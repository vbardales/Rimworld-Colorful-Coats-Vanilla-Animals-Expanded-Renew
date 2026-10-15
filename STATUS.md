---
settings_audit: not_applicable
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
mod:          Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)
packageId:    nelim.colorfulcoats.vae
repo:         Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew
visibility:   public
detached:     yes
workflow_stage: playTests[1.0.0]
licence:      silent
port_licence: MIT (port additions only)
licence_at:   Steam description, public profile, local original files, GitHub repository search
upstream_mod_remotes: N/A
dependencies: declared
showcase:     complete
tested_on:
workshop:     3806766686 (private; item created by a 0.1.0 prepublication, 2026-09-23)
remaining:
  - feature: gallery: four candidates in Art/Gallery (1-kangaroos accepted 2026-10-12; all three candidates 2 to 4 played at frame 2 or 2.5 (runs a816, f048; 1.5 refused by the game, camera bounded at 2) and judged accept by the session), from run a16a (gallery-8, 4/4 passed, exitReason passed, commit 4e1e1e9 era), each opened and looked at 2026-10-12; waiting for the owner to accept (drop "candidate"), refuse or reorder; cats are small in frame, a closer zoom is the likely redo
  - unverified: code review (AUDIT.md 8.m): code_review_sha absent; data-only mod (Mod/ XML + textures, no Source); review Mod/ from 0.1.0, then store the sha
  - unverified: mod-list UI in English and French, new game and existing save, Player.log read (8.i); no owned text, so only the load log and the coats on screen matter
  - unverified: non-regression of the whole suite on the final revision, deposited last, after commit and deploy (AUDIT.md, Passes Pickle, ordering)
  - decided 2026-10-02 (Virginie): manual scenario G is not applicable, as in the other Colorful Coats ports; existing animals recolour on adding the mod and revert on removing it. Recorded in TEST_SCENARIOS.md
  - feature: PUBLICATION.md open points: gallery order (after the gallery is played), thank-you messages (owner voice, after the item is public)
social_preview_sha256: a523be2d6f2573e1cf63b8b1c10ebb94094440542aa57651774c351b3289db07
session:      local_e26bc266-36d6-4bee-9097-818839c11467
updated:      2026-10-10, audit re-run against the 15-state chain: done -> playTests[1.0.0]
protocols_read_sha: 7bafac79376f69b0ecc5d31de811aef4f53a9987
---

# Colorful Coats - Vanilla Animals Expanded! Renew — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it. Dropped here by the sweep of 2026-09-12 and
held since by this mod's thread, which updates it in the commit that changes what it describes.

## Audit re-run — 2026-10-10 (15-state chain)

Re-applied `../AUDIT.md` (read in full) and `WELCOME.md`, `AGENTS.md`, `PICKLE.md`, `GALLERY.md` at protocols HEAD `b4a73cf`. HEAD of this repository `5fb9999`. Working tree at entry: `Art/ModIcon.ico`, `Art/Preview.ico`, `Art/ModIcon-source.png` modified and `Art/ModIcon-signature-candidate.png` untracked (the owner's ModIcon work, left alone: sources are hers, AUDIT.md 2.a). `Mod/` is clean.

**Old `done` -> `playTests[1.0.0]`** (AUDIT.md section 16 correspondence). The first transition that does not hold is `playTests` -> `shootGallery`; everything before it holds.

- **Held, re-run today:** `scripts/Check-Patches.ps1` PASS (5 XML files, metadata, licence copies); `scripts/Check-Coats.ps1` all checks passed (the five Odyssey and five Endangered defNames still exist, no `alternateGraphics` conflict). Dependencies, settings (`not_applicable`) and localization (`not_applicable`, no owned text) rest on the 2026-09-13/28 audits; `Mod/` has not changed since.
- **`playTests` evidence (8.c to 8.f, 8.j):** Pickle suites green on current logic: always-patched, with/without-odyssey, endangered, coats-v2 3/3, rare-odyssey, rare-plain-4 (see `docs/runs/`). No `@wip`. Every `@requires` has its pass. Scenario G not applicable (decided 2026-10-02). The red rare-plain was replayed alone and is green.
- **Not met yet (in `remaining`):** 8.i (UI and log in EN/FR, new game and save), 8.m (code review, `code_review_sha` absent), 8.l (`tested_on` empty). Missing checks, not defects.
- **Gallery (`shootGallery`, next state):** `gallery.feature` is written and uses existing steps (`spawned around`, `is given coat K`, `studio presentation mode`); never played. `Art/Gallery/` holds only `0-preview.png`.
- **Lint:** four WARN at entry (retired `stage` field, old `done` vocabulary, `protocols_read_sha` missing, 43 KB). Fixed: `stage` deleted, vocabulary replaced, `protocols_read_sha` written by `Mark-ProtocolsRead.ps1`, dated sections folded into `docs/runs/status-history-2026-09-to-10-02.md`.
- Registered with the Ticket Manager (`-Owner local_e26bc266-36d6-4bee-9097-818839c11467`). No image generated, no test invented, nothing published.

Vocabulary: `licence` open | silent | alive | forbidden | original; `remaining` feature | defect | unverified; `dependencies` declared | to check | none. The state chain and its criteria live in `../AUDIT.md`.

## Gallery table (candidates, 2026-10-12)

| Index | File | Subject | State |
|---|---|---|---|
| 0 | `0-preview.png` | Preview copy | stale until ModIcon derivatives are regenerated |
| 1 | `1-kangaroos.png` | 3 kangaroos, 3 coats, flower garden | accepted by Virginie 2026-10-12, 1.0 MB |
| 2 | `2-candidate-poodles.png` | 4 poodles, 4 coats, flower garden | candidate, frame 2.5 (run a816, gallery-11), 0.9 MB; session verdict: accept |
| 3 | `3-candidate-red-pandas.png` | 3 red pandas, 3 coats | candidate, frame 2 (run f048, gallery-13), session verdict: accept |
| 4 | `4-candidate-bengal-cats.png` | 3 Bengal cats, original and 2 coats | candidate, frame 2 (run f048, gallery-13), session verdict: accept |

Run history: `20261011-203432-728-a16a` (gallery-8) green after gallery-6 crashed at startup (exit 139, SIGSEGV, no report), gallery-7 failed on an undefined step (the animal facing step lives in ColonistRace, now staged). Earlier runs 583e, a614, 59fb showed an empty frame, tiny scattered animals, and the bed and cube in frame.
