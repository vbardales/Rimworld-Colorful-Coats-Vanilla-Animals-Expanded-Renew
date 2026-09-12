---
mod:          Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)
packageId:    nelim.colorfulcoats.vaerenew
repo:         Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
port_licence: MIT (port additions only)
licence_at:   Steam description, public profile, local original files, GitHub repository search
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running; scenarios A, B, D and M of TESTING.md are the ones that decide
session:      local_bd47cda2-a14e-4c5c-83b4-d538829c4475
updated:      2026-09-13, held by the mod's own thread
---

# Colorful Coats - Vanilla Animals Expanded! Renew — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it. Dropped here by the sweep of 2026-09-12 and
held since by this mod's thread, which updates it in the commit that changes what it describes.

## Preview overlay recomposed — 2026-09-12

- Final: `Mod/About/Preview.png`, 896 × 504, 551,050 bytes (under 900 KB).
- Illustration replaced at user request: `Art/Preview.png` now shows a giraffe, red panda,
  kangaroo and two differently coated cats in a colony shelter. Original dog illustration
  archived as `Art/Preview-dogs-archived.png`; `Art/Preview-source.png` also preserved.
- Composition: `Art/preview.html`; reproduction and QA: `Art/render-preview.cjs`
  (Node, Playwright, Sharp, installed Chrome). The previous HTML is archived as
  `Art/preview-legacy.html`. Serve the repository over HTTP to view the current HTML.
- Palette reference: `Art/preview-palette.json`, loaded directly by the HTML.
  Veil and secondary ink now follow the dominant blue-slate courtyard stones: muted dark
  slate veil, lighter blue secondary. The warm amber accent comes from the lamp pool,
  hay and ginger cat coat; it stands apart from the cool dominant family and is shared
  by the rule and badge. Palette recalculated for the new illustration.
- Exact existing name and summary retained. Title: two lines at 46 px, weight 600;
  Renew at 65 percent in secondary ink; unofficial on its own 24 px tag line.
  Text block starts at (50,54); summary width 430 px; rule 58 × 3 px.
- Badge reads 1.6, derived at render time from the highest stable supportedVersions
  entry in shipped About.xml. Triangle and rotated text use the guide coordinates.
- Actual fonts verified through Chrome's platform-font API: Segoe UI Semibold for
  title/Renew, Segoe UI regular for tag/summary, Segoe UI Bold for version. Capture waits
  for document.fonts.ready and image decoding. No fallback font used.
- QA: `Art/qa/preview-checks.json`, `Art/qa/Preview-background.png`, and
  `Art/qa/Preview-268.png`. Contrast measured over every background pixel in each text
  run's bounding rectangle with text hidden, not just the nominal veil colour.
  Worst ratios: main title 10.00:1, Renew 6.58:1, tag 7.19:1, summary 9.55:1,
  badge 8.99:1. All exceed 4.5:1. Dark veil holds longer to protect the title suffix.
- Visually checked at 896 × 504 and 268 px wide: two-line title, Renew and version
  identifiable, rule visible, cool secondary/warm accent distinct, no clipped text
  or overlapping text blocks. Summary is intended for the full-size view.
- Preview approved by the user. Illustration source is in Art/Preview.png.
  Preview, composition and audit were committed and pushed to GitHub in 60ef536.
  No Workshop publication performed.

## Visibility and naming policy rechecked — 2026-09-12

Reference: `../PUBLISHING.md`, Licence section (lines 112–139), and
`../STYLE_RIMWORLD.md`, status-tag section. These are the workspace policy, not an
upstream licence grant. Under that policy:

- `silent`: abandoned source without a licence or permission found; a public mod with
  no identified prohibition uses `(unofficial)` and the UNOFFICIAL opening disclaimer.
- `alive`: maintained source without a licence or permission found; private is mandatory,
  with `(prohibited)`, regardless of a previously public repository.
- Any private mod uses `(prohibited)` and the PERSONAL USE ONLY opening disclaimer.

Decision for this repository: retain **public / silent / (unofficial)**. The long absence
of updates and unmet Odyssey maintenance need support the documented assessment of an
apparently abandoned source. The 31-comment audit found neither permission nor prohibition.
The author reply in 2023 is historical support, not evidence of maintenance in 2026.
About.xml, README title, STATUS mod field and preview tag already use `(unofficial)`;
no renaming or preview regeneration is required. No remote visibility setting was changed.
The local definition of silent was restored to match PUBLISHING.md, replacing the overly
broad definition introduced during the earlier audit. Reassess if maintenance resumes or
permission/prohibition is discovered. The MIT scope remains limited to port additions.

## Local repository audit — 2026-09-12

