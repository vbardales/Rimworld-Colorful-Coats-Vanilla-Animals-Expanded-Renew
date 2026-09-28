# Protocols read

What this mod's sessions have read from the shared protocol/tooling repositories, at which
revision, and whether it changed anything for this mod. Kept so a session that resumes after a
context compaction, or picks the mod up cold, does not have to reopen every file if none of them
moved. Re-read anything whose commit below is now behind the file's current one.

| File | Read at | Useful here | Why / why not |
| --- | --- | --- | --- |
| `../AGENTS.md` | `3a1d2cb` (2026-09-24) | Yes | Sets the ordered gate workflow and the Pickle/publishing absolute rules this mod's audit follows. |
| `../AUDIT.md` | `c5ca0c0` (2026-09-26) | Yes | The audit script itself; re-read in full on 2026-09-28. |
| `../MOD_SETTINGS.md` | `b83933b` (2026-09-23) | Yes, briefly | Confirms the `not_applicable` vocabulary this mod already used; no owned settings to test. |
| `../PUBLISHING.md` | read at an older revision; now `95c6dfd` (2026-09-28), moved after the read, re-read before the real publish | Yes | Description footer format, CI publish rules, `tested -> prepublished -> published` gates. |
| `../TRANSLATIONS.md` | `f5c2d9d` (2026-09-25) | Yes, briefly | Confirms `not_applicable`: no owned in-game text, all payloads are selectors/paths/numbers. |
| `../STYLE_RIMWORLD.md` | `7311308` (2026-09-25) | Partially | Preview/ModIcon review criteria used in 2026-09-13's audit; nothing new checked 2026-09-28. |
| `../WORKSHOP_COMMENTS.md` | now `dea856b` (2026-09-28), not read | Not yet | Only matters once thank-you comments are written, at `tested -> prepublished`. Not there yet. |
| `../scripts/SEARCHING.md` | `372c447` (2026-09-23) | Not yet | Homonym-sweep method; this mod's sweep already ran (2026-09-12) and found nothing live. |
| `../PickleTools/README.md` | `90836e7` (2026-09-27) | Yes | Read in full 2026-09-28: layout and pass-family conventions used to write `Tests/Pickle/`. |
| `../PickleTools/Authoring/README.md` | `90836e7` (2026-09-27) | Yes | The template this mod's suite follows: pass matrix, `@requires:`, `wsl-ids.map`/`wsl-deps.<pass>.map` syntax, companion `About.xml`. |
| `../PickleTools/docs/steps.md` | `90836e7` (2026-09-27) | Not yet | PickleTools' own companion steps (RIMMSQOL, filming, xenotype colonists); this suite uses only Pickle's built-in steps, none of these. |
| `../PickleTools/Headless/README.md` | `90836e7` (2026-09-27) | Yes | Read in full 2026-09-28: launcher options (`-Filter`, `-DepMap`, `-Then`), exit codes, and the `wsl-ids.map`/`wsl-deps.<pass>.map` split used to write `Tests/Pickle/`'s maps. |
| `Rimworld-Pickle`'s own `Docs/steps.md` | `286e74e` (2026-09-21, `pickle-local/anima-film`, a feature branch — not confirmed as main) | Yes | The authoritative built-in step catalogue; `def`/`mod` steps quoted verbatim into `Tests/Pickle/`'s feature files. Not the same file as `PickleTools/docs/steps.md` above. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | `851a155` (2026-09-27) | Not yet | Matters once a real (1.0.0) CI publish is dispatched. This mod is still at a manual 0.1.0 prepublication done in-game, not by CI. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` (2026-09-27) | **Yes** | Its 2026-09-27 addition on Explorer-artifact leaks into `Mod/` directly named this mod's own defect (`Mod/desktop.ini`), found and fixed 2026-09-28. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `d07b2b8` (2026-09-26) | Yes | Read in full 2026-09-28 at the dispatcher's request: options, `-DepMap` name-only rule, exit codes. |

## Not useful yet, and why

`PickleTools/docs/steps.md` (PickleTools' own companion steps: RIMMSQOL, filming, xenotype
colonists) and the Ticket-Dispatcher's `SUBMIT.md`: this suite uses only Pickle's built-in steps,
and no run has been submitted yet. Reopen `SUBMIT.md` when the three passes of `Tests/Pickle/`
are filed. `OPERATIONS.md` matters only from the real `1.0.0` CI publish onward: the `0.1.0`
prepublication went through the game's own button, not the CI.

## This mod's own documents

`STATUS.md`, `README.md`, `CHANGELOG.md`, `ATTRIBUTION.md`, `LICENSE`, `TESTING.md` and
`Mod/About/About.xml` are read at the repository's own HEAD each session, not pinned to a
revision here: they change with this mod's own commits, and `STATUS.md` already carries its own
dated history of what was checked and when. `PUBLICATION.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md`
and `docs/runs/` do not exist for this mod: nothing has been drafted yet (`PUBLICATION.md` is
due before the real publish, not before), and there is no separate backlog, running notes or bug
list kept outside `STATUS.md`'s own `remaining` field.

## Revisions of the shared protocol documents

Since commit `90d51374` the protocol documents belong to `vbardales/Rimworld-protocols`. A
`git log` run from the monorepo returns the commit that removed them, a plausible hash for the
opposite of what is wanted (`WELCOME.md`). The first table above briefly carried that hash for
seven files; it was wrong and is corrected. The true revisions come from the protocols repository:

```
git --git-dir=../rimworld-protocols.git --work-tree=. log -1 --format='%h %ad' --date=short -- AUDIT.md
```

run from the monorepo root, `Documents\rimworld`.
