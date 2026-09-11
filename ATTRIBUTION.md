# Colorful Coats - Vanilla Animals Expanded! — attribution

A 1.6 port of **Colorful Coats - Vanilla Animals Expanded!**, by **purpleyam**
([2398446130](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130)).

## Status: public

The source mod is **dead** — it declares 1.4 and nothing further — and **no licence is declared
anywhere**, checked at the four places one could be: no `LICENSE` file in the mod, no mention in
its `About.xml`, no linked repository (`<url>` is absent entirely), and nothing in the body of
the description on its Steam page. That last check is the one that matters: it is the one that
was skipped once on たたら製鉄, whose ban on redistribution turned out to be a sentence in its
description and nowhere else.

This is the usual convention for ports on the RimWorld Workshop: republished with **credit by
name** and **removal on request, without argument**. The `<author>` field reads
`purpleyam - 1.6 port: nelim`, and the removal clause is in the description.

purpleyam published four mods under the *Colorful Coats* name. Three are ported, each in its own
repository; the fourth is not, and this is the mod that makes it redundant — see below.

## What was carried over

Everything the mod contained, which is three patch files and 222 textures. There is no `Defs`
folder, no assembly and no C# — the mod does one thing and does it in XML.

| | |
|---|---|
| `Patches/ColorfulCoats_VAEcore.xml` | 30 animals, guarded on `Vanilla Animals Expanded` and, added by the port, `Vanilla Animals Expanded — Cats and Dogs` |
| `Patches/ColorfulCoats_VAEextras.xml` | 5 animals, guarded on `Vanilla Animals Expanded — Endangered` |
| `Patches/ColorfulCoats_VAEvarious.xml` | the same 16 wildlife animals again, guarded on the eight old modular mods |
| `Textures/Things/Pawn/Animal/…` (222 files, 74 coats) | purpleyam's, byte for byte |

The 35 animals, their 74 coats and every `alternateGraphicChance` are purpleyam's, unchanged.

**The two most interesting numbers in the mod are the two lowest.** The jaguar and the tiger get
a single alternate each at `0.05` — one animal in twenty, where everything else sits between 0.3
and 0.8. That is a deliberate rarity, not an oversight, and it survives the port untouched.

`About/Preview.png` was **not** carried over; the port has its own. purpleyam's five extra
screenshots in `About/` were dropped, along with `oldcatsdogs.png`: RimWorld reads `Preview.png`
and `ModIcon.png` from that folder and nothing else, and those were 4.4 MB of the mod's 11.

## What the mod does

`PawnKindDef` carries two fields the game has had for a long time and still has in 1.6, checked
by reflection against `Assembly-CSharp.dll`:

```
Verse.PawnKindDef.alternateGraphics      List<Verse.AlternateGraphic>
Verse.PawnKindDef.alternateGraphicChance float
Verse.AlternateGraphic.texPath           string
```

A `PatchOperationAdd` puts both onto each animal's `PawnKindDef`, and the game then rolls a coat
for each animal as it is generated. That is the entire mod.

## Nothing was broken

`PatchOperationFindMod` matches on a mod's **display name**, not on its `packageId` —
`Verse.ModLister.HasActiveModWithName(string)`, which is what the operation calls, takes a name.
That is what killed the Dodos mod in this family, whose target had been renamed. Here it did not:

| guard | target today | verdict |
|---|---|---|
| `Vanilla Animals Expanded` | `VanillaExpanded.VanillaAnimalsExpanded`, 1.4–1.6, same name | matches |
| `Vanilla Animals Expanded — Endangered` | `VanillaExpanded.VAEEndAndExt`, 1.4–1.6, same name | matches, em dash and all |

The em dash was compared character by character rather than by eye, because that is the sort of
thing that reads identical and is not — and the comparison was done on the raw UTF-8 bytes of both
files, not on what a console printed, which is a second way to be fooled.

### One name was added: the old Cats and Dogs module

`Vanilla Animals Expanded — Cats and Dogs` (`VanillaExpanded.VAECD`) now sits in the same `<mods>`
list as `Vanilla Animals Expanded`. It defines the same 14 breeds as the merged mod — all 14,
checked — so a player who never moved off the standalone module gets the coats too, where before
the guard would have skipped them in silence.

It cannot double-apply: `PatchOperationFindMod` stops at the first name it finds, so a player
running both mods still gets one pass. And it is inert today, because `VanillaExpanded.VAECD`
stops at 1.3. Its point is what it settles rather than what it does: if that module were ever
revived for 1.6, this mod would already cover it, and the fourth Colorful Coats mod would still
have nothing to come back for.

