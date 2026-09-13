---
settings_audit: not_applicable
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
mod:          Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)
packageId:    nelim.colorfulcoats.vaerenew
repo:         Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew
visibility:   public
detached:     yes
stage:        done
stage_workflow: done
licence:      silent
port_licence: MIT (port additions only)
licence_at:   Steam description, public profile, local original files, GitHub repository search
dependencies: declared
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: execute applicable TESTING.md scenarios A-H and K-M in game, including logs, English/French mod-list UI, new game and existing save; I-J are conditional on revived legacy modules
session:      local_bd47cda2-a14e-4c5c-83b4-d538829c4475
updated:      2026-09-13, audit reservations corrected and offline checks rerun
---

# Colorful Coats - Vanilla Animals Expanded! Renew — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it. Dropped here by the sweep of 2026-09-12 and
held since by this mod's thread, which updates it in the commit that changes what it describes.

## Audit follow-up corrections — 2026-09-13

At the user's request, corrected the documentary reservations and the description
gate found in the ordered audit below. This section supersedes that audit's open
documentary findings and stage decision, while preserving its historical evidence.

**Decision: showcase (Preview generated) -> done.** The required final labelled
Steam-format GitHub link now closes Mod/About/About.xml's English description.
The earlier independent settings, localization, dependency, image and test-scenario
validations remain applicable: no patches, textures, images or UI were changed.
`done` maps directly to the requested workflow: ready for final in-game validation,
not a claim of completed game tests. `tested_on` remains empty.

- README.md and About.xml now explicitly say that offline checks passed and final
  in-game validation of this delivery remains unverified. The unsupported wording
  claiming in-game testing has been removed, without asserting that historical
  tests never occurred.
- README.md, About.xml and both LICENSE copies now qualify the upstream licence
  investigation by its date and examined sources, consistent with ATTRIBUTION.md.
  They distinguish the workspace policy from permission. The MIT grant and its
  exclusion of inherited assets are unchanged. Removed the unsupported categorical
  README assertion that the original item was not withdrawn.
- Removed the obsolete, ignored PROMPT_COLORFULCOATSVAE.md as required by the
  publishing cleanup rule. Art sources and historical audit/test records remain.
- Executed Check-Xml.ps1: PASS for all five shipped XML files, metadata and matching
  licence copies. Executed Check-Coats.ps1: all checks passed, no installed-target
  checks skipped (35 animals, 74 coats, 222 textures, 40 target defNames).
- Explicitly asserted the description ends with the exact labelled GitHub link
  and that the obsolete prompt no longer exists: PASS. `git diff --check`: PASS.

Validated working tree: base revision
`b923e6f1cbea438561654aa478035d0ff5d2715e` plus this follow-up's README.md, LICENSE,
Mod/LICENSE and Mod/About/About.xml edits; STATUS.md already had local audit edits,
which were preserved and extended. No commit or publication performed.
All documentary reservations from this audit are resolved. Only the in-game
execution listed in `remaining` is still unverified; no runtime success is invented.

## Ordered workflow audit — 2026-09-13

This section and the front matter supersede the historical stage conclusions below;
historical results and the pre-existing uncommitted translation audit are preserved.
Audit time: approximately 01:48 CEST (Europe/Paris).
Revision: `b923e6f1cbea438561654aa478035d0ff5d2715e`.
At entry, `git status --short` showed only ` M STATUS.md` (translation fields and
translation audit added locally). No delivered files differed from HEAD. This audit
changes only STATUS.md; no implementation, artwork, publication or commit was performed.

References read: `../AGENTS.md`, `../PUBLISHING.md`, `../STYLE_RIMWORLD.md`,
`../MOD_SETTINGS.md`, `../TRANSLATIONS.md`, and the user's ordered audit workflow.
The user's clarifications take precedence, particularly source-based validation of
the no-settings case and keeping in-game checks at the final transition.

