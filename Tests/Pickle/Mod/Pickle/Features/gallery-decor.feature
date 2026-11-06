@requires:nelim.pickletools.coatsteps @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.camerazoom @requires:nelim.pickletools.colonistrace @requires:nelim.pickletools.decorbase @requires:nelim.sanctuarybacklot
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: Workshop gallery captures 2 to 4 (validated Sanctuary)

  # Shotlist: STATUS.md, "Shotlist" and "Revision, validated places only" (2026-11-06). Staged photographs, not assertions
  # (a person opens each image). Story, "The coats afternoon": late afternoon into night at Nelim's Sanctuary; Nelim follows the
  # animals that wandered in, each in its own coat. Hours 17 (hut), 18 (cloister), 19 (ritual-hall); game paused for every shot.
  # Scene 1, the kangaroos (gallery.feature), is an accepted capture and is not replayed. Only places validated in
  # SanctuaryBacklot/Docs/VALIDE.md (hut, cloister, ritual-hall) and the decorated save the owner validated
  # (Nelims-tribe-decor-mods, staged by nelim.pickletools.decorbase). Poodles and Bengal cats validated by Virginie 2026-11-06
  # (anonymous animals the mod recolours). Nelim stays as the fixture dresses her (validated daily outfit, canon hair). Animals
  # face Nelim, who stands south of them, so the front view is the natural one. Coats are chosen, never drawn: "the animal
  # coat-N is given coat K" (K index into the kind's alternateGraphics, -1 the original).
  # Play alone, wsl-deps.gallery-decor.map (heavy decor-mods variant, container cap 7g, scenario timeout 600).

  Background:
    Given the save "Nelims-tribe-decor-mods" is loaded
    And game speed is paused
    And I set the weather to "Clear"

  # Scene 2: medium, zoom 6. Poodles in the tea room; just before: Nelim set the tea down, just after: the nearest poodle gets the
  # first biscuit. Light: the oil andon of the room.
  @review @gallery
  Scenario: four poodles come to the tea room, each in its own coat
    Given I set the hour to 17
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 4 adult animals of kind "AEXP_Poodle" are spawned around (141, 72)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-4" is given coat 2
    And Nelim's Pickle Tools: "Nelim" stands at (141, 70) facing South
    And Nelim's Pickle Tools: the animal "coat-1" faces South
    And Nelim's Pickle Tools: the animal "coat-2" faces South
    And Nelim's Pickle Tools: the animal "coat-3" faces West
    And Nelim's Pickle Tools: the animal "coat-4" faces East
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I frame the sanctuary "hut"
    And I take a screenshot "gallery-2-poodles-tea-room"

  # Scene 3: medium-close, zoom 4.5. Red pandas in the cloister at dusk; just before: Nelim came in from the garden, just after:
  # the pandas follow her toward the shrine. Light: low and warm, one side.
  @review @gallery
  Scenario: three red pandas in the cloister, each in its own coat
    Given I set the hour to 18
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 3 adult animals of kind "AEXP_RedPanda" are spawned around (178, 128)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 1
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 2
    And Nelim's Pickle Tools: "Nelim" stands at (178, 126) facing South
    And Nelim's Pickle Tools: the animal "coat-1" faces South
    And Nelim's Pickle Tools: the animal "coat-2" faces South
    And Nelim's Pickle Tools: the animal "coat-3" faces East
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I frame the sanctuary "cloister"
    And I take a screenshot "gallery-3-red-pandas-cloister"

  # Scene 4: close, zoom 4 (the named place frames at 8, the frame step below tightens it). Bengal cats among the cushions of the
  # ritual hall, evening; just before: Nelim reached toward the nearest cat, just after: it climbs onto a cushion. Light: the lit
  # brazier of the hall and the incense burner.
  @review @gallery
  Scenario: three Bengal cats in the ritual hall, the original and both coats
    Given I set the hour to 19
    And Nelim's Pickle Tools: all animals are removed
    And Nelim's Pickle Tools: 3 adult animals of kind "AEXP_CatBengal" are spawned around (206, 117)
    When Nelim's Pickle Tools: the animal "coat-1" is given coat -1
    And Nelim's Pickle Tools: the animal "coat-2" is given coat 0
    And Nelim's Pickle Tools: the animal "coat-3" is given coat 1
    And Nelim's Pickle Tools: "Nelim" stands at (206, 115) facing South
    And Nelim's Pickle Tools: the animal "coat-1" faces South
    And Nelim's Pickle Tools: the animal "coat-2" faces West
    And Nelim's Pickle Tools: the animal "coat-3" faces South
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And Nelim's Sanctuary: I frame the sanctuary "ritual-hall"
    And I take a screenshot "gallery-4-bengal-cats-ritual-hall"
