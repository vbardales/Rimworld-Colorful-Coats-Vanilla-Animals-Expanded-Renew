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
  - feature: gallery-decor 2026-11-07: 22b3 green 5/5 and 4968 3/4 read and opened; candidates kept as clean JPEGs in Art/Gallery-clean (3 red pandas, 4 Bengal cats, 5 giants, 6 hunters, 8 barn yard, 10 cats; not yet subtitled, not yet shown to Virginie, Nelim smile unverified on all: faces too small); REDO 2 (poodles at the wall and door, Nelim back to camera), 7 (pond too bare), 9 (cell (192,122) was a Wall, bonsai moved); 4bdc read: shot 2 now candidate (Art/Gallery-clean/2-poodles-tea-room.jpg); 7 still REDO (props floated on water), moved onto the west bank x 143-158; 9 moved onto free terrace cells (SANCTUAIRE-CASES); 2c0d: shot 9 failed on a lantern at (199,120) (third obstacle on the terrace), shot 7 on the bank showed the burrow (149,173): 376b: shot 7 accepted as candidate (Art/Gallery-clean/7-waterside-pond.jpg, burrow out of frame); shot 9 REDO (dogs spawned on the grand piano, Nelim far): dogs moved to paving x 195-197 z 122-124, refiled alone (Inbox/gallery-decor-11); candidates now 2 to 7 and 10 (score-gallery 2026-11-07: shot 8 REDO, adequacy 3.5: kibble not visible in the bowls, animals not crowding, clean JPEG deleted; recomposed 2026-11-07: six animals ring a pile of 30 Kibble, Nelim one cell west, refiled alone as Inbox/gallery-decor-12); next: open 9, rate, reindex, subtitles (draft in PUBLICATION.md), Art/Gallery-clean needs 1-kangaroos original; next: open the three, rate-gallery, then reindex (no gap: 1 kangaroos exists), subtitles (PUBLICATION.md, Add-Subtitle.ps1), show candidates to Virginie; kept from the old notes: the PartySpot,RitualSpot Given (shot 4) and kept-asleep step were never played, send a red message to the TM (forwards to NPT)
  - feature: compatibility test with Animal Variety Coats 1511926373 (Virginie, 2026-11-13: "on fera un test de compatibilité"): check whether it touches the same animals or `alternateGraphics`, then a Pickle scenario with both mods; AVC is not in any dep map yet, so ask NPT for the step or map and tell PiI the Workshop id stays protected
  - feature: gallery scenarios polish (TM relay of Audit rule 2026-10-18, not started): per shot and transition refine clothes, hair, tattoos, weapons, other-mod objects, animals, plants, props, buildings; Nelim as protagonist, StageDecor props, facing front; look first in PickleTools/ColonistRace/docs CATALOGUE-*, FACE-PARTS, GALLERY-PROPS.md; research via scripts/SEARCHING.md; release rules AGENTS.md 9a, 9b; then run Mark-ProtocolsRead and ack TM one line
  - unverified: 1.7 diagnostic (AUDIT.md, Passe 1.7), English only, filed 2026-10-19 on HEAD, six tickets (-Game /home/nelim/rimworld17): 20261019-230516-546-8227 (no-odyssey: always-patched, without-odyssey, loadaudit), -230517-648-8ae6 (with-odyssey), -230518-769-1140 (endangered), -230519-850-455e (coats), -230520-933-3e50 (rare odyssey), -230522-002-365b (rare plain); evidence: greens minified into Tests/Pickle/Evidence/17-coats, 17-endangered, 17-odyssey (2026-10-27); reds kept in Tests/Pickle/Inbox/17-no-odyssey and 17-rare-plain until replayed; results read 2026-10-25 (English, 1.7): no-odyssey 2 passed 2 skipped (both loadaudit scenarios skipped, reason not found in junit), with-odyssey 1/1, endangered 1/1, coats 5/5 (includes rare-odyssey, merged launch), rare-plain RED 0/1 (Log.Error "Grammar unresolvable. Root 'r_ritualName'", vanilla festival namer, probably environment, not proven); loadaudit skip explained 2026-10-27 (no-odyssey map lacks the LoadAudit mod, @requires unmet, not a 1.7 defect); read 2026-11-02: loadaudit 20261027-195906-491-2500 GREEN 2/2 on 1.7 (minified in Evidence/17-loadaudit; Evidence/17-no-odyssey keeps always-patched and without-odyssey greens); rare-plain replay 20261027-195807-782-fde6 RED again, same Log.Error "Grammar unresolvable. Root 'r_ritualName'" (vanilla Ideology festival namer, no mod text involved; reproducible, so not flaky; cause on 1.7 not proven), parked in Tests/Pickle/Parked/17-rare-plain-2 with RELEASE.md; next: find why the namer fails on the 1.7 map of this scenario (ask NPT if a Pickle step or map is at fault), replay alone; tested_1_7 stays absent until rare-plain green or judged not a mod defect; no <li>1.7</li> before a green run
  - unverified: non-regression of the whole suite on the final revision, deposited last, after commit and deploy (AUDIT.md, Passes Pickle, ordering)
  - decided 2026-10-02 (Virginie): manual scenario G is not applicable, as in the other Colorful Coats ports; existing animals recolour on adding the mod and revert on removing it. Recorded in TEST_SCENARIOS.md
  - feature: PUBLICATION.md open points: gallery order (after the gallery is played), thank-you messages (owner voice, after the item is public)
