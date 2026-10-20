# Test scenarios

Four patch files, 222 textures, no assembly, no def of its own. Little here to
break, and **everything that can break breaks silently** — twice over, more than
other mods of this family.

**No errors in log not a pass.** Two mechanisms in this mod swallow
own failures:

- `PatchOperationFindMod` compares **display name**. Guard not matching not an
  error: `match` branch skipped, operation returns true, nothing written. Mod
  installs, loads, says nothing, does nothing.
- Each of 51 sequenced `PatchOperationAdd` operations carries `<success>Always</success>` — 14
  added by this port. Operation finding no animal reports success, writes
  nothing. Flag buys other animals their coats when one defName moves, and buys
  them by making loss invisible. Five conditional operations of Odyssey file silent
  for same reason without needing flag.

Only animals on screen settle it.

## Pickle passes

Two families. Structural: prove patch *landed*, not coat *renders* (`Tests/Pickle/README.md`).
Coats: prove coat actually drawn and read back, using shared CoatSteps companion. Third
family, one pass per `incompatibleWith` entry, not stageable today: both named originals
cap `supportedVersions` at 1.3, cannot load on 1.6 at all (scenario K). English/French not
applicable: mod owns no in-game text.

| Pass | Covers |
|---|---|
| Minimal, Odyssey absent | 25 DLC-independent animals, plus five Odyssey could take over, patched under `AEXP_*`. |
| Minimal, Odyssey present | Same 25, plus same five now patched under Ludeon's own bare names instead. |
| Optional integration: Endangered | Five Endangered-only animals, on top of either Odyssey state. |
| Coats drawn | Poodles draw and keep extra coat, drawn with own texture (`@review`). |
| Gallery captures (`@gallery`, `wsl-deps.gallery.map`) | Four `@review` captures for Workshop page: poodles, kangaroos, red pandas, Bengal cats. Not played yet. |
| Rare coats, Odyssey present | 100 jaguars, 100 Odyssey tigers: each draws 5% coat at least once. |
| Rare coats, Odyssey absent | 100 `AEXP_Tiger`: draws 5% coat at least once. |

## Manual scenarios: what remains to look at

`AUDIT.md` asks that no manual test stay to validate at `tested`: each automated
and green, or listed not applicable with reason. State on 2026-09-28, nothing yet run green:

| Scenario | Status | Reason |
|---|---|---|
| A coats appear | Automated, written | `coats.feature`, poodles. |
| B far end of the sequence | Automated, written | `always-patched.feature` covers all 25 animals, giraffe first, shih tzu last. |
| C the two rarities | Automated, written | `rare-jaguar`, `rare-tiger-odyssey`: 100 animals, at least one carries 5% coat. `rare-tiger-plain`: 100 on new colony (NewColony, map 150) since 2026-10-02; fixture save does not play without Odyssey (red 2026-10-01 at save load, not at placement); needs `-Extra '-pickle-scenario-timeout=400'`, own ticket. |
| D Endangered | Automated, written | `endangered.feature`; guard name proven by animals being patched. |
| E 74 coats, three rotations | Offline plus `@review` | `Check-Coats.ps1` proves every rotation file ships; north view is capture a person looks at. |
| F survives a reload | Automated, written | `coats.feature`, note and still-has-coat steps. |
| G added to, removed from a save | Not applicable | Decided 2026-10-02 (Virginie), as in other Colorful Coats ports: existing animals recolour on adding, revert on removing; nothing stored in save; game's reaction to missing mod not ours. |
| H no Vanilla Animals Expanded | Not applicable | Warning is game's reaction to declaration; declaration checked in sources (`Check-Patches.ps1`). |
| I, J legacy modules | Not applicable | Both target 1.3, cannot load on 1.6. |
| K originals enabled alongside | Not applicable | Both originals cannot load on 1.6; `incompatibleWith` checked in sources. |
| L mod list entry | Offline plus a look | Name and metadata checked offline; banner and icon inspected as images. |
| M five Odyssey animals | Automated, written | `with-odyssey.feature`, `without-odyssey.feature`. Smaller draw size is `@review` look at `coats.feature` capture. |

Written is not run: none of this a pass until passes return green.

## What is settled before the game starts

