-- Package script "CCSyrinExtra" (kraken-extensions/syrinscape/engine): sounds and
-- triggers shared by the fantasy Syrinscape extensions on top of the catalog.
-- Class-ability triggers carry cat = "class" and are checked before spell names
-- (3.5e "Rage" is both a barbarian ability and a spell).
-- Every sound here is a Syrinscape one-shot element (column 8 "oneshot").

local function el(id, name)
  return { name = name, sound_id = "ss|" .. id .. "|element|oneshot|" .. name }
end

sounds = {
  swing_and_miss   = el(704036, "Swing & a miss"),
  fumble_ouch      = el(2227957, "Failed swinging. Ouch!"),
  sword_critical   = el(138904, "Sword critical"),
  turn_undead      = el(1065132, "Turn undead"),
  channel_positive = el(138909, "Positive energy channel"),
  channel_negative = el(138910, "Negative energy channel"),
  smite            = el(530168, "Smite"),
  rage_roar        = el(4243747, "Roars"),
  war_horn         = el(2652468, "War horn"),
  sneak_attack     = el(2006703, "Sneak attack"),
  eldritch_blast   = el(618135, "Eldritch Blast"),
  divine_strength  = el(2737, "Divine strength"),
  wild_shape       = el(627205, "Wildshape"),
  bardic_song      = el(618168, "3rd level spell"),
  death_toll       = el(540893, "Toll the Dead"),
  holy_aura        = el(138906, "Buff spell - divine"),
}

-- id prefix "class_" = Class Abilities, "kraken_" = Criticals / Fumbles
triggers = {
  -- Kraken Krits & Fumbles results (any game)
  { id = "kraken_fumble",   pattern = "[kraken fumble]",   plain = true, sound = "fumble_ouch" },
  { id = "kraken_critical", pattern = "[kraken critical]", plain = true, sound = "sword_critical" },
  { id = "kraken_crit2",    pattern = "[kraken krit]",     plain = true, sound = "sword_critical" },

  -- Natural 1 without a fumble table
  { id = "automatic_miss",  pattern = "[automatic miss]",  plain = true, sound = "swing_and_miss" },
  { id = "miss_automatic",  pattern = "[miss-automatic]",  plain = true, sound = "swing_and_miss" },

  -- Class abilities (3.5e effect labels, 2E/C&C power names)
  { id = "class_turn",       pattern = "turn undead",       plain = true, sound = "turn_undead", cat = "class" },
  { id = "class_turn2e",     pattern = "[turnundead]",      plain = true, sound = "turn_undead", cat = "class" },
  { id = "class_rebuke",     pattern = "rebuke undead",     plain = true, sound = "channel_negative", cat = "class" },
  { id = "class_layonhands", pattern = "lay on hands",      plain = true, sound = "channel_positive", cat = "class" },
  { id = "class_smite",      pattern = "smite evil",        plain = true, sound = "smite", cat = "class" },
  { id = "class_smite2",     pattern = "effect ['smite",    plain = true, sound = "smite", cat = "class" },
  { id = "class_rage",       pattern = "effect ['rage",     plain = true, sound = "rage_roar", cat = "class" },
  { id = "class_rage2",      pattern = "effect ['mighty rage", plain = true, sound = "rage_roar", cat = "class" },
  { id = "class_rage3",      pattern = "effect ['greater rage", plain = true, sound = "rage_roar", cat = "class" },
  { id = "class_rage_cc",    pattern = "[power] rage",      plain = true, sound = "rage_roar", cat = "class" },
  { id = "class_berserk",    pattern = "berserk",           plain = true, sound = "rage_roar", cat = "class" },
  { id = "class_inspire",    pattern = "inspire courage",   plain = true, sound = "war_horn", cat = "class" },
  { id = "class_bardic",     pattern = "bardic music",      plain = true, sound = "bardic_song", cat = "class" },
  { id = "class_sneak",      pattern = "effect ['sneak attack", plain = true, sound = "sneak_attack", cat = "class" },
  { id = "class_backstab",   pattern = "backstab",          plain = true, sound = "sneak_attack", cat = "class" },
  { id = "class_eldritch",   pattern = "eldritch blast",    plain = true, sound = "eldritch_blast", cat = "class" },
  { id = "class_stunfist",   pattern = "stunning fist",     plain = true, sound = "punch", cat = "class" },
  { id = "class_strength",   pattern = "feat of strength",  plain = true, sound = "divine_strength", cat = "class" },
  { id = "class_wildshape",  pattern = "wild shape",        plain = true, sound = "wild_shape", cat = "class" },
  { id = "class_grave",      pattern = "grave touch",       plain = true, sound = "death_toll", cat = "class" },
  { id = "class_ward",       pattern = "protective ward",   plain = true, sound = "holy_aura", cat = "class" },

  -- Death (the catalogs stop at dying)
  { id = "status_dead",      pattern = "[status: dead]",    plain = true, sound = "dying_roar" },

  -- AD&D 2E defences
  { id = "mirror_image_hit", pattern = "[mirror-image hit]", plain = true, sound = "magical_windchimes" },
  { id = "stoneskin_hit",    pattern = "[stoneskin hit]",   plain = true, sound = "magical_windchimes" },
  { id = "displacement_hit", pattern = "[displacement]",    plain = true, sound = "magical_windchimes" },
  { id = "concentration_broken", pattern = "concentration broken", plain = true, sound = "magical_windchimes" },
}

function onInit()
  if not CCSyrinCatalog or not CCSyrinCatalog.sounds then return end
  for k, v in pairs(sounds) do
    CCSyrinCatalog.sounds[k] = CCSyrinCatalog.sounds[k] or v
  end
  local have = {}
  for _, t in ipairs(CCSyrinCatalog.triggers) do have[t.id] = true end
  -- before everything else, in this order
  local n = 0
  for _, t in ipairs(triggers) do
    if not have[t.id] then
      n = n + 1
      table.insert(CCSyrinCatalog.triggers, n, t)
    end
  end
end
