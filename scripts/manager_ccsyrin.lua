-- Kraken fantasy Syrinscape engine (generated: kraken-extensions/syrinscape/build.py).
-- Plays Syrinscape one-shots from the game's chat. Same design as Kraken
-- Traveller 2E Syrinscape 0.7.0: every setting is an FGU option in the
-- "Kraken Syrinscape" group, sounds come in categories the GM can switch off,
-- hidden GM rolls can be silent, combat only, or all.
--
-- Public functions go in Public; onInit copies them onto the CCSyrin package
-- (the package global does not exist yet while this file loads).
local Public = {}

local GAME = {
  label = "Kraken AD&D 2E Syrinscape",
  tag = "Kraken AD&D 2E Syrinscape",
  version = "1.0.0",
  pfx = "K2SY",
  regkey = "KRAKENADD2ESYRIN",
}

local DEBUG = false
local WARNED_MISSING_TOKEN = false
local WARNED_MISSING_CATALOG = false
local PLAYED_AT = {}

---------------------------------------------------------------------------
-- Categories
---------------------------------------------------------------------------
local CATEGORIES = {
  { id = "weapons", name = "Weapon Attacks",      desc = "Swings, shots and natural attacks on attack rolls" },
  { id = "damage",  name = "Hits and Damage",     desc = "Weapon hits and damage-type impacts on damage rolls" },
  { id = "crits",   name = "Criticals / Fumbles", desc = "Critical hits, fumbles, automatic misses, Krits & Fumbles results" },
  { id = "spells",  name = "Spells",              desc = "A sound for every spell cast (recording, school or caster level)" },
  { id = "magic",   name = "Saves and Defences",  desc = "Saving throws, spell saves, resistances, mirror images, stoneskin" },
  { id = "class",   name = "Class Abilities",     desc = "Turn undead, rage, smite, sneak attack, lay on hands, bardic music" },
  { id = "status",  name = "Wounds and Death",    desc = "Wounded, heavy, dying, unconscious, dead" },
  { id = "heal",    name = "Healing",             desc = "Heal rolls and healing effects" },
  { id = "init",    name = "Initiative",          desc = "Initiative rolls" },
}

-- Which category a catalog trigger belongs to (catalogs predate categories)
local function triggerCategory(t)
  if t.cat then return t.cat end
  local id = t.id or ""
  if id:find("fumble") or id:find("^critical") or id:find("^kraken_") or id:find("automatic") then return "crits" end
  if id:find("^status_") or id:find("unconscious") or id:find("^death") or id:find("dying") then return "status" end
  if id:find("^heal") then return "heal" end
  if id:find("^init") then return "init" end
  if id:find("^class_") then return "class" end
  if id == "spell_save_notice" or id:find("save") or id:find("defen") or id:find("mirror")
      or id:find("stoneskin") or id:find("displacement") or id:find("concentration")
      or id:find("resist") or id:find("immune") then return "magic" end
  if id:find("^spell_") then return "spells" end
  if id:find("^dmg_") or id:find("^damage_") or id:find("_damage_") or id:find("^cc_type_")
      or id:find("_hit$") then return "damage" end
  return "weapons"
end

-- Damage-type impact triggers (cc_type_fire ...) versus weapon hit triggers
local function isImpactTrigger(t)
  return (t.id or ""):find("^cc_type_") ~= nil
end

---------------------------------------------------------------------------
-- Fallback catalog (used only when the catalog script failed to load)
---------------------------------------------------------------------------
local function el(id, name)
  return { name = name, sound_id = "ss|" .. id .. "|element|oneshot|" .. name }
