CCSyrin = {}

local DEBUG = false
local WARNED_MISSING_TOKEN = false
local WARNED_MISSING_CATALOG = false
local PLAYED_AT = {}

local FALLBACK_CATALOG = {
  sounds = {
    roll_initiative = {
      name = "Roll Initiative",
      sound_id = "ss|228543|element|oneshot|Roll Initiative",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/228543/play/?auth_token=",
    },
    sword_swoosh = {
      name = "Longsword miss",
      sound_id = "ss|4373167|element|oneshot|Longsword miss",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4373167/play/?auth_token=",
    },
    bow_fire = {
      name = "Bow fire",
      sound_id = "ss|4373171|element|oneshot|Bow fire",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4373171/play/?auth_token=",
    },
    arrow_in_flesh = {
      name = "Arrow in flesh",
      sound_id = "ss|1040|element|oneshot|Arrow in flesh",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/1040/play/?auth_token=",
    },
    taking_damage = {
      name = "Taking damage",
      sound_id = "ss|715261|element|oneshot|Taking damage",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/715261/play/?auth_token=",
    },
    swords_clash = {
      name = "Longsword hit",
      sound_id = "ss|4373166|element|oneshot|Longsword hit",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4373166/play/?auth_token=",
    },
    fan_fumble = {
      name = "Fan Fumble",
      sound_id = "ss|228536|element|oneshot|Fan Fumble",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/228536/play/?auth_token=",
    },
    longsword_critical = {
      name = "Longsword critical",
      sound_id = "ss|2717042|element|oneshot|Longsword critical",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717042/play/?auth_token=",
    },
    magical_windchimes = {
      name = "Magical windchimes",
      sound_id = "ss|3952933|element|oneshot|Magical windchimes",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3952933/play/?auth_token=",
    },
    fireball = {
      name = "Fireball",
      sound_id = "ss|415567|element|oneshot|Fireball",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/415567/play/?auth_token=",
    },
    magic_missile = {
      name = "Magic Missile",
      sound_id = "ss|415569|element|oneshot|Magic Missile",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/415569/play/?auth_token=",
    },
    cure_wounds = {
      name = "Cure wounds",
      sound_id = "ss|3665515|element|oneshot|Cure wounds",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3665515/play/?auth_token=",
    },
    spare_the_dying = {
      name = "Spare the Dying",
      sound_id = "ss|540892|element|oneshot|Spare the Dying",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/540892/play/?auth_token=",
    },
    dying_roar = {
      name = "Dying roar",
      sound_id = "ss|3911237|element|oneshot|Dying roar",
      so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3911237/play/?auth_token=",
    },
  },
  triggers = {
    { id = "critical_fumble", pattern = "[critical fumble]", plain = true, sound = "fan_fumble" },
    { id = "critical_failure", pattern = "[critical failure]", plain = true, sound = "fan_fumble" },
    { id = "spell_spare_the_dying", pattern = "spare the dying", plain = true, sound = "spare_the_dying" },
    { id = "spell_cure_wounds", pattern = "cure wounds", plain = true, sound = "cure_wounds" },
    { id = "spell_magic_missile", pattern = "magic missile", plain = true, sound = "magic_missile" },
    { id = "spell_fireball", pattern = "fireball", plain = true, sound = "fireball" },
    { id = "status_wounded", pattern = "[status: wounded]", plain = true, sound = "taking_damage" },
    { id = "status_heavy", pattern = "[status: heavy]", plain = true, sound = "taking_damage" },
    { id = "status_dying", pattern = "[status: dying]", plain = true, sound = "dying_roar" },
    { id = "status_unconscious", pattern = "[status: unconscious]", plain = true, sound = "dying_roar" },
    { id = "critical_hit", pattern = "[critical hit]", plain = true, sound = "longsword_critical" },
    { id = "initiative_roll", pattern = "[init]", plain = true, sound = "roll_initiative" },
    { id = "attack_ranged", pattern = "[attack (r)]", plain = true, sound = "bow_fire" },
    { id = "attack_melee", pattern = "[attack (m)]", plain = true, sound = "sword_swoosh" },
    { id = "damage_ranged", pattern = "[damage (r)]", plain = true, sound = "arrow_in_flesh" },
    { id = "damage_melee", pattern = "[damage (m)]", plain = true, sound = "swords_clash" },
    { id = "attack_generic", pattern = "[attack]", plain = true, sound = "sword_swoosh" },
    { id = "damage_generic", pattern = "[damage]", plain = true, sound = "swords_clash" },
    { id = "spell_save_notice", pattern = "spell save:", plain = true, sound = "magical_windchimes" },
  },
}

