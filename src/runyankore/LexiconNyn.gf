--# -path=.:../rukiga:../prelude:../abstract:../common
-- Runyankore lexicon. Inherits the shared Runyankore-Rukiga lexicon
-- (LexiconCgg, Bamutura et al.) and overrides only entries that differ
-- in Runyankore. Add excluded functions to the list and redefine below.
concrete LexiconNyn of Lexicon = LexiconCgg - [walk_V, freeze_V, hit_V2, hold_V2, squeeze_V2, stab_V2] **
  open ParadigmsNyn, ResCgg, Prelude in {
  -- Verbs with a stem-final t: same entries as LexiconCgg, but ParadigmsNyn
  -- derives the Runyankore perfective (t-retention: -sire -> -tsire,
  -- -ise -> -itse). Generated from LexiconCgg; regenerate when those change.
  lin
    -- t-final verbs, copied from LexiconCgg (Runyankore perfective via ParadigmsNyn)
    walk_V = mkV "ribá" "ta" "sire" ;
    freeze_V = mkV "kwa" "ta" "ise" ;
    hit_V2 = mkV2 "kangaa" "ta" "sire" ;
    hold_V2 = mkV2 "kwa" "ta" "ise" ;
    squeeze_V2 = mkV2 "ima" "ta" "sire" ;
    stab_V2 = mkV2 "cumi" "ta" "sire" ;
    -- end of t-final verbs

    -- Example override pattern (verify with a native speaker first):
    -- 1. add  bark_N  to the exclusion list above
    -- 2. bark_N = mkN "<runyankore word>" KI_BI ;
}
