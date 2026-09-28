# Publication notes

What the Workshop page asks for and the repository holds nowhere else. Draft of 2026-09-28,
written before the mod is `tested`; every line marked **open** waits for a result or for the
owner. Item `3806766686` exists, private, from the `0.1.0` prepublication; the real release is
`1.0.0`, published by the CI (`Rimworld-Release-Admin/docs/OPERATIONS.md`).

## Dependencies and DLC

- **Required:** Vanilla Animals Expanded (`VanillaExpanded.VanillaAnimalsExpanded`, Workshop
  2871933948), declared in `modDependencies`. The patches find no animal without it.
- **Optional, not declared:** Vanilla Animals Expanded - Endangered (`VanillaExpanded.VAEEndAndExt`,
  2366589898): five animals. Only `loadAfter`. The mod is complete without it.
- **Optional DLC:** Odyssey. With it, five animals move to Ludeon's own defs and
  `ColorfulCoats_VAEodyssey.xml` reaches them. No declaration: the patch checks the def exists.
- Harmony and Vanilla Expansion Framework are Vanilla Animals Expanded's own requirements, not
  this mod's: it has no assembly and calls no API.
- **Checked in sources on 2026-09-28** against the installed About.xml and LoadFolders.xml of
  both packs. Recheck if either changes its `packageId` or display name (the guards compare the
  display name).

## Adult content boxes

No adult content: textures are animal coats only. **Open:** open every image before answering,
a file name does not say what it contains.

## Gallery order

Steam shows the first image large. **Open:** the captures come from `coats.feature`
(`@review`, poodles drawn with their coat), not yet run. Plan: 1. poodles with different coats,
close up; 2. a second species, for range; 3. the rare coat if a capture of it exists. Each image
is opened and looked at before it is chosen; a green scenario does not prove its image shows a coat.

## Thank-you messages

**Open, needs the owner's voice** (`WORKSHOP_COMMENTS.md`, "Writing a comment"; posted after the
item is public; under 1000 characters, BBCode links). Recipients to consider:
- purpleyam, author of the original Colorful Coats - Vanilla Animals Expanded! (the coats).
- The authors of Vanilla Animals Expanded, whose art the coats recolour: Oskar Potocki, Erin,
  Sarg Bjornson (named on the original's page).
Check the register in `WORKSHOP_COMMENTS.md` first, so no one is thanked twice. The original is
apparently abandoned, so this message is not a request for permission.

## Steam release note for 1.0.0

Draft, plain text; replaced by the final `### 1.0.0` block at send time:

> First release of the 1.6 port. 74 extra coats for 35 animals of Vanilla Animals Expanded,
> including the five that Odyssey took over, plus the Endangered animals if that pack is on.
> Texture patch only: no assembly, no defs, safe to add to or remove from a save.

## After the send

Commit nothing by hand for the tag or release: the CI creates them after a successful upload.
`Mod/About/PublishedFileId.txt` is already committed. Steam creates every item private; the owner
switches it public herself.
