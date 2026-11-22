---
settings_audit: not_applicable
ecosystem_line: 1.0
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
mod:          Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)
packageId:    nelim.colorfulcoats.vae
repo:         Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew
visibility:   public
detached:     yes
workflow_stage: writeReleaseDocs[1.0.0]
licence:      silent
port_licence: MIT (port additions only)
licence_at:   Steam description, public profile, local original files, GitHub repository search
upstream_mod_remotes: N/A
dependencies: declared
workshop_required_items: n/a, not released yet
showcase:     complete
tested_on:    "RimWorld 1.6, kept proofs in Tests/Pickle/Evidence (Mod/ defs, patches and textures unchanged since 2026-09-11; later Mod/ commits touch About text and images only): 2026-09-28 odyssey-v2 2/2, endangered-v2 1/1, no-odyssey-v2 1/1, rare-odyssey; 2026-10-02 coats-v2 3/3, rare-plain-4; 2026-10-18 loadaudit-2 1/1 (ticket 20261017-215813-717-6411); 2026-10-23 loadaudit-3 2/2 (ticket 20261019-231033-626-9492, mod-list entry, exitReason passed); all green, English; see Docs/runs/pickle.md. Scenario G not applicable"
workshop:     3806766686 (private; item created by a 0.1.0 prepublication, 2026-09-23)
remaining:
  - feature: gallery redo of shots 2, 6, 9 DONE 2026-11-22 (ticket 6164, 3/3 passed, run minified in Tests/Pickle/Evidence/gallery-redo-2-6-9; VTW wait lifted 2026-11-20). Read against the old: 2 Nelim face visible, brazier apart from the poodles; 6 Nelim whole in frame, murk still heavy; 9 face visible, chihuahuas larger but still small. All three kept as candidates (clean in Art/Gallery-clean, subtitled in Art/Gallery). Gallery validated by Virginie 2026-11-22 (gallery_validated_sha). Stage mountPreview DONE 2026-11-22 (10.a to 10.f); next writeReleaseDocs 11.a Steam description in PUBLICATION.md (name DALL-E in the AI mention), 4.g required items, ATTRIBUTION gallery credits. Earlier notes: 10.a echo KEPT 2026-11-22 (Virginie "Oui, garder": kangaroo and red panda echo still matches shots 1 and 3; echo_review_sha written), 10.a bis Preview source REDO decided 2026-11-22 (Virginie "on refait la preview"): prompt written in Docs/PROMPT_ColorfulCoatsVAERenew.md (refs 1-kangaroos.png and 3-red-pandas-cloister.jpg from Art/Gallery-clean, main 3-red-pandas), take 1 kept (Virginie: "c.est pas grave"), panelBare true added to Art/Preview.config.json (old: absent) so the panel no longer covers the left red panda; panelAnchor bottom-left KEPT 2026-11-22 (Virginie "panneau en bas, c.est mieux"; old: absent = top-left; icon moves top-left); 10.f social preview resent via Chrome 2026-11-22 (settings page shows the new image after reload, og:image not checked), 10.d contrast only estimated (title p90 about 4.3), image model DALL-E (Virginie 2026-11-22): name it in the Generation par IA mention of the description at writeReleaseDocs, then 10.b to 10.g
  - feature: gallery 2026-11-19: all of shots 2 to 10 are accepted, subtitled candidates (Art/Gallery-clean and Art/Gallery; shot 2 final take ticket 7c48, shot 8 final take ticket 0786, both read and opened). Rule 2026-11-19 (AUDIT 9.a, GALLERY): Virginie validates no image, the session decides alone. Kept flags, not defects: Nelim smile unverified (face half hidden by the carried item), blue brazier touches the right poodle on 2, burrow hole at the top edge and grey murk on 7, grey murk on 6, chihuahuas about 10 px at 268 px on 9. Open: nothing before VTW; a gallery change reopens mountPreview (AUDIT 10), so the Preview is redone after any redo
  - feature: writeReleaseDocs 2026-11-22: 11.a to 11.g done in PUBLICATION.md (Steam description block, About.xml generated from it, publish.config.json description source added, ATTRIBUTION Gallery set 44 mods, change note 1.0.0 with [list]); code_review_sha moved to HEAD (diff of Mod: About description, ATTRIBUTION copy, Preview.png only). 11.h drafted 2026-11-22 (purpleyam 2398446130 and Endangered 2366589898 drafted, register rows added, 22 existing pages join Covers); OPEN: owner decision on thanking the ~22 decorated-Sanctuary pages (no draft), then 11.j Virginie review, 11.k, 12.a to 12.h
  - feature: optional, only if Virginie asks: railings on the shot 6 bridge (none today, "pas disqualificatif"): CATALOG-REQUEST to Cat for a railing def
  - feature: TM missions list Rimworld-Ticket-Dispatcher/docs/sessions/tm-missions-2026-11-12.md (items 0 to 39; 34 superseded by 34c, 36d NOT yet, 39 Steam change notes in BBCode with a [list], read the dry-run note before publish, post nothing), sent 2026-11-17, not yet read or applied
  - defect: audit replay 2026-11-17 (ledger ../.replays/ColorfulCoatsVAERenew-20261117.tsv): records of 4.g written (workshop_required_items, Dependencies, Settings audit, Translation audit); rerun /audit-replay to advance, then replay the whole chain for 1 to 4 after the stage moves
  - feature: compatibility test with Animal Variety Coats 1511926373 (Virginie, 2026-11-13): static check found 0 overlapping defNames (it patches 34 vanilla kinds, this mod 40 AEXP_*); a Pickle scenario with both mods would settle runtime texture clash; AVC is in no dep map: ask NPT for the step or map, tell PiI the Workshop id stays protected
  - feature: gallery scenarios polish (TM relay of Audit rule 2026-10-18): per shot refine clothes, hair, props, other-mod objects; Nelim as protagonist; look first in PickleTools/ColonistRace/docs CATALOGUE-*, FACE-PARTS, GALLERY-PROPS.md; props are asked of Cat (AGENTS, Gallery, Cat and NPT)
  - unverified: 1.7 diagnostic (AUDIT.md, Passe 1.7), English, six tickets filed 2026-10-19, results read 2026-10-25 and 2026-11-02: no-odyssey 2/2 (2 loadaudit skipped, map lacks LoadAudit, not a 1.7 defect), with-odyssey 1/1, endangered 1/1, coats 5/5, loadaudit 2/2 green (20261027-195906-491-2500); rare-plain RED twice (Log.Error "Grammar unresolvable. Root 'r_ritualName'", vanilla Ideology festival namer, reproducible, cause on 1.7 not proven), parked in Tests/Pickle/Parked/17-rare-plain-2 with RELEASE.md; next: find why the namer fails on the 1.7 map (ask NPT if a step or map is at fault), replay alone; tested_1_7 stays absent until rare-plain is green or judged not a mod defect; no <li>1.7</li> before a green run; greens kept in Tests/Pickle/Evidence/17-*
  - unverified: non-regression of the whole suite on the final revision, deposited last, after commit and deploy (AUDIT.md, Passes Pickle, ordering)
  - decided 2026-10-02 (Virginie): manual scenario G is not applicable, as in the other Colorful Coats ports; existing animals recolour on adding the mod and revert on removing it. Recorded in TEST_SCENARIOS.md
  - feature: PUBLICATION.md open points: gallery order (after the gallery is played), thank-you messages (owner voice, after the item is public)
