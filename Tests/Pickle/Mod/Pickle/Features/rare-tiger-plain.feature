# 100 timed out twice, identically ("PickleDriver.WaitUntil timed out after 175s", ~177s both
# times, docs/runs/2026-09-28.md): AEXP_Tiger's drawSize is 1.3, the largest of the five
# Odyssey-contested animals, and 100 of it apparently cannot be placed/scanned in time near
# test-colony's map centre - the same 100-count spawn of a jaguar and of Odyssey's own smaller
# Tiger (drawSize 1.05) passed clean the same day. Neither CoatSteps' nor PickleDriver.WaitUntil's
# source has been read here to confirm the mechanism (relayed from colorfulcoats.megafauna,
# 2026-09-30, itself without a source read - flag to Dodos when reachable).
# Halved to 50 per that session's suggestion: weaker guarantee than the other two rare-coat
# passes (0.95^50 ≈ 7.7% odds of a false red, against under 1% at 100) but the pass actually
# completes. Needs 50 large animals placed in a clear area; the spawn step fails saying which one
# could not be placed, never a short count. CoatSteps is compiled, not played.
# Without Odyssey the tiger is AEXP_Tiger. Not tagged to self-select (no negated @requires:):
# select it by name in the pass that leaves Odyssey out, wsl-deps.coats-no-odyssey.map.
@requires:nelim.pickletools.coatsteps
@timeout:60
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: the rare tiger coat, Odyssey absent

  Scenario: among 50 AEXP tigers at least one carries the rare coat
    Given mod "Ludeon.RimWorld.Odyssey" is not loaded
    And the save "test-colony" is loaded
    When Nelim's Pickle Tools: 50 animals of kind "AEXP_Tiger" are spawned
    Then Nelim's Pickle Tools: among the animals of kind "AEXP_Tiger", at least 1 carry an extra coat
    And no errors were logged
