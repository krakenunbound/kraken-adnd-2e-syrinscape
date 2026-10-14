-- Named extension scripts do not have a guaranteed initialization order.
CCSyrinCatalog = CCSyrinCatalog or {}

CCSyrinCatalog.sounds = {
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
  dagger_critical = {
    name = "Dagger critical",
    sound_id = "ss|2717039|element|oneshot|Dagger critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/2717039/play/?auth_token=",
  },
  battle_axe_critical = {
    name = "Battle axe critical",
    sound_id = "ss|3021192|element|oneshot|Battle axe critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/3021192/play/?auth_token=",
  },
  bow_critical = {
    name = "Bow critical",
    sound_id = "ss|138872|element|oneshot|Bow critical",
    so_play = "syrinscape-online://syrinscape.com/online/frontend-api/elements/138872/play/?auth_token=",
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
}

CCSyrinCatalog.triggers = {
  { id = "miss_automatic", pattern = "[miss-automatic]", plain = true, sound = "sword_swoosh" },
  { id = "mirror_image_hit", pattern = "[mirror-image hit]", plain = true, sound = "magical_windchimes" },
  { id = "stoneskin_hit", pattern = "[stoneskin hit]", plain = true, sound = "magical_windchimes" },
  { id = "displacement_hit", pattern = "[displacement]", plain = true, sound = "magical_windchimes" },
  { id = "concentration_broken", pattern = "concentration broken by damage", plain = true, sound = "magical_windchimes" },
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
}