Run `powershell -File scripts/Check-Patches.ps1` for standalone XML and metadata checks:
parsing, operation classes, XPath syntax, probabilities, coat entries, package identity,
unofficial suffix, GitHub description link, dependency, identical licence copies.
This and Check-Coats passed on 2026-09-12, no installed-target checks skipped.
Checks do not execute RimWorld's patch engine or replace scenarios A–M.

`scripts/Check-Coats.ps1` answers five questions needing no running RimWorld, exits
non-zero naming file or animal on failure:

```
powershell -File scripts/Check-Coats.ps1
```

1. Every `texPath` has its three rotation files shipped.
2. Every shipped texture referenced by some `texPath`.
3. Every defName still exists in owning mod, with no `alternateGraphics` of its own —
   and, separately, whether it exists **only** in conditionally loaded folder.
4. 16 animals patched twice carry same chance and same coats in both files, which
   makes scenario J harmless.
5. Five animals of Odyssey file get same coats and chances as `AEXP_`
   counterparts, matched on coat lists since defNames deliberately differ.

Also counts sequenced operations carrying `<success>Always</success>`, since shape of
those three files depends on all 51 having it.

Run 2026-09-11 and again 2026-09-12, same result: 74 coats, 222 textures, nothing missing,
nothing orphaned, all 51 flagged, all 40 defNames present across three targets, no
`alternateGraphics` on any, both agreement checks clean.

Four shared checkers live in monorepo this mod detached from, one directory up; this
mod passes all four:

```
powershell -File ..\scripts\Check-XmlFields.ps1  -ModPath .
powershell -File ..\scripts\Check-XmlClasses.ps1 -ModPath . -TypeLists rw16_types.txt
powershell -File ..\scripts\Check-DefRefs.ps1    -ModPath .
powershell -File ..\scripts\Check-TypeRefs.ps1   -ModPath .
```

| Checker | Result |
|---|---|
| `Check-XmlFields` | 5 files, every element maps to a 1.6 field |
| `Check-XmlClasses` | 4 type references, all resolved |
| `Check-DefRefs` | no dangling reference, four `Class=` values vanilla patch operations |
| `Check-TypeRefs` | no reference to third-party type |

## The five animals Odyssey took over

Found by check 3 on 2026-09-11, why there is a fourth patch file.

Vanilla Animals Expanded splits 1.6 content in two. `LoadFolders.xml` loads `1.6` always,
`1.6NotOdyssey` only `IfModNotActive="Ludeon.RimWorld.Odyssey"`, because **Odyssey made five of
those animals vanilla**: badger, muskox, otter, walrus, tiger now defined in
`Data/Odyssey/Defs/ThingDefs_Races`, under plain names `Badger`, `Muskox`, `Otter`, `Walrus`
and `Tiger`.

So with Odyssey installed, `AEXP_Badger`, `AEXP_Muskox`, `AEXP_Otter`,
`AEXP_Walrus`, `AEXP_Tiger` do not exist, five core file operations match nothing.
Ten coats used to go missing there, tiger's among them, nothing in log to say so.

`ColorfulCoats_VAEodyssey.xml` hands those ten coats to Ludeon's five defs instead, purpleyam's
chances unchanged. One `PatchOperationConditional` per animal, keyed on def's own
existence: true exactly when Odyssey active, false and silently successful when not, and
one renamed def cannot cost other four their coats. Not guarded by
`PatchOperationFindMod`, which compares display name, because Odyssey's `About.xml` declares no
`<name>` at all, and not by `MayRequire`, which an `<Operation>` ignores.

**Two halves exclusive by construction**, what to check rather than trust: def
exists in one folder or other, never both, so no animal receives coats twice.

**Sweep run 2026-09-12, nothing conflicts.** Five conditionals key on bare
defName - `Tiger`, `Badger`, `Otter`, `Walrus`, `Muskox` - names generic enough that
another animal mod could declare one, handing that mod's animal purpleyam's coat. One
`grep -rInE --include='*.xml'` for `<defName>(Tiger|Badger|Otter|Walrus|Muskox)</defName>` over
9,726 Workshop folders and 240 local ones answers it: 41 matching lines, all in
Workshop, spread over five mods, none a live conflict.

