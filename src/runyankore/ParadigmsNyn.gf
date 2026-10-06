--# -path=.:../rukiga:../prelude:../abstract:../common
-- Runyankore paradigms. Identical to ParadigmsCgg except for the perfective
-- of verbs whose stem ends in t. Rukiga spirantises the t (-ta -> -sire,
-- -ta -> -ise: kwasire, kwaise); Runyankore keeps it (-ta -> -tsire,
-- -ta -> -itse: kwatsire, kwaitse). The shared lexicon writes the Rukiga
-- form; these paradigms derive the Runyankore one.
resource ParadigmsNyn = ParadigmsCgg - [mkV, mkV2, mkV3] **
  open (Predef=Predef), ResCgg, CatCgg, Prelude in {

oper
  -- t-retention in the perfective ending, only when the stem ends in t
  -- (restPres starts with "t"): sire -> tsire, si -> tsi, ise -> itse
  tsiPerf : Str -> Str -> Str = \restPres, restPerf ->
    case restPres of {
      "t" + _ => case restPerf of {
                   "s" + rest              => "ts" + rest ;
                   v@("i"|"e") + "s" + rest => v + "ts" + rest ;
                   _                       => restPerf
                 } ;
      _       => restPerf
    } ;

  mkV = overload {
    mkV : Str -> V
      = \root -> lin V (smartVerb root) ;
    mkV : Str -> Str -> Str -> V
      = \root, restPres, restPerf -> lin V (mkVerb root restPres (tsiPerf restPres restPerf)) ;
    mkV : Str -> Str -> Str -> Str -> Bool -> V
      = \root, restPres, restPerf, p, bool -> lin V (mkVerbV2X root restPres (tsiPerf restPres restPerf) p bool) ;
  } ;

  mkV2 = overload {
    mkV2 : Str -> V2 = \root -> dirV2 (lin V (smartVerb root)) ;
    mkV2 : Str -> Str -> Str -> V2
      = \root, s1, s2 -> dirV2 (lin V (mkVerb root s1 (tsiPerf s1 s2))) ;
  } ;

  mkV3 = overload {
    mkV3 : Str -> Verb3 = \root -> mkV2 root ** {comp2 = []} ;
    mkV3 : Str -> Str -> Str -> Verb3 = \root, s1, s2 -> mkV2 root s1 s2 ** {comp2 = []} ;
  } ;
}
