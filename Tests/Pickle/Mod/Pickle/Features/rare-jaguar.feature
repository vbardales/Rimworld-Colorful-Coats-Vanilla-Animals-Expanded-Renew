# The 5% coats: one alternate at chance 0.05, so 100 animals leave under 1% odds of none (0.95^100).
# Needs 100 large animals placed in a clear area; the spawn step fails saying which one could not
# be placed, never a short count. A red for that reason is a placement failure, not a missing coat.
# CoatSteps is compiled, not played.
@requires:nelim.pickletools.coatsteps
@timeout:60
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: the rare jaguar coat

  Scenario: among 100 jaguars at least one carries the rare coat
    Given the save "test-colony" is loaded
    When Nelim's Pickle Tools: 100 animals of kind "AEXP_Jaguar" are spawned
    Then Nelim's Pickle Tools: among the animals of kind "AEXP_Jaguar", at least 1 carry an extra coat
    And no errors were logged