This Codex task now maintains STATUS.md whenever the repository state changes.
Scope: only `C:\Users\nelim\Documents\rimworld\ColorfulCoatsVAERenew`.
Git reports this folder as its root, with its own `.git` and no superproject:
this is an independent repository, not a monorepo checkout or submodule.

- Mod: **Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)**.
- packageId: `nelim.colorfulcoats.vaerenew`.
- Origin (fetch/push): https://github.com/vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew.git
- Visibility: **public**, verified through the GitHub repository API (`private: false`).
- Suffix: `(unofficial)` already exists and should remain for this unofficial continuation.
  No additional suffix needed; supportedVersions already declares 1.6.
- GitHub link exists in both About.xml's url and its description.
- Licence: **MIT for port additions only**, as scoped in LICENSE and Mod/LICENSE,
  whose contents match. This permits reuse of maintenance work with its copyright notice.
  Original coats, probabilities and textures are purpleyam's and explicitly excluded.
  The prior source audit records no declared licence; `silent` describes those original
  resources. Attribution and removal on request are the repository policy, not an explicit
  upstream permission or MIT grant. The upstream sources were rechecked below on 2026-09-12.
- Automated: `_tools/Check-Coats.ps1` passed against installed VAE, Endangered and Odyssey:
  35 animals, 40 target defNames, 74 coats, 222 textures, 51 sequenced and 5 conditional
  operations. No installed-target checks skipped.
- XML: `_tools/Check-Xml.ps1` passed for all 5 shipped XML files; validates parsing,
  operation classes, XPath syntax, probabilities, coat entries, identity, suffix,
  GitHub description link, dependency and identical licence copies.
  Both scripts run from this repository without monorepo scripts. Neither runs the game engine.
- Manual: 13 functional scenarios A–M exist in TESTING.md. In-game execution remains
  unverified; tested_on stays empty. Priorities: A, B, D, M.
- Icon: approved replacement optimized to 128 × 128; see the dated update below.

## Upstream licence recheck — 2026-09-12