code_review_sha: 80b5d8f278eecacf4469bdb18893518759f9a5f6
social_preview_sha256: 59faba60037a2f05b68b45d38acadc89718ffd32f182111627db557fce26d7ee
session:      local_372522c2-0e0b-47d6-a482-b41a0acb0460
updated:      2026-11-13 (shot 8 recomposed: six animals on the six cells touching the 30 Kibble, faces toward the pile, three props added, tree a68b347, drift check OK, refiled alone as ticket 20261113-225851-536-caaa, Inbox/gallery-decor-19; next: open, test at 268 px, score-gallery; ticket 7a01 read, green 2/2, score-gallery: shot 9 candidate (Art/Gallery-clean/9-dogs-terrace.jpg: five dogs readable at 268 px, Rottweiler in profile, Nelim beside the kibble, stone terrace with piano, torches, lanterns; image 4.5, understanding 4, decoration 4.5, adequacy 4; Nelim smile unverified, face too small), shot 8 REDO (animals readable but two rows, none ringing the kibble pile, hay ground bare, Nelim sideways; image 4, understanding 3.5, decoration 3.5, adequacy 3.5), capture and Inbox/gallery-decor-18 deleted; next: recompose shot 8 alone (ring of animals on the pile, ground decor, Nelim facing the pile), refile, then subtitles on candidates 2 to 7, 9, 10, sync-nsb-npt (NSB changed 2026-11-12), show candidates to Virginie; ticket 60bf green 2/2 read, score-gallery: both REDO again (shot 8: animals readable at 268 px now but two rows, bare hay ground, Nelim not among them, decor out of frame, image 4, understanding 3.5, decoration 3.5, adequacy 3.5; shot 9: small dogs are specks at 268 px, j weak, Rottweiler seen from behind, Great Dane on the piano side, understanding 3.5); captures deleted; shot 8 got Bonsai, Stool, SculptureSmall near the ring, shot 9 zoom 2.5 and Rottweiler East, tree 0f65e64, refiled as ticket 20261113-212807-475-7a01, Inbox/gallery-decor-18, drift check OK; shots 8 and 9 recomposed: zoom was wrong way (smaller is closer), now 3 and 3.5, main bar hidden, tree f0a18c1, refiled as ticket 20261113-212005-953-60bf, Inbox/gallery-decor-17, drift check OK; next: open both, test at 268 px, score-gallery, then subtitles; ticket 87b0 read, green 2/2, score-gallery both shots REDO: j weak at 268 px, animals are dots; shot 8 also two groups, Nelim back turned, bar-room decor; shot 9 terrace cluttered; captures and RELAY-87b0 deleted; next: recompose 8 and 9 tighter (zoom above 6 or fewer animals, one group, Nelim facing the pile), refile, then sync-nsb-npt (NSB changed 2026-11-12); review-translation page 1 no correction, TRANSLATION_REVIEW.md committed); 2026-11-09 (refiled shots 8 and 9 as ticket 20261109-234202-695-87b0, Inbox/gallery-decor-16, tree 3084911: next open both, test at 268 px, score-gallery; then sync-nsb-npt, subtitles on Art/Gallery per 2026-11-09 rule, FRENCH_REVIEW rename; ticket 072b green 2/2 but both captures REDO under the 2026-11-09 criterion j rule (animals unreadable at 268 px; shot 8 also two groups, Nelim back turned, bar-room decor): zoom raised to 6 on both, captures deleted, Inbox emptied, Prune dry run nothing to prune; shots 8 and 9 filed together as ticket 20261109-233703-406-072b, Inbox/gallery-decor-15, tree 8b50809: 8d49 burned by the 13:43 launcher bug (exit 99, no play), c578 evidence gallery-decor-12 already scored REDO and gone from Inbox); 2026-11-08 (shot 8 c578 scored REDO: animals drifted 2 cells off the pile in two groups, Nelim back turned, decor odd; frame wait 5 to 1, refiled gallery-decor-14; shot 9 REDO after score-gallery: image 3.5, adequacy 3.5, understanding 3, decoration 4; dogs ring 30 Kibble, refiled alone as ticket 20261108-001450-572-8d49 Inbox/gallery-decor-13; shot 8 ticket c578 still queued); 2026-11-07 (gallery-decor tickets refiled after dep map and cell fixes; OptionalCompat check OK 7/7), shotlist 2 to 10 and gallery-decor.feature rewritten (plan 5 per scene, drift check OK); 2026-11-06, Preview re-rendered and validated by Virginie 2026-11-06 (automatic title fit 35 px, echo beside the title); Check-Coats.ps1 replaced by Tests/Rule-OwnValues.ps1 (new test shape, mutation proof done), LOCAL_SCRIPTS row pushed, CI/CD regenerate (Test-Mod.ps1 + .github) and Audit validation still to ask
protocols_read_sha: 0ee69017f242dc5306be754ef91bc910700fb029
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

