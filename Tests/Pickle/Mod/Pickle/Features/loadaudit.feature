@requires:nelim.pickletools.loadaudit
Feature: Colorful Coats - Vanilla Animals Expanded! Renew loads cleanly

  AUDIT.md 8.i: the load is read in the game log, nothing from the mod, no def that does not
  resolve. The mod owns no text, so no translation can be missing; English only, no French pass.
  Stays at the main menu: the load happens before it, no save needed.

  Scenario: the mod loads with no error, warning or missing definition
    Then Nelim's Pickle Tools: the load of the mod "nelim.colorfulcoats.vae" is clean

  Scenario: the mod list entry has its name, a description and a preview image
    Then Nelim's Pickle Tools: the mod list entry of the mod "nelim.colorfulcoats.vae" has the name "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)", a description and a preview image that loaded
