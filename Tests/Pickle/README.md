# Pickle tests — Colorful Coats - Vanilla Animals Expanded! Renew

Written 2026-09-28, closing the gap `AUDIT.md`'s `preTest` gate flags for a `TESTING.md` that
never names a Pickle pass count. Not yet run: writing a suite is a `preTest -> done` criterion,
executing and reading it belongs to `done -> tested` (`AUDIT.md`, step 8's explicit note).

## Why this suite exists, and why it stays small

This mod ships no assembly, no owned Def and no UI: four XML patches and 222 textures. Per
`PickleTools/Authoring/README.md` step 1, a running game only proves what an offline check
cannot — here, that is exactly one thing: **which of Vanilla Animals Expanded's or Odyssey's
`PawnKindDef`s this mod's patches actually reached**, at the load order and DLC/optional-pack
combination a real player has. `_tools/Check-Coats.ps1` already proves the *authored* content
is internally consistent (74 coats, 222 textures, no orphan, no gap); it cannot prove a patch
*landed*, because that only exists once a game has loaded and RimWorld has built and discarded
its own patch tree. That is the one thing these four feature files check, using only Pickle's
built-in `def`/`mod` steps — no companion assembly, no fixture, no fighting or camera time.

**What stays manual, and why Pickle does not replace it.** Whether a coat actually *renders*,
whether its three rotations point at the right art, and whether the 5%/80% rarities *look*
right over many spawns are exactly what `PickleTools/Authoring/README.md` step 1 says to keep
out of Gherkin: a rendered outcome a person has to look at, and a statistical distribution no
green checkmark can summarize honestly (`AUDIT.md`'s own point about a Pickle green not proving
what a screenshot shows). `TESTING.md` scenarios A, C, E, F, G keep doing that job. What this
suite *does* replace is the structural half of scenario B — the risk that one renamed def
silently drops every def listed after it in the sequence — which it checks completely and in
about two seconds, instead of by spawning enough shih tzus to trust a statistic.

## Pass matrix

Two pass families apply; two do not.

| Pass | `-DepMap` | Feature file(s) that matter | What it establishes |
|---|---|---|---|
| Minimal, Odyssey absent | `wsl-deps.no-odyssey.map` | `always-patched.feature`, `without-odyssey.feature` | The 25 DLC-independent animals plus the five Odyssey could take over, all patched under `AEXP_*`; the bare Ludeon names do not exist to be confused with them. |
| Minimal, Odyssey present | `wsl-deps.odyssey.map` | `always-patched.feature`, `with-odyssey.feature` | Same 25, plus the same five now patched under Ludeon's own bare names; `AEXP_Badger` and its four fellows no longer exist. |
| Optional integration: Endangered | `wsl-deps.endangered.map` | `always-patched.feature`, `endangered.feature` | The five Endangered-only animals exist and are patched, on top of whichever Odyssey state the pass also has. |
| Declared incompatibility | — | — | **Not stageable today.** `incompatibleWith` names `purpleyam.colorfulcoats.vaewildlife` and `purpleyam.colorfulcoats.vaecatsdogs`; both cap their `supportedVersions` at 1.3 and cannot be loaded on 1.6 at all (`TESTING.md`, scenario K). There is nothing to look at until one of them is revived — recorded here rather than invented as a pass that could not run. |
| Rare coats (fifth and sixth passes) | `wsl-deps.coats.map`, filter `'rare-jaguar,rare-tiger-odyssey'`; `wsl-deps.coats-no-odyssey.map`, filter `'rare-tiger-plain'` | `rare-jaguar`, `rare-tiger-odyssey`, `rare-tiger-plain` | 100 large animals each: at least one carries the 5% coat (under 1% odds of a false red). A red on placement is not a missing coat. |
| Coats drawn (fourth pass) | `wsl-deps.coats.map` | `coats.feature` | Poodles draw at least two extra coats, keep them across reload, and each is drawn with its own texture (`@review` capture). Odyssey stays at its default. Rare 5% coats are not covered: tiger and jaguar need about 100 large animals placed. Uses the shared CoatSteps (PickleTools, compiled, never played). Filter: `'coats'`. |
| English and French | — | — | **Not applicable.** This mod owns no in-game text (`STATUS.md`, localization: `not_applicable`); there is nothing a language switch could change here. |

`with-odyssey.feature` and `endangered.feature` are tagged `@requires:` their DLC/mod and so
skip themselves outside the pass that has it: they can stay in the suite's default selection.
`without-odyssey.feature` cannot self-select the same way (no negated `@requires:`), so the filter above carries it:
so it is **only** correct in a pass that explicitly excludes Odyssey; select it by name
(`-Filter 'without-odyssey'`) rather than relying on the suite default in that pass.

## Commands

Filed as requests through `Submit-PickleRun.ps1`, never launched directly (`AUDIT.md`, "Déposer un
run au lieu de le lancer"). One pass is one request and one `-DepMap`; `-Then` is not used, since
every pass is a single launch. Put the commit SHA in `-Label`: the request carries none, and the
mod is staged when its ticket is played, from the working tree of that moment.

| Pass | `-DepMap` | `-Filter` |
|---|---|---|
| Odyssey absent | `wsl-deps.no-odyssey.map` | `'always-patched,without-odyssey'` |
| Odyssey present | `wsl-deps.odyssey.map` | `'always-patched,with-odyssey'` |
| Endangered | `wsl-deps.endangered.map` | `'always-patched,with-odyssey,endangered'` |

The filter names feature files, comma meaning OR. It is required, not cosmetic: no negated
`@requires:` exists, so `without-odyssey.feature` would fail by design in any pass that has the
DLC. A term that names no file makes Pickle exit 2 (the launcher returns 8) and play nothing.
Every pass has a map, including the Odyssey-present one, because Vanilla Animals Expanded needs
Vanilla Expansion Framework, and the staging copies only this mod's direct dependencies: the bare
pass could not activate it. Each map lists it first, then Vanilla Animals Expanded, so the order
is the one Vanilla Animals Expanded's own `loadAfter` asks for. Whether the staging then stages
Vanilla Animals Expanded twice is untested; the request's log lists what was activated.

```powershell
powershell.exe -ExecutionPolicy Bypass -File C:\Users\nelim\Documents\rimworld\Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod ColorfulCoatsVAERenew -Owner local_<session id> -Label "no-odyssey <sha>" `
  -DepMap wsl-deps.no-odyssey.map -Filter 'always-patched,without-odyssey' `
  -EvidenceDir ColorfulCoatsVAERenew/Tests/Pickle/Evidence/no-odyssey
```

## Evidence

Each pass writes `summary.md`/`junit.xml`/`messages.ndjson` to its own `-EvidenceDir`; keep only
the latest per pass, per the repository's evidence-retention rule in `AGENTS.md`. There is no
`@review` scenario here — every assertion is structural, not a capture — so there is nothing to
open and look at beyond `exitReason` and the pass/fail counts themselves.

## Attribution is matched by display name

`def {string} was patched by mod {string}` compares the mod's **display name**, case-insensitively,
against the list of names that patched the def (`DefSteps.cs`, `AssertDefPatchedBy`), although
Pickle's step catalogue says "name or packageId" for the other mod steps. The first three runs of
2026-09-28 failed on exactly this: the assertions gave `nelim.colorfulcoats.vae`, and the failure
message listed the display name. The features now carry `Colorful Coats - Vanilla Animals
Expanded! Renew (unofficial)`, so **renaming the mod breaks them**; change both together.
