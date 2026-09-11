# Colorful Coats - Vanilla Animals Expanded! Renew

Port of **purpleyam's Colorful Coats - Vanilla Animals Expanded!** to RimWorld 1.6.

**I am not the author of this mod.** The coats and the whole idea are purpleyam's — all I did was
the work needed to run it on 1.6. Credit goes to them; mistakes in the port are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130 — declares 1.4 and
nothing further. The page is still online; the mod is abandoned, not withdrawn.

## What the mod does

Coat variations for 35 animals of Vanilla Animals Expanded: 74 extra coats in all.

- **Pets** — the nine cat breeds and the five dog breeds, so a colony's animals stop being
  interchangeable.
- **Wildlife** — badger, beaver, black bear, giraffe, hedgehog, hyena, jaguar, kangaroo, koala,
  megawolverine, muskox, otter, platypus, red panda, tiger, walrus.
- **Endangered**, if that mod is running — black-footed ferret, black rhinoceros, moa, pangolin,
  rockhopper penguin.

Most sit between a 30% and an 80% chance of an alternate coat. **The jaguar and the tiger have one
alternate each, at 5%.** One tiger in twenty. That rarity is purpleyam's design and the best thing
in the mod, and it survives the port untouched.

Three patch files, 222 textures, no `Defs`, no assembly, no Harmony, no DLC. Safe to add to a save
in progress and safe to remove from one: it changes how an animal is drawn, nothing else.

## What it needs

**Vanilla Animals Expanded** — https://steamcommunity.com/workshop/filedetails/?id=2871933948 —
and optionally **Vanilla Animals Expanded — Endangered**. Neither is declared as a hard dependency,
because the mod does something useful with either one alone.

## It replaces Colorful Coats - Cats and Dogs!

purpleyam's separate [Cats and
Dogs](https://steamcommunity.com/sharedfiles/filedetails/?id=2388932599) mod is not being ported,
because there is nothing left in it. Compared against this mod: the same 14 `PawnKindDef`s, the
same coat chance on every one, the same number of coats each, and the same 78 textures —
**identical by SHA-256**, differing only in folder name.

It existed because *Vanilla Animals Expanded — Cats and Dogs* used to be a module of its own.
Vanilla Animals Expanded has since absorbed it, and purpleyam had already folded the pets into
this mod's core patch by then; `About/oldcatsdogs.png`, still in the original's About folder, is
the leftover of that. Run this one and you have both. They are declared incompatible, since
running them together would patch the same cats twice.

**And it would not come back even if its target did.** `VanillaExpanded.VAECD` stops at 1.3, which
invites the conclusion that Cats and Dogs should be picked up again the day the module returns. It
should not: the redundancy is with *this* mod, not with the game version. This port's guard now
names the old module alongside the merged one, and the two define the same 14 breeds, so a player
on a revived Cats and Dogs would get these coats from here — once, because
`PatchOperationFindMod` stops at the first name it finds.

## What was checked, and what it found

`PatchOperationFindMod` matches on a mod's **display name**, not on its `packageId`:

```csharp
Verse.ModLister.HasActiveModWithName(string name)   // what the operation calls
```

That is what killed the Dodos mod in this family, whose target had been renamed. Here it did not:

| guard | target today | verdict |
|---|---|---|
| `Vanilla Animals Expanded` | `VanillaExpanded.VanillaAnimalsExpanded`, 1.4–1.6 | matches |
| `Vanilla Animals Expanded — Endangered` | `VanillaExpanded.VAEEndAndExt`, 1.4–1.6 | matches |

The em dash was compared character by character rather than by eye, on the raw UTF-8 bytes of both
files rather than on what a console printed — that is the sort of thing that reads identical and
is not, in two different ways.

One name was **added**: `Vanilla Animals Expanded — Cats and Dogs`, in the same `<mods>` list as
`Vanilla Animals Expanded`. See above.

**The two fields still exist under those names.** Verified by reflection against the 1.6
`Assembly-CSharp.dll`:

```
Verse.PawnKindDef.alternateGraphics      List<Verse.AlternateGraphic>
Verse.PawnKindDef.alternateGraphicChance float
Verse.AlternateGraphic.texPath           string
```

This is the failure mode that kills ported XML quietly. RimWorld does not stop for an element that
matches no field — it logs one line and loads with the field unset. A renamed field here would
have left every animal loading, walking and simply being the wrong colour.

**All 35 `defName`s still exist**, all 74 `texPath`s resolve to shipped textures, no shipped
texture is unreferenced, and neither target already defines `alternateGraphics` on any of them.

### The eight modular guards were left alone

`ColorfulCoats_VAEvarious.xml` patches the same 16 wildlife animals a second time, guarded on the
eight standalone Vanilla Animals Expanded modules that predate the merged mod. All eight stop at
1.3, so on 1.6 the whole file is inert and the animals are covered by the `Vanilla Animals
Expanded` guard instead.

It is kept exactly as written. No name in it was corrected, because none is wrong — they are the
names those modules had, and they are what the mod does for anyone still running an older game.

## The one change to the patches

The 14 cats and dogs in `ColorfulCoats_VAEcore.xml` now carry `<success>Always</success>`, as the
21 wildlife animals in the same file already did.

`PatchOperationSequence` **stops at the first operation that returns false** — it does not skip and
carry on. The block runs `AEXP_CatBengal` first and `AEXP_Shih-Tzu` last, so one renamed breed
would have quietly cost every breed after it its coats. purpleyam had the flag on the wildlife half
of the file and not on the pets half; this brings the two into line, and changes nothing about what
happens today.

The five large screenshots left in `About/`, plus `oldcatsdogs.png`, were also dropped. RimWorld
reads `Preview.png` and `ModIcon.png` from that folder and nothing else, and those were 4.4 MB of
the mod's 11.

## Layout

```
Mod/          published — the junction into RimWorld/Mods points here
  About/
  Patches/
  Textures/
```

Everything outside `Mod/` — this file, the changelog, the attribution — stays out of the Steam
upload by construction. `SteamUGC.SetItemContent` takes the junction's target directory as it
stands on disk, with no filtering.

## Credit and removal

purpleyam declared no licence, checked at all four places one could be: no `LICENSE` file, nothing
in `About.xml`, no linked repository, and nothing in the body of the Steam description. Republished
under the usual convention for abandoned mods — full credit, a link to the original, removal on
request. If purpleyam would rather this did not exist, say so and it comes down.

See [ATTRIBUTION.md](ATTRIBUTION.md) for what was taken and what was changed, [LICENSE](LICENSE)
for what the MIT grant does and does not cover, and [CHANGELOG.md](CHANGELOG.md).

The port work was done with the help of an AI assistant (Claude, by Anthropic), under human
direction and in-game testing.
