# The 25 AEXP_* PawnKindDefs that Odyssey never touches: present and patched in every pass
# that has Vanilla Animals Expanded, whatever Endangered or Odyssey are doing. This is the
# structural half of TESTING.md's scenario B - the sequence-stops-at-first-false risk - for
# every animal except the five Odyssey can take over (see with-odyssey.feature /
# without-odyssey.feature) and the five Endangered-only ones (see endangered.feature).
# Needs no save: these steps read the def database built at the main menu.
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: core patches always apply

  Scenario: every non-Odyssey animal of the core file was patched
    Then def "AEXP_Beaver" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_BlackBear" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatBengal" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatBritishShorthair" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatMaineCoon" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatMunchkin" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatNorwegianForest" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatPersian" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatSiamese" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatSomali" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_CatSphynx" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Chihuahua" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Giraffe" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_GreatDane" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Hedgehog" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Hyena" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Jaguar" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Kangaroo" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Koala" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_MegaWolverine" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Platypus" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Poodle" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_RedPanda" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Rottweiler" was patched by mod "nelim.colorfulcoats.vae"
    And def "AEXP_Shih-Tzu" was patched by mod "nelim.colorfulcoats.vae"
    Then no errors were logged
