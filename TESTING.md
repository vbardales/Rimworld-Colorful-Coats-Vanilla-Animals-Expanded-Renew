# Test scenarios

Three patch files, 222 textures, no assembly and no def of its own. There is very little here to
break, and **everything that can break breaks silently** — twice over, which is more than the
other mods of this family have to contend with.

**The absence of errors in the log is not a pass.** Two separate mechanisms in this mod swallow
their own failures:

- `PatchOperationFindMod` compares a **display name**. A guard that does not match is not an
  error: the `match` branch is skipped, the operation returns true, and nothing is written. The
  mod installs, loads, says nothing and does nothing.
- Each of the 51 `PatchOperationAdd` operations carries `<success>Always</success>` — 14 of them
  added by this port. An operation that finds no animal reports success and writes nothing. That
  flag buys the other animals their coats when one defName moves, and it buys them by making the
  loss invisible.

Only animals on screen settle it.

## What is settled before the game starts

`_tools/Check-Coats.ps1` answers the four questions that do not need RimWorld running, and exits
non-zero naming the file or the animal when one fails:

```
powershell -File _tools/Check-Coats.ps1
```

1. Every `texPath` has its three rotation files shipped.
2. Every shipped texture is referenced by some `texPath`.
3. Every defName still exists in the mod that owns it, with no `alternateGraphics` of its own —
   and, separately, whether it exists **only** in a conditionally loaded folder.
4. The 16 animals patched twice carry the same chance and the same coats in both files, which is
   what makes scenario J harmless.

It also counts the operations that carry `<success>Always</success>`, since the whole shape of
this file depends on all 51 of them having it.

Run on 2026-09-11: 74 coats, 222 textures, nothing missing, nothing orphaned, all 51 flagged, all
35 defNames present, no `alternateGraphics` on any target, and the two passes in agreement.

The four shared checkers live in the monorepo this mod was detached from, one directory up, and
this mod passes all four:

```
powershell -File ..\scripts\Check-XmlFields.ps1  -ModPath .
powershell -File ..\scripts\Check-XmlClasses.ps1 -ModPath . -TypeLists rw16_types.txt
powershell -File ..\scripts\Check-DefRefs.ps1    -ModPath .
powershell -File ..\scripts\Check-TypeRefs.ps1   -ModPath .
```

| Checker | Result |
|---|---|
| `Check-XmlFields` | 4 files, every element maps to a 1.6 field |
| `Check-XmlClasses` | 3 type references, all resolved |
| `Check-DefRefs` | no dangling reference; the three `Class=` values are vanilla patch operations |
| `Check-TypeRefs` | no reference to a third-party type |

## Five animals the mod cannot reach on an Odyssey install

Found by check 3 on 2026-09-11, and it changes what several scenarios below expect.

Vanilla Animals Expanded splits its 1.6 content in two. `LoadFolders.xml` loads `1.6` always and
`1.6NotOdyssey` only `IfModNotActive="Ludeon.RimWorld.Odyssey"`, because **Odyssey made five of
those animals vanilla**: badger, muskox, otter, walrus and tiger are now defined in
`Data/Odyssey/Defs/ThingDefs_Races`, under the plain names `Badger`, `Muskox`, `Otter`, `Walrus`
and `Tiger`.

So on a copy of the game with Odyssey installed, `AEXP_Badger`, `AEXP_Muskox`, `AEXP_Otter`,
`AEXP_Walrus` and `AEXP_Tiger` **do not exist**, five of this mod's 35 operations match nothing,
and their nine coats never appear. Nothing is logged, because those operations carry
`<success>Always</success>`. The other 30 animals are unaffected.

This is a gap to decide about rather than a fault in the port: the patch is correct for the mod it
names, and covering the vanilla five would mean patching vanilla defs behind a guard on Odyssey,
with purpleyam's textures drawn on Ludeon's sprites. Nothing has been changed for it yet. What
matters for testing is that **the tiger, one of the two rarities this mod is known for, is on that
list**: test the rarity with the jaguar, which lives in `1.6\Defs` and is always there.

## Load order

```
VanillaExpanded.VanillaAnimalsExpanded  Vanilla Animals Expanded            2871933948  the target
VanillaExpanded.VAEEndAndExt            Vanilla Animals Expanded — Endangered  2366589898  optional
nelim.colorfulcoats.vaerenew            this mod                                        after both
```

