--# -path=.:../rukiga:../prelude:../abstract:../common
-- Runyankore lexicon. Inherits the shared Runyankore-Rukiga lexicon
-- (LexiconCgg, Bamutura et al.) and overrides only entries that differ
-- in Runyankore. Add excluded functions to the list and redefine below.
concrete LexiconNyn of Lexicon = LexiconCgg **
  open ParadigmsCgg, ResCgg, Prelude in {
  -- lin
    -- Example override pattern (verify with a native speaker first):
    -- 1. add  bark_N  to the exclusion list above
    -- 2. bark_N = mkN "<runyankore word>" KI_BI ;
}
