# The rare 5% coat of AEXP_Tiger, the tiger Odyssey replaces (so Odyssey must be absent).
# 2026-10-02: no longer loads the "test-colony" fixture. That save was made with the five DLC and does not
# play in a pass without Odyssey: the kept 2026-10-01 report fails at `the save "test-colony" is loaded`
# (912 reference errors on Odyssey defs, then the 175s WaitUntil). The earlier explanation (100 or 50 large
# animals cannot be placed) was never confirmed; docs/runs/2026-09-28.md. The scene is now a new colony
# (PickleTools/NewColony): own ticket, `-Extra "-pickle-scenario-timeout=400"`, once, initial or final pass.
# Map size 150 for room; 100 tigers again, since placement is no longer the suspect: 0.95^100 is under 1%
# odds of a false red. CoatSteps and NewColony are compiled, not played together.
# Not tagged to self-select (no negated @requires:): select it by name in wsl-deps.coats-no-odyssey.map.
@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.newcolony
@timeout:300
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: the rare tiger coat, Odyssey absent

  Scenario: among 100 AEXP tigers at least one carries the rare coat
    Given mod "Ludeon.RimWorld.Odyssey" is not loaded
    And the main menu is open
    And Nelim's Pickle Tools: the new colony's seed is "colorfulcoats-vae"
    And Nelim's Pickle Tools: the new colony's map size is 150
    When Nelim's Pickle Tools: a new colony is started
    And Nelim's Pickle Tools: 100 animals of kind "AEXP_Tiger" are spawned
    Then Nelim's Pickle Tools: among the animals of kind "AEXP_Tiger", at least 1 carry an extra coat
    And no errors were logged
