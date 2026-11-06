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
  - ticket 77fb RED 0/3 (2026-11-06, step `"Nelim" stands next to "coat-N"` is colonist-only; evidence deleted), fixed (Nelim placed by `stands at (x, z) facing South`), replay 20261106-112928-219-de2b GREEN 3/3 (azure, 2026-11-06, captures opened: all three REFUSED by the session, redo: 2 poodles, framed too wide with clutter (blue flame pots, chests), Nelim at bottom; 3 red pandas, two pandas centred but third tiny at top, Nelim stuck on a wall-edge with clutter below, no lantern; 4 Bengal cats, frame far too wide, cats tiny and one outside the hall, blue selection overlays visible, ritual-hall clutter; fix next: zoom closer on cats and Nelim, hide selection overlays, move clutter out of frame; evidence kept in Inbox/gallery-decor-3 until redo); previous 20261106-084651-988-c9ed FAILED infra (exit 6, no report: ssh forward "bind [127.0.0.1]:27750: Address already in use"; not a mod defect; evidence deleted); refiled (nearby cells unverified for walkability); original ticket text follows: gallery-decor.feature scenes 2 to 4 (poodles hut 17h, red pandas cloister 18h, Bengal cats ritual-hall 19h) on the validated decorated Sanctuary, map wsl-deps.gallery-decor.map, heavy (runs alone, 7g, timeout 600, priority 500 behind NSB); TM sends RUN_DONE with peak memory; read summary.md + junit.xml, open each capture, judge accept/refuse, then update the Shotlist estimates in this file, add subtitles, Art/Gallery-clean; scene 1 kangaroos accepted, not replayed; steps for Nelim exist (NPT 2026-11-06)
  - unverified: scene 4 (ritual-hall) blocked until NPT answers (asked 2026-11-06): a step hiding the blue gathering-spot and ritual-spot markers by name (capture Tests/Pickle/Inbox/gallery-decor-3/screenshots/manual--gallery-4-bengal-cats-ritual-hall--step0.png; `area and zone overlays are hidden` does NOT cover them); NPT also answered: no petting job, no kneel pose, no holding animals, no sitting animals; collars `the animal X is dressed in Y` untested on VAE kinds (file one small ticket only if a shot needs it)
  - feature: next step 2026-11-06: write the scenario bodies of scenes 2 to 4 in `gallery-decor.feature` from the shotlist rewrite (smile validated, VALIDE.md wins: only listed places and pawns), `git rm` old captures of scenes 2 to 4 in the same commit, then file one gallery-decor ticket (map wsl-deps.gallery-decor.map, -Extra -pickle-scenario-timeout=600, azure/hetzner ok); then write shots 5 to 9 (rule 5, dogs and cats validated, ideas: statue-garden big animals, water-garden bank, opening at the entrance torii, closing on the terrace with Shogun)
  - feature: rule 5 (2026-11-06): 31 animals have no gallery shot, see "Third run" table in NSB section; shotlist and scenarios to write at shootGallery (write-shotlist), after Virginie validates the domestic ones (4 dogs, 8 cats)
  - feature: gallery scenarios polish (TM relay of Audit rule 2026-10-18, not started): per shot and transition refine clothes, hair, tattoos, weapons, other-mod objects, animals, plants, props, buildings; Nelim as protagonist, StageDecor props, facing front; look first in PickleTools/ColonistRace/docs CATALOGUE-*, FACE-PARTS, GALLERY-PROPS.md; research via scripts/SEARCHING.md; release rules AGENTS.md 9a, 9b; then run Mark-ProtocolsRead and ack TM one line
  - unverified: 1.7 diagnostic (AUDIT.md, Passe 1.7), English only, filed 2026-10-19 on HEAD, six tickets (-Game /home/nelim/rimworld17): 20261019-230516-546-8227 (no-odyssey: always-patched, without-odyssey, loadaudit), -230517-648-8ae6 (with-odyssey), -230518-769-1140 (endangered), -230519-850-455e (coats), -230520-933-3e50 (rare odyssey), -230522-002-365b (rare plain); evidence: greens minified into Tests/Pickle/Evidence/17-coats, 17-endangered, 17-odyssey (2026-10-27); reds kept in Tests/Pickle/Inbox/17-no-odyssey and 17-rare-plain until replayed; results read 2026-10-25 (English, 1.7): no-odyssey 2 passed 2 skipped (both loadaudit scenarios skipped, reason not found in junit), with-odyssey 1/1, endangered 1/1, coats 5/5 (includes rare-odyssey, merged launch), rare-plain RED 0/1 (Log.Error "Grammar unresolvable. Root 'r_ritualName'", vanilla festival namer, probably environment, not proven); loadaudit skip explained 2026-10-27 (no-odyssey map lacks the LoadAudit mod, @requires unmet, not a 1.7 defect); read 2026-11-02: loadaudit 20261027-195906-491-2500 GREEN 2/2 on 1.7 (minified in Evidence/17-loadaudit; Evidence/17-no-odyssey keeps always-patched and without-odyssey greens); rare-plain replay 20261027-195807-782-fde6 RED again, same Log.Error "Grammar unresolvable. Root 'r_ritualName'" (vanilla Ideology festival namer, no mod text involved; reproducible, so not flaky; cause on 1.7 not proven), parked in Tests/Pickle/Parked/17-rare-plain-2 with RELEASE.md; next: find why the namer fails on the 1.7 map of this scenario (ask NPT if a Pickle step or map is at fault), replay alone; tested_1_7 stays absent until rare-plain green or judged not a mod defect; no <li>1.7</li> before a green run
  - unverified: non-regression of the whole suite on the final revision, deposited last, after commit and deploy (AUDIT.md, Passes Pickle, ordering)
  - decided 2026-10-02 (Virginie): manual scenario G is not applicable, as in the other Colorful Coats ports; existing animals recolour on adding the mod and revert on removing it. Recorded in TEST_SCENARIOS.md
  - feature: PUBLICATION.md open points: gallery order (after the gallery is played), thank-you messages (owner voice, after the item is public)
