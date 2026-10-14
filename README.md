# Kraken AD&D 2E Syrinscape

A Fantasy Grounds Unity extension for the **AD&D 2E** ruleset that plays **Syrinscape** sound effects on its own as the game happens: a sword swoosh on a melee attack, a bow on a ranged one, a clash on damage, a groan when someone is badly hurt, a fanfare on a fumble, and a spell's own sound when it is cast.

> **Beta.** It is in use at Kraken's own table. The trigger list is basic (attacks and damage aren't yet weapon-specific), and the spell sounds come from Syrinscape's spell library, so a 2E spell plays only when its name matches one there. Tell us which sounds you miss.

## What it plays

| In chat | Sound |
| --- | --- |
| Melee attack / ranged attack | Sword swoosh / bow fire |
| Melee damage / ranged damage | Swords clash / arrow in flesh |
| Critical hit | Longsword critical |
| Critical fumble or failure | Fumble fanfare |
| Initiative | "Roll initiative" |
| Wounded / heavy damage | Taking damage |
| Dying / unconscious | Dying roar |
| Mirror image, stoneskin, displacement absorbing a hit; concentration broken; spell save | Magical wind chimes |
| A spell cast by name (Cure Light Wounds, Magic Missile, Fireball, Protection from Evil and about 120 more) | That spell's sound |

Only the host (the DM) plays sounds, and each sound plays at most once a second. Secret (GM-only) rolls don't play unless you turn that on (see below).

## Install

1. Download `KrakenADD2ESyrinscape.ext` from the latest [**Release**](../../releases/latest).
2. Put it in your Fantasy Grounds data folder under `extensions\` (usually `%appdata%\SmiteWorks\Fantasy Grounds\extensions`).
3. On the FGU load screen, select your AD&D 2E campaign, click **Extensions**, and enable **Kraken AD&D 2E Syrinscape**.

### Requirements
- Fantasy Grounds Unity and the AD&D 2E ruleset
- A **Syrinscape Online** subscription, set up in Fantasy Grounds' own Syrinscape sound settings (your Syrinscape auth token, and a session if your players listen through the Syrinscape web player)

## Use

Once FGU's Syrinscape settings are filled in, there is nothing to do: sounds play as the chat shows attacks, damage and spells. The chat says `[Kraken AD&D 2E] Loaded.` when the campaign starts.

Chat commands (DM only):

| Command | What it does |
| --- | --- |
| `/krakensyrin status` | Shows whether it is on and whether FGU's Syrinscape token and session are set |
| `/krakensyrin invite` | Posts the Syrinscape session links in chat: the GM controls and the player link for your players |
| `/krakensyrin test <sound>` | Plays one sound, e.g. `/krakensyrin test fireball` |
| `/krakensyrin hidden on` / `off` | Also play sounds for secret (GM-only) rolls |
| `/krakensyrin debug on` / `off` | Shows in chat which trigger matched and what played |
| `/krakensyrin token <token>` | A fallback token if you don't use FGU's Syrinscape settings |

Sound names for `test`: `roll_initiative`, `sword_swoosh`, `bow_fire`, `arrow_in_flesh`, `taking_damage`, `swords_clash`, `fan_fumble`, `longsword_critical`, `dagger_critical`, `battle_axe_critical`, `bow_critical`, `magical_windchimes`, `fireball`, `magic_missile`, `cure_wounds`, `spare_the_dying`, `dying_roar`.

## Troubleshooting

- **No sound:** `/krakensyrin status` should show `fg_auth=set`. If it says `missing`, enter your Syrinscape auth token in FGU's Syrinscape sound settings. `/krakensyrin test fireball` checks playback on its own.
- **Players don't hear it:** they listen through the Syrinscape web player. `/krakensyrin invite` posts their link.

## Release

`python release.py` builds `KrakenADD2ESyrinscape.ext` and publishes a GitHub Release with it attached (the tag is `v` plus the version in `extension.xml`). It needs Python 3 and an authenticated GitHub CLI (`gh`).

## See also

- [Kraken AD&D 2E Character Wizard](https://github.com/krakenunbound/kraken-adnd-2e-charwizard)
- [Kraken AD&D 2E Sidebar by Default](https://github.com/krakenunbound/kraken-adnd-2e-sidebar)