| Mod | Declares | Why it cannot take a coat |
|---|---|---|
| Duck's Funbox | `PawnKindDef` `Tiger` | 1.0 only, duplicate of Odyssey's own defName |
| Zoo-动物（Animal） | `PawnKindDef` `Otter` | `targetVersion` 0.15.1284, Alpha 15, same duplicate |
| Legacy Ark (Continued) | `PawnKindDef` `Badger`, in `1.0` through `1.5` | its `1.6` folder renamed it `EuropeanBadger` |
| Dogs mate (Continued) | `Revolus.DogsMate.AnimalGroupDef` named for four of five | not `PawnKindDef`, xpath cannot reach it |
| Vehicle Framework | `Vehicles.PatternDef` `Tiger` | vehicle livery |

Nothing declares `Muskox` or `Walrus` as `PawnKindDef` at all. Legacy Ark's `LoadFolders` loads
exactly one version folder, so under 1.6 its `Badger` gone, renamed for the very reason this
file exists. **Two real duplicates already duplicate Odyssey's own defNames**, which settles
them: RimWorld keeps one def per defName and reports the other, so install running
either mod broken before this one patches anything. Duck's tiger even draws from
`Things/Pawn/Animal/Tiger/Tiger`, path purpleyam's coats drawn against, so coat would
land on sprite it was made for.

**Conditionals left as they are.** No field separates the two tigers: Duck's carries
same `<race>Tiger</race>` and same texture path as Ludeon's, so narrowing predicate would be
guess dressed as guard.

Looks right because Vanilla Animals Expanded ships own art for these five at same
texture paths Ludeon uses, from root `Textures` folder, loading on every version. Base
sprite player sees therefore already the one purpleyam drew coats against. What does
differ is `drawSize`:

| Animal | Vanilla Animals Expanded | Odyssey |
|---|---|---|
| Tiger | 1.3 | 1.05 |
| Muskox | 1.5 | 1.25 |
| Badger | 1 | 0.75 |
| Otter | 1 | 0.75 |
| Walrus | 1 | 1.05 |

Ludeon draws four of five a little smaller, so alternate coat rendered smaller than
authored. Nothing stretched: whole sprite scaled, base coat included, so coloured
animal and plain one always same size as each other. Scenario M is where that gets
looked at.

## Load order

```
VanillaExpanded.VanillaAnimalsExpanded  Vanilla Animals Expanded            2871933948  the target
VanillaExpanded.VAEEndAndExt            Vanilla Animals Expanded — Endangered  2366589898  optional
nelim.colorfulcoats.vae                 this mod                                        after both
```

`<loadAfter>` names both, plus `VanillaExpanded.VAECD`. **`<modDependencies>` names Vanilla Animals
Expanded alone**, added 2026-09-12 to match Megafauna port: player enabling this mod
without target now sees red line in mod list, where before nothing said a word.
Endangered stays out on purpose — mod works without it, 30 of 35 animals never
needed it. See scenario H.

`purpleyam.colorfulcoats.vaewildlife` and `purpleyam.colorfulcoats.vaecatsdogs` both named in
`<incompatibleWith>`, must stay off.

## What the patch aims at

35 animals, 74 extra coats, three rotations each. Chance per animal:

| Chance | Animals |
|---|---|
| 0.8 | Poodle (4 coats), Moa (4) |
| 0.7 | Kangaroo, Hedgehog, Muskox, Chihuahua, Pangolin (3 each) |
| 0.6 | the seven two-coat cats — Bengal, British shorthair, Maine coon, Norwegian forest, Siamese, Somali, sphynx — plus badger, beaver, black bear, hyena, koala, otter, platypus, walrus and black-footed ferret (2 each) |
| 0.5 | Black rhinoceros, rockhopper penguin (3 each); giraffe, munchkin, Persian, shih tzu (1 each) |
| 0.4 | Red panda (3), megawolverine (2) |
| 0.3 | Great Dane, rottweiler (1 each) |
| 0.05 | **Jaguar, tiger** (1 each) |

Two at `0.05` deliberate, best thing in mod. Everything else between
0.3 and 0.8.

