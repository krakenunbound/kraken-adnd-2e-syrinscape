# Changelog: Kraken AD&D 2E Syrinscape

## 1.0.0 (2026-10-23)

- Rebuilt on the Kraken Traveller 2E Syrinscape 0.7.0 design: every setting is an FGU option in
  its own **Kraken Syrinscape** group (Options), campaign-wide, plus a category window
  (`/krakensyrin config`).
- Nine sound categories the GM switches on or off: Weapon Attacks, Hits and Damage,
  Criticals / Fumbles, Spells, Saves and Defences, Class Abilities, Wounds and Death, Healing,
  Initiative.
- Hidden GM rolls: Silent / Combat only (default) / All. Attack roll sound: every attack or misses
  only. Damage roll sound: weapon, damage type or both. Spell sounds: every spell, named
  recordings only, or off. Repeat guard 1-10 seconds.
- **Every spell now has a fitting sound.** Before, most spells played one generic "magical
  windchimes". Now each spell is matched to the full Syrinscape catalog: the spell's own
  recording (D&D class spell sets, Pathfinder's Ezren and Kyra sets), a related spell
  (Summon Monster IV -> Summon Monster, Melf's Acid Arrow -> Acid Arrow), the spell's energy
  or school (necromancy, illusion, summoning, enchantment, divination, abjuration), and last the
  caster's own "Nth level spell" sound (wizard, cleric, druid, bard, paladin, ranger).
- New sounds: class abilities (turn/rebuke undead, rage, smite, lay on hands, sneak attack,
  inspire courage, eldritch blast, stunning fist, wild shape), automatic misses, death,
  Kraken Krits & Fumbles results.
- Result lines that start with a number ("Attack [4] -> [at Ape] [CRITICAL FUMBLE]",
  "Damage [5] -> [to Ape] [STATUS: Wounded]") now play their sounds.
- `/krakensyrin why <text>` shows which sounds a chat line would play; `invite` uses
  Fantasy Grounds' own player invite; registers with the Kraken Agent Bridge for tests.
- Old slash-command settings (enabled, hidden, fallback) carry over into the options once.
- Fixes the catalog bug (`CCSyrinCatalog = CCSyrinCatalog or {}` hid the catalog, so only a
  small fallback played).
- The full fantasy catalog (C&C/3.5e weapon sets) instead of 20 sounds; 903 spell names
  (OSRIC, 3.5e and C&C names; 2E PHB names match by phrase: "Melf's Acid Arrow").
- 2E tags: [MISS-AUTOMATIC], [TURNUNDEAD], mirror image, stoneskin, displacement.

## 0.2.1

Earlier version: chat-driven sounds with slash-command settings.