- Read the [original Steam description](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130)
  and **all 31 public comments**, successfully retrieved on retry through Steam's
  [public comment endpoint](https://steamcommunity.com/comment/PublishedFile_Public/render/76561198342847927/2398446130/?start=0&count=100).
  The response reported success=true, total_count=31; 31 unique comment IDs were read,
  spanning 17 February 2021 to 27 August 2025. No licence, reuse permission, prohibition
  on redistribution, source repository link or explicit abandonment announcement was found.
  Seven comments are by purpleyam; the latest is still 17 November 2023. The earlier
  empty comment pages were a pagination retrieval failure, now resolved. Deleted or
  non-public comments are outside this verification.
- The page lists versions through 1.4 and a last update on 29 October 2022, but the author
  replied on 17 November 2023. Users reported 1.6 compatibility in July/August 2025, with
  missing Odyssey coats. As of September 2026, these are substantial indications of absent
  maintenance: **apparently abandoned / no longer maintained by its original author** is a
  reasonable practical assessment, not a confirmed announcement by the author. A reply in
  2023 does not establish ongoing maintenance in 2026; continued functionality does not either.
- The description explicitly credits Oskar Potocki, Erin and Sarg Bjornson for the original
  textures. The inherited recolours therefore also have an underlying VAE art provenance;
  the port's MIT does not license that artwork.
- Read the [author's public Steam profile](https://steamcommunity.com/profiles/76561198342847927):
  no source repository link or general reuse statement found in the accessible content.
- GitHub public repository API queries: `"Colorful Coats" rimworld` found four repositories,
  all under vbardales; `ColorfulCoats` found zero; `purpleyam rimworld` found one vbardales
  repository. Web searches also found no attributable upstream repository. This establishes
  "not found", not "no repository exists"; private/unindexed repositories are outside this search.
- Re-read the installed original at Steam workshop/content/294100/2398446130:
  About.xml has no url or licence, and no LICENSE/COPYING/README filename was found recursively.
  This is the installed copy, not a freshly downloaded archive.
- Conclusion: no explicit permission established. Public visibility is the current repository
  setting, not evidence of redistribution rights. Credit, unofficial labelling and removal
  on request do not establish an upstream grant. No visibility or licence grant was changed.

This dated audit supersedes older categorical claims such as "dead", "never declared a
licence" or "no licence anywhere" in the existing port documentation. The accessible Steam
text also contains a removal notice alongside subscription controls; that extraction is
insufficient to confirm the item's actual availability or the reason for any restriction.

## What the fields say

Maintenance terminology reviewed on 2026-09-12: abandonment here describes sustained absence
of development/support, whether explicitly announced or inferred from inactivity and unmet
maintenance needs. No universal RimWorld inactivity deadline was found in the consulted
[mod release rules](https://ludeon.com/forums/index.php?topic=10561.0).
The [follow-up discussion](https://ludeon.com/forums/index.php?topic=10561.15) suggests authors
can specify an inactivity period in their own licence; it does not set a community-wide period.
An author can remain active elsewhere while abandoning one mod. Conversely, an old update
date alone is insufficient for a finished mod that needs no maintenance. The assessment above
combines the long update gap with undeclared newer versions and the unaddressed Odyssey gap.
Maintenance status and permission to redistribute remain separate questions.

`stage: done` in the repository's sense: the port work is finished. Four patch files, 222 textures,
74 coats over 35 animals, no assembly and no def of its own. Everything that can be settled without
the game has been settled and passes — `_tools/Check-Coats.ps1` for the textures, the 40 defNames
and the 51 sequenced operations, and the monorepo's four shared checkers, historically recorded as run on 2026-09-12. Those shared scripts are not shipped here and were not rerun in this local audit.
`done` does not mean tested, which is what `tested_on` is for.

`tested_on` empty: no in-game validation has been recorded. There is no halfway answer here, because both of this
mod's mechanisms swallow their own failures — a `PatchOperationFindMod` that does not match its
display name logs nothing, and `<success>Always</success>` does the same for an operation that finds
no animal. **A clean log is therefore not a pass**, and only animals on screen settle it.
`TESTING.md` is written around that.

`dependencies: declared` since 2026-09-12, and `to check` before that. `<modDependencies>` now names
`VanillaExpanded.VanillaAnimalsExpanded`, which `<loadAfter>` already named. Nothing here could ever
break the way Reequilibrage animaux did: this mod injects no class and declares no def, so the game
loads clean with or without its target. What the declaration buys is the one thing the mod could not
say for itself — **a player who enables it alone now reads why nothing happened.** Endangered
stays undeclared on purpose, since 30 of the 35 animals never needed it.

`workshop` empty: there is no `Mod/About/PublishedFileId.txt`, so nothing has gone to the Workshop.
The repository itself is public, and detached from the monorepo since 2026-09-11.

`licence: silent` follows PUBLISHING.md: source assessed as abandoned, with no explicit
upstream licence or permission found. The maintenance assessment is documented above.
The MIT grant remains limited to the port additions described in LICENSE.

`showcase: complete` — `About/Preview.png` and `About/ModIcon.png` both exist. The banner follows
its own brief and sits under Steam's hard 1 MB ceiling. The approved replacement icon is now optimized to 128 × 128.

## What is left

**Run the manual in-game checks.** Thirteen scenarios are written; four of them
decide:

- **A** — whether the coats appear at all. Ten poodles, `0.8`, four coats.
- **B** — the far end of the sequence. Shih tzu is the last operation of the core file, and it is
  what the port exists for: before it, one renamed breed cost its coats to every breed listed after
  it, in silence.
- **D** — the Endangered half, guarded on a display name carrying an em dash.
- **M** — the five animals Odyssey took over, on both kinds of install. The fourth patch file
  exists so that the answer is the same on either side.

Scenario H gained something to look at on 2026-09-12: the mod list must now warn when Vanilla
Animals Expanded is off, and the warning must name that mod rather than this one.

**ModIcon approved and optimized — 2026-09-12.** The user approved the new mascot
surrounded by VAE animals. `Mod/About/ModIcon.png` is now 128 × 128, indexed PNG
(256 colours), 12,938 bytes instead of 2,025,578 bytes: a 99.36 percent reduction.
The original 1254 × 1254 image is preserved in `Art/ModIcon-source-v2.png`.
Optimized copy: `Art/ModIcon-128.png`; thumbnail QA: `Art/qa/ModIcon-32.png`.
Visually checked at 128 and 32 px: central mascot remains recognizable; individual
animal details naturally merge at 32 px. No redesign or crop was applied.
This replaces the old icon/species defect. Included with its source and thumbnail QA in
the 2026-09-13 icon commit. The unused output/imagegen variant remains local.
**The homonym sweep is done.** The five conditionals of the Odyssey file key on bare defNames —
`Tiger`, `Badger`, `Otter`, `Walrus`, `Muskox` — which another animal mod could declare. The sweep
over the 9,726 Workshop folders and the 240 local ones ran on 2026-09-12: no live conflict. The
record is in `TESTING.md`, with the reason for each of the five mods that carry one of those names.

`licence` vocabulary: `open` an explicit licence, `silent` abandoned source with no licence or permission found,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
`stage` vocabulary: `port`, `showcase`, `preTest`, `done`, `tested`, `published`.
`remaining` vocabulary: `feature` for something missing from a first release, `defect` for a known
fault left unfixed, `unverified` for what could not be checked.
`dependencies` vocabulary: `declared` when every mod this one needs is named in the About's
`modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
the class it injects belongs to a mod that was not declared and not loaded.