local function postChat(text)
  Comm.addChatMessage({ text = text })
end

local function getState()
  if not GlobalRegistry.KRAKENADD2ESYRIN then
    GlobalRegistry.KRAKENADD2ESYRIN = {
      auth_token = "",
      hidden = false,
      enabled = true,
    }
  end
  return GlobalRegistry.KRAKENADD2ESYRIN
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

local function getCatalog()
  if CCSyrinCatalog and CCSyrinCatalog.sounds and CCSyrinCatalog.triggers then
    return CCSyrinCatalog
  end

  if not WARNED_MISSING_CATALOG then
    postChat("[Kraken AD&D 2E] Catalog script not available. Using fallback built-in catalog.")
    WARNED_MISSING_CATALOG = true
  end

  return FALLBACK_CATALOG
end

local function hasToken()
  local state = getState()
  return trim(state.auth_token) ~= ""
end

local function getFGSoundState()
  return {
    auth_token = trim(DB.getValue("settings.sound.ss.authtoken", "")),
    session_id = trim(DB.getValue("settings.sound.ss.sessionid", "")),
  }
end

local function getActiveAuthToken()
  local soundState = getFGSoundState()
  if soundState.auth_token ~= "" then
    return soundState.auth_token, "fg"
  end

  local state = getState()
  local sAuth = trim(state.auth_token)
  if sAuth ~= "" then
    return sAuth, "legacy"
  end

  return "", ""
end

local function getFGPlayerUrl()
  local soundState = getFGSoundState()
  if soundState.session_id == "" then
    return ""
  end
  return "https://app.syrinscape.com/" .. soundState.session_id .. "/player/"
end

local function getFGGMUrl()
  local soundState = getFGSoundState()
  if soundState.session_id == "" then
    return ""
  end
  return "https://app.syrinscape.com/" .. soundState.session_id .. "/gm/"
end

local function shareFGSessionLinks()
  local soundState = getFGSoundState()
  if soundState.session_id == "" then
    postChat("[Kraken AD&D 2E] No FG Syrinscape session ID found at sound.ss.sessionid. Generate the Web Player Session URL first.")
    return
  end

  Comm.deliverChatMessage({ text = "Syrinscape session controls" })
  Comm.deliverChatMessage({ text = getFGGMUrl() })
  Comm.deliverChatMessage({ text = "Join my Syrinscape session!" })
  Comm.deliverChatMessage({ text = getFGPlayerUrl() })
end

local function playSoundData(soundData, rateKey)
  if not soundData then
    return
  end

  local auth, source = getActiveAuthToken()
  if auth == "" then
    if not WARNED_MISSING_TOKEN then
      postChat("[Kraken AD&D 2E] No Syrinscape auth token found in Fantasy Grounds Sound settings.")
      WARNED_MISSING_TOKEN = true
    end
    return
  end

  local key = rateKey or soundData.sound_id or soundData.name or "sound"
  local now = os.time()
  local last = PLAYED_AT[key] or 0
  if now <= last then
    return
  end

  if SoundManager and soundData.sound_id then
    SoundManager.playSound(soundData.sound_id)
  else
    local url = (soundData.so_play or "") .. auth
    url = string.gsub(url, "syrinscape%-online", "https")
    Interface.openURL(url)
  end

  PLAYED_AT[key] = now

  if DEBUG then
    postChat("[Kraken AD&D 2E] Played: " .. (soundData.name or key) .. " (" .. key .. ", auth=" .. source .. ")")
  end
end