**Five of 35 change hands on Odyssey install** — badger and muskox, otter and walrus, and
tiger. Their ten coats reach Ludeon's defs through `ColorfulCoats_VAEodyssey.xml` instead, same
chances. See section above.

Order inside `ColorfulCoats_VAEcore.xml` matters for scenario B: giraffe first operation,
16 wildlife animals before 14 pets, **shih tzu last**.

## What to search the log for

`Player.log` sits in
`%USERPROFILE%\AppData\LocalLow\Ludeon Studios\RimWorld by Ludeon Studios\Player.log`.

Each string below searched for in 1.6's own `Assembly-CSharp.dll` on 2026-09-11 rather than
remembered. Method matters, getting it wrong cost this file two rows on first pass:
**strings are UTF-16, not all begin on even byte.** Decoding whole file from
offset 0 reads only half the heap, every string starting on odd byte comes out as
garbage, so `IndexOf` reports it absent. Search both alignments:

```powershell
$b = [IO.File]::ReadAllBytes($dll)
foreach ($off in 0,1) { [Text.Encoding]::Unicode.GetString($b, $off, $b.Length-$off).IndexOf($s) }
```

String being in assembly **not** same claim as code path reaching it. Last
row of table makes distinction concrete.

| String in the log | Written by | What it would mean here |
|---|---|---|
| `in any active mod or in base resources` | `ContentFinder<T>.Get` | `texPath` with nothing behind it. Line quotes path, so names coat and rotation. |
| `Failed to find any textures at … while constructing` | `Graphic_Multi.Init` | Same fault one level up: no rotation at all found for coat. |
| `XML error: … doesn't correspond to any field in type` | `DirectXmlToObject` | Failure port was checked against: would name `alternateGraphics` or `alternateGraphicChance`, mean 1.6 renamed field under us. Animals would still load and walk, simply wrong colour. |
| `Patch operation … failed` | `PatchOperation.Complete` | Expected count from this mod: **zero**, and zero says nothing at all. Every operation carries `<success>Always</success>`. |
| `Could not find type named` | the XML loader | Only four `Class=` values used, all vanilla patch operations. Would mean 1.6 renamed one. |
| `Adding duplicate` | `DefDatabase<T>.Add` | **Never, and not because missing.** String is in assembly; path reaching it is not. `AddAllInMods` removes previous def before adding new one, so error inside `Add` unreachable, last mod loaded wins in silence. Disassembled from 1.6, recorded in repository's own notes. |

**Two things then produce no log line at all, worth knowing which:**

- **Guard not matching** writes nothing, by design. No string to grep for:
  `match` branch skipped, operation returns true.
- **Operation finding no animal** writes nothing either, because `<success>Always</success>`
  says so. Flag this port added, price of protection it buys.

Neither reachable from `DefDatabase` at all, incidentally: mod declares no def of
its own, so nothing it does can collide there. What two conflicting copies of it actually do
is in scenario K.

Lines naming other mods not ours to fix, worth leaving in whatever gets pasted back.

---

## A — the coats appear at all

One scenario that matters. Everything else assumes this passed.

- Dev mode on, spawn **10 poodles** with debug spawn-pawn action.
- Poodle rolls `0.8` with four coats, expect roughly **8 coloured, 2 original**, expect
  more than one of four colours.
- **All 10 original coat means defName moved**, not bad luck: at `0.8` clean sweep is
  about one run in ten million (`0.2^10`).
- If all original, read `defName` on Vanilla Animals Expanded's poodle as it
  stands today, compare against xpath in `Mod/Patches/ColorfulCoats_VAEcore.xml`.
  Nothing in log will have said a word.

## B — the far end of the sequence

Scenario port exists for, only one testing change it made.

30 operations of core file sit in one `PatchOperationSequence`, and sequence **stops at
first operation returning false**. Before port, 14 cats and dogs carried no
per-operation flag while 21 wildlife operations already did, so one renamed breed would have
cost its coats to every breed listed after, in silence.

- Spawn about **20 shih tzus**, last operation in file, and handful of **giraffes**, the
  first.
- Both must show extra coats. Shih tzu rolls `0.5` with one coat, so 20 all-original about
  one run in a million.
- If giraffe has coats and shih tzu does not, something between failing and
  sequence stopping there — should now be impossible, would mean flag lost.

