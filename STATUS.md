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
workflow_stage: shootGallery[1.0.0]
licence:      silent
port_licence: MIT (port additions only)
licence_at:   Steam description, public profile, local original files, GitHub repository search
upstream_mod_remotes: N/A
dependencies: declared
showcase:     complete
tested_on:    "RimWorld 1.6, kept proofs in Tests/Pickle/Evidence (Mod/ defs, patches and textures unchanged since 2026-09-11; later Mod/ commits touch About text and images only): 2026-09-28 odyssey-v2 2/2, endangered-v2 1/1, no-odyssey-v2 1/1, rare-odyssey; 2026-10-02 coats-v2 3/3, rare-plain-4; 2026-10-18 loadaudit-2 1/1 (ticket 20261017-215813-717-6411); 2026-10-23 loadaudit-3 2/2 (ticket 20261019-231033-626-9492, mod-list entry, exitReason passed); all green, English; see docs/runs/2026-10-19.md. Scenario G not applicable"
workshop:     3806766686 (private; item created by a 0.1.0 prepublication, 2026-09-23)
remaining:
  - feature: gallery: four candidates in Art/Gallery (1-kangaroos accepted 2026-10-12; all three candidates 2 to 4 played at frame 2 or 2.5 (runs a816, f048; 1.5 refused by the game, camera bounded at 2) and judged accept by the session), from run a16a (4/4 passed, exitReason passed, commit 4e1e1e9 era; evidence folder deleted 2026-10-19, captures live in Art/Gallery), each opened and looked at 2026-10-12; waiting for the owner to accept (drop "candidate"), refuse or reorder; cats are small in frame, a closer zoom is the likely redo
  - feature: gallery scenarios polish (TM relay of Audit rule 2026-10-18, not started): per shot and transition refine clothes, hair, tattoos, weapons, other-mod objects, animals, plants, props, buildings; Nelim as protagonist, StageDecor props, facing front; look first in PickleTools/ColonistRace/docs CATALOGUE-*, FACE-PARTS, GALLERY-PROPS.md; research via scripts/SEARCHING.md; release rules AGENTS.md 9a, 9b; then run Mark-ProtocolsRead and ack TM one line
  - unverified: 1.7 diagnostic (AUDIT.md, Passe 1.7), English only, filed 2026-10-19 on HEAD, six tickets (-Game /home/nelim/rimworld17): 20261019-230516-546-8227 (no-odyssey: always-patched, without-odyssey, loadaudit), -230517-648-8ae6 (with-odyssey), -230518-769-1140 (endangered), -230519-850-455e (coats), -230520-933-3e50 (rare odyssey), -230522-002-365b (rare plain); evidence: greens minified into Tests/Pickle/Evidence/17-coats, 17-endangered, 17-odyssey (2026-10-27); reds kept in Tests/Pickle/Inbox/17-no-odyssey and 17-rare-plain until replayed; results read 2026-10-25 (English, 1.7): no-odyssey 2 passed 2 skipped (both loadaudit scenarios skipped, reason not found in junit), with-odyssey 1/1, endangered 1/1, coats 5/5 (includes rare-odyssey, merged launch), rare-plain RED 0/1 (Log.Error "Grammar unresolvable. Root 'r_ritualName'", vanilla festival namer, probably environment, not proven); loadaudit skip explained 2026-10-27 (no-odyssey map lacks the LoadAudit mod, @requires unmet, not a 1.7 defect); read 2026-11-02: loadaudit 20261027-195906-491-2500 GREEN 2/2 on 1.7 (minified in Evidence/17-loadaudit; Evidence/17-no-odyssey keeps always-patched and without-odyssey greens); rare-plain replay 20261027-195807-782-fde6 RED again, same Log.Error "Grammar unresolvable. Root 'r_ritualName'" (vanilla Ideology festival namer, no mod text involved; reproducible, so not flaky; cause on 1.7 not proven), parked in Tests/Pickle/Parked/17-rare-plain-2 with RELEASE.md; next: find why the namer fails on the 1.7 map of this scenario (ask NPT if a Pickle step or map is at fault), replay alone; tested_1_7 stays absent until rare-plain green or judged not a mod defect; no <li>1.7</li> before a green run
  - unverified: non-regression of the whole suite on the final revision, deposited last, after commit and deploy (AUDIT.md, Passes Pickle, ordering)
  - decided 2026-10-02 (Virginie): manual scenario G is not applicable, as in the other Colorful Coats ports; existing animals recolour on adding the mod and revert on removing it. Recorded in TEST_SCENARIOS.md
  - feature: PUBLICATION.md open points: gallery order (after the gallery is played), thank-you messages (owner voice, after the item is public)
