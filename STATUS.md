---
mod:          Colorful Coats - Vanilla Animals Expanded! Renew
packageId:    nelim.colorfulcoats.vaerenew
repo:         Rimworld-Colorful-Coats-Vanilla-Animals-Expanded-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   four places, the About and the Steam page among them
dependencies: to check
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: never seen running; scenarios A, B, D and M of TESTING.md are the ones that decide
  - defect: the icon shipped is not the one the repository wanted — it rings the mascot with eight animals, seven of which this mod does not touch
session:      local_bd47cda2-a14e-4c5c-83b4-d538829c4475
updated:      2026-09-12, held by the mod's own thread
---

# Colorful Coats - Vanilla Animals Expanded! Renew — status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it. Dropped here by the sweep of 2026-09-12 and
held since by this mod's thread, which updates it in the commit that changes what it describes.

## What the fields say

`stage: done` in the repository's sense: the port work is finished. Four patch files, 222 textures,
74 coats over 35 animals, no assembly and no def of its own. Everything that can be settled without
the game has been settled and passes — `_tools/Check-Coats.ps1` for the textures, the 40 defNames
and the 51 sequenced operations, and the monorepo's four shared checkers, all re-run on 2026-09-12.
`done` does not mean tested, which is what `tested_on` is for.

`tested_on` empty: the mod has never run. There is no halfway answer here, because both of this
mod's mechanisms swallow their own failures — a `PatchOperationFindMod` that does not match its
display name logs nothing, and `<success>Always</success>` does the same for an operation that finds
no animal. **A clean log is therefore not a pass**, and only animals on screen settle it.
`TESTING.md` is written around that.

`workshop` empty: there is no `Mod/About/PublishedFileId.txt`, so nothing has gone to the Workshop.
The repository itself is public, and detached from the monorepo since 2026-09-11.

`licence: silent` — purpleyam declared none, checked at the four places one could be: a `LICENSE`
file, `About.xml`, a linked repository, and the body of the Steam description. The source is dead
at 1.4 and its page is still online. Republished under the usual convention for abandoned mods:
credit, a link to the original, removal on request. `ATTRIBUTION.md` records what was taken, and
`LICENSE` what the MIT grant does and does not cover.

`showcase: complete` — `About/Preview.png` and `About/ModIcon.png` both exist. The banner follows
its own brief and sits under Steam's hard 1 MB ceiling. The icon is the `defect` above.

## What is left

**Start the game**, and that cannot be done from here. Thirteen scenarios are written; four of them
decide:

- **A** — whether the coats appear at all. Ten poodles, `0.8`, four coats.
- **B** — the far end of the sequence. Shih tzu is the last operation of the core file, and it is
  what the port exists for: before it, one renamed breed cost its coats to every breed listed after
  it, in silence.
- **D** — the Endangered half, guarded on a display name carrying an em dash.
- **M** — the five animals Odyssey took over, on both kinds of install. The fourth patch file
  exists so that the answer is the same on either side.

**The icon is to be redone**, and the prompt that would redo it is unspent. That is the only thing
still holding `PROMPT_COLORFULCOATSVAE.md`, which git ignores and which goes away the day the icon
exists. The fault is known and described in scenario L of `TESTING.md`, and it blocks nothing: the
icon reads at 32 px, it simply points at species this mod does not touch.

**The homonym sweep is done.** The five conditionals of the Odyssey file key on bare defNames —
`Tiger`, `Badger`, `Otter`, `Walrus`, `Muskox` — which another animal mod could declare. The sweep
over the 9,726 Workshop folders and the 240 local ones ran on 2026-09-12: no live conflict. The
record is in `TESTING.md`, with the reason for each of the five mods that carry one of those names.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
`stage` vocabulary: `port`, `showcase`, `preTest`, `done`, `tested`, `published`.
`remaining` vocabulary: `feature` for something missing from a first release, `defect` for a known
fault left unfixed, `unverified` for what could not be checked.

- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