`<loadAfter>` names both, plus `VanillaExpanded.VAECD`. **There is no `<modDependencies>`**, which
is the difference from the Megafauna port: nothing warns a player who enables this mod without
Vanilla Animals Expanded. The guards simply find no mod by that name and do nothing at all. See
scenario H.

`purpleyam.colorfulcoats.vaewildlife` and `purpleyam.colorfulcoats.vaecatsdogs` are both named in
`<incompatibleWith>` and must stay off.

## What the patch aims at

35 animals, 74 extra coats, three rotations each. The chance is per animal:

| Chance | Animals |
|---|---|
| 0.8 | Poodle (4 coats), Moa (4) |
| 0.7 | Kangaroo, Hedgehog, Muskox, Chihuahua, Pangolin (3 each) |
| 0.6 | the seven two-coat cats — Bengal, British shorthair, Maine coon, Norwegian forest, Siamese, Somali, sphynx — plus badger, beaver, black bear, hyena, koala, otter, platypus, walrus and black-footed ferret (2 each) |
| 0.5 | Black rhinoceros, rockhopper penguin (3 each); giraffe, munchkin, Persian, shih tzu (1 each) |
| 0.4 | Red panda (3), megawolverine (2) |
| 0.3 | Great Dane, rottweiler (1 each) |
| 0.05 | **Jaguar, tiger** (1 each) |

The two at `0.05` are deliberate and are the best thing in the mod. Everything else sits between
0.3 and 0.8.

**Five of those 35 are out of reach on an Odyssey install** — badger and muskox, otter and walrus,
and the tiger. Ten coats in all. See the section above before reading a plain animal as a fault.

Order inside `ColorfulCoats_VAEcore.xml` matters for scenario B: giraffe is the first operation,
the 16 wildlife animals come before the 14 pets, and **shih tzu is the last**.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

Each string below was searched for in 1.6's own `Assembly-CSharp.dll` on 2026-09-11 rather than
remembered. The method matters, and getting it wrong cost this file two rows on its first pass:
**the strings are UTF-16 and not all of them begin on an even byte.** Decoding the whole file from
offset 0 reads only half the heap, and every string that starts on an odd byte comes out as
garbage, so `IndexOf` reports it absent. Search both alignments:

```powershell
$b = [IO.File]::ReadAllBytes($dll)
foreach ($off in 0,1) { [Text.Encoding]::Unicode.GetString($b, $off, $b.Length-$off).IndexOf($s) }
```

And a string being in the assembly is **not** the same claim as a code path reaching it. The last
row of the table is there to make that distinction concrete.

| String in the log | Written by | What it would mean here |
|---|---|---|
| `in any active mod or in base resources` | `ContentFinder<T>.Get` | A `texPath` with nothing behind it. The line quotes the path, so it names the coat and the rotation. |
| `Failed to find any textures at … while constructing` | `Graphic_Multi.Init` | The same fault one level up: no rotation at all found for a coat. |
| `XML error: … doesn't correspond to any field in type` | `DirectXmlToObject` | The failure the port was checked against: it would name `alternateGraphics` or `alternateGraphicChance` and mean 1.6 renamed the field under us. The animals would still load and walk, and simply be the wrong colour. |
| `Patch operation … failed` | `PatchOperation.Complete` | Expected count from this mod: **zero**, and zero says nothing at all. Every operation carries `<success>Always</success>`. |
| `Could not find type named` | the XML loader | Only three `Class=` values are used, all vanilla patch operations. This would mean 1.6 renamed one. |
| `Adding duplicate` | `DefDatabase<T>.Add` | **Never, and not because it is missing.** The string is in the assembly; the path that would reach it is not. `AddAllInMods` removes the previous def before adding the new one, so the error inside `Add` is unreachable and the last mod loaded wins in silence. Disassembled from 1.6, recorded in the repository's own notes. |

**Two things then produce no log line at all, and it is worth knowing which:**

- A **guard that does not match** writes nothing, by design. There is no string to grep for: the
  `match` branch is skipped and the operation returns true.
- An **operation that finds no animal** writes nothing either, because `<success>Always</success>`
  says so. That is the flag this port added, and it is the price of the protection it buys.

Neither of those is reachable from `DefDatabase` at all, incidentally: this mod declares no def of
its own, so nothing it does can ever collide there. What two conflicting copies of it actually do
is in scenario K.

Lines naming other mods are not ours to fix, and are worth leaving in whatever gets pasted back.

---

## A — the coats appear at all

The one scenario that matters. Everything else assumes this one passed.

