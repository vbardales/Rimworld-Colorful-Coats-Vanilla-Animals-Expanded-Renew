# The five animals Odyssey takes over, on the side Vanilla Animals Expanded's own LoadFolders
# picks when Odyssey is absent: AEXP_* still exists and still gets patched, and the bare
# Ludeon name does not exist at all to be confused with it. Select this file explicitly for a
# pass staged without Odyssey (Tests/Pickle/wsl-deps.no-odyssey.map): its assertions are false
# by design in a pass that has the DLC, so it is not tagged to self-select - see
# Tests/Pickle/README.md.
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: the five Odyssey animals, DLC absent

  Scenario: without Odyssey, the AEXP_ defs exist and are patched, the bare names do not exist
    Given mod "Ludeon.RimWorld.Odyssey" is not loaded
    Then def "AEXP_Badger" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Muskox" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Otter" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Tiger" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Walrus" was patched by mod "nelim.colorfulcoats.vae"
    And no def "Badger" exists
    And no def "Muskox" exists
    And no def "Otter" exists
    And no def "Tiger" exists
    And no def "Walrus" exists
    Then no errors were logged
