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

Everything below was run on 2026-09-11 and passed. None of it says the coats appear.

The four shared checkers live in the monorepo this mod was detached from, one directory up:

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

Three more facts that need no game and were checked by hand, since this mod has no checker script
of its own the way the Megafauna port does:

- **74 coats, 222 textures, every rotation shipped.** Each `texPath` has its `_north`, `_south`
  and `_east` file. Nothing is missing and nothing is orphaned: the 74 stems on disk are exactly
  the 74 the patches reference.
- **All 35 defNames exist in the target mods as they are installed today**, 30 in Vanilla Animals
  Expanded and 5 in Endangered.
- **Neither target defines `alternateGraphics` itself**, so nothing is being overwritten.

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

Order inside `ColorfulCoats_VAEcore.xml` matters for scenario B: giraffe is the first operation,
the 16 wildlife animals come before the 14 pets, and **shih tzu is the last**.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

Each string below was searched for in 1.6's own `Assembly-CSharp.dll` on 2026-09-11, in its
UTF-16 string heap, rather than remembered.

| String in the log | Written by | What it would mean here |
|---|---|---|
| `in any active mod or in base resources` | `ContentFinder<T>.Get` | A `texPath` with nothing behind it. The line quotes the path, so it names the coat and the rotation. |
| `Patch operation` … `failed` | `PatchOperation.Complete` | Expected count from this mod: **zero**, and zero says nothing at all. Every operation carries `<success>Always</success>`. |
| `Could not find type named` | the XML loader | Only three `Class=` values are used, all vanilla patch operations. This would mean 1.6 renamed one. |

**Three things produce no log line at all, and it is worth knowing which:**

- A **guard that does not match** writes nothing, by design. There is no string to grep for.
- A **duplicate defName** between two active mods is not reported either: the last loaded
  silently overwrites. `<incompatibleWith>` is the only protection against running purpleyam's
  original alongside this port.
- The **field-mismatch warning is not in 1.6 under the wording the Megafauna port's notes use.**
  Neither `doesn't correspond to any field in type` nor `Failed to find any textures at` exists in
  this build's strings. So do not wait on the log to tell you `alternateGraphics` was renamed —
  `Check-XmlFields.ps1` answers that question offline, and it is the reason to run it.

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

## C — the two rarities

The jaguar and the tiger have one alternate each at `0.05`. This is the scenario most likely to be
mistaken for a bug.

- Spawn **100 tigers**. Expect about **five** in the alternate coat.
- Seeing none out of 100 happens about one run in 170 (`0.95^100`), so it is worth a second run
  before concluding anything.
- Do not "fix" this by raising the chance. One tiger in twenty is purpleyam's design and the port
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
  **kangaroo**, **hedgehog**, **muskox**, **chihuahua**, **pangolin**, **red panda**, **black
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
arrive whichever of them the cats came from, and arrive once.

- Today this is inert: `VanillaExpanded.VAECD` stops at 1.3 and cannot be enabled on 1.6.
- If it is ever revived, enable both it and the merged mod, then spawn a dozen Bengals. Each must
  carry at most one `alternateGraphics` list. Two lists would mean the guard applied twice, which
  would double the chances and duplicate the entries.

## J — the eight modular guards, and the double-application risk

`ColorfulCoats_VAEvarious.xml` patches 16 of the same wildlife animals a second time, guarded on
the eight standalone Vanilla Animals Expanded modules — Arid Shrubland, Australia, Boreal Forest,
Desert, Ice Sheet, Temperate Forest, Tropical Rainforest, Tundra. All eight stopped at 1.3.

- On 1.6 the whole file is inert and there is nothing to see. That is the expected result.
- The reason to keep it is a player on an older game, where it is the only thing giving those 16
  animals their coats.
- The risk to watch if any module is ever revived: a player running **both** a module and the
  merged mod gets the same 16 animals patched twice, since the two files guard on different names.
  The symptom is a doubled `alternateGraphics` list, not an error.

## K — the original enabled alongside

- Try to enable `purpleyam.colorfulcoats.vaewildlife` or `purpleyam.colorfulcoats.vaecatsdogs` at
  the same time as this one.
- `<incompatibleWith>` should refuse each pair. If one somehow loads anyway, **nothing is logged**:
  the duplicate defName is resolved silently by load order, and the animals end up with whichever
  list was applied last.

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
