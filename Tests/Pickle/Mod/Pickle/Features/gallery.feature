@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom @requires:nelim.sanctuarybacklot
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: Workshop gallery captures

  # Staged photographs, not assertions (owner's rule 2026-10-02; AUDIT.md, "Captures destinees a la publication"): a
  # person opens each image. Story: a slow afternoon in the flower glade of the zen meadow studio; the colony's
  # animals have wandered out together and, for once, no two look alike. One shared set for all four images (the
  # flower field north of the statue garden of Nelim's Sanctuary (save Nelims-tribe, SanctuaryBacklot), hour 16, clear weather), animals set, photographed, then removed by the
  # CoatSteps AfterScenario. Coats are chosen, never drawn: "the animal coat-N is given coat K" (K index into the
  # kind's alternateGraphics, -1 the original), so every image shows distinct coats by construction. Subjects: kinds
  # with 2 to 4 extra coats (counted in ColorfulCoats_VAEcore.xml): poodle 4, kangaroo 3, red panda 3, Bengal cat 2.
  # Scenes 2 to 4 (poodles, red pandas, Bengal cats) moved to gallery-decor.feature on 2026-11-06 (validated places only); this file keeps the accepted kangaroos scene. Play in the gallery pass only (wsl-deps.gallery.map, -Filter gallery), Odyssey present, no other coat mod.
  # Images 3 and 4 moved to calm-zone on 2026-10-12 (run a16a: flowers swallowed the warm coats). Replayed 2026-10-11 in Nelim's Sanctuary (SanctuaryBacklot, named place "flower-garden", docs/SANCTUAIRE-LIEUX.md) after the studio fixture vanished (run d06b, 0/4).

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And I set the hour to 16
    And I set the weather to "Clear"

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
