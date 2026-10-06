--# -path=.:../rukiga:../prelude:../abstract:../common
-- Runyankore LexiconExtra. Inherits LexiconExtraCgg and overrides only entries that
-- differ in Runyankore: verbs with a stem-final t are rebuilt with
-- ParadigmsNyn, which derives the Runyankore perfective (t-retention).
concrete LexiconExtraNyn of LexiconExtra = LexiconExtraCgg - [baata_1_V, boota_1_V, borogota_1_V, bota_1_V, bumbata_1_1_V2, bumbata_1_2_V2, bumbata_2_1_V2, bumbata_2_2_V2, fuuta_1_V2, gaita_1_1_V2, gaita_2_1_V2, gata_1_V, gota_1_V2, guta_1_V2, gweta_1_V, gyeta_1_V2, haata_1_V2, yeta_1_V2, imata_1_1_V2, imata_1_2_V2, imata_2_1_V2, imata_2_2_V2, kwata_1_1_V2, kwata_1_2_V2, kwata_1_3_V2, kwata_1_4_V2, kwata_2_1_V2, kwata_2_2_V2, kwata_2_3_V2, kwata_2_4_V2, kwata_3_1_V2, kwata_3_2_V2, kwata_3_3_V2, kwata_3_4_V2, kwata_4_1_V2, kwata_4_2_V2, kwata_4_3_V2, kwata_4_4_V2, kwata_5_1_V2, kwata_5_2_V2, kwata_5_3_V2, kwata_5_4_V2, kwata_6_1_V2, kwata_6_2_V2, kwata_6_3_V2, kwata_6_4_V2, kurata_1_1_V2, kurata_2_1_V2, yita_1_V2] **
  open ParadigmsNyn, ResCgg, Prelude in {
  lin
    -- t-final verbs, copied from LexiconExtraCgg (Runyankore perfective via ParadigmsNyn)
    baata_1_V = mkV "baa" "ta" "sire" ;
    boota_1_V = mkV "boo" "ta" "sire" ;
    borogota_1_V = mkV "borogo" "ta" "sire" ;
    bota_1_V = mkV "bo" "ta" "sire" ;
    bumbata_1_1_V2 = mkV2 "bumba" "ta" "sire" ;
    bumbata_1_2_V2 = mkV2 "bumba" "ta" "sire" ;
    bumbata_2_1_V2 = mkV2 "bumba" "ta" "sire" ;
    bumbata_2_2_V2 = mkV2 "bumba" "ta" "sire" ;
    fuuta_1_V2 = mkV2 "fuu" "ta" "sire" ;
    gaita_1_1_V2 = mkV2 "gai" "ta" "sire" ;
    gaita_2_1_V2 = mkV2 "gai" "ta" "sire" ;
    gata_1_V = mkV "ga" "ta" "sire" ;
    gota_1_V2 = mkV2 "go" "ta" "sire" ;
    guta_1_V2 = mkV2 "gu" "ta" "sire" ;
    gweta_1_V = mkV "gwe" "ta" "sire" ;
    gyeta_1_V2 = mkV2 "gye" "ta" "sire" ;
    haata_1_V2 = mkV2 "haa" "ta" "sire" ;
    yeta_1_V2 = mkV2 "e" "ta" "sire" ;
    imata_1_1_V2 = mkV2 "ima" "ta" "sire" ;
    imata_1_2_V2 = mkV2 "ima" "ta" "si" ;
    imata_2_1_V2 = mkV2 "ima" "ta" "sire" ;
    imata_2_2_V2 = mkV2 "ima" "ta" "si" ;
    kwata_1_1_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_1_2_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_1_3_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_1_4_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_2_1_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_2_2_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_2_3_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_2_4_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_3_1_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_3_2_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_3_3_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_3_4_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_4_1_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_4_2_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_4_3_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_4_4_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_5_1_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_5_2_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_5_3_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_5_4_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_6_1_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_6_2_V2 = mkV2 "kwa" "ta" "ise" ;
    kwata_6_3_V2 = mkV2 "kwa" "ta" "sire" ;
    kwata_6_4_V2 = mkV2 "kwa" "ta" "ise" ;
    kurata_1_1_V2 = mkV2 "kura" "ta" "sire" ;
    kurata_2_1_V2 = mkV2 "kura" "ta" "sire" ;
    yita_1_V2 = mkV2 "i" "ta" "sire" ;
    -- end of t-final verbs
}