local function playSoundKey(soundKey)
  local catalog = getCatalog()
  local soundData = catalog.sounds[soundKey]
  if not soundData then
    if DEBUG then
      postChat("[Kraken AD&D 2E] Unknown sound key: " .. tostring(soundKey))
    end
    return
  end
  playSoundData(soundData, soundKey)
end

local function matchTrigger(text, trigger)
  if trigger.plain then
    return string.find(text, trigger.pattern, 1, true) ~= nil
  end
  return string.find(text, trigger.pattern) ~= nil
end

local function matchWholePhrase(text, phrase)
  local pattern = "%f[%w]" .. escapePattern(phrase) .. "%f[%W]"
  return string.find(text, pattern) ~= nil
end

local function matchSpell(text)
  if not CCSyrinCatalog or not CCSyrinCatalog.spells then
    return nil
  end

  for _, spell in ipairs(CCSyrinCatalog.spells) do
    if matchWholePhrase(text, spell.pattern) then
      return spell
    end
  end

  return nil
end

local function processMessage(msg)
  if not Session.IsHost then
    return
  end

  local state = getState()
  if not state.enabled then
    return
  end

  if msg.secret and not state.hidden then
    return
  end

  local text = normalize(msg.text or "")
  if text == "" then
    return
  end

  local spell = matchSpell(text)
  if spell then
    if DEBUG then
      postChat("[Kraken AD&D 2E] Spell matched: " .. spell.pattern)
    end
    playSoundData(spell, "spell:" .. spell.pattern)
    return
  end

  local catalog = getCatalog()
  for _, trigger in ipairs(catalog.triggers) do
    if matchTrigger(text, trigger) then
      if DEBUG then
        postChat("[Kraken AD&D 2E] Trigger matched: " .. trigger.id)
      end
      playSoundKey(trigger.sound)
      return
    end
  end
end

local function setToken(token)
  local state = getState()
  state.auth_token = trim(token)
  WARNED_MISSING_TOKEN = false
  if state.auth_token == "" then
    postChat("[Kraken AD&D 2E] Token cleared.")
  else
    postChat("[Kraken AD&D 2E] Token stored.")
  end
end

local function showStatus()
  local state = getState()
  local soundState = getFGSoundState()
  postChat(
    "[Kraken AD&D 2E] enabled="
      .. tostring(state.enabled)
      .. ", hidden="
      .. tostring(state.hidden)
      .. ", token="
      .. (hasToken() and "set" or "missing")
      .. ", fg_auth="
      .. (soundState.auth_token ~= "" and "set" or "missing")
      .. ", fg_session="
      .. (soundState.session_id ~= "" and soundState.session_id or "missing")
  )
end

local function setDebug(value)
  DEBUG = value
  postChat("[Kraken AD&D 2E] Debug " .. (value and "enabled" or "disabled") .. ".")
end

local function setHidden(value)
  local state = getState()
  state.hidden = value
  postChat("[Kraken AD&D 2E] Hidden-message triggers " .. (value and "enabled" or "disabled") .. ".")
end

local function handleSlash(_, params)
  local command, rest = splitCommand(params or "")

  if command == "token" then
    setToken(rest)
    return
  end

  if command == "debug" then
    setDebug(normalize(rest) == "on")
    return
  end

  if command == "hidden" then
    setHidden(normalize(rest) == "on")
    return
  end

  if command == "status" then
    showStatus()
    return
  end

  if command == "fgstatus" then
    showStatus()
    return
  end

  if command == "invite" then
    shareFGSessionLinks()
    return
  end

  if command == "test" then
    playSoundKey(trim(rest))
    return
  end

  postChat("[Kraken AD&D 2E] Commands: token <token>, debug on|off, hidden on|off, status, fgstatus, invite, test <sound_key>")
end

function onInit()
  if not Session.IsHost then
    return
  end

  getState()
  getCatalog()
  Comm.registerSlashHandler("krakensyrin", handleSlash, "token <auth>|debug on|off|hidden on|off|status|fgstatus|invite|test <sound_key>")
  ChatManager.registerReceiveMessageCallback(processMessage)
  postChat("[Kraken AD&D 2E] Loaded. Using Fantasy Grounds Syrinscape settings for playback.")
end

