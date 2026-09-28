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
| Minimal, Odyssey present | *(none — Odyssey is an owned DLC staged by default)* | `always-patched.feature`, `with-odyssey.feature` | Same 25, plus the same five now patched under Ludeon's own bare names; `AEXP_Badger` and its four fellows no longer exist. |
| Optional integration: Endangered | `wsl-deps.endangered.map` | `always-patched.feature`, `endangered.feature` | The five Endangered-only animals exist and are patched, on top of whichever Odyssey state the pass also has. |
| Declared incompatibility | — | — | **Not stageable today.** `incompatibleWith` names `purpleyam.colorfulcoats.vaewildlife` and `purpleyam.colorfulcoats.vaecatsdogs`; both cap their `supportedVersions` at 1.3 and cannot be loaded on 1.6 at all (`TESTING.md`, scenario K). There is nothing to look at until one of them is revived — recorded here rather than invented as a pass that could not run. |
| English and French | — | — | **Not applicable.** This mod owns no in-game text (`STATUS.md`, localization: `not_applicable`); there is nothing a language switch could change here. |

`with-odyssey.feature` and `endangered.feature` are tagged `@requires:` their DLC/mod and so
skip themselves outside the pass that has it: they can stay in the suite's default selection.
`without-odyssey.feature` cannot self-select the same way — there is no negated `@requires:` —
so it is **only** correct in a pass that explicitly excludes Odyssey; select it by name
(`-Filter 'without-odyssey'`) rather than relying on the suite default in that pass.

## Commands

Filed as a request, never launched directly (`AUDIT.md`, "Déposer un run au lieu de le lancer"):

```powershell
powershell.exe -ExecutionPolicy Bypass -File Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod ColorfulCoatsVAERenew -Owner local_<session id> -Label "ColorfulCoatsVAERenew local_<session id> minimal, Odyssey absent" `
  -DepMap wsl-deps.no-odyssey.map -EvidenceDir ColorfulCoatsVAERenew/Tests/Pickle/Evidence/no-odyssey
```

and again with no `-DepMap` for the Odyssey-present pass, and with
`-DepMap wsl-deps.endangered.map` for the Endangered pass. Three requests, three tickets, one
process if run back to back (`AUDIT.md`, "Un seul processus pour toutes les passes d'une tâche").

## Evidence

Each pass writes `summary.md`/`junit.xml`/`messages.ndjson` to its own `-EvidenceDir`; keep only
the latest per pass, per the repository's evidence-retention rule in `AGENTS.md`. There is no
`@review` scenario here — every assertion is structural, not a capture — so there is nothing to
open and look at beyond `exitReason` and the pass/fail counts themselves.
