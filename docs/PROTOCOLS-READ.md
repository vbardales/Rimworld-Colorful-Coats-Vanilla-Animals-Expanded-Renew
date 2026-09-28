# Protocols read

What this mod's sessions have read from the shared protocol/tooling repositories, at which
revision, and whether it changed anything for this mod. Kept so a session that resumes after a
context compaction, or picks the mod up cold, does not have to reopen every file if none of them
moved. Re-read anything whose commit below is now behind the file's current one.

| File | Read at | Useful here | Why / why not |
| --- | --- | --- | --- |
| `../AGENTS.md` | `90d51374` (2026-09-25) | Yes | Sets the ordered gate workflow and the Pickle/publishing absolute rules this mod's audit follows. |
| `../AUDIT.md` | `90d51374` (2026-09-25) | Yes | The audit script itself; re-read in full on 2026-09-28. |
| `../MOD_SETTINGS.md` | `90d51374` (2026-09-25) | Yes, briefly | Confirms the `not_applicable` vocabulary this mod already used; no owned settings to test. |
| `../PUBLISHING.md` | `90d51374` (2026-09-25) | Yes | Description footer format, CI publish rules, `tested -> prepublished -> published` gates. |
| `../TRANSLATIONS.md` | `90d51374` (2026-09-25) | Yes, briefly | Confirms `not_applicable`: no owned in-game text, all payloads are selectors/paths/numbers. |
| `../STYLE_RIMWORLD.md` | `90d51374` (2026-09-25) | Partially | Preview/ModIcon review criteria used in 2026-09-13's audit; nothing new checked 2026-09-28. |
| `../WORKSHOP_COMMENTS.md` | `d438141c` (2026-09-27) | Not yet | Only matters once thank-you comments are written, at `tested -> prepublished`. Not there yet. |
| `../scripts/SEARCHING.md` | `90d51374` (2026-09-25) | Not yet | Homonym-sweep method; this mod's sweep already ran (2026-09-12) and found nothing live. |
| `../PickleTools/README.md` | `90836e7` (2026-09-27) | Not yet | This mod ships no owned UI/behaviour Pickle would exercise; TESTING.md's scenarios are manual. Revisit if any scenario is ever converted to Gherkin (see `remaining`). |
| `../PickleTools/Headless/README.md` | `90836e7` (2026-09-27) | Not yet | Same reason; no Pickle suite exists for this mod to run headless. |
| `../PickleTools/docs/steps.md` | `90836e7` (2026-09-27) | Not yet | Same reason. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | `851a155` (2026-09-27) | Not yet | Matters once a real (1.0.0) CI publish is dispatched. This mod is still at a manual 0.1.0 prepublication done in-game, not by CI. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` (2026-09-27) | **Yes** | Its 2026-09-27 addition on Explorer-artifact leaks into `Mod/` directly named this mod's own defect (`Mod/desktop.ini`), found and fixed 2026-09-28. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | not opened | Not yet | No Pickle run has ever been submitted for this mod; nothing here to submit against yet. |

## Not useful yet, and why

Everything under `PickleTools/` and the Ticket-Dispatcher's `SUBMIT.md`: this mod has no owned
code, UI or def, so nothing in `TESTING.md`'s thirteen manual scenarios has been written as a
Pickle/Gherkin suite. `AUDIT.md` requires the count and scope of Pickle passes to be named in
`TESTING.md` even when the answer is zero; that line is missing today (see `remaining` in
`STATUS.md`). `OPERATIONS.md` matters only from the real `1.0.0` CI publish onward — the
`0.1.0` prepublication already done for this mod went through the game's own button, not the CI.

## This mod's own documents

`STATUS.md`, `README.md`, `CHANGELOG.md`, `ATTRIBUTION.md`, `LICENSE`, `TESTING.md` and
`Mod/About/About.xml` are read at the repository's own HEAD each session, not pinned to a
revision here: they change with this mod's own commits, and `STATUS.md` already carries its own
dated history of what was checked and when. `PUBLICATION.md`, `BACKLOG.md`, `NOTES.md`, `BUGS.md`
and `docs/runs/` do not exist for this mod: nothing has been drafted yet (`PUBLICATION.md` is
due before the real publish, not before), and there is no separate backlog, running notes or bug
list kept outside `STATUS.md`'s own `remaining` field.
