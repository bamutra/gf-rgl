--# -path=.:../rukiga:../prelude:../abstract:../common
-- Runyankore grammar: shares all syntax with the Runyankore-Rukiga
-- resource grammar; dialect-specific rules are overridden here.
concrete GrammarNyn of Grammar =
  NounCgg, VerbCgg, AdjectiveCgg, AdverbCgg, NumeralCgg, SentenceCgg,
  QuestionCgg, RelativeCgg, ConjunctionCgg, PhraseCgg, TextX - [Adv, IAdv, AdA],
  StructuralNyn, IdiomCgg, TenseX - [Adv, IAdv, AdA]
  ** { flags startcat = Phr ; } ;
