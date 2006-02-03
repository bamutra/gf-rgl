--# -path=.:../abstract:../common:../../prelude

--1 Finnish auxiliary operations.

-- This module contains operations that are needed to make the
-- resource syntax work. To define everything that is needed to
-- implement $Test$, it moreover contains regular lexical
-- patterns needed for $Lex$.

resource ResFin = ParamFin ** open Prelude in {

  flags optimize=all ;

  oper

  Compl : Type = {s : Str ; c : NPForm} ;

-- For $Verb$.

  Verb : Type = {
    s : VForm => Str
    } ;


  VP : Type = {
    s  : Tense => Anteriority => Polarity => Agr => {fin, inf : Str} ; 
    s2 : Agr => Str
    } ;

  predV : Verb -> VP = \verb -> {
    s = \\t,ant,b,agr => {fin = verb.s ! Presn agr.n agr.p ; inf = []} ;
    s2 = \\_ => []
    } ;
{-
      let
        inf  = verb.s ! VInf ;
        fin  = presVerb verb agr ;
        past = verb.s ! VPast ;
        part = verb.s ! VPPart ;
        vf : Str -> Str -> {fin, inf : Str} = \x,y -> 
          {fin = x ; inf = y} ;
      in
      case <t,ant,b,ord> of {
        <Pres,Simul,Pos,ODir>   => vf fin          [] ;
        <Pres,Simul,Pos,OQuest> => vf (does agr)   inf ;
        <Pres,Simul,Neg,_>      => vf (doesnt agr) inf ;
        <Pres,Anter,Pos,_>      => vf (have agr)   part ;
        <Pres,Anter,Neg,_>      => vf (havent agr) part ;
        <Past,Simul,Pos,ODir>   => vf past         [] ;
        <Past,Simul,Pos,OQuest> => vf "did"        inf ;
        <Past,Simul,Neg,_>      => vf "didn't"     inf ;
        <Past,Anter,Pos,_>      => vf "had"        part ;
        <Past,Anter,Neg,_>      => vf "hadn't"     part ;
        <Fut, Simul,Pos,_>      => vf "will"       inf ;
        <Fut, Simul,Neg,_>      => vf "won't"      inf ;
        <Fut, Anter,Pos,_>      => vf "will"       ("have" ++ part) ;
        <Fut, Anter,Neg,_>      => vf "won't"      ("have" ++ part) ;
        <Cond,Simul,Pos,_>      => vf "would"      inf ;
        <Cond,Simul,Neg,_>      => vf "wouldn't"   inf ;
        <Cond,Anter,Pos,_>      => vf "would"      ("have" ++ part) ;
        <Cond,Anter,Neg,_>      => vf "wouldn't"   ("have" ++ part)
        } ;
    s2 = \\a => if_then_Str verb.isRefl (reflPron ! a) []
    } ;


  insertObj : (Agr => Str) -> VP -> VP = \obj,vp -> {
    s = vp.s ;
    s2 = \\a => vp.s2 ! a ++ obj ! a
    } ;

--- This is not functional.

  insertAdV : Str -> VP -> VP = \adv,vp -> {
    s = vp.s ;
    s2 = vp.s2
    } ;

  presVerb : {s : VForm => Str} -> Agr -> Str = \verb -> 
    agrVerb (verb.s ! VPres) (verb.s ! VInf) ;

  infVP : VP -> Agr -> Str = \vp,a -> 
    (vp.s ! Fut ! Simul ! Neg ! ODir ! a).inf ++ vp.s2 ! a ;

  agrVerb : Str -> Str -> Agr -> Str = \has,have,agr -> 
    case agr of {
      {n = Sg ; p = P3} => has ;
      _                 => have
      } ;

  have   = agrVerb "has"     "have" ;
  havent = agrVerb "hasn't"  "haven't" ;
  does   = agrVerb "does"    "do" ;
  doesnt = agrVerb "doesn't" "don't" ;

  Aux = {pres,past : Polarity => Agr => Str ; inf,ppart : Str} ;

  auxBe : Aux = {
    pres = \\b,a => case <b,a> of {
      <Pos,{n = Sg ; p = P1}> => "am" ; 
      <Neg,{n = Sg ; p = P1}> => ["am not"] ; --- am not I
      _ => agrVerb (posneg b "is")  (posneg b "are") a
      } ;
    past = \\b,a => case a of {
      {n = Sg ; p = P1|P3} => (posneg b "was") ;
      _                    => (posneg b "were")
      } ;
    inf  = "be" ;
    ppart = "been"
    } ;

  posneg : Polarity -> Str -> Str = \p,s -> case p of {
    Pos => s ;
    Neg => s + "n't"
    } ;

  conjThat : Str = "that" ;

  reflPron : Agr => Str = table {
    {n = Sg ; p = P1} => "myself" ;
    {n = Sg ; p = P2} => "yourself" ;
    {n = Sg ; p = P3} => "itself" ; ----
    {n = Pl ; p = P1} => "ourselves" ;
    {n = Pl ; p = P2} => "yourselves" ;
    {n = Pl ; p = P3} => "themselves"
    } ;
-}
-- For $Sentence$.

  Clause : Type = {
    s : Tense => Anteriority => Polarity => SType => Str
    } ;

{-
  mkClause : Str -> Agr -> VP -> Clause =
    \subj,agr,vp -> {
      s = \\t,a,b,o => 
        let 
          verb  = vp.s ! t ! a ! b ! o ! agr ;
          compl = vp.s2 ! agr
        in
        case o of {
          ODir   => subj ++ verb.fin ++ verb.inf ++ compl ;
          OQuest => verb.fin ++ subj ++ verb.inf ++ compl
          }
    } ;


-- For $Numeral$.

  mkNum : Str -> Str -> Str -> Str -> {s : DForm => CardOrd => Str} = 
    \two, twelve, twenty, second ->
    {s = table {
       unit => table {NCard => two ; NOrd => second} ; 
       teen => \\c => mkCard c twelve ; 
       ten  => \\c => mkCard c twenty
       }
    } ;

  regNum : Str -> {s : DForm => CardOrd => Str} = 
    \six -> mkNum six (six + "teen") (six + "ty") (regOrd six) ;

  regCardOrd : Str -> {s : CardOrd => Str} = \ten ->
    {s = table {NCard => ten ; NOrd => regOrd ten}} ;

  mkCard : CardOrd -> Str -> Str = \c,ten -> 
    (regCardOrd ten).s ! c ; 

  regOrd : Str -> Str = \ten -> 
    case last ten of {
      "y" => init ten + "ieth" ;
      _   => ten + "th"
      } ;
-}
}
