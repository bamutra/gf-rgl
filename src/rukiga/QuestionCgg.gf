--# -path=.:../prelude:../abstract:../common

concrete QuestionCgg of Question = CatCgg ** open ResCgg, Prelude in {
--1 Question: Questions and Interrogative Pronouns
-- A question can be formed from a clause ('yes-no question') or
-- with an interrogative.

  lin
     --QuestCl     : Cl -> QCl ;            -- does John walk

     QuestCl cl = cl ** {posibleSubAgr = mkSubjCliticTable ; isSubjQ = False ; qWord = [] ; subjRel = \\_,_,_ => []};
     --QuestVP     : IP -> VP -> QCl ;      -- who walks
    
    QuestVP ip vp = {
      s =  ip.s;
      subjAgr = NONE; -- no option but to just pick one
      isCopAP = False; isCopNP = vp.isCompNP; vcl = joinV (scBase NONE) vp.rootV; vni = case vp.noNi of { True => joinV (scBase NONE) vp.rootV ; False => joinV (niBase NONE) vp.rootV }; vti = joinV (tiBase NONE) vp.rootV; vku = joinV <"k", SCu> vp.rootV; rootV = vp.rootV; vka = mkPastStem NONE vp.noNi vp.rootV;
      posibleSubAgr = mkSubjCliticTable;
      isSubjQ = case ip.qKind of { QOther => False ; _ => True } ; qWord = ip.qWord ; -- noha ogwejegyeire
      subjRel = \\t,a,p => mkSubjRel t a p vp.rootV vp.pres vp.perf (joinV <"k", SCu> vp.rootV)
                     (case <ip.qKind, ip.n> of { <QWhat, IPl> => AgP3 Pl KI_BI ; <QWhat, _> => AgP3 Sg KI_BI ;
                                                 <_, IPl> => AgP3 Pl MU_BA ; _ => AgP3 Sg MU_BA }) ++ vp.comp ;
      root = vp.s;
      pres = vp.pres;
      perf = vp.perf;
      isPresBlank = vp.isPresBlank;
      isPerfBlank = vp.isPerfBlank;
      --morphs = vp.morphs;
      {-
      inf  : Str;
      pres  : Str; 
      past  : Str; 
      presPart  : Str; 
      pastPart  : Str;                              -- subject
      --root : Str ; -- dep. on Pol,Temp, e.g. "does","sleep"
      -}
      compl = vp.comp -- after verb: complement, adverbs
                                   
    } ;

    --QuestSlash  : IP -> ClSlash -> QCl ; -- whom does John love
    QuestSlash ip clSlash =
        let comp = case clSlash.complType of{
                        Ap            => clSlash.ap;
                        Adverbial     => clSlash.adv;
                        AdverbialVerb => clSlash.adV;
                        _             => []
                    };
        in    {
              s =  ip.s;
              subjAgr = NONE; -- no option but to just pick one
              isCopAP = False; isCopNP = False; vcl = clSlash.vcl; vni = clSlash.vni; vti = clSlash.vti; vku = clSlash.vku; rootV = clSlash.rootV; vka = clSlash.vka;
              posibleSubAgr = mkSubjCliticTable; isSubjQ = False ; qWord = [] ; subjRel = \\_,_,_ => [];
              root = clSlash.s;
              pres = clSlash.pres;
              perf = clSlash.perf;
              isPresBlank = clSlash.isPresBlank;
              isPerfBlank = clSlash.isPerfBlank;
              --morphs = clSlash.morphs;
              {-
              inf  : Str;
              pres  : Str; 
              past  : Str; 
              presPart  : Str; 
              pastPart  : Str;                              -- subject
              --root : Str ; -- dep. on Pol,Temp, e.g. "does","sleep"
              -}
              compl = comp -- after verb: complement, adverbs                            
            } ; 
    --QuestIAdv   : IAdv -> Cl -> QCl ;    -- why does John walk
    QuestIAdv iadv cl =
            {
              s =  iadv.s ++ cl.s;
              subjAgr = cl.subjAgr; -- no option but to just pick one
              isCopAP = cl.isCopAP; isCopNP = cl.isCopNP; vcl = cl.vcl; vni = cl.vni; vti = cl.vti; vku = cl.vku; rootV = cl.rootV; vka = cl.vka;
              posibleSubAgr = mkSubjCliticTable; isSubjQ = False ; qWord = [] ; subjRel = \\_,_,_ => [];
              root = cl.s;
              pres = cl.pres;
              perf = cl.perf;
              --morphs = cl.morphs;
              isPresBlank = cl.isPresBlank;
              isPerfBlank = cl.isPerfBlank;
              {-
              inf  : Str;
              pres  : Str; 
              past  : Str; 
              presPart  : Str; 
              pastPart  : Str;                              -- subject
              --root : Str ; -- dep. on Pol,Temp, e.g. "does","sleep"
              -}
              compl = cl.compl -- after verb: complement, adverbs                            
            } ; 
    --QuestIComp  : IComp -> NP -> QCl ;   -- where is John
    {-
        This function always uses the auxiliary. When we meet questions that may or may not use it, we shall
        querry the usesAux field
    -}
    QuestIComp icomp np = case <icomp.endOfSentence, icomp.requiresSubjPrefix> of {
                                   <True, True>   =>{ --such as ta?
                                                      s = np.s ! Acc;
                                                      subjAgr = np.agr; -- no option but to just pick one
                                                      isCopAP = False; isCopNP = False; vcl = joinV (scBase np.agr) be_Copula.rootV; vni = joinV (niBase np.agr) be_Copula.rootV; vti = joinV (tiBase np.agr) be_Copula.rootV; vku = joinV <"k", SCu> be_Copula.rootV; rootV = be_Copula.rootV; vka = mkPastStem np.agr False be_Copula.rootV;
                                                      posibleSubAgr = mkSubjCliticTable; isSubjQ = False ; qWord = [] ; subjRel = \\_,_,_ => [];
                                                      root = be_Copula.s;
                                                      pres = be_Copula.pres;
                                                      perf = be_Copula.perf;
                                                      --morphs = be_Copula.morphs;
                                                      isPresBlank = be_Copula.isPresBlank;
                                                      isPerfBlank = be_Copula.isPerfBlank;
                                                      {-
                                                      inf  : Str;
                                                      pres  : Str; 
                                                      past  : Str; 
                                                      presPart  : Str; 
                                                      pastPart  : Str;                              -- subject
                                                      --root : Str ; -- dep. on Pol,Temp, e.g. "does","sleep"
                                                      -}
                                                      compl =  mkSubjCliticTable ! np.agr ++ icomp.s -- after verb: complement, adverbs                            
                                                } ;
                                    <True, False>   =>{ -- such as nkahe?
                                                      s = np.s ! Acc;
                                                      subjAgr = np.agr; -- no option but to just pick one
                                                      isCopAP = False; isCopNP = False; vcl = joinV (scBase np.agr) be_Copula.rootV; vni = joinV (niBase np.agr) be_Copula.rootV; vti = joinV (tiBase np.agr) be_Copula.rootV; vku = joinV <"k", SCu> be_Copula.rootV; rootV = be_Copula.rootV; vka = mkPastStem np.agr False be_Copula.rootV;
                                                      posibleSubAgr = mkSubjCliticTable; isSubjQ = False ; qWord = [] ; subjRel = \\_,_,_ => [];
                                                      root = be_Copula.s;
                                                      pres = be_Copula.pres;
                                                      perf = be_Copula.perf;
                                                      --morphs = be_Copula.morphs;
                                                      isPresBlank = be_Copula.isPresBlank;
                                                      isPerfBlank = be_Copula.isPerfBlank;
                                                      {-
                                                      inf  : Str;
                                                      pres  : Str; 
                                                      past  : Str; 
                                                      presPart  : Str; 
                                                      pastPart  : Str;                              -- subject
                                                      --root : Str ; -- dep. on Pol,Temp, e.g. "does","sleep"
                                                      -}
                                                      compl =  icomp.s -- after verb: complement, adverbs                            
                                                } ;
                                  <_, _>  => {
                                              s = icomp.s;
                                              subjAgr = np.agr; -- no option but to just pick one
                                              isCopAP = False; isCopNP = False; vcl = joinV (scBase np.agr) be_Copula.rootV; vni = joinV (niBase np.agr) be_Copula.rootV; vti = joinV (tiBase np.agr) be_Copula.rootV; vku = joinV <"k", SCu> be_Copula.rootV; rootV = be_Copula.rootV; vka = mkPastStem np.agr False be_Copula.rootV;
                                              posibleSubAgr = mkSubjCliticTable; isSubjQ = False ; qWord = [] ; subjRel = \\_,_,_ => [];
                                              root = be_Copula.s;
                                              pres = be_Copula.pres;
                                              perf = be_Copula.perf;
                                              --morphs = be_Copula.morphs;
                                              isPresBlank = be_Copula.isPresBlank;
                                              isPerfBlank = be_Copula.isPerfBlank;
                                              {-
                                              inf  : Str;
                                              pres  : Str; 
                                              past  : Str; 
                                              presPart  : Str; 
                                              pastPart  : Str;                              -- subject
                                              --root : Str ; -- dep. on Pol,Temp, e.g. "does","sleep"
                                              -}
                                              compl = np.s ! Acc  -- after verb: complement, adverbs      
                                            } 
        };
        
    --IdetCN    : IDet -> CN -> IP ;       -- which five songs
    
    IdetCN idet cn = let num = case idet.n of{
                                 Sg => ISg;
                                 Pl => IPl
                            };

                    in


                        case idet.requiresSubjPrefix  of {
                            True => {s =  cn.s!idet.n!Complete ++ mkSubjPrefix (mkAgreement cn.gender P3 idet.n) ++ idet.s; n = num; isVerbSuffix=False; requiresIPPrefix=True; aux= "ni"; endOfSentence = True ; qKind = QOther ; qWord = []};
                            False => { s = cn.s!idet.n!Complete ++ idet.s; isVerbSuffix=False;  n=num; requiresIPPrefix=True; aux= "ni"; endOfSentence = True ; qKind = QOther ; qWord = []}
                        };
    --IdetIP    : IDet       -> IP ;       -- which five
    --Noun Class has been ignored
    IdetIP idet = let num = case idet.n of{
                                 Sg => ISg;
                                 Pl => IPl
                            };

                 in 
                   { 
                     s = idet.s ; 
                    
                    isVerbSuffix=False; 
                    n=num; requiresIPPrefix=True; 
                    aux= "ni"; 
                    endOfSentence = True ; qKind = QOther ; qWord = []
                  };
    --IdetQuant : IQuant -> Num -> IDet ;  -- which (five)
    --IdetQuant iquant num = { s = iquant.s ! num.n  ; requiresSubjPrefix=True};

    -- Interrogative complements to copulas can be both adverbs and
    -- pronouns.

    --CompIAdv  : IAdv -> IComp ;          -- where (is it)
    CompIAdv iadv =
        {
            s =iadv.s ; 
            n = INeut; 
            isVerbSuffix=False;
            requiresSubjPrefix =False; 
            requiresIPPrefix=False; 
            aux=[];
            usesAux = False; 
            endOfSentence=iadv.endOfSentence
        };
    --CompIP    : IP   -> IComp ;          -- who (is it)
    CompIP  ip    = 
        {
            s = ip.s; 
            n = ip.n; 
            isVerbSuffix = ip.isVerbSuffix;
            requiresSubjPrefix = False; 
            requiresIPPrefix = ip.requiresIPPrefix; 
            aux=ip.aux;
            usesAux = True;
            endOfSentence= ip.endOfSentence;

    };
{-
--1 Question: Questions and Interrogative Pronouns

abstract Question = Cat ** {

-- A question can be formed from a clause ('yes-no question') or
-- with an interrogative.

  fun
    QuestCl     : Cl -> QCl ;            -- does John walk
    QuestVP     : IP -> VP -> QCl ;      -- who walks
    QuestSlash  : IP -> ClSlash -> QCl ; -- whom does John love
    QuestIAdv   : IAdv -> Cl -> QCl ;    -- why does John walk
    QuestIComp  : IComp -> NP -> QCl ;   -- where is John

-- Interrogative pronouns can be formed with interrogative
-- determiners, with or without a noun.

    IdetCN    : IDet -> CN -> IP ;       -- which five songs
    IdetIP    : IDet       -> IP ;       -- which five

-- They can be modified with adverbs.

    AdvIP     : IP -> Adv -> IP ;        -- who in Paris

-- Interrogative quantifiers have number forms and can take number modifiers.

    IdetQuant : IQuant -> Num -> IDet ;  -- which (five)

-- Interrogative adverbs can be formed prepositionally.

    PrepIP    : Prep -> IP -> IAdv ;     -- with whom

-- They can be modified with other adverbs.

    AdvIAdv   : IAdv -> Adv -> IAdv ;    -- where in Paris

-- Interrogative complements to copulas can be both adverbs and
-- pronouns.

    CompIAdv  : IAdv -> IComp ;          -- where (is it)
    CompIP    : IP   -> IComp ;          -- who (is it)

-- More $IP$, $IDet$, and $IAdv$ are defined in $Structural$.

-- Wh questions with two or more question words require a new, special category.

  cat 
    QVP ;          -- buy what where
  fun
    ComplSlashIP  : VPSlash -> IP -> QVP ;   -- buys what 
    AdvQVP        : VP  ->   IAdv -> QVP ;   -- lives where 
    AddAdvQVP     : QVP ->   IAdv -> QVP ;   -- buys what where 

    QuestQVP      : IP -> QVP -> QCl ;       -- who buys what where

-}

}
