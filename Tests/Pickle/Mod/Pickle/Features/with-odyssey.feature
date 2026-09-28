# The same five animals, on the side Vanilla Animals Expanded's LoadFolders picks when Odyssey
# is active: it stops defining AEXP_Badger and its four fellows, and ColorfulCoats_VAEodyssey.xml
# hands the same coats to Ludeon's own Badger, Muskox, Otter, Tiger and Walrus instead. Tagged
# to self-select: Pickle skips this feature entirely in any pass that does not have Odyssey, so
# it can stay in the suite's default run rather than needing its own -Filter every time.
@requires:Ludeon.RimWorld.Odyssey
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: the five Odyssey animals, DLC present

  Scenario: with Odyssey, the bare defs are patched, the AEXP_ names no longer exist
    Then def "Badger" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "Muskox" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "Otter" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "Tiger" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "Walrus" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And no def "AEXP_Badger" exists
    And no def "AEXP_Muskox" exists
    And no def "AEXP_Otter" exists
    And no def "AEXP_Tiger" exists
    And no def "AEXP_Walrus" exists
    Then no errors were logged