## Gallery table (2026-11-07)

Only `Art/Gallery/0-preview.png` and `1-kangaroos.png` (accepted by Virginie 2026-10-12) exist. Scenes 2 to 10 are planned (section "Shotlist"), no capture yet. The old candidates 2 to 4 and the refused run de2b captures are deleted.

## Ecosystem

PiI, 2026-11-13 (details: `../docs/inventory/ecosystem-steam/ColorfulCoatsVAERenew.md`): original 2398446130, packageId `purpleyam.colorfulcoats.vaewildlife`, versions 1.2 1.3 1.4, dead for 1.6. No duplicate or fork. A corpus scan of its packageId finds only the original, this Renew and No Version Warning (link). No other Steam mod recolours Vanilla Animals Expanded. Siblings of the series (Cats and Dogs, Dodos, Megafauna) all dead for 1.6. Only live neighbour: Animal Variety Coats 1511926373. Patch-only mod, no defName scan. Nothing subscribed.

## NSB

First sync, 2026-11-06 (`sync-nsb`). NSB changed since the gallery was authored (2026-10-11/12): `Docs/EMBELLISSEMENT-LIEUX.md` (plan of 2026-11-04) adds decor to `flower-garden` (rose border along the statue path, two birches in the background; later pass: hydrangeas, lavender, lanterns, a silver tree), applied by NPT to the `Nelims-tribe` fixture. `calm-zone` stays free (shooting zones are kept bare); a new `calm-zone-close` frame exists. Nothing renamed or removed. Left alone: the two scenarios that use `flower-garden` (poodles, kangaroos) stay as played; if the owner wants them replayed on the embellished garden, that is a redo, not a fix. The mod uses no NSB colonist and no named NSB animal.

Second run, same day: no NSB doc changed since the first read (file dates 2026-11-05 or older); `wsl-deps.gallery.map` still matches what NSB uses (VAE, its core, the PickleTools steps, `nelim.sanctuarybacklot`); nothing to update.

Places read: 2026-11-07
Tribe read: 2026-11-07 (`VALIDE.md` in full, `CATALOGUE-ANIMAUX.md`, `SANCTUAIRE-LIEUX.md` places table; roster and individual profiles not opened, Nelim is the only colonist used and `VALIDE.md` holds her outfit)

