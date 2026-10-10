--# -path=.:../prelude:../abstract:../common

concrete IdiomCgg of Idiom = CatCgg **
  open Prelude,Predef, ResCgg in {


lin
  -- subjunctive: SC-root-e (tugwejegyere "let us sleep", omwana agwejegyere "let the child sleep")
  -- "let us ...": reka is optional (reka tuhage / tuhage); plain linearization gives the full form
  ImpPl1  vp = {s = optStr "reka" ++ joinV (scBase (AgMUBAP1 Pl)) vp.rootV ++ Predef.BIND ++ vp.presSubj ++ vp.comp};  -- let's go
  -- "let X ...": X is the object of reka. A noun follows plain reka (reka abaana bagwejegyere);
  -- a pronoun becomes an object marker on reka: bareke bagwejegyere "let them sleep",
  -- kireke kigwe "let it fall", mureke agwejegyere "let him/her sleep"; "let you (pl.)" also takes mu-
  ImpP3 np vp = let
      rekaOM : Agreement -> Str = \a -> case a of {
        AgMUBAP2 Pl => "mureke" ;
        _ => omRootV a (mkRootV "rek") ! SPlain ++ Predef.BIND ++ "e" } ;
      subjunct : Str = joinV (scBase np.agr) vp.rootV ++ Predef.BIND ++ vp.presSubj ++ vp.comp
    in {s = case np.isPron of {
              True  => rekaOM np.agr ++ subjunct ;
              False => "reka" ++ np.s ! Nom ++ subjunct } } ; -- let John walk
{-
--1 Idiom: Idiomatic Expressions

abstract Idiom = Cat ** {

-- This module defines constructions that are formed in fixed ways,
-- often different even in closely related languages.

  fun
    ImpersCl  : VP -> Cl ;        -- it is hot
    GenericCl : VP -> Cl ;        -- one sleeps

    CleftNP   : NP  -> RS -> Cl ; -- it is I who did it
    CleftAdv  : Adv -> S  -> Cl ; -- it is here she slept

    ExistNP   : NP -> Cl ;        -- there is a house
    ExistIP   : IP -> QCl ;       -- which houses are there

-- 7/12/2012 generalizations of these

    ExistNPAdv : NP -> Adv -> Cl ;    -- there is a house in Paris
    ExistIPAdv : IP -> Adv -> QCl ;   -- which houses are there in Paris

    ProgrVP   : VP -> VP ;        -- be sleeping

    ImpPl1    : VP -> Utt ;       -- let's go

    ImpP3     : NP -> VP -> Utt ; -- let John walk

-- 3/12/2013 non-reflexive uses of "self"

    SelfAdvVP : VP -> VP ;        -- is at home himself
    SelfAdVVP : VP -> VP ;        -- is himself at home
    SelfNP    : NP -> NP ;        -- the president himself (is at home)

-}
  
}
