# Publication

What the Workshop page asks for and the repository holds nowhere else. Item `3806766686` exists, private, from the `0.1.0` prepublication; the real release is `1.0.0` (first public release, never sent yet), published by the CI (`Rimworld-Release-Admin/docs/OPERATIONS.md`).

## Steam description

```markdown
**UNOFFICIAL.** This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

Coat variations for the pets and wildlife of [Vanilla Animals Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2871933948), so a colony's dogs and cats stop being interchangeable and a jaguar is worth stopping to look at. 35 animals, 74 extra coats.

Texture patch only. No DLC, no Harmony, no assembly, no Def of its own: four XML patches and 222 textures. Safe to add to a save in progress and safe to remove from one. Animals already on the map take their coats when the mod is added and go back to their original one when it is removed; nothing is written into the save.

## WHAT IS COVERED

From Vanilla Animals Expanded: the nine cat breeds and the five dog breeds, plus badger, beaver, black bear, giraffe, hedgehog, hyena, jaguar, kangaroo, koala, megawolverine, muskox, otter, platypus, red panda, tiger and walrus.

From [Vanilla Animals Expanded - Endangered](https://steamcommunity.com/sharedfiles/filedetails/?id=2366589898), if you run it: black-footed ferret, black rhinoceros, moa, pangolin and rockhopper penguin.

Most animals have a 40% to 80% chance of an alternate coat. The two exceptions are deliberate: the jaguar and the tiger have a single alternate each, at 5%. One tiger in twenty.

## IF YOU OWN ODYSSEY

Badger, muskox, otter, walrus and tiger became vanilla animals with that expansion, so Vanilla Animals Expanded stops declaring its own and the coats aimed at them would find nothing. A fourth patch file aims the same ten coats at Ludeon's five animals instead, at the same chances, so all 35 are covered whether you own Odyssey or not. It only fires when those animals exist, so nothing fires twice.

## REPLACES COLORFUL COATS - CATS AND DOGS

purpleyam's separate "Colorful Coats - Cats and Dogs!" is not ported: there is nothing left to port. Its 14 patched animals, its coat chances and its 78 textures are all inside this mod, identical, because Vanilla Animals Expanded absorbed the module it patched. Run this one and you have both. The original of this mod and the Cats and Dogs one are declared incompatible, since running them together would patch the same animals twice. The guard also names the old "Vanilla Animals Expanded - Cats and Dogs" module, so the coats arrive whichever of the two your cats came from, and only once.

The eight old modular Vanilla Animals Expanded mods (Arid Shrubland, Australia, Boreal Forest, Desert, Ice Sheet, Temperate Forest, Tropical Rainforest, Tundra) are still recognised for anyone playing an older version on which they run. They stopped at 1.3, so on the latest RimWorld version those parts never fire.

## CREDIT

I am not the author of this mod. The textures and the whole idea are purpleyam's: [Colorful Coats - Vanilla Animals Expanded!](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130), which stops at an old RimWorld version. All I did was the work needed to run it on the latest one, and mistakes in the port are mine. The colours, the chances and the 222 textures are untouched.

What changed in the port: the 14 cats and dogs now report success whether or not they are found, as the other 21 animals already did, so one renamed breed can no longer cost every breed after it its coats; the five animals Odyssey made vanilla get their coats from the fourth patch file, which reaches ten coats (the tiger's 5% among them) that reached nobody who owns Odyssey; and five large screenshots were removed from the About folder, 4.4 MB of the mod's 11.

No explicit licence, permission or prohibition was found for the original after checking its Steam page, its comments, its author's profile and public repository searches. That does not cover every private or unindexed statement, and it is not permission. If purpleyam would rather this port did not exist, say so and it comes down, no argument, no delay.

## IF I GO QUIET

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

## AI-GENERATED

This mod was made with AI tools, under human direction: Claude Code (Anthropic) for the checks, the test suites, the documentation and the composition of the Preview, and DALL-E (OpenAI) for the illustration behind the Preview. The in-game test runs were played by Pickle. The gallery was shot in Nelim's own set, built with many other mods credited in ATTRIBUTION.md.

## THANKS

[purpleyam](https://steamcommunity.com/sharedfiles/filedetails/?id=2398446130) for the coats and the idea. Oskar Potocki, Sarg Bjornson and Erin for the animals of [Vanilla Animals Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2871933948). For development only, never a dependency of this mod: [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), [RimLogging](https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696), [Harmony](https://steamcommunity.com/sharedfiles/filedetails/?id=2009463077) (which Pickle needs) and [PickleTools](https://steamcommunity.com/sharedfiles/filedetails/?id=3806142401).

Full credits, the gallery set and the licence are in ATTRIBUTION.md and LICENSE, in the source repository below.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew)
```

