# Changelog

All notable changes to this mod are documented here.

## [1.0.0] — 2026-09-05

First release. Port of purpleyam's **Colorful Coats - Vanilla Animals Expanded!** to RimWorld 1.6.

Nothing in this mod was broken by 1.6 — both of its `PatchOperationFindMod` guards still name
their targets exactly. The one change to the patches is hardening, not a repair.

### Added

- `About/Preview.png` and `About/ModIcon.png`, the showcase this port draws for itself rather than
  cutting out of purpleyam's textures. The banner is engraved at exactly 896x504 by a headless
  browser, so its glyphs are composed at final size and never resampled; `Art/preview.html` is
  that page and `Art/Preview-source.png` the picture behind it. The icon is a crop of
  `Art/ModIcon-source.png` at 64% of the frame, keeping the mascot legible at the 32 pixels the
  mod list actually draws, rather than a plain reduction of the whole crowd. Nothing in `Art/`
  ships: the Workshop uploader only ever sees `Mod/`.
- `TESTING.md`, twelve scenarios for the game plus what is settled before it starts. All four
  shared checkers pass, every coat ships its three rotations with nothing orphaned, and all 35
  defNames exist in the targets as installed today with no `alternateGraphics` of their own.
- No count is engraved on the banner. The rule allows one only where nothing outside this
  repository can move the number, and the 35 animals are Vanilla Animals Expanded's, not this
  mod's: a renamed breed would make the figure wrong with nobody touching the mod.

### Changed

- `<success>Always</success>` added to the 14 cat and dog `PatchOperationAdd` operations in
  `Patches/ColorfulCoats_VAEcore.xml`, which the 21 wildlife operations in the same file already
  had. `PatchOperationSequence` **stops at the first operation that returns false** — it does not
  skip it and carry on. The block runs `AEXP_CatBengal` first and `AEXP_Shih-Tzu` last, so one
  renamed breed would have quietly cost every breed after it its coats. Nothing changes today: all
  14 breeds are present.
- `Vanilla Animals Expanded — Cats and Dogs` added to the `<mods>` list of the guard in
  `Patches/ColorfulCoats_VAEcore.xml`, beside `Vanilla Animals Expanded`. The old standalone
  module defines the same 14 breeds as the merged mod — checked, all 14 — so a player who still
  runs it now gets the coats too, and a player who runs both gets them once, because
  `PatchOperationFindMod` stops at the first name it finds. Inert today: `VanillaExpanded.VAECD`
  stops at 1.3. It means the Cats and Dogs mod has nothing left to come back for even if its own
  target is revived. The name was read out of that mod's `About.xml` rather than retyped, em dash
  included.
- `packageId` changed from `purpleyam.colorfulcoats.vaewildlife` to
  `nelim.colorfulcoats.vaerenew`.
- `<name>` changed from `Colorful Coats - Vanilla Animals Expanded!` to
  `Colorful Coats - Vanilla Animals Expanded! Renew`, in line with the Dodos and Megafauna ports of
  the same family. Nothing has gone to the Workshop under the earlier form of the name, which said
  1.6 where the repository said Renew, so this replaces it rather than succeeding it.
- `<supportedVersions>` set to 1.6.
- `<incompatibleWith>` now names `purpleyam.colorfulcoats.vaecatsdogs` as well as purpleyam's
  original of this mod. Cats and Dogs patches the same 14 breeds; running both would apply the
  coats twice.
- `About/PublishedFileId.txt` dropped: it names purpleyam's Workshop item.

### Removed

- `About/colorfulwildlife1.png` through `5.png` and `About/oldcatsdogs.png`, 4.4 MB of the mod's
  11. RimWorld reads `Preview.png` and `ModIcon.png` from that folder and nothing else; those were
  Workshop screenshots, which live on the Steam page and not in the download.
- `About/Preview.png`, purpleyam's own. The port has its own showcase.

### Unchanged

- The 35 animals, their 74 coats, every `alternateGraphicChance`, and the 222 textures, byte for
  byte. That includes the jaguar and the tiger at `0.05` with one alternate each — the deliberate
  rarity in a mod where everything else sits between 0.3 and 0.8.
- **`Patches/ColorfulCoats_VAEvarious.xml` in full.** It patches the same 16 wildlife animals a
  second time, guarded on the eight standalone Vanilla Animals Expanded modules — Arid Shrubland,
  Australia, Boreal Forest, Desert, Ice Sheet, Temperate Forest, Tropical Rainforest, Tundra. All
  eight stop at 1.3, so on 1.6 the file is inert and those animals are covered by the
  `Vanilla Animals Expanded` guard instead. No name in it was corrected, because none is wrong:
  they are the names those modules had, and they are what the mod does for anyone on an older game.
- The `defName`s the patches aim at, which are not this mod's to choose.

### Verified

- Both `PatchOperationFindMod` guards still name their targets exactly.
  `Verse.ModLister.HasActiveModWithName(string)` — what the operation calls — matches on the
  **display name**, not the `packageId`, and `Vanilla Animals Expanded`
  (`VanillaExpanded.VanillaAnimalsExpanded`) and `Vanilla Animals Expanded — Endangered`
  (`VanillaExpanded.VAEEndAndExt`) both still carry those names on 1.6. The em dash was compared
  character by character rather than by eye.
- `Verse.PawnKindDef.alternateGraphics` and `alternateGraphicChance`, and
  `Verse.AlternateGraphic.texPath`, all still exist under those names in 1.6 — checked by
  reflection against `Assembly-CSharp.dll`. An XML element matching no field does not stop the
  game: it logs one line and loads with the field unset, so the animals would have loaded, walked,
  and simply been the wrong colour.
- All 35 `defName`s still exist: 30 in Vanilla Animals Expanded, 5 in Endangered.
- All 74 `texPath` values resolve to shipped textures; no shipped texture is unreferenced.
- Neither target already defines `alternateGraphics` on any of the 35.

### Not ported: Colorful Coats - Cats and Dogs!

purpleyam's separate Cats and Dogs mod
([2388932599](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599)) has nothing left
in it. Against this mod: the same 14 `PawnKindDef`s, the same `alternateGraphicChance` on every one,
the same number of coats each, and the same 78 textures — **identical by SHA-256**, differing only
in folder name (`CatBengal/` there, `AEXP_CatBengal/` here). It existed because *Vanilla Animals
Expanded — Cats and Dogs* used to be a module of its own; the merged mod defines all 14 breeds now,
and purpleyam had already folded the pets into this mod's core patch. Its own target,
`VanillaExpanded.VAECD`, stops at 1.3.
