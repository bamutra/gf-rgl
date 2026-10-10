concrete SentenceExtraCgg of SentenceExtra = CatCgg, TenseExtraCgg  ** 
	open Prelude, ResCgg  in {

	

	lin
		UseClExtra temp pol cl = let 
                subj = cl.s;
                vMorphs = mkVerbMorphs;
                clitic = mkSubjClitic cl.subjAgr;
                agr = cl.subjAgr;
                niClitic = mkNiSubjClitic cl.subjAgr;   -- ni- fused with the subject prefix
                tiClitic = mkTiSubjClitic cl.subjAgr;   -- ti- fused with the subject prefix
                tiRaClitic = mkTiRaClitic cl.subjAgr; -- ti-SC-ra- (tinda- in 1sg)
                presSimul =  vMorphs ! VFPres; --this is not delivering the string
                presAnt = vMorphs ! VFPastPart; --this is not delivering the string
                root = cl.root;
                presRestOfVerb = cl.pres;
                pastRestOfVerb = cl.perf; --morphs ! VFPastPart ! RestOfVerb;

                compl = cl.compl

                in
                	case <temp.t, temp.a, pol.p> of {
                		 <RemotePast, Performative,Pos>  => case cl.isPresBlank of {
                		 									True => {s = subj ++ clitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCa ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ clitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCa  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                	     <RemotePast, Performative,Neg> => case cl.isPerfBlank of {
                	     										True => {s = subj ++ mkTiRaBase cl.subjAgr ++  cl.rootV ! SCa ++ Predef.BIND ++ "ire" ++ compl};
                		 										False => {s = subj ++ mkTiRaBase cl.subjAgr ++ cl.rootV ! SCa  ++ Predef.BIND ++ pastRestOfVerb ++ compl} 
                	 										};
                	 	 <RemotePast, (Perfect | Resultative),Pos>  => case cl.isPerfBlank of {
                		 									True => {s = subj ++ clitic ++ "kaba" ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba" ++ cl.vcl  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                	     <RemotePast, (Perfect | Resultative),Neg> => case cl.isPerfBlank of {
                	     									True => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "ta" ++ Predef.BIND ++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                	 										};
                	    <RemotePast, Retrospective, Pos> => case cl.isPerfBlank of {
                                  True => {s = subj ++ clitic ++ "kaba" ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ clitic ++ "kaba" ++ cl.vcl ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<RemotePast, Retrospective, Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<RemotePast, Habitual, Pos> => case cl.isPresBlank of{
                											True => {s = subj ++ clitic ++ "kaba" ++ cl.vcl ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba" ++ cl.vcl  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<RemotePast, Habitual, Neg> => case cl.isPresBlank of {
                											True => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "ta" ++Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "ta" ++Predef.BIND ++ root  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<RemotePast, Progressive, Pos> => case cl.isPresBlank of{
                											True => {s = subj ++ clitic ++ "kaba ni" ++ cl.vcl ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba ni" ++ cl.vcl  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<RemotePast, Progressive, Neg> => case cl.isPresBlank of{
                											True => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "ta riku" ++Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "ta riku" ++Predef.BIND ++ root  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<RemotePast, Persistive, Pos> => case cl.isPresBlank of{
                											True => {s = subj ++ clitic ++ "kaba" ++ clitic ++"kyaa" ++Predef.BIND++ root ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ clitic ++ "kaba" ++ clitic ++"kyaa" ++Predef.BIND ++ root  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<RemotePast, Persistive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ clitic ++ "kaba" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearPast, Performative,Pos> => case cl.isPerfBlank of {
                											True => {s = subj ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ cl.vcl  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<NearPast, Performative,Neg> => case cl.isPerfBlank of {
                											True => {s = subj ++ cl.vti ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ cl.vti  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<NearPast, (Perfect |Resultative),Pos> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ cl.vcl ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<NearPast, (Perfect |Resultative),Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<NearPast, Retrospective,Pos> => case cl.isPerfBlank of {
                											True => {s = subj ++ clitic ++ "bire" ++clitic ++"aa"++ Predef.BIND++ root ++ Predef.BIND ++ "ire" ++ compl}; --I had already bought
                		 									False => {s = subj ++ clitic ++ "bire" ++clitic ++"aa"++ Predef.BIND++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl} --I had already bought
                											};
                		<NearPast, Retrospective,Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };

                		<(NearPast | MemorialPres|ExpPres|NearFut), Habitual,Pos>  => case cl.isPresBlank of {
                		 									True => {s = subj ++ cl.vcl ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ cl.vcl  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                	    <(NearPast | MemorialPres|ExpPres|NearFut), Habitual,Neg> => case cl.isPresBlank of {
                	     										True => {s = subj ++ cl.vti ++ Predef.BIND ++ "a" ++ compl};
                		 										False => {s = subj ++ cl.vti  ++ Predef.BIND ++ presRestOfVerb ++ compl} 
                	 										};
                	 	<NearPast, Progressive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ cl.vni ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ cl.vni ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearPast, Progressive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearPast, Persistive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "kyaa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "kyaa" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearPast, Persistive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "baire" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<MemorialPres, Performative, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkMemSubj agr ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkMemSubj agr ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<MemorialPres, Performative, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkMemNegSubj agr ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkMemNegSubj agr ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<MemorialPres, (Perfect | Resultative), Pos> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ cl.vcl ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<MemorialPres, (Perfect | Resultative), Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<MemorialPres, Retrospective, Pos> => case cl.isPerfBlank of {
                											True => {s = subj ++ clitic ++ "aaba" ++ clitic ++"aa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ clitic ++ "aaba" ++ clitic ++"aa" ++ Predef.BIND ++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<MemorialPres, Retrospective, Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<MemorialPres, Progressive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ cl.vni ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ cl.vni ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<MemorialPres, Progressive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<MemorialPres, Persistive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ clitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCaa ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ clitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCaa ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<MemorialPres, Persistive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkMemAux agr ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkMemAux agr ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<ExpPres, Performative, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ cl.vcl ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ cl.vcl ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                <ExpPres, Performative, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ tiClitic ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ tiClitic ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<ExpPres, (Perfect |Resultative), Pos> => case cl.isPerfBlank of {
                											True => {s = subj ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ cl.vcl  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<ExpPres, (Perfect |Resultative), Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ cl.vti ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ cl.vti ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<ExpPres, Retrospective, Pos>     => case cl.isPerfBlank of {
                		 									True => {s = subj ++ clitic ++ "naa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ clitic ++ "naa" ++ Predef.BIND++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<ExpPres, Retrospective, Neg>     => case cl.isPerfBlank of {
                		 									True => {s = subj ++ tiClitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCa ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ tiClitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCa  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<ExpPres, Progressive, Pos>     => case cl.isPresBlank of {
                		 									True => {s = subj ++ cl.vni ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj ++ cl.vni  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<ExpPres, Progressive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkTiSubjWord agr "ri" ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkTiSubjWord agr "ri" ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<ExpPres, Persistive, Pos>     => case cl.isPerfBlank of {
                		 									True => {s = subj ++ clitic ++ "k" ++ Predef.BIND ++  cl.rootV ! SCaa ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj  ++ clitic ++ "k" ++ Predef.BIND ++ cl.rootV ! SCaa  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		<ExpPres, Persistive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkTiSubjWord agr "ri" ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkTiSubjWord agr "ri" ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearFut, Performative, Pos> => case cl.isPresBlank of {
                											True => {s = subj ++ niClitic ++"za" ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                		 									False => {s = subj  ++ niClitic ++"za" ++ cl.vku  ++ Predef.BIND ++ presRestOfVerb ++ compl}
                											};
                		-- Uses the subjunctive e.g a + e = e
                		<NearFut, Performative, Neg>     => case cl.isPerfBlank of {
                		 									True => {s = subj ++ tiRaClitic ++ "a" ++ Predef.BIND ++ root ++ Predef.BIND ++ cl.presSubj ++ compl};
                		 									False => {s = subj ++ tiRaClitic ++ "a" ++ Predef.BIND ++ root  ++ Predef.BIND ++ cl.presSubj ++ compl} -- subjunctive: taraagwejegyere
                											};
                		<NearFut, (Perfect | Resultative), Pos> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "raba" ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "raba" ++ cl.vcl ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<NearFut, (Perfect | Resultative), Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "raba" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "raba" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<NearFut, Retrospective, Pos> =>case cl.isPerfBlank of { 
                											True => {s = subj ++ niClitic ++"za kuba" ++ Predef.BIND ++ clitic ++ "aa" ++Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj  ++ niClitic ++"za kuba" ++ Predef.BIND ++ clitic ++ "aa" ++Predef.BIND ++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<NearFut, Retrospective, Neg> =>case cl.isPerfBlank of { 
                											True => {s = subj ++ niClitic ++"za kuba" ++ Predef.BIND ++ clitic ++ "taka" ++Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj  ++ niClitic ++"za kuba" ++ Predef.BIND ++ clitic ++ "taka" ++Predef.BIND ++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<NearFut, Progressive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ niClitic ++ "za kuba" ++ cl.vni ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ niClitic ++ "za kuba" ++ cl.vni ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearFut, Progressive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ niClitic ++ "za kuba" ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ niClitic ++ "za kuba" ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearFut, Persistive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ niClitic ++ "za kuba" ++ clitic ++ "kyaa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ niClitic ++ "za kuba" ++ clitic ++ "kyaa" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<NearFut, Persistive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ niClitic ++ "za kuba" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ niClitic ++ "za kuba" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Performative, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "rya" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "rya" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Performative, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkTiSubjWord agr "rya" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkTiSubjWord agr "rya" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, (Perfect | Resultative), Pos> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "ryaba" ++ cl.vcl ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "ryaba" ++ cl.vcl ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<RemoteFut, (Perfect | Resultative), Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "ryaba" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "ryaba" ++ clitic ++ "ta" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<RemoteFut, Retrospective, Pos> => case cl.isPerfBlank of {
                		 									True => {s = subj ++ clitic ++ "ryaba" ++ clitic ++ "aa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                		 									False => {s = subj ++ clitic ++ "ryaba" ++ clitic ++ "aa"++ Predef.BIND++ root  ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                											};
                		<RemoteFut, Retrospective, Neg> => case cl.isPerfBlank of {
                                  True => {s = subj ++ mkSubjWord agr "ryaba" ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ "ire" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "ryaba" ++ clitic ++ "taka" ++ Predef.BIND ++ root ++ Predef.BIND ++ pastRestOfVerb ++ compl}
                                };
                		<RemoteFut, Habitual, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "raa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "raa" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Habitual, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkTiSubjWord agr "raa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkTiSubjWord agr "raa" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Progressive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "riba" ++ cl.vni ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "riba" ++ cl.vni ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Progressive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "riba" ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "riba" ++ clitic ++ "tari" ++ Predef.BIND ++ cl.vku ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Persistive, Pos> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "riba" ++ clitic ++ "kyaa" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "riba" ++ clitic ++ "kyaa" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                };
                		<RemoteFut, Persistive, Neg> => case cl.isPresBlank of {
                                  True => {s = subj ++ mkSubjWord agr "riba" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ "a" ++ compl};
                                  False => {s = subj ++ mkSubjWord agr "riba" ++ clitic ++ "taki" ++ Predef.BIND ++ root ++ Predef.BIND ++ presRestOfVerb ++ compl}
                                }

                };

}