The block above is the one source of the description: `Mod/About/About.xml` is generated from it (`node .github/scripts/sync-about-description.mjs`). It ends with the `Source code on GitHub` link, which is also the `<url>` field. Not linked on purpose: the gallery set mods (45 of them, credited in `ATTRIBUTION.md`, "Gallery set"): the Steam page has no room for them.

## Dependencies and DLC

- **Required:** Vanilla Animals Expanded (`VanillaExpanded.VanillaAnimalsExpanded`, Workshop 2871933948), declared in `modDependencies`. The patches find no animal without it. Workshop "Required items": `n/a, not released yet` (owner decision 2026-11-10), to set by hand at `writeReleaseDocs` step 12 or at `publish`.
- **Order (`loadAfter`):** Vanilla Animals Expanded, Vanilla Animals Expanded - Endangered (`VanillaExpanded.VAEEndAndExt`, 2366589898, five animals) and the old Cats and Dogs module (`VanillaExpanded.VAECD`).
- **Incompatible:** `purpleyam.colorfulcoats.vaewildlife` and `purpleyam.colorfulcoats.vaecatsdogs`.
- **Optional compat** (`Mod/About/OptionalCompat.xml`, 7 declared, checked by `Check-OptionalCompat.ps1`): the VAE biome packs and the Odyssey kind patch.
- **DLC:** Odyssey is not required; a fourth patch file is keyed on Ludeon's five animals existing.
- Harmony and Vanilla Expansion Framework are Vanilla Animals Expanded's own requirements, not this mod's: it has no assembly and calls no API.

## Adult content boxes

No adult content: textures are animal coats only. **Checked 2026-10-02:** the 74 coats (south views, two contact sheets, all 222 textures share the same art) opened and looked at: cartoon animals only, nothing adult. **Gallery checked 2026-11-22:** the ten gallery images and the Preview opened and looked at: animals and a colonist in a dressed tunic, no nudity, no violence. Answer the Steam box accordingly.

## Gallery order

`0-preview.png` is a byte-for-byte copy of `Mod/About/Preview.png` (checked 2026-11-22). The ten others tell one story, played in the Sanctuary set (`Tests/Pickle/Mod/Pickle/Features/gallery.feature` for shot 1, `gallery-decor.feature` for shots 2 to 10, pass map `wsl-deps.gallery-decor.map`): day 1, "the coats afternoon" (16h to 19h), then day 2, "the morning after" (8h to 17h). Clean originals are in `Art/Gallery-clean/`, subtitled copies in `Art/Gallery/`. The gallery was validated as a whole by the owner on 2026-11-22 (`gallery_validated_sha`).