## C — the two rarities

Jaguar and tiger have one alternate each at `0.05`. Scenario most likely to be
mistaken for bug: at one in twenty, absent and rare look identical.

- Spawn **100 jaguars**, expect about **five** in alternate coat. Seeing none out of 100
  happens about one run in 170 (`0.95^100`), so worth second run before concluding
  anything.
- Then same with **tigers**, mind which tiger you look at. With Odyssey animal
  is Ludeon's `Tiger`, coat from `ColorfulCoats_VAEodyssey.xml`; without Odyssey it is
  `AEXP_Tiger` from core file. **Both must show roughly five in a hundred**, whole
  point of fourth patch file is answer no longer depends on which of two the
  player has.
- Do not "fix" rarity by raising chance. One in twenty is purpleyam's design, port
  keeps it untouched.

## D — the Endangered half, with and without its mod

`ColorfulCoats_VAEextras.xml` guarded on display name
`Vanilla Animals Expanded — Endangered`, em dash included, covers five animals.

- With Endangered enabled: spawn **moa** (`0.8`, four coats) and **pangolin** (`0.7`, three). Both
  must show alternates.
- With Endangered disabled: game must load with clean log, other 30 animals must
  keep coats. Guard not matching not a failure.
- If moa plain with Endangered enabled, read `<name>` in that mod's `About.xml`
  today, compare against guard character for character. Renamed target is failure
  this mod most exposed to, completely silent.

## E — the 74 coats and the three rotations

- Beyond poodle and moa, three-coat animals worth spawn of dozen each:
  **kangaroo**, **hedgehog**, **muskox**, **chihuahua**, **pangolin**, **red panda**, **black
  rhinoceros**, **rockhopper penguin**.
- West not shipped. RimWorld mirrors `_east` when no `_west` exists, so animal walking west
  showing far side reversed is correct.
- Watch few walk each direction, check north view in particular: hides head,
  so wrong file easy to miss.
- Any missing file shows in log with path, per table above.

## F — the coat is per-animal and survives a reload

`Verse.Pawn.overrideGraphicIndex` records which entry of `alternateGraphics` pawn drew, and
goes into save under same name. Field present in 1.6's assembly.

- Save with several coloured animals in view, quit to menu, load again.
- Each animal keeps **its own** coat. Coat jumping to different animal means index
  re-rolled rather than read back, also meaning every reload reshuffles colony's
  pets.

## G — added to a save in progress, then removed from one

**Not applicable** (Virginie, 2026-10-02, same decision as other Colorful Coats ports, tested there): existing animals recolour on adding mod and revert on removing it; nothing of this mod stored in save, so no state outlives it, game's reaction to missing mod not ours (AUDIT.md, "On ne teste pas le jeu"). Text below kept as original intent only, wrong on one point: animals already in save do gain coat.

Description says both safe. What "safe" means worth pinning down, because index
stored per animal: animal generated before mod added has none, no index means coat
born with.

- Add mod to running colony already having Vanilla Animals Expanded animals. Animals
  already in save stay exactly as they were; **new** ones — spawned, born, tamed, or arriving
  with caravan or raid — draw from coats.
- Then remove it, load same save. Animals go back to original coats, nothing
  in log names `overrideGraphicIndex`, `alternateGraphics`, or any of 35 defNames.

## H — the mod alone, with no Vanilla Animals Expanded at all

- Enable this mod with Vanilla Animals Expanded switched off.
- **RimWorld now warns**, because `<modDependencies>` names Vanilla Animals Expanded. Check
  wording names that mod, not this one, and warning goes away once target on.
  This changed 2026-09-12; before it mod list said nothing at all.
- Behind warning, nothing else changed: all three guards find no mod by their names, skip
  sequences, report success, write nothing.
- Game must still load, log must stay clean. Intended behaviour of texture patch.
  Warning only thing now telling player why they see no coats.

## I — the old Cats and Dogs module, and the guard that stops at the first name

Core guard names two mods: `Vanilla Animals Expanded` and
`Vanilla Animals Expanded — Cats and Dogs`. Old standalone module defines same 14 breeds
as merged mod, and `PatchOperationFindMod` **stops at first name it finds**, so coats
arrive whichever of them cats came from, block runs once.