end
local FALLBACK_CATALOG = {
  sounds = {
    roll_initiative = el(228543, "Roll Initiative"),
    longsword_miss = el(2717040, "Longsword miss"),
    longsword_hit = el(2717041, "Longsword hit"),
    longsword_critical = el(2717042, "Longsword critical"),
    bow_fire = el(4373171, "Bow fire"),
    bow_hit = el(1040, "Arrow in flesh"),
    taking_damage = el(715261, "Taking damage"),
    scream_high = el(3559950, "High-pitch scream"),
    body_fall = el(4163158, "Body fall"),
    dying_roar = el(3911237, "Dying roar"),
    fan_fumble = el(228536, "Fan Fumble"),
    magical_windchimes = el(4497403, "Magical windchimes"),
    cure_wounds = el(3665515, "Cure wounds"),
  },
  triggers = {
    { id = "critical_fumble", pattern = "[critical fumble]", plain = true, sound = "fan_fumble" },
    { id = "critical_hit", pattern = "[critical hit]", plain = true, sound = "longsword_critical" },
    { id = "status_dying", pattern = "[status: dying]", plain = true, sound = "dying_roar" },
    { id = "status_unconscious", pattern = "[status: unconscious]", plain = true, sound = "body_fall" },
    { id = "status_heavy", pattern = "[status: heavy]", plain = true, sound = "scream_high" },
    { id = "status_wounded", pattern = "[status: wounded]", plain = true, sound = "taking_damage" },
    { id = "heal_any", pattern = "[heal", plain = true, sound = "cure_wounds" },
    { id = "spell_save_notice", pattern = "spell save:", plain = true, sound = "magical_windchimes" },
    { id = "initiative_roll", pattern = "[init", plain = true, sound = "roll_initiative" },
    { id = "attack_ranged", pattern = "[attack (r)]", plain = true, sound = "bow_fire" },
    { id = "damage_ranged", pattern = "[damage (r)]", plain = true, sound = "bow_hit" },
    { id = "attack_generic", pattern = "[attack", plain = true, sound = "longsword_miss" },
    { id = "damage_generic", pattern = "[damage", plain = true, sound = "longsword_hit" },
  },
  spells = {},
}

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------
local function postChat(text)
  Comm.addChatMessage({ text = text })
end

local function say(text)
  postChat("[" .. GAME.tag .. "] " .. text)
end

local function trim(text)
  return StringManager.trim(text or "")
end

local function splitCommand(text)
  local cmd, rest = text:match("^(%S+)%s*(.*)$")
  return string.lower(cmd or ""), trim(rest)
end

local function normalize(text)
  return string.lower(text or "")
end

local function escapePattern(text)
  return (text or ""):gsub("(%W)", "%%%1")
end

local function getState()
  if not GlobalRegistry[GAME.regkey] then
    GlobalRegistry[GAME.regkey] = { auth_token = "" }
  end
  return GlobalRegistry[GAME.regkey]
end

local function getCatalog()
  if CCSyrinCatalog and CCSyrinCatalog.sounds and CCSyrinCatalog.triggers then
    return CCSyrinCatalog
  end
  if not WARNED_MISSING_CATALOG then
    say("Catalog script not available. Using the small built-in catalog.")
    WARNED_MISSING_CATALOG = true
  end
  return FALLBACK_CATALOG
end

---------------------------------------------------------------------------
-- Options (Settings > Options, "Kraken Syrinscape" group; campaign-wide)
---------------------------------------------------------------------------
local OPT_ON = GAME.pfx .. "ON"
local OPT_HIDDEN = GAME.pfx .. "HID"      -- off / combat / all
local OPT_CAT_PREFIX = GAME.pfx .. "C_"
local OPT_DAMAGE = GAME.pfx .. "DMG"      -- weapon / impact / both
local OPT_ATTACK = GAME.pfx .. "ATK"      -- swing / miss / off
local OPT_SPELLS = GAME.pfx .. "SPL"      -- all / exact / off
local OPT_REPEAT = GAME.pfx .. "REP"      -- seconds before the same sound again
local OPT_STARTUP = GAME.pfx .. "MSG"
local OPT_DEBUG = GAME.pfx .. "DBG"

-- "Hidden GM rolls: Combat only" lets these categories through
local COMBAT_CATS = { weapons = true, damage = true, crits = true, spells = true, status = true, class = true, heal = true }

local function getCategoryOptionKey(catId)
  return OPT_CAT_PREFIX .. string.upper(catId)
end