Fifth run, 2026-11-07 (`sync-nsb`, Check-Status `nsb-sync`): NSB commits since the fourth run only touch `VALIDE.md`, `SANCTUAIRE-LIEUX.md`, `AVANCEMENT.md`, `GALERIE.md`, `runs/`. `VALIDE.md` now validates, on the decorated save (photos 2e61, 8a0a, cd57): `flower-garden`, `water-garden`, `statue-garden`, `river-bridge`, `barn`, `pediatrics`, `infirmary`, `infirmary-animals`, plus the free zones (`calm-zone`, `calm-zone-close`, `bare-clearing`, `emerald-clearing`, `exhibition-zone`, `fishing-zone`, smileys, bamboo backdrops), on top of `cloister`, `terrace`, `hut`, `ritual-hall`, `infirmary-pawns`. `ritual-hall` frame in `VALIDE.md`: (206, 117) zoom 8 (the places table of `SANCTUAIRE-LIEUX` says (206, 119) zoom 6.5; `SanctuarySites` in code wins). Consequence for this mod: scene 1 (kangaroos, `flower-garden`) and the old water-garden and calm-zone options are usable again; nothing renamed or removed; the scene lines of 2 to 4 stand. NSB animals (Shogun, Yuki, Atticus, Rain, Kuru, Tama, Onigiri, Ottawa, Pecan, Ulysse, Ursule, Wren, Wrille, Xylo): none is an animal this mod recolours, so no animal row changes. Rule 5 gap unchanged (shots 5 to 9 proposed, none written). `GALLERY.md` of 2026-11-07 now demands each scene rated 5 by `rate-gallery` (b: no thin decor, g: story readable in the image) before any ticket, then `Check-ShotlistVsScenario.ps1`: the 4 to 4.5 estimates above no longer open a ticket; next step is `write-shotlist` rework, not a refile. `Mod/Pickle/Fixtures/Nelims-tribe` is still the old undecorated save (copy "at the end of the redecoration").

Sixth run, 2026-11-13 (`sync-nsb-npt`, Check-Status `nsb-sync` warning): the only NSB commit since the fifth run is 18abf53 (2026-11-12), `docs/` renamed `Docs/`, 0 lines changed in any file: no place, colonist, animal or validation moved. Docs not reopened, so Places read and Tribe read keep 2026-11-07. NPT (first read of its log since 2026-11-01, diffs of the three that serve a gallery): new steps `the decor {string} at ({int}, {int}) burns` (lights a brazier or lamp, fuel and switch), `the main bar, the speed controls and the mouse-over readout are hidden` (cleaner capture), `I place the decor {string} holding {string} fully grown near ({int}, {int})` (pot with plant); other new steps (batteries, cultures, surgery, filth, floors) do not serve a shot. Nothing renamed or removed that a gallery scenario calls (to confirm with `Check-ShotlistVsScenario.ps1` at the next refile). Possible use for the REDO of shots 8 and 9: hide the bars; nothing applied. Rule 5: all 35 kinds still have a shot, no MISSING row. No owner question.

Steps read: 2026-11-13

| Place | Shots that use it | Changes made for the gallery | Last read |
|---|---|---|---|
| `flower-garden` (154, 110) zoom 10.5 | 1 kangaroos (accepted capture) | none by this mod; validated 2026-11-06, revalidated 2026-11-07 (photo 2e61); a replay now has the roses and birches | 2026-11-07 |
| `cloister` (178, 128) zoom 4.5 | 3 red pandas | none | 2026-11-07 |
| `hut` (141, 72) zoom 9 | 2 poodles | none | 2026-11-07 |
| `ritual-hall` (206, 117) zoom 8 | 4 Bengal cats | none (overlay spots `PartySpot,RitualSpot` hidden by the existing Given, not yet played) | 2026-11-07 |
| `calm-zone` (200, 187), `water-garden` (167, 173) | none now (old scenes, replaced) | none; both validated 2026-11-07, available as alternatives | 2026-11-07 |

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

## Shotlist (write-shotlist 2026-11-07, supersedes every earlier shotlist table; scene 1 kangaroos accepted and kept)

Header with all shots, story and rule: `Tests/Pickle/Mod/Pickle/Features/gallery-decor.feature` (shots 2 to 10, played alone on `wsl-deps.gallery-decor.map`, heavy, timeout 600); shot 1 lives in `gallery.feature` (accepted `Art/Gallery/1-kangaroos.png`, not replayed). Drift check `Check-ShotlistVsScenario.ps1`: OK 2026-11-07. NSB read 2026-11-07 (section above); every place is in `VALIDE.md`.

