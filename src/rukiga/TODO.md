# Runyankore-Rukiga (Cgg) resource grammar: open issues

Maintainer: David Sabiiti Bamutura · list started 5 October 2026.
Status: **open** = not started · **needs data** = waiting for linguistic examples · **done** = fixed (keep for the record).

## 1. Numerals: new Decimal API (upstream commit fb398c60, Aug 2023)

The mechanical part was added upstream by Krasimir Angelov and works:
`Decimal` lincat (CatCgg), `NumDecimal` (NounCgg), `PosDecimal`, `NegDecimal`, `IFrac` (NumeralCgg).
Digits render as *abaana 3*, *ente 3.5*, *emiti -2*.

| Function | Abstract | Example | Status |
|---|---|---|---|
| `pot3decimal` | `Decimal -> Sub1000000` | 3.5 thousand | **needs data** (no lin; linearises as empty string) |
| `pot4decimal` | `Decimal -> Sub1000000000` | 3.5 million | **needs data** |
| `pot5decimal` | `Decimal -> Sub1000000000000` | 3.5 billion | **needs data** |
| `QuantityNP` | `Decimal -> MU -> NP` | 3.5 kg | **needs data** |

Questions to settle before implementing:
1. How decimals are read aloud (e.g. 3.5 as "three point five" or "three and a half", *ekicweka*?).
2. How fractions of thousands/millions are said (news style: "3.5 thousand people").
3. Whether negative numbers have a native expression in words.
4. Decimal separator in Runyankore-Rukiga writing (point assumed).

## 2. Verb lexicon: perfective forms vs Ry/Rk-Lex (Rukiga rules)

**Applied (5 Oct 2026, patch `0001-Fix-smartVerb-double-a-and-imperative-ending`):**
`smartVerb` double *-a* fixed in ParadigmsCgg (`verbRadical`): *bagambaa* → *bagamba*, *bareebaire* → *bareebire*
(speak, split, swell, throw, tie, turn, vomit, watch, win, write).

**On hold until past participles are fixed (§2b):**
- patch `0002-Correct-verb-perfectives-from-Ry-Rk-Lex-Rukiga-rules` — 26 entries: buy *guzire*, eat *riire*,
  come *izire*, die *fiire*, live *twire*, sleep *gwejegyeire* (**drink keeps *nywire***), plus 20 LexiconExtraCgg
  entries (truncated *bumbami*, *gandami*, *garami*, *gashami*, *gurukre*; *boine* → *bonire*; …);
- patch `0003-Apply-glide-formation-u-i-wi-to-Ry-Rk-Lex-perfective` — 115 entries, *u + i → wi* (*babuire* → *babwire*).
Sign-off sheet: `rr-verbs-hfst/verification_GF_verb_fixes.xlsx`.
**Open question:** does *o + i* also glide (145 Ry/Rk-Lex perfectives such as *goboire*, *gogoize*)?

**Needs decision (46 entries, `rr-verbs-hfst/perfective_review.tsv`, column `decision`):**
- *-sire* vs *-tsire* (Rukiga vs Runyankore?): hold/kwata (all senses) *kwasire*/*kwatsire*,
  stab *cumisire*/*cumitsire*, bumbata *bumbasire*/*bumbatsire*.
- Long-vowel causatives where Ry/Rk-Lex is inconsistent: bobeeza, gangaaza, gorogooza, haahuuza.
- Deliberate GF entries that differ: burn *baturire*/*batuire*, scratch *haire*/*hazire*,
  seek *kyenuuzire*/*kyenuize*, spit *cwerire*/*cweire*.
- Several Rukiga forms in Ry/Rk-Lex: hear *huriire*/*huririre*, squeeze/imata *imasire*/*imatsire*
  (GF has truncated *imatsi*, *imasi*).
- Suspicious Ry/Rk-Lex rules: gumaanya `a-re` (→ *gumaanyre*), particle verbs gwisaho, garukamu.
- Broken GF entry: `buuza_1_V2 = mkV2 "" "za" "rize"` (empty root).
- walk_V perfective *ribási* (truncated; no Rukiga rule in Ry/Rk-Lex).

## 2b. Verb morphology in the grammar (found while testing §2)

| Issue | Where | Example | Status |
|---|---|---|---|
| Root and ending joined by a space instead of `BIND` in negative / conditional / relative tenses | `SentenceCgg.gf` (16 places: `root ++ presRestOfVerb`, `root ++ pastRestOfVerb`, `root ++ "ire"`) | *tiakaamany a*, *tiakaagwejegyer a*, *tiakaab a* | **open** — a blanket `BIND` was tried and reverted: it glues copula forms with empty endings to the next word (*atakarihóòna*) and doubles `BIND` (*kub&+ ire*); needs branch-by-branch work with `isPresBlank` / `isPerfBlank` |
| Passive perfective participle built as root + *-irwe* | `NounCgg.gf:83` (`PPartNP`: `v2.s ++ BIND ++ mkVerbMorphs!VFPastPart!RestOfVerb`) | buy: *ekigurirwe* (before) / *ekiguirwe* (after shorter root) — expected *ekiguzirwe*? | **open, blocks patches 0002/0003** — 87 of 100 participles wrong before and after; needs a perfective-passive stem field in the `Verb` record, set in `mkVerb`/`smartVerb` from the perfective (*-ire* → *-irwe*) |
| Imperative used a hard-coded *-a* | `SentenceCgg.gf` `ImpVP` | *kwaa kyo* → *kwata kyo*; imperative = present stem for 1,076/1,085 verbs (was 485) | **done** (patch 0001) |

## 3. Syntax issues seen in test sentences

| Tree (abbreviated) | Output | Issue | Status |
|---|---|---|---|
| he walks (`PredVP he_Pron (UseV walk_V)`, TPres) | *uwe ni aribáta* | focus *ni* not bound to the verb; accent mark from `walk_V = mkV "ribá" "ta" "si"` appears in output | **open** |
| they did not buy the house | *bo tabaragurire baenju* | spurious *ba* before the object NP; perfective *gurire* (see §2) | **open** |

## 4. Unimplemented RGL functions

20 of the 1,060 trees in `test.treebank` + `cgg-eng-treebank.txt` hit unimplemented functions
(e.g. `SubjS`, `ComparAdvAdj`, `PositAdAAdj`). Older full list: `unimplemented_func.txt` (2020).
Status: **open** (regenerate the list against the current abstract syntax).
