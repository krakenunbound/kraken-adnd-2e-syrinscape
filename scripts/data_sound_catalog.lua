-- ============================================================
--  Kraken C&C Syrinscape – Sound Catalog  v0.3.0
--  80 sounds | 83 triggers | 11 categories
--
--  Sounds sourced from Syrinscape "Melee weapons",
--  "Ranged weapons", Creature soundsets, and D&D/Fantasy packs.
-- ============================================================

-- Named script package is already CCSyrinCatalog; publish fields directly.

-- -------------------------------------------------------
--  SOUNDS
-- -------------------------------------------------------
sounds = {

  -- === INITIATIVE ===
  roll_initiative = {
    name = "Roll Initiative",
    sound_id = "ss|228543|element|oneshot|Roll Initiative",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/228543/play/?auth_token=",
  },

  -- === SWORDS ===
  longsword_miss = {
    name = "Longsword miss",
    sound_id = "ss|2717040|element|oneshot|Longsword miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717040/play/?auth_token=",
  },
  longsword_hit = {
    name = "Longsword hit",
    sound_id = "ss|2717041|element|oneshot|Longsword hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717041/play/?auth_token=",
  },
  longsword_critical = {
    name = "Longsword critical",
    sound_id = "ss|2717042|element|oneshot|Longsword critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717042/play/?auth_token=",
  },
  shortsword_miss = {
    name = "Shortsword miss",
    sound_id = "ss|2717043|element|oneshot|Shortsword miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717043/play/?auth_token=",
  },
  shortsword_hit = {
    name = "Shortsword hit",
    sound_id = "ss|2717044|element|oneshot|Shortsword hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717044/play/?auth_token=",
  },
  shortsword_critical = {
    name = "Shortsword critical",
    sound_id = "ss|2717045|element|oneshot|Shortsword critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717045/play/?auth_token=",
  },
  greatsword_miss = {
    name = "Greatsword miss",
    sound_id = "ss|3021165|element|oneshot|Greatsword miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021165/play/?auth_token=",
  },
  greatsword_hit = {
    name = "Greatsword hit",
    sound_id = "ss|3022880|element|oneshot|Greatsword hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022880/play/?auth_token=",
  },
  greatsword_critical = {
    name = "Greatsword critical",
    sound_id = "ss|3022881|element|oneshot|Greatsword critcal",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022881/play/?auth_token=",
  },
  rapier_miss = {
    name = "Rapier miss",
    sound_id = "ss|2717034|element|oneshot|Rapier miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717034/play/?auth_token=",
  },
  rapier_hit = {
    name = "Rapier hit",
    sound_id = "ss|2717035|element|oneshot|Rapier hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717035/play/?auth_token=",
  },
  rapier_critical = {
    name = "Rapier critical",
    sound_id = "ss|2717036|element|oneshot|Rapier critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717036/play/?auth_token=",
  },
  scimitar_miss = {
    name = "Scimitar miss",
    sound_id = "ss|2717046|element|oneshot|Scimitar miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717046/play/?auth_token=",
  },
  scimitar_hit = {
    name = "Scimitar hit",
    sound_id = "ss|2717047|element|oneshot|Scimitar hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717047/play/?auth_token=",
  },
  scimitar_critical = {
    name = "Scimitar critical",
    sound_id = "ss|2717048|element|oneshot|Scimitar critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717048/play/?auth_token=",
  },

  -- === AXES ===
  battleaxe_miss = {
    name = "Battle axe miss",
    sound_id = "ss|3021190|element|oneshot|Battle axe miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021190/play/?auth_token=",
  },
  battleaxe_hit = {
    name = "Battle axe hit",
    sound_id = "ss|3021193|element|oneshot|Battle axe hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021193/play/?auth_token=",
  },
  battleaxe_critical = {
    name = "Battle axe critical",
    sound_id = "ss|3021192|element|oneshot|Battle axe critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021192/play/?auth_token=",
  },
  greataxe_miss = {
    name = "Greataxe miss",
    sound_id = "ss|3022879|element|oneshot|Greataxe miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022879/play/?auth_token=",
  },
  greataxe_hit = {
    name = "Greataxe hit",
    sound_id = "ss|3022878|element|oneshot|Greataxe hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022878/play/?auth_token=",
  },
  greataxe_critical = {
    name = "Greataxe critical",
    sound_id = "ss|3022877|element|oneshot|Greataxe critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022877/play/?auth_token=",
  },
  handaxe_miss = {
    name = "Handaxe miss",
    sound_id = "ss|3021169|element|oneshot|Handaxe miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021169/play/?auth_token=",
  },
  handaxe_hit = {
    name = "Handaxe hit",
    sound_id = "ss|3021168|element|oneshot|Handaxe hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021168/play/?auth_token=",
  },

  -- === BLUDGEONING ===
  mace_miss = {
    name = "Mace miss",
    sound_id = "ss|3022885|element|oneshot|Mace miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022885/play/?auth_token=",
  },
  mace_hit = {
    name = "Mace hit",
    sound_id = "ss|3022886|element|oneshot|Mace hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022886/play/?auth_token=",
  },
  mace_critical = {
    name = "Mace critical",
    sound_id = "ss|3022793|element|oneshot|Mace critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022793/play/?auth_token=",
  },
  warhammer_miss = {
    name = "Warhammer miss",
    sound_id = "ss|3021181|element|oneshot|Warhammer miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021181/play/?auth_token=",
  },
  warhammer_hit = {
    name = "Warhammer hit",
    sound_id = "ss|3021183|element|oneshot|Warhammer hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021183/play/?auth_token=",
  },
  warhammer_critical = {
    name = "Warhammer critical",
    sound_id = "ss|3021182|element|oneshot|Warhammer critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021182/play/?auth_token=",
  },
  club_miss = {
    name = "Club miss",
    sound_id = "ss|3021162|element|oneshot|Club miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021162/play/?auth_token=",
  },
  club_hit = {
    name = "Club hit",
    sound_id = "ss|3021163|element|oneshot|Club hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021163/play/?auth_token=",
  },
  club_critical = {
    name = "Club critical",
    sound_id = "ss|3021164|element|oneshot|Club critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021164/play/?auth_token=",
  },
  flail_miss = {
    name = "Flail miss",
    sound_id = "ss|2712692|element|oneshot|Flail miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2712692/play/?auth_token=",
  },
  flail_hit = {
    name = "Flail hit",
    sound_id = "ss|2712690|element|oneshot|Flail hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2712690/play/?auth_token=",
  },
  flail_critical = {
    name = "Flail critical",
    sound_id = "ss|2712691|element|oneshot|Flail critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2712691/play/?auth_token=",
  },
  morningstar_miss = {
    name = "Morningstar miss",
    sound_id = "ss|3022792|element|oneshot|Morningstar miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022792/play/?auth_token=",
  },
  morningstar_hit = {
    name = "Morningstar hit",
    sound_id = "ss|3022794|element|oneshot|Morningstar hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022794/play/?auth_token=",
  },
  morningstar_critical = {
    name = "Morningstar critical",
    sound_id = "ss|3022887|element|oneshot|Morningstar critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022887/play/?auth_token=",
  },
  staff_miss = {
    name = "Quarterstaff miss",
    sound_id = "ss|2717050|element|oneshot|Quarterstaff miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717050/play/?auth_token=",
  },
  staff_hit = {
    name = "Quarterstaff hit",
    sound_id = "ss|2717051|element|oneshot|Quarterstaff hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717051/play/?auth_token=",
  },
  staff_critical = {
    name = "Quarterstaff critical",
    sound_id = "ss|2717052|element|oneshot|Quarterstaff critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717052/play/?auth_token=",
  },
  light_hammer_miss = {
    name = "Light hammer miss",
    sound_id = "ss|3021184|element|oneshot|Light hammer miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021184/play/?auth_token=",
  },
  light_hammer_hit = {
    name = "Light hammer hit",
    sound_id = "ss|3021185|element|oneshot|Light hammer hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021185/play/?auth_token=",
  },

  -- === PIERCING / DAGGERS ===
  dagger_miss = {
    name = "Dagger miss",
    sound_id = "ss|2717037|element|oneshot|Dagger miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717037/play/?auth_token=",
  },
  dagger_hit = {
    name = "Dagger hit",
    sound_id = "ss|2717038|element|oneshot|Dagger hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717038/play/?auth_token=",
  },
  dagger_critical = {
    name = "Dagger critical",
    sound_id = "ss|2717039|element|oneshot|Dagger critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717039/play/?auth_token=",
  },
  spear_miss = {
    name = "Spear miss",
    sound_id = "ss|3022795|element|oneshot|Spear miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022795/play/?auth_token=",
  },
  spear_hit = {
    name = "Spear hit",
    sound_id = "ss|3022797|element|oneshot|Spear hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022797/play/?auth_token=",
  },
  spear_critical = {
    name = "Spear critical",
    sound_id = "ss|3022796|element|oneshot|Spear critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022796/play/?auth_token=",
  },

  -- === POLEARMS ===
  halberd_miss = {
    name = "Halberd miss",
    sound_id = "ss|2712707|element|oneshot|Halberd miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2712707/play/?auth_token=",
  },
  halberd_hit = {
    name = "Halberd hit",
    sound_id = "ss|3022883|element|oneshot|Halberd hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022883/play/?auth_token=",
  },
  halberd_critical = {
    name = "Halberd critical",
    sound_id = "ss|3022884|element|oneshot|Halberd critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022884/play/?auth_token=",
  },
  pike_miss = {
    name = "Pike miss",
    sound_id = "ss|2717020|element|oneshot|Pike miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717020/play/?auth_token=",
  },
  pike_hit = {
    name = "Pike hit",
    sound_id = "ss|2717016|element|oneshot|Pike hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717016/play/?auth_token=",
  },
  pike_critical = {
    name = "Pike critical",
    sound_id = "ss|2717019|element|oneshot|Pike critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717019/play/?auth_token=",
  },
  glaive_miss = {
    name = "Glaive miss",
    sound_id = "ss|3022882|element|oneshot|Glaive miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3022882/play/?auth_token=",
  },
  glaive_hit = {
    name = "Glaive hit",
    sound_id = "ss|2712706|element|oneshot|Glaive hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2712706/play/?auth_token=",
  },
  glaive_critical = {
    name = "Glaive critical",
    sound_id = "ss|2712708|element|oneshot|Glaive critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2712708/play/?auth_token=",
  },

  -- === RANGED ===
  bow_fire = {
    name = "Bow fire",
    sound_id = "ss|4373171|element|oneshot|Bow fire",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4373171/play/?auth_token=",
  },
  bow_hit = {
    name = "Arrow in flesh",
    sound_id = "ss|1040|element|oneshot|Arrow in flesh",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/1040/play/?auth_token=",
  },
  bow_critical = {
    name = "Bow critical",
    sound_id = "ss|138872|element|oneshot|Bow critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/138872/play/?auth_token=",
  },
  crossbow_fire = {
    name = "Crossbow fire",
    sound_id = "ss|1624188|element|oneshot|Crossbow fire",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/1624188/play/?auth_token=",
  },
  crossbow_hit = {
    name = "Crossbow hit",
    sound_id = "ss|4345258|element|oneshot|Crossbow hit",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4345258/play/?auth_token=",
  },
  crossbow_miss = {
    name = "Crossbow miss",
    sound_id = "ss|4345257|element|oneshot|Crossbow miss",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4345257/play/?auth_token=",
  },

  -- === NATURAL / MONSTER ATTACKS ===
  bite_attack = {
    name = "Snake bite",
    sound_id = "ss|4160891|element|oneshot|Snake bite",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4160891/play/?auth_token=",
  },
  claw_swipe = {
    name = "Claw swipe",
    sound_id = "ss|1809820|element|oneshot|Claw swipe",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/1809820/play/?auth_token=",
  },
  punch = {
    name = "Punched",
    sound_id = "ss|2199034|element|oneshot|Punched",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2199034/play/?auth_token=",
  },

  -- === WOUNDS / STATUS ===
  taking_damage = {
    name = "Taking damage",
    sound_id = "ss|715261|element|oneshot|Taking damage",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/715261/play/?auth_token=",
  },
  scream_low = {
    name = "Low-pitch scream",
    sound_id = "ss|3559951|element|oneshot|Low-pitch scream",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3559951/play/?auth_token=",
  },
  scream_high = {
    name = "High-pitch scream",
    sound_id = "ss|3559950|element|oneshot|High-pitch scream",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3559950/play/?auth_token=",
  },
  body_fall = {
    name = "Body fall",
    sound_id = "ss|4163158|element|oneshot|Body fall",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4163158/play/?auth_token=",
  },
  dying_roar = {
    name = "Dying roar",
    sound_id = "ss|3911237|element|oneshot|Dying roar",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3911237/play/?auth_token=",
  },

  -- === CRITICAL / FUMBLE ===
  fan_fumble = {
    name = "Fan Fumble",
    sound_id = "ss|228536|element|oneshot|Fan Fumble",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/228536/play/?auth_token=",
  },

  -- === MAGIC ===
  magical_windchimes = {
    name = "Magical windchimes",
    sound_id = "ss|4497403|element|oneshot|Magical windchimes",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/4497403/play/?auth_token=",
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

  -- === UTILITY ===
  unsheathe = {
    name = "Unsheathe fast",
    sound_id = "ss|2717033|element|oneshot|Unsheathe fast",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717033/play/?auth_token=",
  },
}

-- -------------------------------------------------------
--  TRIGGERS  (evaluated top-to-bottom, first match wins)
-- -------------------------------------------------------
triggers = {
  -- Official C&C weapon labels use comma order as well as prose names.
  { id = "cc_handaxe_hit", pattern = "%[damage.-%].*axe, hand", sound = "handaxe_hit" },
  { id = "cc_handaxe_attack", pattern = "%[attack.-%].*axe, hand", sound = "handaxe_miss" },
  { id = "cc_twohandaxe_hit", pattern = "%[damage.-%].*axe, two%-handed", sound = "greataxe_hit" },
  { id = "cc_twohandaxe_attack", pattern = "%[attack.-%].*axe, two%-handed", sound = "greataxe_miss" },
  { id = "cc_warhammer_hit", pattern = "%[damage.-%].*hammer, war", sound = "warhammer_hit" },
  { id = "cc_warhammer_attack", pattern = "%[attack.-%].*hammer, war", sound = "warhammer_miss" },

  -- ===== CRITICAL / FUMBLE (highest priority) ==========
  { id = "critical_fumble",  pattern = "[critical fumble]",  plain = true, sound = "fan_fumble" },
  { id = "critical_failure", pattern = "[critical failure]", plain = true, sound = "fan_fumble" },
  { id = "critical_hit",     pattern = "[critical hit]",     plain = true, sound = "longsword_critical" },
  { id = "critical_success", pattern = "[critical success]", plain = true, sound = "magical_windchimes" },

  -- ===== STATUS / WOUNDS ================================
  { id = "status_dying",       pattern = "[status: dying]",       plain = true, sound = "dying_roar" },
  { id = "status_unconscious", pattern = "[status: unconscious]", plain = true, sound = "body_fall" },
  { id = "status_critical",    pattern = "[status: critical]",    plain = true, sound = "scream_high" },
  { id = "status_heavy",       pattern = "[status: heavy]",       plain = true, sound = "scream_high" },
  { id = "status_moderate",    pattern = "[status: moderate]",    plain = true, sound = "scream_low" },
  { id = "status_light",       pattern = "[status: light]",       plain = true, sound = "taking_damage" },
  { id = "status_wounded",     pattern = "[status: wounded]",     plain = true, sound = "taking_damage" },
  { id = "effect_unconscious", pattern = "effect ['unconscious']", plain = true, sound = "body_fall" },

  -- ===== HEALING ========================================
  { id = "heal_any", pattern = "[heal]", plain = true, sound = "cure_wounds" },

  -- ===== SPELLS (before generic triggers) ===============
  { id = "spell_spare_the_dying", pattern = "spare the dying", plain = true, sound = "spare_the_dying" },
  { id = "spell_cure_wounds",     pattern = "cure wounds",     plain = true, sound = "cure_wounds" },
  { id = "spell_magic_missile",   pattern = "magic missile",   plain = true, sound = "magic_missile" },
  { id = "spell_fireball",        pattern = "fireball",        plain = true, sound = "fireball" },
  { id = "spell_save_notice",     pattern = "spell save:",     plain = true, sound = "magical_windchimes" },

  -- ===== WEAPON-SPECIFIC DAMAGE (hit/impact sounds) =====
  --  Pattern: [damage ...] followed by weapon name
  --  Uses Lua patterns (plain is nil/false)

  -- Axes (check "axe" -- matches Axe Bearded, Battle Axe, Hand Axe, Great Axe)
  { id = "dmg_greataxe", pattern = "%[damage.-%].*great.*axe",  sound = "greataxe_hit" },
  { id = "dmg_handaxe",  pattern = "%[damage.-%].*hand.*axe",   sound = "handaxe_hit" },
  { id = "dmg_axe",      pattern = "%[damage.-%].*axe",         sound = "battleaxe_hit" },

  -- Swords (specific before generic)
  { id = "dmg_greatsword",    pattern = "%[damage.-%].*greatsword",       sound = "greatsword_hit" },
  { id = "dmg_sword_short",   pattern = "%[damage.-%].*sword, short",     sound = "shortsword_hit" },
  { id = "dmg_sword_bastard", pattern = "%[damage.-%].*sword, bastard",   sound = "longsword_hit" },
  { id = "dmg_sword_long",    pattern = "%[damage.-%].*sword, long",      sound = "longsword_hit" },
  { id = "dmg_rapier",        pattern = "%[damage.-%].*rapier",           sound = "rapier_hit" },
  { id = "dmg_scimitar",      pattern = "%[damage.-%].*scimitar",         sound = "scimitar_hit" },
  { id = "dmg_sword",         pattern = "%[damage.-%].*sword",            sound = "longsword_hit" },

  -- Bludgeoning
  { id = "dmg_morningstar", pattern = "%[damage.-%].*morningstar",  sound = "morningstar_hit" },
  { id = "dmg_warhammer",   pattern = "%[damage.-%].*warhammer",    sound = "warhammer_hit" },
  { id = "dmg_flail",       pattern = "%[damage.-%].*flail",        sound = "flail_hit" },
  { id = "dmg_mace",        pattern = "%[damage.-%].*mace",         sound = "mace_hit" },
  { id = "dmg_hammer",      pattern = "%[damage.-%].*hammer",       sound = "light_hammer_hit" },
  { id = "dmg_club",        pattern = "%[damage.-%].*club",         sound = "club_hit" },
  { id = "dmg_staff",       pattern = "%[damage.-%].*staff",        sound = "staff_hit" },

  -- Piercing
  { id = "dmg_dagger",   pattern = "%[damage.-%].*dagger",  sound = "dagger_hit" },
  { id = "dmg_spear",    pattern = "%[damage.-%].*spear",   sound = "spear_hit" },
  { id = "dmg_javelin",  pattern = "%[damage.-%].*javelin",  sound = "spear_hit" },

  -- Polearms
  { id = "dmg_halberd", pattern = "%[damage.-%].*halberd",  sound = "halberd_hit" },
  { id = "dmg_pike",    pattern = "%[damage.-%].*pike",     sound = "pike_hit" },
  { id = "dmg_glaive",  pattern = "%[damage.-%].*glaive",   sound = "glaive_hit" },

  -- Monster / Natural
  { id = "dmg_bite",  pattern = "%[damage.-%].*bite",    sound = "bite_attack" },
  { id = "dmg_claw",  pattern = "%[damage.-%].*claw",    sound = "claw_swipe" },
  { id = "dmg_slam",  pattern = "%[damage.-%].*slam",    sound = "punch" },
  { id = "dmg_fist",  pattern = "%[damage.-%].*fist",    sound = "punch" },

  -- Ranged damage
  { id = "dmg_crossbow", pattern = "%[damage.-%].*crossbow",  sound = "crossbow_hit" },
  { id = "dmg_sling",    pattern = "%[damage.-%].*sling",     sound = "bow_hit" },
  { id = "dmg_dart",     pattern = "%[damage.-%].*dart",      sound = "bow_hit" },

  -- ===== WEAPON-SPECIFIC ATTACK (miss/swoosh sounds) =====

  -- Axes
  { id = "atk_axe",   pattern = "%[attack.-%].*axe",   sound = "battleaxe_miss" },

  -- Swords (specific before generic)
  { id = "atk_sword_short",   pattern = "%[attack.-%].*sword, short",    sound = "shortsword_miss" },
  { id = "atk_sword_bastard", pattern = "%[attack.-%].*sword, bastard",  sound = "longsword_miss" },
  { id = "atk_rapier",        pattern = "%[attack.-%].*rapier",          sound = "rapier_miss" },
  { id = "atk_scimitar",      pattern = "%[attack.-%].*scimitar",        sound = "scimitar_miss" },
  { id = "atk_sword",         pattern = "%[attack.-%].*sword",           sound = "longsword_miss" },

  -- Bludgeoning
  { id = "atk_flail",  pattern = "%[attack.-%].*flail",  sound = "flail_miss" },
  { id = "atk_mace",   pattern = "%[attack.-%].*mace",   sound = "mace_miss" },
  { id = "atk_hammer", pattern = "%[attack.-%].*hammer",  sound = "warhammer_miss" },
  { id = "atk_club",   pattern = "%[attack.-%].*club",   sound = "club_miss" },
  { id = "atk_staff",  pattern = "%[attack.-%].*staff",  sound = "staff_miss" },

  -- Piercing
  { id = "atk_dagger",  pattern = "%[attack.-%].*dagger",  sound = "dagger_miss" },
  { id = "atk_spear",   pattern = "%[attack.-%].*spear",   sound = "spear_miss" },

  -- Polearms
  { id = "atk_halberd", pattern = "%[attack.-%].*halberd",  sound = "halberd_miss" },
  { id = "atk_pike",    pattern = "%[attack.-%].*pike",     sound = "pike_miss" },
  { id = "atk_glaive",  pattern = "%[attack.-%].*glaive",   sound = "glaive_miss" },

  -- Monster / Natural
  { id = "atk_bite",     pattern = "%[attack.-%].*bite",     sound = "bite_attack" },
  { id = "atk_claw",     pattern = "%[attack.-%].*claw",     sound = "claw_swipe" },
  { id = "atk_slam",     pattern = "%[attack.-%].*slam",     sound = "punch" },
  { id = "atk_fist",     pattern = "%[attack.-%].*fist",     sound = "punch" },
  { id = "atk_unarmed",  pattern = "%[attack.-%].*unarmed",  sound = "punch" },
  { id = "atk_pummel",   pattern = "%[attack.-%].*pummel",   sound = "punch" },
  { id = "atk_overbear", pattern = "%[attack.-%].*overbear", sound = "punch" },
  { id = "atk_touch",    pattern = "%[attack.-%].*touch",    sound = "magical_windchimes" },

  -- Ranged attack
  { id = "atk_crossbow", pattern = "%[attack.-%].*crossbow", sound = "crossbow_fire" },
  { id = "atk_sling",    pattern = "%[attack.-%].*sling",    sound = "bow_fire" },
  { id = "atk_dart",     pattern = "%[attack.-%].*dart",     sound = "bow_fire" },
  { id = "atk_bow",      pattern = "%[attack.-%].*bow",      sound = "bow_fire" },

  -- ===== GENERIC FALLBACKS ==============================
  { id = "initiative_roll", pattern = "[init]",        plain = true, sound = "roll_initiative" },
  { id = "attack_ranged",   pattern = "[attack (r)]",  plain = true, sound = "bow_fire" },
  { id = "damage_ranged",   pattern = "[damage (r)]",  plain = true, sound = "bow_hit" },
  { id = "attack_melee",    pattern = "[attack (m)]",  plain = true, sound = "longsword_miss" },
  { id = "damage_melee",    pattern = "[damage (m)]",  plain = true, sound = "longsword_hit" },
  { id = "siege_attack_ranged", pattern = "[attack] (r)", plain = true, sound = "bow_fire" },
  { id = "siege_damage_ranged", pattern = "[damage] (r)", plain = true, sound = "bow_hit" },
  { id = "attack_generic",  pattern = "[attack]",      plain = true, sound = "longsword_miss" },
  { id = "damage_generic",  pattern = "[damage]",      plain = true, sound = "longsword_hit" },
}

-- Additional C&C natural attacks use physical families instead of a sword.
-- These are deliberately generic, not species-specific creature recordings.
function onInit()
local naturalFamilies = {
  { "talon", "claw_swipe" }, { "rake", "claw_swipe" },
  { "fang", "bite_attack" }, { "teeth", "bite_attack" },
  { "gore", "spear_hit" }, { "horn", "spear_hit" }, { "tusk", "spear_hit" },
  { "sting", "spear_hit" }, { "beak", "spear_hit" }, { "spike", "spear_hit" },
  { "hoof", "punch" }, { "hooves", "punch" }, { "tail", "punch" },
  { "stomp", "punch" }, { "trample", "punch" }, { "crush", "punch" },
  { "constrict", "punch" }, { "tentacle", "punch" }, { "wing", "punch" },
}
local insertion = #triggers + 1
for i, trigger in ipairs(triggers) do
  if trigger.id == "initiative_roll" then insertion = i; break end
end
for _, family in ipairs(naturalFamilies) do
  for _, tag in ipairs({ "attack", "damage" }) do
    table.insert(triggers, insertion, {
      id = "cc_" .. tag .. "_" .. family[1],
      pattern = "%[" .. tag .. ".-%].*%f[%a]" .. family[1], sound = family[2],
    })
    insertion = insertion + 1
  end
end
local function addEvent(id, pattern, sound, plain)
  table.insert(triggers, insertion, { id = id, pattern = pattern, sound = sound, plain = plain })
  insertion = insertion + 1
end
-- Explicit defense/save events only; a missed attack does not imply a shield.
addEvent("cc_save", "[save", "magical_windchimes", true)
addEvent("cc_defense", "[defen", "magical_windchimes", true)
-- Typed damage gets a semantic fallback when no named spell/weapon matched.
sounds.damage_acid = { name = "Acid Splash (generic acid damage)", sound_id = "ss|415550|element|oneshot|Acid Splash" }
sounds.damage_cold = { name = "Ray of Frost (generic cold damage)", sound_id = "ss|415570|element|oneshot|Ray of Frost" }
sounds.damage_lightning = { name = "Lightning Bolt (generic lightning damage)", sound_id = "ss|415692|element|oneshot|Lightning Bolt" }
sounds.damage_poison = { name = "Poison Spray (generic poison damage)", sound_id = "ss|618107|element|oneshot|Poison Spray" }
for _, damage in ipairs({ {"acid","damage_acid"}, {"cold","damage_cold"},
    {"fire","fireball"}, {"lightning","damage_lightning"}, {"electric","damage_lightning"},
    {"poison","damage_poison"}, {"slashing","longsword_hit"}, {"piercing","dagger_hit"},
    {"bludgeoning","punch"}, {"sonic","magical_windchimes"}, {"thunder","magical_windchimes"},
    {"force","magical_windchimes"}, {"psychic","magical_windchimes"},
    {"necrotic","magical_windchimes"}, {"radiant","magical_windchimes"} }) do
  addEvent("cc_type_" .. damage[1], "%[type: [^%]]*%f[%a]" .. damage[1] .. "%f[%A]", damage[2])
end
end
