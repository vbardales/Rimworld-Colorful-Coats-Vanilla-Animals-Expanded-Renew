# Protocols read

Which shared protocol/tooling documents this mod's sessions have read, at which revision, and
whether they helped here. Re-read a file only if its last-commit date below is now behind the
file's current one. Revisions are `git log -1 --format='%h %ad'` of the file, run from
`Documents\rimworld` for the monorepo-root files and inside each tool repository for the others.
Caveat: since commit `90d51374` (2026-09-25) a root `git log` of a protocol file may return that
commit, which moved them; treat a `90d51374` below as "unchanged since 2026-09-25", not as a blob id.

Last full pass: 2026-10-02 (audit re-run). "Read" = opened in full that day; "diff" = only what changed
since the previous read; "not reopened" = unchanged since the recorded read, so skipped.

| File | Revision / date | 2026-10-02 | Useful here | Note |
| --- | --- | --- | --- | --- |
| `../AGENTS.md` | `90d51374` 2026-09-25 | in session context | Yes | Gate order, evidence-retention rule, CI publishing guardrails. |
| `../AUDIT.md` | `90d51374` 2026-09-25 | read in full | Yes | The audit script. New this time: `tested` needs no `@wip`, every `@requires` pass run, no manual test left; WSL cleanup at hibernation. |
| `../MOD_SETTINGS.md` | `90d51374` 2026-09-25 | not reopened | Briefly | `settings_audit: not_applicable` stands; no owned UI. |
| `../PUBLISHING.md` | `c770fd1e` 2026-10-02 | diff only | Yes | New since the earlier read: Preview line-art protocol, gallery pawn-capture rule (apparel/hair mods; this mod has no pawn content). Re-read in full before the real publish. |
| `../TRANSLATIONS.md` | `90d51374` 2026-09-25 | not reopened | Briefly | `not_applicable`: no owned in-game text. |
| `../STYLE_RIMWORLD.md` | `f7e23d33` 2026-10-01 | not reopened | Partly | Preview/ModIcon criteria; the 2026-10-01 preview-generation protocol arrived after this mod's Preview, nothing regenerated. |
| `../WORKSHOP_COMMENTS.md` | `08878789` 2026-09-29 | not reopened | Not yet | Only at `tested -> prepublished`, when thank-you comments are written. |
| `../scripts/SEARCHING.md` | `90d51374` 2026-09-25 | not reopened | No | Homonym sweep already run 2026-09-12, nothing live. |
| `../PickleTools/README.md` | `ff20d89` 2026-09-29 | not reopened | Yes | Tool table; this suite uses CoatSteps only. |
| `../PickleTools/Authoring/README.md` | `a47799f` 2026-09-29 | not reopened | Yes | Suite template followed. |
| `../PickleTools/Headless/README.md` | `ed4e73a` 2026-09-26 | not reopened | Yes | Launcher, maps, exit codes. |
| `../PickleTools/docs/steps.md` | `da7c3b0` 2026-09-28 | not reopened | Not yet | Companion steps; only CoatSteps matters and it is read at its source. |
| `Rimworld-Pickle` `Docs/steps.md` | `286e74e` 2026-09-21 (branch, unconfirmed main) | not reopened | Yes | Built-in `def`/`mod` steps used by the features. |
| `../Rimworld-Release-Admin/docs/OPERATIONS.md` | `3c03f51` 2026-09-26 | not reopened | Not yet | Needed from the real `1.0.0` CI publish on. |
| `../Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | `77ca9d7` 2026-09-27 | not reopened | Yes | Named this mod's `Mod/desktop.ini` leak class. |
| `../Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | `d07b2b8` 2026-09-26 | not reopened | Yes | `Submit-PickleRun.ps1` options. |

## Not useful yet

`WORKSHOP_COMMENTS.md`, `OPERATIONS.md`, `PickleTools/docs/steps.md`: matter only at `prepublished` or later, or
for steps this suite does not use. `scripts/SEARCHING.md`: its sweep is done.

## This mod's own documents

Read at the repository's HEAD each session, not pinned: `STATUS.md`, `README.md`, `CHANGELOG.md`,
`ATTRIBUTION.md`, `LICENSE`, `PUBLICATION.md`, `TESTING.md`, `Mod/About/About.xml`, `docs/runs/`,
`Tests/Pickle/`. Absent by design: `BACKLOG.md`, `NOTES.md`, `BUGS.md` (open work lives in
`STATUS.md` `remaining`).