code_review_sha: c206eb50494aa4424944c61238e8a3bfc33c2ae1
thanks_drafted_line: 1.0
gallery_validated_sha: 6665bc979d2df0498c6dc1b3ffaeda29ea053069  # 2026-11-22 oui de Virginie
echo_review_sha: 4a76d0ecb24fbda2e516e354926b4d48edcfd72d
preview_source_decision: redo, 2026-11-22
social_preview_sha256: f572fb92629ffb78bf540a3972b46e944427930a5bc286b489850b61a41b67ea
session:      local_c65c6b29-02cc-4259-aea8-4a072cdc5267
updated:      2026-11-22 (audit replay mountPreview.. typed by Virginie: stage writeReleaseDocs, first open 11.a description; gallery validated; gallery redo 2, 6, 9 accepted, ticket 6164 3/3; NPT sync 2026-11-22: only Miel and Soren roster steps added, not used here; protocols read d34b4b84)
protocols_read_sha: 5a892073196c88986eeecac0183d5a79366a02a8
---

# Colorful Coats - Vanilla Animals Expanded! Renew — status

Read by sweep across every mod, not by asking each thread in turn. Lives at root, never inside `Mod/`, so Steam never receives it. Dropped here by sweep of 2026-09-12, held since by this mod's thread, which updates it in commit that changes what it describes.