code_review_sha: 80b5d8f278eecacf4469bdb18893518759f9a5f6
social_preview_sha256: 59faba60037a2f05b68b45d38acadc89718ffd32f182111627db557fce26d7ee
session:      local_372522c2-0e0b-47d6-a482-b41a0acb0460
updated:      2026-11-06, Preview re-rendered and validated by Virginie 2026-11-06 (automatic title fit 35 px, echo beside the title); Check-Coats.ps1 replaced by Tests/Rule-OwnValues.ps1 (new test shape, mutation proof done), LOCAL_SCRIPTS row pushed, CI/CD regenerate (Test-Mod.ps1 + .github) and Audit validation still to ask
protocols_read_sha: af61b7d9c0729dbcdfbffc3847e62b1adfaef855
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
| Nelim (NSB) | 2, 3, 4 (not 1: colonists sent to the map corner) | same outfit all three, same day: daily dress `LTS_Tunika` emerald `#1F7A5C` plus gold earrings `Apparel_PAESmallEarrings` (validated 2026-11-04, `VALIDE.md`); hair `Roo_HD_Hair_Highpony`, no hat | 2026-11-06 (`NELIM-PROFIL.md` top, `VALIDE.md`) | mouth: canon is `MouthLipsSmirk`, the shotlist plays a smile (`face kit "smile"`) under the `GALLERY.md` rule of 2026-10-25 (smile on default scenes); no quoted owner words in chat for this mod: smile validated by Virginie 2026-11-06 ("oui, Nelim peut sourire"), for this mod, scenes 2 to 4, default mouth `MouthLipsSmirk` replaced by `face kit "smile"`; NSB told to record it in `VALIDE.md` |

| Animal | Shots | Outfit chosen | Last read of its sheet | Exceptions |
|---|---|---|---|---|
| Poodles (AEXP_Poodle), anonymous | 1 | none | n/a | outside NSB, domestic, validated by Virginie 2026-11-06: "ils font partie du mod, c'est ça ? donc j'accepte" (animals the mod recolours) |
| Kangaroos (AEXP_Kangaroo), anonymous | 2 | none | n/a | wild, not covered by the rule |
| Red pandas (AEXP_RedPanda), anonymous | 3 | none | n/a | wild, not covered by the rule |
| Bengal cats (AEXP_CatBengal), anonymous | 4 | none | n/a | outside NSB, domestic: outside NSB, domestic, validated by Virginie 2026-11-06 (same words, covers poodles and Bengal cats for this mod) |