| # | File | Hour | Shot | What it shows |
| --- | --- | --- | --- | --- |
| 0 | `0-preview.png` | | Preview | The banner |
| 1 | `1-kangaroos.jpg` | 16h | Kangaroos | Three kangaroos, three coats |
| 2 | `2-poodles-tea-room.jpg` | 17h | Poodles | Four poodles, four coats, Nelim with a pile of kibble |
| 3 | `3-red-pandas-cloister.jpg` | 18h | Red pandas | Three red pandas, one coat each |
| 4 | `4-bengal-cats-ritual-hall.jpg` | 19h | Bengal cats | Bengal cats, one asleep, Nelim with milk |
| 5 | `5-giants-plaza.jpg` | 8h | Giants | Two giraffes, black rhino, muskox, moa |
| 6 | `6-hunters-bridge.jpg` | 9h | Hunters | Tigers, jaguar, hyena, mega wolverine, black bear |
| 7 | `7-waterside-pond.jpg` | 10h | Waterside | Otters, beaver, platypus, rockhopper, walrus |
| 8 | `8-barn-yard.jpg` | 11h | Barn yard | Badgers, hedgehog, pangolin, ferret, koala |
| 9 | `9-dogs-terrace.jpg` | 12h | Dogs | Chihuahuas, great dane, rottweiler, shih tzu |
| 10 | `10-cats-tea-room.jpg` | 17h | Cats | Nine cats round one cup of milk |

Every animal of the mod is in a shot (35 of 35 kinds). Kept flags, not defects: Nelim's smile unverifiable on shots 4 and 10 (face half hidden by the carried item), burrow hole at the top edge and grey murk on 7, grey murk on 6, chihuahuas small on 9.

## Gallery subtitles

Written 2026-11-17, indexes are the shot numbers (no gap), clean originals in `Art/Gallery-clean/`, burned copies in `Art/Gallery/` with `Add-Subtitle.ps1`.

| index | file | line |
|---|---|---|
| 1 | 1-kangaroos | Three kangaroos, three coats, one sunny garden. |
| 2 | 2-poodles-tea-room | Tea time: four poodles, four coats. |
| 3 | 3-red-pandas-cloister | Three red pandas pad along the cloister, one coat each. |
| 4 | 4-bengal-cats-ritual-hall | Bengal cats settle in for the night. |
| 5 | 5-giants-plaza | Morning on the plaza: giants in new coats. |
| 6 | 6-hunters-bridge | The hunters cross the bridge in file. |
| 7 | 7-waterside-pond | The waterside folk queue on the bank. |
| 8 | 8-barn-yard | Small visitors crowd around the kibble. |
| 9 | 9-dogs-terrace | Noon on the terrace: the dogs came for the kibble too. |
| 10 | 10-cats-tea-room | Nine cats gather round one cup of milk. |

## Steam change notes

The note is written at the moment of upload. First line is `[b]<version>[/b]` with the exact version, or the CI fails (AUDIT.md 11.i). Nothing sent yet.

### 1.0.0

```
[b]1.0.0[/b]
[list]
[*] First release of this port of purpleyam's Colorful Coats - Vanilla Animals Expanded! for the latest RimWorld version: 74 extra coats for 35 animals of Vanilla Animals Expanded, 222 textures, colours and chances untouched.
[*] Odyssey owners get the coats of badger, muskox, otter, walrus and tiger too, through a fourth patch file aimed at Ludeon's own animals.
[*] The 14 cats and dogs now report success whether or not they are found, so one renamed breed can no longer cost the breeds after it their coats.
[*] Texture patch only: no assembly, no Def, safe to add to or remove from a save in progress.
[/list]
[url=https://github.com/vbardales/Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew/blob/main/CHANGELOG.md]Full changelog on GitHub[/url]
```

## After the send

Commit nothing by hand for the tag or release: the CI creates them after a successful upload. `Mod/About/PublishedFileId.txt` is already committed. Steam creates every item private; the owner switches it public herself.

## Thank-you messages

**Open, not drafted yet** (`WORKSHOP_COMMENTS.md`, "Writing a comment"; posted after the item is public; under 1000 characters, BBCode links, owner's voice). Recipients: purpleyam, author of the original (2398446130, not in the register yet, the original is apparently abandoned so this is not a request for permission); the authors of Vanilla Animals Expanded (2871933948, already `posted` 2026-11-18 by another mod: this mod only joins `Covers`); and the gallery set mods of `ATTRIBUTION.md` that the register does not hold yet. Check the register first, so no one is thanked twice.