- Dev mode on, spawn **10 poodles** with the debug spawn-pawn action.
- Poodle rolls at `0.8` with four coats, so expect roughly **8 coloured, 2 original**, and expect
  to see more than one of the four colours.
- **All 10 in the original coat means the defName moved**, not bad luck: at `0.8` a clean sweep is
  about one run in ten million (`0.2^10`).
- If they all come out original, read the `defName` on Vanilla Animals Expanded's poodle as it
  stands today and compare it against the xpath in `Mod/Patches/ColorfulCoats_VAEcore.xml`.
  Nothing in the log will have said a word.

## B — the far end of the sequence

This is the scenario the port exists for, and the only one that tests the change it made.

The 30 operations of the core file sit in one `PatchOperationSequence`, and a sequence **stops at
the first operation that returns false**. Before the port, the 14 cats and dogs carried no
per-operation flag while the 21 wildlife operations already did, so one renamed breed would have
cost its coats to every breed listed after it, in silence.

- Spawn about **20 shih tzus**, the last operation in the file, and a handful of **giraffes**, the
  first.
- Both must show extra coats. Shih tzu rolls at `0.5` with one coat, so 20 all-original is about
  one run in a million.
- If the giraffe has coats and the shih tzu does not, something between them is failing and the
  sequence is stopping there — which should now be impossible, and would mean a flag was lost.

## C — the two rarities, and the one you cannot use

The jaguar and the tiger have one alternate each at `0.05`. This is the scenario most likely to be
mistaken for a bug, and half of it only works without Odyssey.

- **Test it with the jaguar.** It is defined in `1.6\Defs` and is there on every install. Spawn
  **100 jaguars** and expect about **five** in the alternate coat. Seeing none out of 100 happens
  about one run in 170 (`0.95^100`), so it is worth a second run before concluding anything.
- **The tiger is the wrong subject on an Odyssey install**, where `AEXP_Tiger` does not exist at
  all and the operation matches nothing. Spawning a hundred vanilla `Tiger` will show a hundred
  plain tigers, and that is the expected result, not a failure of the patch. Without Odyssey the
  tiger behaves exactly like the jaguar.
- Do not "fix" the rarity by raising the chance. One in twenty is purpleyam's design and the port
  keeps it untouched.

## D — the Endangered half, with and without its mod

`ColorfulCoats_VAEextras.xml` is guarded on the display name
`Vanilla Animals Expanded — Endangered`, em dash included, and covers five animals.

- With Endangered enabled: spawn **moa** (`0.8`, four coats) and **pangolin** (`0.7`, three). Both
  must show alternates.
- With Endangered disabled: the game must load with a clean log, and the other 30 animals must
  keep their coats. The guard not matching is not a failure.
- If the moa comes out plain with Endangered enabled, read the `<name>` in that mod's `About.xml`
  today and compare it against the guard character for character. A renamed target is the failure
  this mod is most exposed to, and it is completely silent.

## E — the 74 coats and the three rotations

- Beyond the poodle and the moa, the three-coat animals are worth a spawn of a dozen each:
  **kangaroo**, **hedgehog**, **chihuahua**, **pangolin**, **red panda**, **black
  rhinoceros**, **rockhopper penguin**.
- West is not shipped. RimWorld mirrors `_east` when no `_west` exists, so an animal walking west
  showing its far side reversed is correct.
- Watch a few walk in each direction, and check the north view in particular: it hides the head,
  so a wrong file there is easy to miss.
- Any missing file shows up in the log with its path, per the table above.

## F — the coat is per-animal and survives a reload

`Verse.Pawn.overrideGraphicIndex` records which entry of `alternateGraphics` a pawn drew, and it
goes into the save under that same name. The field is present in 1.6's assembly.

- Save with several coloured animals in view, quit to the menu, load again.
- Each animal keeps **its own** coat. A coat that jumps to a different animal means the index is
  being re-rolled rather than read back, which would also mean every reload reshuffles the colony's
  pets.

## G — added to a save in progress, then removed from one

The description says both are safe. What "safe" means is worth pinning down, because the index is
stored per animal: an animal generated before the mod was added has none, and no index means the
coat it was born with.

- Add the mod to a running colony that already has Vanilla Animals Expanded animals. The animals
  already in the save stay exactly as they were; **new** ones — spawned, born, tamed, or arriving
  with a caravan or a raid — draw from the coats.