**Decision: done -> showcase.** In this project's existing stage vocabulary,
`showcase` here maps precisely to **Preview generated / Preview générée**;
`stage_workflow: preview_generated` removes the ambiguity. The next transition is
Preview generated -> preOptions. `done` in the requested workflow means all earlier
gates plus written/passing offline tests, ready for final in-game validation;
`tested` additionally requires actual successful in-game execution.

| Transition | Result in this audit | Evidence / limitation |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Own `.git`, repository root confirmed, no superproject; GitHub PUBLIC repository exists and remote HEAD equals audited HEAD. English README, CHANGELOG, ATTRIBUTION and scoped LICENSE present. |
| horsMonoRepo -> ModIcon generated | Validated; build not applicable | Data-only implementation: four patches and 222 coat textures, no source assembly/project or DLL. Offline checks pass. Installed icon is PNG, 128 x 128, 12,938 bytes. |
| ModIcon generated -> Preview generated | Validated | Direct image inspection; PNG, 896 x 504, 551,050 bytes, below 1 MB. |
| Preview generated -> preOptions | Observed defect in description convention | Description is English, naming and visual palette pass, but its GitHub URL is bare and is not the final labelled link explicitly required by PUBLISHING.md. |
| preOptions -> options | Independently validated; settings not applicable | Settings audit below; no useful settings contract, empty page or shortcut. No game verification is claimed. |
| options -> l10n | Independently validated; owned localization not applicable | All 56 patch payloads inventoried again after settings review; no owned in-game text, keys, parameters or DefInjected fields. |
| l10n -> preTest | Independently validated | Installed dependency metadata, exact guard names, target defs and conditional load folders checked; details below. |
| preTest -> done | Offline criteria independently validated | Both existing test scripts executed successfully on the shipped revision; functional scenarios are written in TESTING.md. This does not override the earlier description gate. |
| done -> tested | Not verified | No game scenarios or game logs checked in this audit; no successful run tied to this delivery established. |

### Repository, packaging and rights evidence

- Repository: `C:\Users\nelim\Documents\rimworld\ColorfulCoatsVAERenew`.
  Delivered root: its `Mod/` folder. The installed
  `RimWorld/Mods/ColorfulCoatsVAERenew` junction targets that exact folder.
- `git rev-parse --show-toplevel --show-superproject-working-tree`, `git remote -v`,
  `git log -1 --format=fuller`, `git diff -- STATUS.md` and `git status --short` read.
- `git ls-remote origin HEAD` returned the full audited revision;
  `gh repo view vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew
  --json name,visibility,url,defaultBranchRef` returned PUBLIC and main.
  Initial sandbox network/config access failed; the read-only retry outside the
  sandbox succeeded. No GitHub access criterion remains unverified.
- `nelim.colorfulcoats.vaerenew`, the About name, repository and directory identify
  the same continuation. About.xml uses native `name`; no invented `packageName`
  element or literal equality between all identifiers is required.
- Retain public / silent / unofficial under the documented workspace policy and
  the dated upstream investigation in ATTRIBUTION.md. That investigation remains
  historical evidence, not a newly repeated Steam search or an upstream permission.
  The MIT scope excludes inherited coats/textures. This audit certifies consistency
  of the recorded decision, not an additional legal grant.
- SHA-256 equality verified for LICENSE / Mod/LICENSE and ATTRIBUTION.md /
  Mod/ATTRIBUTION.md. Mod contains exactly 5 XML, 224 PNG, LICENSE and ATTRIBUTION.md;
  no build outputs, source code, version folders, Languages or LoadFolders.xml.

### Settings audit

`settings_audit: not_applicable`, justified after inspecting all patch payloads and
the delivered inventory. The sole behavior is an authored set of alternate coats
and per-species probabilities, applied to PawnKindDefs at load time. These are
content/balance values, not a promised player configuration mechanism or settings
currently requiring XML edits. No concrete missing player setting was identified.
The port intentionally preserves these probabilities, including the 5% rarities.
Optional animal-pack presence is handled by patch guards; it is not a settings UI.