code_review_sha: 80b5d8f278eecacf4469bdb18893518759f9a5f6
social_preview_sha256: 59faba60037a2f05b68b45d38acadc89718ffd32f182111627db557fce26d7ee
session:      local_c65c6b29-02cc-4259-aea8-4a072cdc5267
updated:      2026-11-06, Preview re-rendered and validated by Virginie 2026-11-06 (automatic title fit 35 px, echo beside the title); Check-Coats.ps1 replaced by Tests/Rule-OwnValues.ps1 (new test shape, mutation proof done), LOCAL_SCRIPTS row pushed, CI/CD regenerate (Test-Mod.ps1 + .github) and Audit validation still to ask
protocols_read_sha: 10ad9f561fcede78b78a06376ce9275469ffa7d2
---
# Colorful Coats - Vanilla Animals Expanded! Renew — status

Read by sweep across every mod, not by asking each thread in turn. Lives at root, never inside `Mod/`, so Steam never receives it. Dropped here by sweep of 2026-09-12, held since by this mod's thread, which updates it in commit that changes what it describes.

## Audit re-run — 2026-10-10 (15-state chain)

Re-applied `../AUDIT.md` (read in full) and `WELCOME.md`, `AGENTS.md`, `PICKLE.md`, `GALLERY.md` at protocols HEAD `b4a73cf`. HEAD of this repository `5fb9999`. Working tree at entry: `Art/ModIcon.ico`, `Art/Preview.ico`, `Art/ModIcon-source.png` modified, `Art/ModIcon-signature-candidate.png` untracked (owner's ModIcon work, left alone: sources are hers, AUDIT.md 2.a). `Mod/` clean.

**Old `done` -> `playTests[1.0.0]`** (AUDIT.md section 16 correspondence). First transition that does not hold: `playTests` -> `shootGallery`; everything before holds.

- **Held, re-run today:** `scripts/Check-Patches.ps1` PASS (5 XML files, metadata, licence copies); `scripts/Check-Coats.ps1` all checks passed (five Odyssey and five Endangered defNames still exist, no `alternateGraphics` conflict). Dependencies, settings (`not_applicable`), localization (`not_applicable`, no owned text) rest on 2026-09-13/28 audits; `Mod/` unchanged since.
- **`playTests` evidence (8.c to 8.f, 8.j):** Pickle suites green on current logic: always-patched, with/without-odyssey, endangered, coats-v2 3/3, rare-odyssey, rare-plain-4 (see `docs/runs/`). No `@wip`. Every `@requires` has pass. Scenario G not applicable (decided 2026-10-02). Red rare-plain replayed alone, green.
- **Not met yet (in `remaining`):** 8.i (UI and log in EN/FR, new game and save), 8.m (code review, `code_review_sha` absent), 8.l (`tested_on` empty). Missing checks, not defects.
- **Gallery (`shootGallery`, next state):** `gallery.feature` written, uses existing steps (`spawned around`, `is given coat K`, `studio presentation mode`); never played. `Art/Gallery/` holds only `0-preview.png`.
- **Lint:** four WARN at entry (retired `stage` field, old `done` vocabulary, `protocols_read_sha` missing, 43 KB). Fixed: `stage` deleted, vocabulary replaced, `protocols_read_sha` written by `Mark-ProtocolsRead.ps1`, dated sections folded into `docs/runs/status-history-2026-09-to-10-02.md`.
- Registered with Ticket Manager (`-Owner local_e26bc266-36d6-4bee-9097-818839c11467`). No image generated, no test invented, nothing published.

Vocabulary: `licence` open | silent | alive | forbidden | original; `remaining` feature | defect | unverified; `dependencies` declared | to check | none. State chain and criteria live in `../AUDIT.md`.

## Gallery table (candidates, 2026-10-12)

| Index | File | Subject | State |
|---|---|---|---|
| 0 | `0-preview.png` | Preview copy | stale until ModIcon derivatives regenerated |
| 1 | `1-kangaroos.png` | 3 kangaroos, 3 coats, flower garden | accepted by Virginie 2026-10-12, 1.0 MB |
| 2 | `2-candidate-poodles.png` | 4 poodles, 4 coats, flower garden | candidate, frame 2.5 (run a816), 0.9 MB; session verdict: accept |
| 3 | `3-candidate-red-pandas.png` | 3 red pandas, 3 coats | candidate, frame 2 (run f048), session verdict: accept |
| 4 | `4-candidate-bengal-cats.png` | 3 Bengal cats, original and 2 coats | candidate, frame 2 (run f048), session verdict: accept |

Run history: `20261011-203432-728-a16a` (gallery-8) green after gallery-6 crashed at startup (exit 139, SIGSEGV, no report), gallery-7 failed on undefined step (animal facing step lives in ColonistRace, now staged). Earlier runs 583e, a614, 59fb showed empty frame, tiny scattered animals, bed and cube in frame.

## NSB

First sync, 2026-11-06 (`sync-nsb`). NSB changed since the gallery was authored (2026-10-11/12): `Docs/EMBELLISSEMENT-LIEUX.md` (plan of 2026-11-04) adds decor to `flower-garden` (rose border along the statue path, two birches in the background; later pass: hydrangeas, lavender, lanterns, a silver tree), applied by NPT to the `Nelims-tribe` fixture. `calm-zone` stays free (shooting zones are kept bare); a new `calm-zone-close` frame exists. Nothing renamed or removed. Left alone: the two scenarios that use `flower-garden` (poodles, kangaroos) stay as played; if the owner wants them replayed on the embellished garden, that is a redo, not a fix. The mod uses no NSB colonist and no named NSB animal.

Second run, same day: no NSB doc changed since the first read (file dates 2026-11-05 or older); `wsl-deps.gallery.map` still matches what NSB uses (VAE, its core, the PickleTools steps, `nelim.sanctuarybacklot`); nothing to update.

Places read: 2026-11-06
Tribe read: 2026-11-06 (animals catalogue and "Qui une galerie peut utiliser" only; roster and profiles not opened, no colonist used)

| Place | Shots that use it | Changes made for the gallery | Last read |
|---|---|---|---|
| `flower-garden` (154, 105) | 1 poodles, 2 kangaroos | none by this mod; NSB plan adds roses and birches (may hide warm coats, check on replay) | 2026-11-06 |
| `calm-zone` (200, 187), shot at (200, 185) | 3 red pandas, 4 Bengal cats | none | 2026-11-06 |

| Colonist | Shots | Outfit per shot | Last read of its profile | Exceptions |
|---|---|---|---|---|
| none (colonists sent to the map corner) | | | | none |

| Animal | Shots | Outfit chosen | Last read of its sheet | Exceptions |
|---|---|---|---|---|
| Poodles (AEXP_Poodle), anonymous | 1 | none | n/a | outside NSB, domestic, validated by Virginie 2026-11-06: "ils font partie du mod, c'est ça ? donc j'accepte" (animals the mod recolours) |
| Kangaroos (AEXP_Kangaroo), anonymous | 2 | none | n/a | wild, not covered by the rule |
| Red pandas (AEXP_RedPanda), anonymous | 3 | none | n/a | wild, not covered by the rule |
| Bengal cats (AEXP_CatBengal), anonymous | 4 | none | n/a | outside NSB, domestic: outside NSB, domestic, validated by Virginie 2026-11-06 (same words, covers poodles and Bengal cats for this mod) |

## Shotlist (scenes 2, 3, 4 rewritten 2026-11-06, `write-shotlist 2, 3, 4`; scene 1 kangaroos accepted, unchanged)

Not played yet. Ticket 20261106-043447-076-488b (owner order 2026-11-06) replays the OLD scenarios 2 to 4 (poodles, red pandas, Bengal cats; NSB place, no pawn, validated animals only); the rewritten scenes below are written into the feature file and the old captures `Art/Gallery/2-*`, `3-*`, `4-*` removed (GALLERY.md, "Réécrire une scène supprime ses anciennes captures") only when the scenarios are written, after that run is read. Opus director pass done (one call), kept below.

Story, "The coats afternoon": late afternoon into night at Nelim's Sanctuary. Nelim follows the animals that wandered in, each in its own coat. Light is the thread: 16h daylight (1) -> 17h unlit lamp (2) -> 18h Nelim lights the lantern (3) -> 19h the hall lit by its fire only (4). Framing tightens: wide (1), medium (2), medium-close (3), close (4). Outfit and hair identical in 2 to 4 (same day). Nelim: long loose hair (`Roo_Royal_LongHD`, never a ponytail or bun; Show Hair Under Stuff 3255379190 `RaccoonCuddler.ShowHair` to add to `-DepMap` if she wears a hat), smile, fixture outfit. Animals face Nelim (south edge of frame), a front view. Steps: only existing ones (spawn at cell, stands at cell facing, give coat K, frame cell, set hour, place decor, light decor). Pawn placement of Nelim by an existing step is to be confirmed (risk below). Poodles and Bengal cats validated by Virginie 2026-11-06 (see NSB).

| Scene | Place, hour | Subject and sentence | Composition | Living | Decor (removed after) | Instant | Estimate | Main risk |
|---|---|---|---|---|---|---|---|---|
| 2 poodles | `hut` (141,72), 17h, Clear | Nelim at the low table, 4 poodles (coats -1,0,1,2): "the poodles came for the tea hour, no two match" | medium, zoom 6, poodles foreground south, Nelim right behind the table, hut wall behind | two poodles face Nelim, one the table, one turned toward the door; a kangaroo at the frame edge links scene 1 | low table (check it is in the hut), `PlantPot` + `Plant_Daylily` fully grown, `TorchLamp` unlit | she just set the tea down; the nearest poodle is about to get the first biscuit | 3.5 | no confirmed step to place Nelim at the table facing a direction; plant selection outlines of the old image 2 must be cleared |
| 3 red pandas | `water-garden` (167,173), 18h, Clear | Nelim beside a lit lantern on the bank, 3 red pandas (coats 0,1,2): "three red pandas, three coats, one pond" | medium-close, zoom 5, pandas lower third on the bank, pond behind, low warm side light | two pandas face the water, one faces Nelim; Nelim stands facing them | `DR_StickLantern` (Mlie 2024351846) or `TorchLamp`, one only, lit; `Plant_Daylily` | she just lit the lantern; the pandas turned toward the light | 4 | Mlie StickLantern must be in `-DepMap` (else TorchLamp); Nelim placement as above |
| 4 Bengal cats | `hearth-hall` (181,115), 19h | Nelim by the fire, 3 cats (original, coats 0,1): "the coats come in for the night" | close, zoom 4, cats foreground at the hearth stones, Nelim off-centre, firelight | one cat faces Nelim, one the fire, one south toward the camera | hall fireplace (in place), `PlantPot` + `Plant_Daylily`; no extra brazier | she just reached toward the nearest cat | 3.5 | Nelim posture (sitting) has no existing step: stand beside instead; indoor light level |

Rule: a scene below 4 is reworked before it is played. Scenes 2 and 4 stay below 4 until the Nelim placement step is confirmed (ask NPT, owner rule 2026-10-25); no scenario for them before that.

### Revision, validated places only (2026-11-06, after `SanctuaryBacklot/Docs/VALIDE.md`)

Owner order: tickets only with validated place, colonists and animals. `VALIDE.md` (updated 2026-11-06) validates five places: `cloister`, `terrace`, `infirmary-pawns`, `hut` (2026-11-06), `ritual-hall` (2026-11-06). `flower-garden`, `water-garden`, `calm-zone` and `hearth-hall` are NOT validated. Ticket 20261106-043447-076-488b (old scenarios on `flower-garden` and `calm-zone`) was cancelled before it started. Scene 1 kangaroos (flower-garden, accepted capture) is not replayed. Nelim: appearance validated, daily outfit (`LTS_Tunika` emerald, gold hoops) validated, canon hair `Roo_HD_Hair_Highpony` (a ponytail is valid without a hat). Poodles and Bengal cats: validated by Virginie 2026-11-06 (see NSB). Red pandas: wild, not covered.

| Scene | Place (validated), hour | Change from the table above |
|---|---|---|
| 2 poodles | `hut`, 17h | same place; the hut now has its own decor (tatamis, low Korean table, cushions, oil andon): no `PlantPot`, no `TorchLamp` of ours; light is the andon |
| 3 red pandas | `cloister` (178,128), zoom 4.5, 18h | replaces `water-garden`; torii, komainu, ablution pavilion; Nelim stands beside one of the cloister lamps (stone lanterns exist only in the decorated save) |
| 4 Bengal cats | `ritual-hall` (206,117), 19h | replaces `hearth-hall`; brazier (204,118) lit, cushions facing the shrine; cats among the cushions, Nelim standing beside the brazier |

Open before any ticket: the validated decorated save (`Nelims-tribe-decor-mods.rws`, map `wsl-deps.sanctuary-decor-mods.map`, 19 mods, loaded through a DecorBase test mod) is not in `Mod/Pickle/Fixtures` and `Nelims-tribe` is still the old undecorated Sanctuary: asked NSB and NPT how a mod gallery loads it. Nelim steps exist (NPT 2026-11-06): `"Nelim" stands at (x, z) facing <dir>`, `"Nelim" stands next to "<name>"`, `"Nelim" sits on the building "<stool def>" at (x, z)`; no step for sitting on the hut cushions, so Nelim stands. Estimates stay 3.5 / 4 / 3.5 until scenarios are written on the validated places and the save question is answered.
