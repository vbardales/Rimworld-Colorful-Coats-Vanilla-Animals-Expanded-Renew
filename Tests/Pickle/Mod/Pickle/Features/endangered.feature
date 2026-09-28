# The five animals Endangered adds, checked structurally the same way as the core 30: that the
# def exists at all (only true when the optional pack is loaded) and that this mod's patch
# reached it. Tagged to self-select: skipped whenever Endangered is not staged, so it can stay
# in the suite's default run.
@requires:VanillaExpanded.VAEEndAndExt
Feature: Colorful Coats - Vanilla Animals Expanded! Renew: the Endangered animals

  Scenario: with Endangered, its five animals exist and are patched
    Then def "AEXP_BlackFootedFerret" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "AEXP_BlackRhino" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "AEXP_Moa" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "AEXP_Pangolin" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    And def "AEXP_RockhopperPenguin" was patched by mod "Colorful Coats - Vanilla Animals Expanded! Renew (unofficial)"
    Then no errors were logged