local function registerOptions()
  local function onOff(sKey, sDefault)
    OptionsManager.registerOptionData({
      sKey = sKey, sGroupRes = "option_header_krakensyrin",
      tCustom = { labelsres = "option_val_on", values = "yes", baselabelres = "option_val_off", baseval = "no", default = sDefault },
    })
  end
  local function choice(sKey, sBaseVal, sBaseLabel, sValues, sLabels, sDefault)
    OptionsManager.registerOptionData({
      sKey = sKey, sGroupRes = "option_header_krakensyrin",
      tCustom = { baseval = sBaseVal, baselabelres = sBaseLabel, values = sValues, labelsres = sLabels, default = sDefault },
    })
  end

  onOff(OPT_ON, "yes")
  choice(OPT_HIDDEN, "off", "option_val_ksy_silent", "combat|all", "option_val_ksy_combat|option_val_ksy_all", "combat")
  for _, cat in ipairs(CATEGORIES) do
    onOff(getCategoryOptionKey(cat.id), "yes")
  end
  choice(OPT_ATTACK, "swing", "option_val_ksy_swing", "miss|off", "option_val_ksy_missonly|option_val_off", "swing")
  choice(OPT_DAMAGE, "weapon", "option_val_ksy_weapon", "impact|both", "option_val_ksy_impact|option_val_ksy_both", "weapon")
  choice(OPT_SPELLS, "all", "option_val_ksy_allspells", "exact|off", "option_val_ksy_exact|option_val_off", "all")
  choice(OPT_REPEAT, "1", "option_val_ksy_1s", "3|5|10", "option_val_ksy_3s|option_val_ksy_5s|option_val_ksy_10s", "1")
  onOff(OPT_STARTUP, "yes")
  onOff(OPT_DEBUG, "no")
end

local function isCategoryEnabled(catId)
  return not OptionsManager.isOption(getCategoryOptionKey(catId), "no")
end

local function setCategoryEnabled(catId, enabled)
  OptionsManager.setOption(getCategoryOptionKey(catId), enabled and "yes" or "no")
end

-- Settings from older versions lived in GlobalRegistry; carry them over once
local function migrateRegistrySettings()
  local state = getState()
  if state.enabled == false then OptionsManager.setOption(OPT_ON, "no") end
  if state.hidden == true then OptionsManager.setOption(OPT_HIDDEN, "all") end
  if state.fallback == false then OptionsManager.setOption(OPT_SPELLS, "exact") end
  state.enabled, state.hidden, state.fallback = nil, nil, nil
end

local function isValidCategory(catId)
  for _, cat in ipairs(CATEGORIES) do
    if cat.id == catId then return true end
  end
  return false
end

local function getCategoryName(catId)
  for _, cat in ipairs(CATEGORIES) do
    if cat.id == catId then return cat.name end
  end
  return catId
end

---------------------------------------------------------------------------
-- Public API (config window, other scripts, the Kraken Agent Bridge)
---------------------------------------------------------------------------
function Public.getCategoryList() return CATEGORIES end
function Public.isCategoryEnabled(catId) return isCategoryEnabled(catId) end
function Public.setCategoryEnabled(catId, enabled) setCategoryEnabled(catId, enabled) end
function Public.openConfigWindow() Interface.openWindow("krakensyrin_options", "") end

