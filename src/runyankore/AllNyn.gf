--# -path=.:../rukiga:../abstract:../common:../prelude
-- Runyankore: the full grammar, i.e. Lang plus the Ry/Rk extensions
-- (tense/aspect system and the dictionary-derived lexicon). Shares the
-- abstract syntax AllCggAbs and SentenceExtraCgg with Rukiga.
concrete AllNyn of AllCggAbs =
  LangNyn, SentenceExtraCgg, LexiconExtraNyn
  ** {} ;
