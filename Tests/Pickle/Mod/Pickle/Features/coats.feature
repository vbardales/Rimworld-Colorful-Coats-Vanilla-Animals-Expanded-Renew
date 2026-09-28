# What only a running game shows: an animal really draws a coat. Uses the shared CoatSteps
# companion (PickleTools), staged only by wsl-deps.coats.map, so this feature skips itself in
# every structural pass. AEXP_Poodle exists with and without Odyssey; its four coats sit at a
# 0.8 chance, so 20 animals make a missing pair of coats negligible. The rare 5% coats
# (tiger, jaguar) are not covered: they need 100 large animals to place, see README.
# Steps not played yet: CoatSteps is compiled, not run.
@requires:nelim.pickletools.coatsteps
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: coats are drawn

  Scenario: poodles draw at least two different extra coats
    Given the save "test-colony" is loaded
    When Nelim's Pickle Tools: 20 animals of kind "AEXP_Poodle" are spawned
    Then Nelim's Pickle Tools: among the animals of kind "AEXP_Poodle", at least 2 different extra coats were drawn
    And no errors were logged

  Scenario: a poodle keeps its coat across save and reload
    Given the save "test-colony" is loaded
    When Nelim's Pickle Tools: 20 animals of kind "AEXP_Poodle" are spawned
    And Nelim's Pickle Tools: I note the coats of the animals of kind "AEXP_Poodle"
    And I save and reload
    Then Nelim's Pickle Tools: each animal of kind "AEXP_Poodle" still has the coat noted for it
    And no errors were logged

  @review
  Scenario: poodles with a coat are drawn with that coat's own texture
    Given the save "test-colony" is loaded
    When Nelim's Pickle Tools: 8 adult animals of kind "AEXP_Poodle" are spawned close together
    Then Nelim's Pickle Tools: each animal of kind "AEXP_Poodle" that carries an extra coat is drawn with that coat's own texture
    When Nelim's Pickle Tools: I frame the animals of kind "AEXP_Poodle"
    And I take a screenshot "poodle-coats"
    Then no errors were logged