All payload fields are `alternateGraphicChance`, `alternateGraphics`, `li`, `texPath`.
There are no other owned Defs, assemblies, ModSettings implementation, UI resources,
MainButtonDef or shortcut registration. Therefore neither an empty mod-options page
nor a settings shortcut can be supplied by this package. Adding one is unwarranted.
Input limits, defaults/reset, settings persistence, shared access routes and RIMMSQOL
tests are not applicable. No customization integration was tested or claimed.
The animal coat persistence tests F/G remain applicable to game behavior, separately.

### Localization and dependencies

- Reparsed all four XML patch files with PowerShell XML DOM. `//value` counts:
  core 30, extras 5, Odyssey 5, various 16. Enumerated `//value//*` and
  `//*[not(*)]`; remaining leaves are selectors, success flags and guard names.
  No player-facing strings, dynamic keys, text parameters or translated fields.
  Animal text remains owned by the game/dependencies; About metadata is excluded
  by TRANSLATIONS.md. EN/FR resources and Check-DefInjected are not applicable.
- Read installed VAE (Workshop 2871933948) and Endangered (2366589898) About.xml
  and LoadFolders.xml. Both support 1.6. Exact case-sensitive guard/display-name
  comparisons passed, including Endangered's em dash. VAE is the required pack;
  Endangered and Odyssey remain optional. VAE's Harmony/VEF requirements are
  declared by VAE itself; this texture-only mod has no direct API dependency on them.
- About.xml orders this mod after VAE, Endangered and the legacy Cats and Dogs
  module. Installed VAE selects 1.6NotOdyssey only without Odyssey. The five
  bare-name Odyssey conditionals match the installed targets and copy the same
  chances/coats. Endangered's extra conditional NotOdyssey folder was inspected
  in its load map; the five owned targets are found in its normal 1.6 Defs.
- Legacy various branches preserve the same 16 animals/coats/chances. The earlier
  legacy-module and corpus homonym investigations are retained as historical;
  they were not a newly executed corpus sweep or engine integration test here.

### Executed tests and visual review

- `& .\_tools\Check-Coats.ps1`: PASS, no installed-target checks skipped.
  35 animals, 74 coats, all 222 directional textures present and referenced;
  51 sequence operations protected; 5 conditional operations;
  30 VAE + 5 Endangered + 5 Odyssey target defNames found, no existing
  alternateGraphics on those target definitions. Legacy and Odyssey parity pass.
- `& .\_tools\Check-Xml.ps1`: PASS for all 5 delivered XML files, patch classes,
  XPath syntax, chance range [0,1], nonempty coats/paths, metadata and licence copies.
  Read both scripts: these are offline data/contract checks, not RimWorld engine runs.
  In particular, its GitHub-link assertion checks URL presence, not the newer
  mandatory footer format; its PASS does not refute the description defect.
- Read TESTING.md A-M: actions and expected results cover coat appearance,
  probabilities, rotations, reload, existing-save add/remove, dependencies,
  incompatible originals, mod-list artwork and Odyssey variants, with relevant
  dev-mode/load-order prerequisites. I/J are conditional future integration
  scenarios for legacy modules; do not report them as tests passed on 1.6.
- Opened the actual Mod/About/Preview.png and ModIcon.png, plus existing QA
  thumbnails at 268 px and 32 px. Read dimensions/format through System.Drawing.
  Title and version remain identifiable, no clipped text/overlap; cool blue
  secondary ink is distinct from amber accent. Renew is reduced and secondary,
  unofficial is on its own line. No reducible liaison word occurs in the title.
  No concrete camera defect found; a separately documented screenshot comparison
  is not a mandatory additional proof. Icon mascot remains recognizable at 32 px.
- Read Art/preview.html, preview-palette.json and qa/preview-checks.json.
  HTML loads the palette and derives the version from About.xml. Recorded font/
  contrast measurements are historical and were not rerendered in this audit;
  the directly inspected final image is unchanged in Git.