- Today inert: `VanillaExpanded.VAECD` stops at 1.3, cannot be enabled on 1.6.
- If ever revived, enable both it and merged mod, spawn dozen Bengals. Must
  carry coats, chance must still look like `0.6` rather than anything higher.
- Two names in one guard is whole point, reason not to split into two guards
  sharing xpath: two matching guards would each run their block.

## J — the eight modular guards, and what applying twice actually does

`ColorfulCoats_VAEvarious.xml` patches 16 of same wildlife animals second time, guarded on
eight standalone Vanilla Animals Expanded modules — Arid Shrubland, Australia, Boreal Forest,
Desert, Ice Sheet, Temperate Forest, Tropical Rainforest, Tundra. All eight stopped at 1.3.

- On 1.6 whole file inert, nothing to see. Expected result.
- Reason to keep it is player on older game, where it is only thing giving those 16
  animals coats.
- If any module revived, player running **both** it and merged mod gets those 16
  animals patched twice, since two files guard on different names. **Compared today, two
  copies identical** — same chance, same `texPath` list, all 16 animals — so def ends up
  with element twice, loader assigns field twice with same content, last
  one wins. Nothing changes, nothing logged. Worth knowing this harmless
  rather than assuming it doubles anything.

## K — the original enabled alongside

- Try enabling `purpleyam.colorfulcoats.vaewildlife` or `purpleyam.colorfulcoats.vaecatsdogs` at
  same time as this one.
- `<incompatibleWith>` should refuse each pair.
- If one somehow loads anyway, **nothing logged, nothing visibly breaks**, real
  argument for field rather than crash. Neither mod declares def, so
  `DefDatabase` never involved; both simply add `<alternateGraphics>` element to same
  `PawnKindDef`, last one read wins. Since two carry same textures — purpleyam's,
  byte for byte — animals look same either way. Cost is two copies of 222 textures in
  memory for one visible result, not error to grep for.

## L — the mod list entry itself

- Name reads `Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)`.
- Workshop banner is `About/Preview.png`, 896x504 and 552 KB, under Steam's hard 1 MB ceiling,
  says `Renew` rather than `1.6`.
- Approved icon shipped at 128 × 128 (12,938 bytes), from
  `Art/ModIcon-source.png`. At about 32 px in mod list, verify central
  winking mascot remains recognizable, no clipping. Surrounding
  animals represent this mod's VAE coverage; fine detail not expected at 32 px.
## M — the five Odyssey animals, on both kinds of install

Fourth patch file exists so this scenario has same answer twice. Run once with Odyssey
enabled, once without, on colony where those animals spawn.

- **With Odyssey**, spawn dozen each **badger**, **muskox**, **otter**, **walrus**. They
  are Ludeon's defs, coats from `ColorfulCoats_VAEodyssey.xml`. Muskox rolls `0.7`
  with three coats, other three `0.6` with two, so dozen each should show
  several coloured. Tiger belongs to scenario C.
- **Without Odyssey**, same animals are `AEXP_*`, coats from core file. Counts
  should look same.
- **Nothing should ever get both.** Def exists in Odyssey or `1.6NotOdyssey`, never both,
  so two halves cannot overlap - but if animal ever showed coat list of four entries
  where patch gives two, that is what happened.
- **Look at size.** Ludeon draws four of five smaller than Vanilla Animals Expanded did,
  most visibly muskox at 1.25 against 1.5. Coats authored at larger size, so
  check they still read as animal rather than blurred version. Coloured animal
  and plain one always same size as each other, so comparison to make is against
  plain one standing next to it.

## What no check offline can catch

Both silent mechanisms point same way. Guard whose target renamed itself writes nothing; operation
whose animal renamed itself writes nothing either, because flag this port added
says so. Together they mean **renamed mod or renamed breed produces no log line, no failed
operation, no visible error** — only animals quietly stopped having coats. Scenarios A, B
and D exist because nothing else would ever tell us.

One did get caught, though, worth saying which: five animals Odyssey took
over found by `scripts/Check-Coats.ps1`, not in game. Reading target's `LoadFolders.xml`
cheap, nobody would ever have noticed tiger by playing — rarity at `0.05` looks
exactly same whether rare or absent.