---------------------------------------------------------------------------
-- Syrinscape link (Fantasy Grounds' own sound settings)
---------------------------------------------------------------------------
local function getFGSoundState()
  return {
    auth_token = trim(DB.getValue("settings.sound.ss.authtoken", "")),
    session_id = trim(DB.getValue("settings.sound.ss.sessionid", "")),
  }
end

local function getActiveAuthToken()
  local soundState = getFGSoundState()
  if soundState.auth_token ~= "" then return soundState.auth_token, "fg" end
  local sAuth = trim(getState().auth_token)
  if sAuth ~= "" then return sAuth, "legacy" end
  return "", ""
end

local function shareFGSessionLinks()
  -- FG's own invite whispers the GM control link and sends only the player link to the table
  if SoundManagerSyrinscape and SoundManagerSyrinscape.sendPlayerInvite then
    SoundManagerSyrinscape.sendPlayerInvite()
    return
  end
  local soundState = getFGSoundState()
  if soundState.session_id == "" then
    say("No Syrinscape session yet. Make the Web Player Session URL in Fantasy Grounds' sound settings first.")
    return
  end
  Comm.deliverChatMessage({ text = "Join my Syrinscape session!" })
  Comm.deliverChatMessage({ text = "https://app.syrinscape.com/" .. soundState.session_id .. "/player/" })
end

---------------------------------------------------------------------------
-- Playback
---------------------------------------------------------------------------
local function playSoundData(soundData, rateKey)
  if not soundData then return end

  local auth, source = getActiveAuthToken()
  if auth == "" then
    if not WARNED_MISSING_TOKEN then
      say("No Syrinscape auth token in Fantasy Grounds' sound settings.")
      WARNED_MISSING_TOKEN = true
    end
    return
  end

  local key = rateKey or soundData.sound_id or soundData.name or "sound"
  local now = os.time()
  local nRepeat = tonumber(OptionsManager.getOption(OPT_REPEAT)) or 1
  if now - (PLAYED_AT[key] or 0) < nRepeat then return end

  if SoundManager and soundData.sound_id then
    SoundManager.playSound(soundData.sound_id)
  else
    local url = string.gsub((soundData.so_play or "") .. auth, "syrinscape%-online", "https")
    Interface.openURL(url)
  end
  PLAYED_AT[key] = now

  if DEBUG then
    say("Played: " .. (soundData.name or key) .. " (" .. key .. ", auth=" .. source .. ")")
  end
end

local function playSoundKey(soundKey)
  local soundData = getCatalog().sounds[soundKey]
  if not soundData then
    if DEBUG then say("Unknown sound key: " .. tostring(soundKey)) end
    return
  end
  playSoundData(soundData, soundKey)
end

function Public.playSoundKey(soundKey) playSoundKey(soundKey) end

function Public.getSoundKeys()
  local keys = {}
  for k, _ in pairs(getCatalog().sounds) do table.insert(keys, k) end
  table.sort(keys)
  return keys
end

function Public.getCatalogCounts()
  local catalog = getCatalog()
  local n = 0
  for _ in pairs(catalog.sounds) do n = n + 1 end
  return n, #catalog.triggers, #(catalog.spells or {})
end

---------------------------------------------------------------------------
-- Matching
---------------------------------------------------------------------------
local function matchTrigger(text, trigger)
  if trigger.plain then
    return string.find(text, trigger.pattern, 1, true) ~= nil
  end
  return string.find(text, trigger.pattern) ~= nil
end

local function matchWholePhrase(text, phrase)
  return string.find(text, "%f[%w]" .. escapePattern(phrase) .. "%f[%W]") ~= nil
end

-- Spell names that are also ordinary weapon and armour words ("Crossbow,
-- light", "Shield, heavy", "a light hammer"): never spells on attack and damage lines.
local WEAPON_WORD_SPELLS = { light = true, shield = true, slow = true, jump = true }

local function matchSpell(text, bWeaponLine)
  local spells = getCatalog().spells
  if not spells then return nil end
  local best
  for _, spell in ipairs(spells) do
    if (not best or #spell.pattern > #best.pattern)
        and not (bWeaponLine and WEAPON_WORD_SPELLS[spell.pattern])
        and matchWholePhrase(text, spell.pattern) then
      best = spell
    end
  end
  return best
end

local function isGenericSpell(spell)
  local cov = spell.coverage or ""
  return not (cov == "existing" or cov == "exact" or cov == "exact catalog" or cov == "base spell")
end

-- Game hooks (per game, from build.py)
local gameResolve = nil

-- Only game-event messages may start sounds: spell names such as Message,
-- Aid and Light also occur in ordinary chat.
local function isEventTag(event)
  return event:match("^attack") or event:match("^damage") or event:match("^heal")
    or event:match("^power") or event:match("^spell") or event:match("^cast") or event:match("^init")
    or event:match("^status:") or event:match("^save") or event:match("^defen") or event:match("^critical")
    or event:match("^kraken") or event:match("^turn") or event:match("^rebuke") or event:match("^effect")
    or event:match("^automatic") or event:match("^miss") or event:match("^hit") or event:match("^stoneskin")
    or event:match("^mirror") or event:match("^displacement") or event:match("^concentration")
    or event:match("^skill") or event:match("^ability") or event:match("^check")
end

-- The first game-event tag of the line. Result lines start with a number
-- ("Attack [4] -> [at Ape] [CRITICAL FUMBLE]"), so every tag is looked at.
local function getEventTag(text)
  for event in text:gmatch("%[([^%]]+)%]") do
    if isEventTag(event) then return event end
  end
  if text:find("spell save:", 1, true) or text:find("effect ['", 1, true) then
    return text:match("%[([^%]]+)%]") or "effect"
  end
  return nil
end

-- Resolve a chat line to the sounds it plays, honouring every option.
-- Returns a list of { data, key, cat, id }; nothing contacts Syrinscape here.
local function resolve(text, bSecret)
  text = normalize(text)
  local event = getEventTag(text)
  if not event then return {} end
  local sHidden = OptionsManager.getOption(OPT_HIDDEN)
  local catalog = getCatalog()
  local out = {}

  local function allowed(cat)
    if not isCategoryEnabled(cat) then return false end
    if bSecret and sHidden == "combat" and not COMBAT_CATS[cat] then return false end
    return true
  end
  local function add(data, key, cat, id)
    if data then table.insert(out, { data = data, key = key, cat = cat, id = id }) end
  end

  local bAttackLine = event:match("^attack") ~= nil
  local bDamageLine = event:match("^damage") ~= nil
  local bWeaponLine = bAttackLine or bDamageLine

  -- Game-specific first look (class abilities that need more than a pattern)
  local hook = gameResolve and gameResolve(text, event, catalog)
  if hook then
    if allowed(hook.cat) then add(hook.data, hook.key, hook.cat, hook.id) end
    return out
  end

  -- Class abilities before spell names (3.5e Rage is both)
  for _, trigger in ipairs(catalog.triggers) do
    if trigger.cat == "class" and matchTrigger(text, trigger) then
      if allowed("class") then add(catalog.sounds[trigger.sound], trigger.sound, "class", trigger.id) end
      return out
    end
  end

  -- Spells: longest spell name in the line (not on wound, turn or result lines)
  local bNoSpell = event:match("^status:") or event:match("^turn") or event:match("^init") or event:match("^critical")
    or event:match("^kraken") or event:match("^automatic") or event:match("^miss") or event:match("^hit")
    or event:match("^stoneskin") or event:match("^mirror") or event:match("^displacement") or event:match("^concentration")
  if not bNoSpell then
    local spell = matchSpell(text, bWeaponLine)
    if spell then
      local sMode = OptionsManager.getOption(OPT_SPELLS)
      if sMode ~= "off" and not (sMode == "exact" and isGenericSpell(spell)) and allowed("spells") then
        add(spell, "spell:" .. spell.pattern, "spells", "spell")
      end
      -- a spell's damage line still gets its impact below only when nothing played
      if #out > 0 or not bDamageLine then return out end
    end
  end

  local sDamageMode = OptionsManager.getOption(OPT_DAMAGE)
  local sAttackMode = OptionsManager.getOption(OPT_ATTACK)
  local bWeaponPlayed = false
  for _, trigger in ipairs(catalog.triggers) do
    local cat = triggerCategory(trigger)
    local bImpact = isImpactTrigger(trigger)
    local bSkip = false
    if bDamageLine and cat == "damage" then
      if sDamageMode == "impact" and not bImpact and trigger.id ~= "damage_generic" then bSkip = true end
      if sDamageMode == "weapon" and bImpact then bSkip = true end
      if bWeaponPlayed and not bImpact then bSkip = true end
    end
    if not bSkip and trigger.cat ~= "class" and matchTrigger(text, trigger) then
      local sSound = trigger.sound
      if cat == "weapons" and bAttackLine then
        if sAttackMode == "off" then sSound = nil
        elseif sAttackMode == "miss" and not (text:find("[miss", 1, true) or text:find("miss]", 1, true)) then sSound = nil end
      end
      if sSound and sSound ~= "none" and allowed(cat) then
        add(catalog.sounds[sSound], sSound, cat, trigger.id)
      elseif DEBUG then
        say("Trigger matched: " .. tostring(trigger.id) .. " [" .. cat .. "] (silenced by an option)")
      end
      -- "Both": after the weapon hit, keep looking for the damage-type impact
      if bDamageLine and cat == "damage" and sDamageMode == "both" and not bImpact then
        bWeaponPlayed = true
      else
        return out
      end
    end
  end
  return out
end

-- Inspect the routing used by chat without contacting Syrinscape (tests, bridge)
function Public.resolveSound(text, bSecret)
  local r = resolve(text, bSecret)[1]
  if r then return r.data, r.key, r.cat, r.id end
  return nil
end

function Public.resolveAll(text, bSecret)
  local names = {}
  for _, r in ipairs(resolve(text, bSecret)) do
    table.insert(names, (r.key or "?") .. " [" .. r.cat .. "]")
  end
  return names
end

local function processMessage(msg)
  if not Session.IsHost then return end
  if OptionsManager.isOption(OPT_ON, "no") then return end
  if msg.secret and OptionsManager.isOption(OPT_HIDDEN, "off") then return end
  local text = msg.text or ""
  if text == "" then return end
  for _, r in ipairs(resolve(text, msg.secret)) do
    if DEBUG then say("Trigger matched: " .. tostring(r.id) .. " [" .. r.cat .. "]") end
    playSoundData(r.data, r.key)
  end
end

---------------------------------------------------------------------------
-- Slash commands
---------------------------------------------------------------------------
local function setToken(token)
  getState().auth_token = trim(token)
  WARNED_MISSING_TOKEN = false
  say(getState().auth_token == "" and "Token cleared." or "Token stored.")
end

local function showStatus()
  local soundState = getFGSoundState()
  local nSounds, nTriggers, nSpells = Public.getCatalogCounts()
  say("v" .. GAME.version .. ": sounds " .. (OptionsManager.isOption(OPT_ON, "no") and "OFF" or "on")
    .. ", hidden GM rolls " .. OptionsManager.getOption(OPT_HIDDEN)
    .. ", FG auth " .. (soundState.auth_token ~= "" and "set" or "missing")
    .. ", session " .. (soundState.session_id ~= "" and soundState.session_id or "missing")
    .. string.format("; %d sounds, %d triggers, %d spells", nSounds, nTriggers, nSpells))
end

local function showCategories()
  say("Sound categories:")
  for _, cat in ipairs(CATEGORIES) do
    postChat("  [" .. (isCategoryEnabled(cat.id) and "ON" or "OFF") .. "]  " .. cat.id .. "  -  " .. cat.name .. " (" .. cat.desc .. ")")
  end
  postChat("Use: /krakensyrin toggle <category> [on|off]")
end

local function handleToggle(rest)
  local catId, onoff = rest:match("^(%S+)%s+(%S+)$")
  catId = string.lower(catId or trim(rest))
  if catId == "" then showCategories() return end
  if not isValidCategory(catId) then
    say("Unknown category: " .. catId)
    showCategories()
    return
  end
  local enabled
  if onoff then enabled = (string.lower(onoff) == "on") else enabled = not isCategoryEnabled(catId) end
  setCategoryEnabled(catId, enabled)
  say(getCategoryName(catId) .. " (" .. catId .. ") = " .. (enabled and "ON" or "OFF"))
end

local HIDDEN_WORDS = { on = "all", all = "all", off = "off", silent = "off", combat = "combat" }
local HIDDEN_LABELS = { all = "All", off = "Silent", combat = "Combat only" }

local function showHelp()
  say("Commands (every setting is also in Options > Kraken Syrinscape):")
  postChat("  /krakensyrin config                  Category window")
  postChat("  /krakensyrin categories              List categories")
  postChat("  /krakensyrin toggle <cat> [on|off]   Switch a category")
  postChat("  /krakensyrin on | off                All sounds on or off")
  postChat("  /krakensyrin hidden off|combat|all   Sounds for hidden GM rolls")
  postChat("  /krakensyrin spells all|exact|off    Spell sounds (exact = only recordings named for the spell)")
  postChat("  /krakensyrin status                  Link and catalog")
  postChat("  /krakensyrin invite                  Share the Syrinscape player link")
  postChat("  /krakensyrin test <sound_key>        Play one sound")
  postChat("  /krakensyrin why <chat text>         Which sounds a line would play")
  postChat("  /krakensyrin debug on|off            Show trigger matches")
end

local function handleSlash(_, params)
  local command, rest = splitCommand(params or "")
  local value = normalize(rest)
  if command == "" or command == "help" then showHelp()
  elseif command == "config" or command == "options" then Public.openConfigWindow()
  elseif command == "on" or command == "off" then
    OptionsManager.setOption(OPT_ON, command == "on" and "yes" or "no"); say("Sounds " .. command .. ".")
  elseif command == "enabled" then
    OptionsManager.setOption(OPT_ON, value == "off" and "no" or "yes"); say("Sounds " .. (value == "off" and "off" or "on") .. ".")
  elseif command == "token" then setToken(rest)
  elseif command == "debug" then
    OptionsManager.setOption(OPT_DEBUG, value == "on" and "yes" or "no")
    DEBUG = (value == "on")
    say("Debug " .. (DEBUG and "on" or "off") .. ".")
  elseif command == "hidden" then
    local sMode = HIDDEN_WORDS[value]
    if not sMode then say("Use: /krakensyrin hidden off|combat|all") return end
    OptionsManager.setOption(OPT_HIDDEN, sMode)
    say("Hidden GM rolls: " .. HIDDEN_LABELS[sMode] .. ".")
  elseif command == "spells" or command == "fallback" then
    local sMode = ({ all = "all", on = "all", exact = "exact", off = (command == "fallback") and "exact" or "off" })[value]
    if not sMode then say("Use: /krakensyrin spells all|exact|off") return end
    OptionsManager.setOption(OPT_SPELLS, sMode)
    say("Spell sounds: " .. sMode .. ".")
  elseif command == "status" or command == "fgstatus" then showStatus()
  elseif command == "invite" then shareFGSessionLinks()
  elseif command == "toggle" then handleToggle(rest)
  elseif command == "categories" then showCategories()
  elseif command == "test" then playSoundKey(trim(rest))
  elseif command == "why" then
    local names = Public.resolveAll(rest, false)
    say(#names > 0 and ("Would play: " .. table.concat(names, ", ")) or "No sound for that line.")
  else showHelp() end
end

---------------------------------------------------------------------------
-- Init
---------------------------------------------------------------------------
function onInit()
  for k, fn in pairs(Public) do
    CCSyrin[k] = fn
  end
  registerOptions()
  OptionsManager.registerCallback(OPT_DEBUG, function() DEBUG = OptionsManager.isOption(OPT_DEBUG, "yes") end)
  if not Session.IsHost then return end
  getState()
  Comm.registerSlashHandler("krakensyrin", handleSlash, "help|config|toggle <cat> [on|off]|categories|on|off|hidden off|combat|all|spells all|exact|off|status|invite|test <key>|why <text>|debug on|off")
  Comm.registerSlashHandler("ccsyrin", handleSlash)
  ChatManager.registerReceiveMessageCallback(processMessage)
end

-- Chat is not ready during onInit, so startup messages go here
function onTabletopInit()
  if not Session.IsHost then return end
  migrateRegistrySettings()
  DEBUG = OptionsManager.isOption(OPT_DEBUG, "yes")
  getCatalog()
  if SoundManager and SoundManager.onChatMessage then
    say("WARNING: another Syrinscape sound extension seems to be active. Disable one of them to avoid doubled sounds.")
  end
  local bridge = AgentBridge or ClaudeBridge
  if bridge and bridge.registerPackage then
    bridge.registerPackage("CCSyrin", CCSyrin)
  end
  if not OptionsManager.isOption(OPT_STARTUP, "no") then
    local nSounds, nTriggers, nSpells = Public.getCatalogCounts()
    say(string.format("v%s loaded: %d sounds, %d triggers, %d spells. Settings: Options > Kraken Syrinscape. /krakensyrin help",
      GAME.version, nSounds, nTriggers, nSpells))
  end
end
