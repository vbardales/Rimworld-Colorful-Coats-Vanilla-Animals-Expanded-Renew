@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom @requires:nelim.sanctuarybacklot
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: Workshop gallery captures

  # Staged photographs, not assertions (owner's rule 2026-10-02; AUDIT.md, "Captures destinees a la publication"): a
  # person opens each image. Story: a slow afternoon in the flower glade of the zen meadow studio; the colony's
  # animals have wandered out together and, for once, no two look alike. One shared set for all four images (the
  # flower field north of the statue garden of Nelim's Sanctuary (save Nelims-tribe, SanctuaryBacklot), hour 16, clear weather), animals set, photographed, then removed by the
  # CoatSteps AfterScenario. Coats are chosen, never drawn: "the animal coat-N is given coat K" (K index into the
  # kind's alternateGraphics, -1 the original), so every image shows distinct coats by construction. Subjects: kinds
  # with 2 to 4 extra coats (counted in ColorfulCoats_VAEcore.xml): poodle 4, kangaroo 3, red panda 3, Bengal cat 2.
  # Play in the gallery pass only (wsl-deps.gallery.map, -Filter gallery), Odyssey present, no other coat mod.
  # Replayed 2026-10-11 in Nelim's Sanctuary (SanctuaryBacklot, named place "flower-garden", docs/SANCTUAIRE-LIEUX.md) after the studio fixture vanished (run d06b, 0/4).

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 16
    And I set the weather to "Clear"

  # Image 1: the headline. Poodles, the most generous kind, three different coats and the original in one frame.
  @review @gallery
  Scenario: poodles in the glade, each in its own coat
    Given Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 4 adult animals of kind "AEXP_Poodle" are spawned in a row from (150, 109), spacing 2
    When Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-4" is given coat 2
    And Nelim's Pickle Tools: the animal "coat-1" stands at (150, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-2" stands at (152, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-3" stands at (154, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-4" stands at (156, 109) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (153, 109) at zoom 4
    And I take a screenshot "gallery-1-poodles"

  # Image 2: wildlife, not only pets. Kangaroos, the three coats side by side.
  @review @gallery
  Scenario: kangaroos in the glade, each in its own coat
    Given Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 3 adult animals of kind "AEXP_Kangaroo" are spawned in a row from (151, 109), spacing 2
    When Nelim's Pickle Tools: the animal "coat-1" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 2
    And Nelim's Pickle Tools: the animal "coat-1" stands at (151, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-2" stands at (153, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-3" stands at (155, 109) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (153, 109) at zoom 4
    And I take a screenshot "gallery-2-kangaroos"

  # Image 3: red pandas, the strongest colour contrast, against the flowers.
  @review @gallery
  Scenario: red pandas in the glade, each in its own coat
    Given Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 3 adult animals of kind "AEXP_RedPanda" are spawned in a row from (151, 109), spacing 2
    When Nelim's Pickle Tools: the animal "coat-1" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 2
    And Nelim's Pickle Tools: the animal "coat-1" stands at (151, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-2" stands at (153, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-3" stands at (155, 109) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (153, 109) at zoom 4
    And I take a screenshot "gallery-3-red-pandas"

  # Image 4: the cats, the other half of what a colony keeps: the original and both coats.
  @review @gallery
  Scenario: Bengal cats in the glade, the original and both coats
    Given Nelim's Pickle Tools: the colonists are sent to the map corner
    And Nelim's Sanctuary: I am at the sanctuary "flower-garden"
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 3 adult animals of kind "AEXP_CatBengal" are spawned in a row from (151, 109), spacing 2
    When Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-1" stands at (151, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-2" stands at (153, 109) facing South
    And Nelim's Pickle Tools: the animal "coat-3" stands at (155, 109) facing South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Pickle Tools: I frame the cell (153, 109) at zoom 4
    And I take a screenshot "gallery-4-bengal-cats"
