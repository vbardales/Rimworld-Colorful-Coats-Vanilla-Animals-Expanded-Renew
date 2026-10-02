@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.screenshotmode
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: Workshop gallery captures

  # Captures for the Workshop page, not assertions: a person opens each image (AUDIT.md, "Captures destinees a la
  # publication"). Image 0 is Preview.png (PUBLICATION.md); these are images 1-4. Developer mode is turned off so
  # the toolbar stays out of the shot, animals are packed close together and framed. Play them in the gallery pass
  # only (-DepMap wsl-deps.gallery.map -Filter '@gallery'), Odyssey absent, no other coat mod.
  #
  # Three animals each: only 3 poodles fit within 4 cells of the map centre in test-colony (run bccc). There is no
  # "different coats" assertion on purpose: three animals at 0.6-0.8 can all draw the same coat, which would fail a
  # capture for luck; the reviewer checks the image shows at least two coats and replays otherwise. The kinds are
  # chosen for range: a dog, a marsupial, a red panda (the strongest colour contrast), a cat.
  # Not played yet: CoatSteps and ScreenshotMode are compiled, not run.

  Background:
    Given the save "test-colony" is loaded

  # Image 1: the headline. Poodles: four extra coats at 0.8, the most generous kind of the pets.
  @review @gallery
  Scenario: three poodles, three coats
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_Poodle" are spawned close together
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_Poodle"
    And I take a screenshot "gallery-1-poodles"

  # Image 2: wildlife, not only pets. Kangaroos: three extra coats at 0.7.
  @review @gallery
  Scenario: three kangaroos in different coats
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_Kangaroo" are spawned close together
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_Kangaroo"
    And I take a screenshot "gallery-2-kangaroos"

  # Image 3: a small wild animal with strongly contrasting coats.
  @review @gallery
  Scenario: three red pandas
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_RedPanda" are spawned close together
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_RedPanda"
    And I take a screenshot "gallery-3-red-pandas"

  # Image 4: the cats, the other half of what colonists keep.
  @review @gallery
  Scenario: three Bengal cats
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_CatBengal" are spawned close together
    When Nelim's Pickle Tools: developer mode is turned off for the capture
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_CatBengal"
    And I take a screenshot "gallery-4-bengal-cats"