Third run, 2026-11-06 (`sync-nsb`, rule 5 of 2026-11-06): `git log --since=2026-11-06 -- Docs` in NSB is empty, nothing changed there; `CATALOGUE-ANIMAUX.md` re-read: the only NSB animal the mod recolours is none: Tama is a Let's Have a Cat! cat (`akaNEKO_N_Forest_Cat`), not an animal this mod recolours (corrected after a read of `TAMA-PROFIL.md`). Rule 5 gap found: the mod patches 40 PawnKindDefs, only poodle, kangaroo, red panda and Bengal cat have a shot. Rows below are a PROPOSAL (shots 5 to 9, grouped by habitat, wild ones are decor and need no question); not written into the shotlist or any scenario yet. Domestic animals outside NSB (4 dogs, 8 cats): validated by Virginie 2026-11-06 ("2. oui").

| Included animal (PawnKindDef) | Shot | Domestic outside NSB |
|---|---|---|
| Poodle | 2 | validated 2026-11-06 |
| Kangaroo | 1 (accepted) | wild |
| Red panda (AEXP_RedPanda, VAEXP_RedPanda) | 3 | wild |
| Bengal cat | 4 | validated 2026-11-06 |
| Giraffe, Black Rhino, Muskox, Walrus, Tiger, Jaguar, Hyena, MegaWolverine | MISSING, proposed shot 5 (big animals) | wild |
| Badger, Beaver (VAEXP_AmericanBeaver), Otter, Hedgehog, Pangolin, Koala, Platypus, Black-footed ferret, Black bear | MISSING, proposed shot 6 (small and woodland) | wild |
| Moa, Rockhopper penguin | MISSING, proposed shot 7 (birds) | wild |
| Chihuahua, Great Dane, Rottweiler, Shih Tzu | MISSING, proposed shot 8 (dogs) | validated by Virginie 2026-11-06 ("2. oui", answer to: may I use the 4 dogs and 8 cats outside NSB, Chihuahua, Great Dane, Rottweiler, Shih Tzu) |
| British Shorthair, Maine Coon, Munchkin, Norwegian, Persian, Siamese, Somali, Sphynx | MISSING, proposed shot 9 (cats) | validated by Virginie 2026-11-06 ("2. oui", same answer, covers the 8 cats listed) |
| Norwegian Forest Cat (`AEXP_CatNorwegianForest`) | MISSING, proposed shot 9 | validated 2026-11-06 ("2. oui"); NOT Tama: her def is `akaNEKO_N_Forest_Cat` (Let's Have a Cat!, per NSB `TAMA-PROFIL.md`), she cannot wear our coats |

Tribe read: 2026-11-06 (animals catalogue; Nelim's profile and `VALIDE.md` re-read at the fourth run).

Fourth run, 2026-11-06 (`sync-nsb`): `VALIDE.md` (changed 16:29) and `NELIM-PROFIL.md` (15:33) are newer than the third run. `VALIDE.md` still validates `cloister` (178,128), `hut` (141,72) and `ritual-hall` (206,117) with the decorated save, and now adds Shogun (labrador, not an animal of this mod). Ritual-hall validated version: six Yuran cushions facing an altar reliquary in the west, incense burner (208,121), brazier (204,118), original furniture kept. Nothing renamed or removed; the scene lines stand. Nelim now carries rows in the colonists table above (she was missing: scenes 2 to 4 use her). Open owner question under rule 3: the smile (canon mouth is `MouthLipsSmirk`).

## Shotlist (scenes 2, 3, 4 rewritten 2026-11-06, `write-shotlist 2, 3, 4`; scene 1 kangaroos accepted, unchanged)

Not played yet. Ticket 20261106-043447-076-488b (owner order 2026-11-06) replays the OLD scenarios 2 to 4 (poodles, red pandas, Bengal cats; NSB place, no pawn, validated animals only); the rewritten scenes below are written into the feature file and the old captures `Art/Gallery/2-*`, `3-*`, `4-*` removed (GALLERY.md, "Réécrire une scène supprime ses anciennes captures") only when the scenarios are written, after that run is read. Opus director pass done (one call), kept below.

Story, "The coats afternoon": late afternoon into night at Nelim's Sanctuary. Nelim follows the animals that wandered in, each in its own coat. Light is the thread: 16h daylight (1) -> 17h unlit lamp (2) -> 18h Nelim lights the lantern (3) -> 19h the hall lit by its fire only (4). Framing tightens: wide (1), medium (2), medium-close (3), close (4). Outfit and hair identical in 2 to 4 (same day). Nelim: long loose hair (`Roo_Royal_LongHD`, never a ponytail or bun; Show Hair Under Stuff 3255379190 `RaccoonCuddler.ShowHair` to add to `-DepMap` if she wears a hat), smile, fixture outfit. Animals face Nelim (south edge of frame), a front view. Steps: only existing ones (spawn at cell, stands at cell facing, give coat K, frame cell, set hour, place decor, light decor). Pawn placement of Nelim by an existing step is to be confirmed (risk below). Poodles and Bengal cats validated by Virginie 2026-11-06 (see NSB).

| Scene | Place, hour | Subject and sentence | Composition | Living | Decor (removed after) | Instant | Estimate | Main risk |
|---|---|---|---|---|---|---|---|---|
| 2 poodles | `hut` (141,72), 17h, Clear | Nelim at the low table, 4 poodles (coats -1,0,1,2): "the poodles came for the tea hour, no two match" | medium, zoom 6, poodles foreground south, Nelim right behind the table, hut wall behind | two poodles face Nelim, one the table, one turned toward the door; a kangaroo at the frame edge links scene 1 | low table (check it is in the hut), `PlantPot` + `Plant_Daylily` fully grown, `TorchLamp` unlit | she just set the tea down; the nearest poodle is about to get the first biscuit | 3.5 | no confirmed step to place Nelim at the table facing a direction; plant selection outlines of the old image 2 must be cleared |
| 3 red pandas | `water-garden` (167,173), 18h, Clear | Nelim beside a lit lantern on the bank, 3 red pandas (coats 0,1,2): "three red pandas, three coats, one pond" | medium-close, zoom 5, pandas lower third on the bank, pond behind, low warm side light | two pandas face the water, one faces Nelim; Nelim stands facing them | `DR_StickLantern` (Mlie 2024351846) or `TorchLamp`, one only, lit; `Plant_Daylily` | she just lit the lantern; the pandas turned toward the light | 4 | Mlie StickLantern must be in `-DepMap` (else TorchLamp); Nelim placement as above |
| 4 Bengal cats | `hearth-hall` (181,115), 19h | Nelim by the fire, 3 cats (original, coats 0,1): "the coats come in for the night" | close, zoom 4, cats foreground at the hearth stones, Nelim off-centre, firelight | one cat faces Nelim, one the fire, one south toward the camera | hall fireplace (in place), `PlantPot` + `Plant_Daylily`; no extra brazier | she just reached toward the nearest cat | 3.5 | Nelim posture (sitting) has no existing step: stand beside instead; indoor light level |

Rule: a scene below 4 is reworked before it is played. Scenes 2 and 4 stay below 4 until the Nelim placement step is confirmed (ask NPT, owner rule 2026-10-25); no scenario for them before that.

### Rewrite of scenes 2, 3, 4 after the refused captures (2026-11-06, `write-shotlist shots 2, 3, 4`; supersedes the tables above for these scenes)

Rule (Virginie 2026-11-06, on `VALIDE.md` against `GALLERY.md`): `VALIDE.md` lists what is usable NOW; anything else in NSB may be used only once validated, so the shotlist counts on listed places, pawns, animals and outfits only (places: cloister, terrace, infirmary-pawns, hut, ritual-hall, and per NSB read pediatrics, statue-garden, flower-garden, water-garden).

Mouth (2026-11-06): NSB holds no validated smile, but Virginie validated it in chat ("oui, Nelim peut sourire", this mod, scenes 2 to 4): the smile steps stand.

Why: run de2b captures refused (too wide, clutter, a panda outside the room, selection overlays in the hall, Nelim posed still, no gesture; `rate-gallery` plan 3.9, image 3.5, adequacy 3.4). Opus director pass done (one call); kept: tighter zoom, Nelim turned in profile and a different facing each scene (no more South every time), only standing animals except one sleeper in scene 4, scene 3 sentence moves the story, overlay risk named. Dropped: "she set the tea down" (no step to put tea on the table; instant is now the biscuit), napping poodle (lying sprite blurs the coat). Same outfit all three scenes (same day): `LTS_Tunika` emerald, gold hoops, `Roo_HD_Hair_Highpony`, smile by `"Nelim" face kit is "smile"`, no hat. Animals placed by cell, never spawned around. Light is the thread: 17h andon, 18h torches, 19h brazier.

| Scene | a place, hour, weather | b decor | c living | d Nelim | e gesture, instant, how obtained | f composition | g sentence | j |
|---|---|---|---|---|---|---|---|---|
| 2 poodles | `hut`, 17h, Clear, game paused | tatamis, low Korean table (141,71), cushions, oil andon (in place, nothing added) | 4 poodles coats -1,0,1,2: (139,70) faces East, (143,70), (140,68), (142,68) face South (front view) | (141,70) faces West, emerald tunika, smile | holds out `Kibble` (`carries the item`); before: she took a biscuit, after: the nearest poodle takes it; obtained by carries + facings, no job | medium, camera centred on "Nelim" root size 4, poodles at both sides and in front, table behind | "the poodles came for the tea hour, no two match" | four coats side by side at about 4 cells each |
| 3 red pandas | `cloister` (178,128), 18h, Clear | lit torch lamps along the boards, komainu, torii, ablution pavilion (in place) | 3 pandas coats 0,1,2: coat-1 (177,127) and coat-2 (176,127) face East, coat-3 (178,128) faces South (front view), all standing | (178,126) faces East in profile toward the shrine, smile | carries `RawBerries`; before: she came in from the garden, after: the pandas follow her to the shrine; obtained by carries + facings | medium-close, area (178,128) root size 3.5, one lit torch in the foreground | "the red pandas follow her to the shrine" | three coats on a wood floor |
| 4 Bengal cats | `ritual-hall` (206,117), 19h, Clear (night falls, brazier is the light) | brazier (204,118) lit, cushions, incense burner (in place) | 3 cats (original, coats 0,1): coat-1 (205,114) faces East toward her, coat-2 (207,116) faces South, coat-3 lies (206,117) near the brazier (the sleeper, closing beat) | (206,114) faces West in profile, smile | carries `Milk`; before: she reached toward the nearest cat, after: it takes the milk; obtained by carries + facing a cat | close, camera frames the head of "Nelim" and "coat-1" at root size 3 | "the coats come in for the night" | two coats plus the sleeper, brazier glow |

Scene 1 line completed (2026-11-06, `write-shotlist shots 1, 2, 3, 4`): the accepted capture `Art/Gallery/1-kangaroos.png` is NOT rewritten and not replayed (a rewrite would delete it, GALLERY.md); only the written plan is filled so that it says what the image shows. No new director call for it (the Opus remarks of the call above are applied to the series).

| Scene | a | b | c | d | e | f | g | j |
|---|---|---|---|---|---|---|---|---|
| 1 kangaroos (accepted, played) | `flower-garden` (154,105), 16h, Clear, game paused | yellow flower field with red blooms (`Plant_Rose` among them) in place, one lit lamp at the top edge; no prop added | 3 kangaroos coats 0,1,2 at (151,109), (153,109), (155,109) standing upright, all facing South (front view) | none: colonists sent to the map corner (the series opens on the animals; Nelim enters at scene 2) | the mob sits upright like sentinels, heads up; before: grazing in the glade, after: the three set off toward the hut; obtained by `stands at ... facing South` (a pose, not a motion, kept weak) | wide-medium, `I frame the cell (153, 109) at zoom 4`, three in one row centred, flowers fill the frame, daylight | "a slow afternoon in the glade, no two kangaroos alike" | three distinct coats readable at thumbnail |

Estimate scene 1: 4 (e stays weak: a pose, no motion). Risks: flower-garden is NOT in `VALIDE.md` (kept only because the capture is accepted, owner 2026-10-12; no replay without validation); NSB plans roses and birches there, the glade may differ on a replay.

Series (k): one story "The coats afternoon", 16h kangaroos (wide, flower-garden, accepted, kept) then 17h offering, 18h walking, 19h settling for the night; wide, medium, medium-close, close; opening = place, closing = the sleeper by the brazier. ok.

| Scene | Estimate | Main risk |
|---|---|---|
| 2 poodles | 4.5 | every cell is a guess, walkability unchecked (Nelim stood 1 cell off her ask last run); kibble in hand must show at root size 4 |
| 3 red pandas | 4.5 | same cell risk; pandas small, root size 3.5 may crop the torch |
| 4 Bengal cats | 4 | blue gathering-spot and ritual-spot overlays may show again: clear the selection first, else ask NPT (no step exists); cats must not sit on the brazier |

Not yet written into the feature scenarios: the bodies in `gallery-decor.feature` are still the refused ones. When they are written the old captures `Tests/Pickle/Inbox/gallery-decor-3` scenes 2 to 4 are removed in the same commit (GALLERY.md, "Réécrire une scène supprime ses anciennes captures"). Rule 5 shots 5 to 9 are still a proposal, domestic animals pending Virginie's validation.

### Revision, validated places only (2026-11-06, after `SanctuaryBacklot/Docs/VALIDE.md`)

Owner order: tickets only with validated place, colonists and animals. `VALIDE.md` (updated 2026-11-06) validates five places: `cloister`, `terrace`, `infirmary-pawns`, `hut` (2026-11-06), `ritual-hall` (2026-11-06). `flower-garden`, `water-garden`, `calm-zone` and `hearth-hall` are NOT validated. Ticket 20261106-043447-076-488b (old scenarios on `flower-garden` and `calm-zone`) was cancelled before it started. Scene 1 kangaroos (flower-garden, accepted capture) is not replayed. Nelim: appearance validated, daily outfit (`LTS_Tunika` emerald, gold hoops) validated, canon hair `Roo_HD_Hair_Highpony` (a ponytail is valid without a hat). Poodles and Bengal cats: validated by Virginie 2026-11-06 (see NSB). Red pandas: wild, not covered.

| Scene | Place (validated), hour | Change from the table above |
|---|---|---|
| 2 poodles | `hut`, 17h | same place; the hut now has its own decor (tatamis, low Korean table, cushions, oil andon): no `PlantPot`, no `TorchLamp` of ours; light is the andon |
| 3 red pandas | `cloister` (178,128), zoom 4.5, 18h | replaces `water-garden`; torii, komainu, ablution pavilion; Nelim stands beside one of the cloister lamps (stone lanterns exist only in the decorated save) |
| 4 Bengal cats | `ritual-hall` (206,117), 19h | replaces `hearth-hall`; brazier (204,118) lit, cushions facing the shrine; cats among the cushions, Nelim standing beside the brazier |

Open before any ticket: the validated decorated save (`Nelims-tribe-decor-mods.rws`, map `wsl-deps.sanctuary-decor-mods.map`, 19 mods, loaded through a DecorBase test mod) is not in `Mod/Pickle/Fixtures` and `Nelims-tribe` is still the old undecorated Sanctuary: asked NSB and NPT how a mod gallery loads it. Nelim steps exist (NPT 2026-11-06): `"Nelim" stands at (x, z) facing <dir>`, `"Nelim" stands next to "<name>"`, `"Nelim" sits on the building "<stool def>" at (x, z)`; no step for sitting on the hut cushions, so Nelim stands. Estimates stay 3.5 / 4 / 3.5 until scenarios are written on the validated places and the save question is answered.