The name was read out of `VanillaExpanded.VAECD`'s own `About.xml` and written straight into the
patch, never retyped, so the em dash is the mod author's own character.

- **Both `PawnKindDef` fields still exist under those names.** This is the failure mode that
  kills ported XML quietly: RimWorld does not stop for an element that matches no field, it logs
  one line and loads with the field unset — the animal would load, walk, and simply be the wrong
  colour.
- **All 35 `defName`s still exist**: the 30 in Vanilla Animals Expanded, the 5 in Endangered.
- **All 74 `texPath` values resolve** to textures the mod ships, and no shipped texture is
  unreferenced.
- **Neither target defines `alternateGraphics` on any of them already**, so the patch is not
  fighting anything.

### The eight modular guards were left alone

`ColorfulCoats_VAEvarious.xml` patches the same 16 wildlife animals a second time, guarded on the
eight standalone Vanilla Animals Expanded modules — Arid Shrubland, Australia, Boreal Forest,
Desert, Ice Sheet, Temperate Forest, Tropical Rainforest, Tundra. That was purpleyam's support
for players who had not moved to the merged mod.

Every one of those eight stops at 1.3. On 1.6 none of the guards can match, so the whole file is
inert, and the animals are covered by the `Vanilla Animals Expanded` guard instead. It is kept
exactly as written: it costs nothing, and it is what the mod does for anyone running it on an
older game. No name in it was corrected, because none of them is wrong — they are the names those
modules had.

## The one change to the patches, and why

The 14 cats and dogs in `ColorfulCoats_VAEcore.xml` now carry `<success>Always</success>`, as the
21 wildlife animals in the same file already did.

They sit inside a single `PatchOperationSequence`, and a sequence **stops at the first operation
that returns false** — it does not skip and carry on. The block runs `AEXP_CatBengal` first and
`AEXP_Shih-Tzu` last, so one renamed breed would have quietly cost every breed after it its
coats. purpleyam had the flag on the wildlife half of the file and not on the pets half; this
brings the two into line.

Nothing about it changes what happens today: all 14 breeds are present in Vanilla Animals
Expanded's 1.6 release.

## This mod replaces Colorful Coats - Cats and Dogs!

**Colorful Coats - Cats and Dogs!**
([2388932599](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599)) is not ported,
because there is nothing left in it. Compared against this mod:

- the same 14 `PawnKindDef`s — `AEXP_CatBengal`, `AEXP_CatBritishShorthair`, `AEXP_CatMaineCoon`,
  `AEXP_CatMunchkin`, `AEXP_CatNorwegianForest`, `AEXP_CatPersian`, `AEXP_CatSiamese`,
  `AEXP_CatSomali`, `AEXP_CatSphynx`, `AEXP_Chihuahua`, `AEXP_GreatDane`, `AEXP_Poodle`,
  `AEXP_Rottweiler`, `AEXP_Shih-Tzu`
- the same `alternateGraphicChance` on every one of them, and the same number of coats each
- the same 78 textures, **identical by SHA-256**; only the folder names differ (`CatBengal/`
  there, `AEXP_CatBengal/` here)

It existed because *Vanilla Animals Expanded — Cats and Dogs* (`VanillaExpanded.VAECD`) used to be
a module of its own. Vanilla Animals Expanded has since absorbed it — the merged mod defines all
14 breeds — and purpleyam had already folded the pets into this mod's core patch by then.
`About/oldcatsdogs.png`, still sitting in the original's About folder, is the leftover of that.
`VanillaExpanded.VAECD` itself stops at 1.3.

**Nor would it come back if its target did.** The obvious reason not to port Cats and Dogs is that
`VanillaExpanded.VAECD` does not declare 1.6, which invites the conclusion that the mod should be
picked up again the day it does. It should not: the redundancy is with *this* mod, not with the
game version, and a revived module would change nothing about it. Since this port's guard now
names that module too, a player on a 1.6 Cats and Dogs would get these 74 coats — the same 78
textures, the same chances — from here. There is no version of the future in which the fourth mod
has content of its own.

Both are declared in `<incompatibleWith>`: purpleyam's original of this mod, and the Cats and Dogs
mod, which would patch the same 14 breeds a second time.

## Thanks

- **purpleyam**, for the coats.
- **Oskar Potocki**, **Sarg Bjornson** and **Erin**, for Vanilla Animals Expanded.
