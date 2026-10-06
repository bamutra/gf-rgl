# Runyankore (Nyn) resource grammar for GF

Builds on David Sabiiti Bamutura's Runyankore-Rukiga resource grammar
(src/rukiga, module suffix Cgg). All syntax is shared; Runyankore-specific
differences are overridden in the Nyn modules:

- GrammarNyn.gf  – reuses every Cgg syntax module, swaps in StructuralNyn
- StructuralNyn.gf – structural words that differ (language title so far)
- LexiconNyn.gf  – inherits LexiconCgg; exclude + redefine differing words
- LangNyn.gf     – top-level module

Build (from this directory, with ../rukiga patched by rukiga-fixes.patch):

    gf -make -path=.:../rukiga:../prelude:../abstract:../common:../api LangNyn.gf

To override a word: add it to an exclusion list, e.g.
`LexiconCgg - [bark_N] **`, then define `bark_N = mkN "..." KI_BI ;`.

## Shared fixes (rukiga-fixes.patch, applies to Cgg and therefore Nyn)
- No subject concord on NP objects (abaana nibareeba ekitabo)
- Adjectives take adjectival prefixes, agreeing in class (omuti omuhango)
- Nasal assimilation for classes 9/10 (embwa empango, ente ennungi, ente enkúru)
- Present tense ni- fused with subject prefix (naaribata, nooribata, neeribata, nibareeba)
- Negative ti- fusion (omwana taribata)
- Copulas with adjectives (mkCopulaAP in ResCgg): ni in the present (ekitabo nikihango, omwana nimurungi); -ri after SC-ka-ba in the past (ekitabo kikaba kiri kihango; negative ekitabo kikaba kitari kihango)
- Demonstratives follow the noun (embwa ezi, ente ezo, omuntu ogwo)

Run the tests:  gf --run Lang.pgf < tests.gfs