- Then remove it and load the same save. The animals go back to their original coats, and nothing
  in the log names `overrideGraphicIndex`, `alternateGraphics`, or any of the 35 defNames.

## H — the mod alone, with no Vanilla Animals Expanded at all

- Enable this mod with Vanilla Animals Expanded switched off.
- **No warning appears in the mod list**, because no `<modDependencies>` is declared. All three
  guards find no mod by their names, skip their sequences, report success, and write nothing.
- The game must still load and the log must stay clean. This is the intended behaviour of a
  texture patch, and it is also the reason a player can install this mod and see nothing happen
  without any clue why.

## I — the old Cats and Dogs module, and the guard that stops at the first name

The core guard names two mods: `Vanilla Animals Expanded` and
`Vanilla Animals Expanded — Cats and Dogs`. The old standalone module defines the same 14 breeds
as the merged mod, and `PatchOperationFindMod` **stops at the first name it finds**, so the coats
arrive whichever of them the cats came from, and the block runs once.

- Today this is inert: `VanillaExpanded.VAECD` stops at 1.3 and cannot be enabled on 1.6.
- If it is ever revived, enable both it and the merged mod, then spawn a dozen Bengals. They must
  carry coats, and the chance must still look like `0.6` rather than anything higher.
- Two names in one guard is the whole point, and the reason not to split them into two guards
  sharing an xpath: two matching guards would each run their block.

## J — the eight modular guards, and what applying twice actually does

`ColorfulCoats_VAEvarious.xml` patches 16 of the same wildlife animals a second time, guarded on
the eight standalone Vanilla Animals Expanded modules — Arid Shrubland, Australia, Boreal Forest,
Desert, Ice Sheet, Temperate Forest, Tropical Rainforest, Tundra. All eight stopped at 1.3.

- On 1.6 the whole file is inert and there is nothing to see. That is the expected result.
- The reason to keep it is a player on an older game, where it is the only thing giving those 16
  animals their coats.
- If any module is ever revived, a player running **both** it and the merged mod gets those 16
  animals patched twice, since the two files guard on different names. **Compared today, the two
  copies are identical** — same chance, same `texPath` list, all 16 animals — so the def ends up
  with the element twice, the loader assigns the field twice with the same content, and the last
  one wins. Nothing changes and nothing is logged. It is worth knowing that this is harmless
  rather than assuming it doubles anything.

## K — the original enabled alongside

- Try to enable `purpleyam.colorfulcoats.vaewildlife` or `purpleyam.colorfulcoats.vaecatsdogs` at
  the same time as this one.
- `<incompatibleWith>` should refuse each pair.
- If one somehow loads anyway, **nothing is logged and nothing visibly breaks**, which is the real
  argument for the field rather than a crash would be. Neither mod declares a def, so
  `DefDatabase` is never involved; both simply add an `<alternateGraphics>` element to the same
  `PawnKindDef`, and the last one read wins. Since the two carry the same textures — purpleyam's,
  byte for byte — the animals look the same either way. The cost is two copies of 222 textures in
  memory for one visible result, not an error to grep for.

## L — the mod list entry itself

- The name reads `Colorful Coats - Vanilla Animals Expanded! Renew`.
- The Workshop banner is `About/Preview.png`, 896x504 and 552 KB, under Steam's hard 1 MB ceiling,
  and it says `Renew` rather than `1.6`.
- The icon is drawn at about 32 px in the mod list. It is a crop of the source at 64%, which keeps
  the mascot's wink and ponytail legible at that size where the uncropped image did not. Its
  weakness is a different one and is recorded here rather than rediscovered: **the animals ringing
  the mascot are not this mod's** — an alpaca, a cow, a chicken, a rabbit, a deer and a wolf, plus
  one cat that does belong. At 32 px they read as coloured fur, which is what the mod is about.

## What no check offline can catch

Both silent mechanisms point the same way. A guard whose target renamed itself writes nothing; an
operation whose animal renamed itself writes nothing either, because the flag this port added says
so. Together they mean **a renamed mod or a renamed breed produces no log line, no failed
operation and no visible error** — only animals that quietly stopped having coats. Scenarios A, B
and D exist because nothing else would ever tell us.

One of them did get caught, though, and it is worth saying which: the five animals Odyssey took
over were found by `_tools/Check-Coats.ps1`, not in the game. Reading a target's `LoadFolders.xml`
is cheap and nobody would ever have noticed the tiger by playing — a rarity at `0.05` looks
exactly the same whether it is rare or absent.