Story: day 1 "The coats afternoon" (16h to 19h): kangaroos (1), poodles at tea (2), red pandas to the shrine (3), Bengal cats for the night (4). Day 2 "The morning after" (8h to 17h): giants (5), hunters on the bridge (6), waterside (7), barn yard (8), dogs on the terrace (9), nine cats at tea, closing and echo of 2 (10). Nelim in every shot, same daily dress (emerald tunic, gold hoops, high ponytail, smile by face kit, no hat; as the fixture dresses her, read on the first capture). Animals pose only by facing and the carried item (steps: face, carries the item, kept asleep). Each group has one kind in two coats so the recolour reads in the thumbnail.

| Shot | Place, hour | Animals (kind coat) | Carried | Frame | Plan |
|---|---|---|---|---|---|
| 1 kangaroos | flower-garden, 16h | 3 kangaroos coats 0,1,2 | none | cell (153, 109) zoom 4 | accepted capture |
| 2 poodles | hut, 17h | poodle -1,0,1,2 | Kibble | (141, 70) zoom 4 | 5 |
| 3 red pandas | cloister, 18h | red panda 0,1,2 | RawBerries | (178, 127) zoom 3.5 | 5 |
| 4 Bengal cats | ritual-hall, 19h | Bengal -1,0, asleep 1 | Milk | (206, 116) zoom 3 | 5 |
| 5 giants | statue-garden, 8h | giraffe -1,0; black rhino 1; muskox 2; moa 3 | Hay | (155, 99) zoom 5 | 5 |
| 6 hunters | river-bridge, 9h | tiger -1,0; jaguar 0; hyena 1; mega wolverine 0; black bear 1 | Meat_Muffalo | (137, 124) zoom 5 | 5 |
| 7 waterside | water-garden, 10h | otter -1,1; beaver 0; platypus 0; rockhopper 2; walrus 1 | RawBerries | (168, 172) zoom 5 | 5 |
| 8 barn yard | barn, 11h | badger -1,1; hedgehog 2; pangolin 0; ferret 1; koala 1 | Kibble | (196, 236) zoom 6 | 5 |
| 9 dogs | terrace, 12h | chihuahua -1,2; great dane 0; rottweiler 0; shih tzu 0 | Kibble | (196, 123) zoom 6 | 5 |
| 10 cats | hut, 17h | Maine coon -1,1; British shorthair 0; munchkin 0; Norwegian forest 1; Persian 0; Siamese 1; Somali 0; Sphynx 1 | Milk | (141, 71) zoom 4.5 | 5 |

Rule 5 (every kind): 35 of 35 kinds of the mod appear (kangaroo 1, poodle 2, red panda 3, Bengal cat 4; giraffe, black rhino, muskox, moa 5; tiger, jaguar, hyena, mega wolverine, black bear 6; otter, beaver, platypus, rockhopper, walrus 7; badger, hedgehog, pangolin, ferret, koala 8; chihuahua, great dane, rottweiler, shih tzu 9; the eight other cats 10). Original (-1) next to an added coat is drawn in each group shot except 3 (three added coats) and 1 (accepted).

Plan rating (`rate-gallery`, no capture yet), first pass: b weak on 6 and 9 (named props on near bare ground), j weak on 5 and 6 (zoom 6, five or six animals), g weak on 5 and 10 (sentence true only through the header). Fixed in the same pass (added Stool, SculptureSmall, PlantPot_Bonsai on 6 and 9; zoom 5 on 5 and 6; sentences rewritten): each scene 5/5, series k ok (opening 1, closing 10, wide 1, close 4, 8, 10). Director pass (Opus, one call): kept the facings toward Nelim, the carried item as the only pose, Moa to shot 5, Walrus to 7, original plus coat pair per group, unlit lamps in daylight, close frames for 5 to 9, hour 17 on shot 10 for the echo; NOT kept: its claim that no step puts an animal to sleep (`the animal "X" is kept asleep` exists in `docs/steps.md`), so the sleeper of shot 4 stays. Not verified: cell walkability for every placement (adjust after the first capture), the outfit the decor save gives Nelim, the steps `kept asleep` and `things ... hidden when present` (listed, never played), the AEXP_Shih-Tzu defName (taken from the patch xpath).

Next: `review-gallery` step 1 (place, DepMap, steps), then file one gallery-decor ticket (map `wsl-deps.gallery-decor.map`, -Extra -pickle-scenario-timeout=600, runner auto); read `summary.md`, open each capture, `rate-gallery` on the images, REDO or candidate; tell the owner only candidates. Gallery images budget: 10 images under 2 MB each and 8 MB in all.