Vocabulary: `licence` open | silent | alive | forbidden | original; `remaining` feature | defect | unverified; `dependencies` declared | to check | none. State chain and criteria live in `../AUDIT.md`.

## Gallery table (2026-11-22)

`Art/Gallery/` holds `0-preview.png`, `1-kangaroos` (accepted 2026-10-12) and the subtitled shots 2 to 10 (2, 6, 9 retaken 2026-11-22, ticket 6164) (2 poodles, 3 red pandas, 4 Bengal cats, 5 giants, 6 hunters, 7 waterside, 8 barn yard, 9 dogs, 10 cats; lines in `PUBLICATION.md`); originals without subtitle in `Art/Gallery-clean/`. All accepted by the session (rule 2026-11-19: Virginie validates no image). Details in `remaining` and the shotlist below.

## Ecosystem

Refresh 2026-11-17 (PiI, report commit f27686d, now with the `ecosystem-links` block: parent VAE 2871933948, linked: original 2398446130, Animal Variety Coats 1511926373, Colorful Coats Cats and Dogs, Megafauna, Dodos, Vanilla Textures Expanded). Animal Variety Coats static check: it patches 34 vanilla PawnKindDefs, this mod 40 AEXP_* kinds, overlap 0 defNames; runtime texture clash not tested, a Pickle run with both loaded would settle it (feature item in `remaining`). No translation of the original found, so nothing to add at `localize`. VAE translations (PiI 2026-11-17, report commit 4695712): zh pack 2035865333 (leafzxg, upd 2026-11-13, page forbids reposting and AI training, not integrable) and Russian Language Pack 2947390965 (Mewn Goddess, upd 2026-11-04, no readable licence, ask the author); both translate VAE defs, which this mod does not own, so nothing to integrate here (no text of its own, localization not_applicable); information only. Original kept as linked by PiI, not parent: tell PiI if the original should be the parent.

PiI 2026-11-13 (`../docs/inventory/ecosystem-steam/ColorfulCoatsVAERenew.md`): original 2398446130 (`purpleyam.colorfulcoats.vaewildlife`, dead for 1.6), no duplicate or fork, siblings of the series all dead for 1.6, only live neighbour Animal Variety Coats 1511926373. Nothing subscribed.

## NSB

