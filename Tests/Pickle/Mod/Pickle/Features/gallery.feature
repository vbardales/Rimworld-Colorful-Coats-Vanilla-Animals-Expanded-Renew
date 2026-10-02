@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: Workshop gallery captures

  # Staged photographs, not assertions (owner's rule 2026-10-02; AUDIT.md, "Captures destinees a la publication"): a
  # person opens each image. Story: a slow afternoon in the flower glade of the zen meadow studio; the colony's
  # animals have wandered out together and, for once, no two look alike. One shared set for all four images (the
  # glade, camera "flowers" around 154,98, hour 16, clear weather), animals set, photographed, then removed by the
  # CoatSteps AfterScenario. Coats are chosen, never drawn: "the animal coat-N is given coat K" (K index into the
  # kind's alternateGraphics, -1 the original), so every image shows distinct coats by construction. Subjects: kinds
  # with 2 to 4 extra coats (counted in ColorfulCoats_VAEcore.xml): poodle 4, kangaroo 3, red panda 3, Bengal cat 2.
  # Play in the gallery pass only (wsl-deps.gallery.map, -Filter gallery), Odyssey present, no other coat mod.
  # Not played yet: the spawn-around, coat and camera steps are compiled, not run (PickleTools/docs/STAGING.md).

  Background:
    Given the save "nelim-zen-meadow-studio" is loaded
    And game speed is paused
    And I set the hour to 16
    And I set the weather to "Clear"

  # Image 1: the headline. Poodles, the most generous kind, three different coats and the original in one frame.
  @review @gallery
  Scenario: poodles in the glade, each in its own coat
    Given Nelim's Pickle Tools: 4 adult animals of kind "AEXP_Poodle" are spawned around (154, 98)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-4" is given coat 2
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_Poodle"
    And I take a screenshot "gallery-1-poodles"

  # Image 2: wildlife, not only pets. Kangaroos, the three coats side by side.
  @review @gallery
  Scenario: kangaroos in the glade, each in its own coat
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_Kangaroo" are spawned around (154, 98)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 2
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_Kangaroo"
    And I take a screenshot "gallery-2-kangaroos"

  # Image 3: red pandas, the strongest colour contrast, against the flowers.
  @review @gallery
  Scenario: red pandas in the glade, each in its own coat
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_RedPanda" are spawned around (154, 98)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 2
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_RedPanda"
    And I take a screenshot "gallery-3-red-pandas"

  # Image 4: the cats, the other half of what a colony keeps: the original and both coats.
  @review @gallery
  Scenario: Bengal cats in the glade, the original and both coats
    Given Nelim's Pickle Tools: 3 adult animals of kind "AEXP_CatBengal" are spawned around (154, 98)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the animals of kind "AEXP_CatBengal"
    And I take a screenshot "gallery-4-bengal-cats"