### Required next action and later verification

For Preview generated -> preOptions, change the final paragraph of the shipped
About.xml description to the explicit link required by PUBLISHING.md:
`[url=https://github.com/vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew]Source code on GitHub[/url]`.
Then recheck the description/footer and XML. No new image, feature, settings UI,
translation file or game run is needed to correct that specific gate. The other
independent validations above remain valid unless their relevant inputs change.

For final tested status, execute and record applicable scenarios A-H and K-M on
RimWorld 1.6, including a new game, an existing save, persistence, optional packs,
logs and mod-list presentation in English and French. There is no owned translated
UI or settings shortcut to exercise. No controllable native game session was
available through this audit's tools; the installed data enabled offline checks only.
Do not treat missing execution as an observed runtime failure.

Separate documentary reservations, not extra blockers for the next transition:
About.xml and README say "under human direction and in-game testing", while no
matching test results are established. Supply the actual dated evidence or qualify
that claim; this audit cannot assert that no historical test ever happened.
The ignored PROMPT_COLORFULCOATSVAE.md also remains after artwork completion despite
PUBLISHING.md's cleanup instruction; it is outside the delivered folder and was
preserved under this audit's non-development/preservation scope. Several older
source/licence statements in README/LICENSE are categorical compared with the
qualified ATTRIBUTION investigation; aligning that wording is recommended without
inventing permissions. No visual correction or regeneration is requested.

## Translation audit — 2026-09-13

Applied the mandatory gate in `../PUBLISHING.md` and `../TRANSLATIONS.md` to
revision `b923e6f1cbea438561654aa478035d0ff5d2715e`; published files are unchanged
by this audit. All three fields are `not_applicable`: this mod adds or changes
no in-game text. This conclusion follows the patch payload inventory, not merely
the absence of a Languages folder.

- Scope: all of `Mod/`, including core, optional Endangered, conditional Odyssey
  and the eight legacy module integrations. The published inventory contains five
  XML files, 224 PNGs, LICENSE and ATTRIBUTION.md. There are no Defs, assemblies,
  C# sources, language resources, version folders or LoadFolders.xml.
- Parsed every `//value` and enumerated `//value//*` in the four patch files using
  PowerShell's XML DOM: core has 30 payloads, extras 5, Odyssey 5 and various 16.
  All 56 payloads contain only `alternateGraphicChance`, `alternateGraphics`,
  `li` and `texPath`. They inject probabilities and texture paths, with no labels,
  descriptions, custom text fields, grammar or generated strings.
- Also enumerated `//*[not(*)]`: remaining leaves are XPath selectors, success
  flags and mod display names used by FindMod guards. These are lookup data,
  not text to translate. Translating guard names would break matching.
- Animal names and descriptions remain supplied by RimWorld and the originating
  animal mods; this mod neither overrides those fields nor calls dependency
  translation keys. There are no owned Keyed keys, DefInjected paths or text
  parameters requiring English/French resources. Check-DefInjected is therefore
  not applicable, and no empty language folders were added.
- About.xml metadata, licences and repository documentation are excluded by the
  protocol and remain in English. Preview and icon are publication artwork.
- Validation: `Get-ChildItem Mod -Recurse -File` for the content inventory,
  XML DOM enumeration above for every conditional branch, and
  `./_tools/Check-Xml.ps1` passed for all five shipped XML files.
- No in-game translation checks apply to this inventory. No game session was
  run; the existing functional checks A, B, D and M remain unverified in
  `remaining`, and `tested_on` stays empty. The historical `stage: done` is retained.

Repeat this audit after changes to patches, Defs, UI code or language resources;
reset affected translation fields to `unchecked` until revalidated. Any future
owned text needs English/French coverage before `preTest` and separate runtime
checks tracked in `remaining` until exercised in both languages.

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