Synced eleven times since 2026-11-06 (`sync-nsb-npt`; latest 2026-11-20, NPT part only: two new ScreenshotStudio lighting steps, sun ceiling and lamp glow, none used by this mod, none renamed or removed; NSB unchanged since 2026-11-19). State: nothing the mod uses was renamed or removed; every place of the shotlist is validated in `VALIDE.md` with a frame (ours differ on purpose: close zooms); no NSB animal is one this mod recolours (Tama is `akaNEKO_N_Forest_Cat`, Let's Have a Cat!); Nelim is the only colonist, her look unchanged (skin, hair `Roo_HD_Hair_Highpony`, `Face_Love`, `Body_Heart`). NPT steps added since 2026-11-07 serve other mods or a cleaner capture (decor burns, bars hidden, plant pot, mouth framing); none is renamed or removed where a scenario calls it. Rules 1 to 5 of the skill stand, no owner question open.

Places read: 2026-11-15
Tribe read: 2026-11-22
Steps read: 2026-11-22

| Place | Shots that use it | Changes made for the gallery |
|---|---|---|
| `flower-garden` (154, 110) | 1 kangaroos (accepted capture) | none |
| `hut` (141, 72) | 2 poodles, 10 cats | shot 2: the incense burner RLE_Kouro is hidden by the Sanctuary hide step |
| `cloister` (178, 128) | 3 red pandas | none |
| `ritual-hall` (206, 117) | 4 Bengal cats | none |
| `statue-garden` (155, 99) | 5 giants | StageDecor props |
| `river-bridge` (135, 124) | 6 hunters | StageDecor props |
| `water-garden` (167, 173) | 7 waterside | StageDecor props |
| `barn` (196, 237) | 8 barn yard | yard decor, hay, kibble pile at (196, 238) |
| `terrace` (196, 123) | 9 dogs | StageDecor props |

Colonist: Nelim (NSB), shots 2 to 10 (not 1). Daily dress `LTS_Tunika` emerald `#1F7A5C`, gold earrings `Apparel_PAESmallEarrings`, white `Apparel_Pants` worn before the tunic (`Nelim is undressed` strips the fixture trousers), hair `Roo_HD_Hair_Highpony`, no hat, smile by `face kit "smile"` (validated by Virginie 2026-11-06 for this mod, scenes 2 to 4, default mouth `MouthLipsSmirk`). No property of hers changed otherwise.

Domestic animals outside NSB, validated by Virginie 2026-11-06 ("ils font partie du mod, c'est ça ? donc j'accepte" and "2. oui"): poodles, Bengal cat, Chihuahua, Great Dane, Rottweiler, Shih Tzu, British Shorthair, Maine Coon, Munchkin, Norwegian Forest Cat (`AEXP_CatNorwegianForest`), Persian, Siamese, Somali, Sphynx. Wild animals are decor.

## Shotlist (write-shotlist 2026-11-07, supersedes every earlier shotlist table; scene 1 kangaroos accepted and kept)

Header with all shots, story and rule: `Tests/Pickle/Mod/Pickle/Features/gallery-decor.feature` (shots 2 to 10, played alone on `wsl-deps.gallery-decor.map`, heavy, timeout 600); shot 1 lives in `gallery.feature` (accepted `Art/Gallery/1-kangaroos.png`, not replayed). Drift check `Check-ShotlistVsScenario.ps1`: OK 2026-11-07. NSB read 2026-11-07 (section above); every place is in `VALIDE.md`.

Story: day 1 "The coats afternoon" (16h to 19h): kangaroos (1), poodles at tea (2), red pandas to the shrine (3), Bengal cats for the night (4). Day 2 "The morning after" (8h to 17h): giants (5), hunters on the bridge (6), waterside (7), barn yard (8), dogs on the terrace (9), nine cats at tea, closing and echo of 2 (10). Nelim in every shot, same daily dress (emerald tunic, gold hoops, high ponytail, smile by face kit, no hat; as the fixture dresses her, read on the first capture). Animals pose only by facing and the carried item (steps: face, carries the item, kept asleep). Each group has one kind in two coats so the recolour reads in the thumbnail.

| Shot | Place, hour | Animals (kind coat) | Carried | Frame | Plan |
|---|---|---|---|---|---|
| 1 kangaroos | flower-garden, 16h | 3 kangaroos coats 0,1,2 | none | cell (153, 109) zoom 4 | accepted capture |
| 2 poodles | hut, 17h | poodle -1,0,1,2 | Kibble | (141, 70) zoom 4 | 5 |
| 3 red pandas | cloister, 18h | red panda 0,1,2 | none | (178, 128) zoom 3.5 | 5 |
| 4 Bengal cats | ritual-hall, 19h | Bengal -1,0, asleep 1 | Milk | (206, 116) zoom 3 | 5 |
| 5 giants | statue-garden, 8h | giraffe -1,0; black rhino 1; muskox 2; moa 3 | Hay | (155, 99) zoom 5 | 5 |
| 6 hunters | river-bridge, 9h | tiger -1,0; jaguar 0; hyena 1; mega wolverine 0; black bear 1 | Meat_Muffalo | (137, 124) zoom 5 | 5 |
| 7 waterside | water-garden, 10h | otter -1,1; beaver 0; platypus 0; rockhopper 2; walrus 1 | RawBerries | (168, 172) zoom 5 | 5 |
| 8 barn yard | barn, 11h | badger -1,1; hedgehog 2; pangolin 0; ferret 1; koala 1 | Kibble | (196, 236) zoom 6 | 5 |
| 9 dogs | terrace, 12h | chihuahua -1,2; great dane 0; rottweiler 0; shih tzu 0 | Kibble | (196, 123) zoom 6 | 5 |
| 10 cats | hut, 17h | Maine coon -1,1; British shorthair 0; munchkin 0; Norwegian forest 1; Persian 0; Siamese 1; Somali 0; Sphynx 1 | Milk | (141, 71) zoom 4.5 | 5 |

Rule 5 (every kind): 35 of 35 kinds of the mod appear (kangaroo 1, poodle 2, red panda 3, Bengal cat 4; giraffe, black rhino, muskox, moa 5; tiger, jaguar, hyena, mega wolverine, black bear 6; otter, beaver, platypus, rockhopper, walrus 7; badger, hedgehog, pangolin, ferret, koala 8; chihuahua, great dane, rottweiler, shih tzu 9; the eight other cats 10). Original (-1) next to an added coat is drawn in each group shot except 3 (three added coats) and 1 (accepted).

## Dependencies (4.g, 2026-11-17, revision 7a517f1)

Hard: `VanillaExpanded.VanillaAnimalsExpanded` (Workshop 2871933948, `modDependencies` with `steamWorkshopUrl`). Order: `loadAfter` VAE, `VanillaExpanded.VAEEndAndExt` (Endangered), `VanillaExpanded.VAECD` (Cats and Dogs). Incompatible: `purpleyam.colorfulcoats.vaewildlife`, `purpleyam.colorfulcoats.vaecatsdogs`. Optional compat (`Mod/About/OptionalCompat.xml`, 7 declared, `Check-OptionalCompat.ps1` OK 2026-11-17): VAE biome packs VAEAS, VAEAU, VAEBF, VAEIS, VAET, VAETF, VAETR, kind patch; VAE Desert noted without packageId. DLC: Odyssey is not required; a fourth patch file is keyed on Ludeon's five animals existing. No Harmony, no assembly. Workshop "Required items": `n/a, not released yet` (owner decision 2026-11-10, set by hand at `writeReleaseDocs` step 12 or `publish`). Older detail: git history.

## Settings audit (5.g)

`settings_audit: not_applicable`. The only behaviour is authored alternate coats and per-species chances applied to PawnKindDefs at load; no promised player setting, no empty page or shortcut. Older record: git history (2026-09-13, 2026-09-28).

## Translation audit (6.h)

`localization`, `translation_en`, `translation_fr`: `not_applicable`. The mod adds no player-facing text: all `//value` leaves of the four patch files are selectors, flags or guard names. `TRANSLATION_REVIEW.md` regenerated at 7a517f1 says so. Older record: git history (2026-09-13).
