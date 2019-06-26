--SELECT DISTINCT T.CREATOR,T.NAME                                      00010000
  SELECT                                                                00010100
  'ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||                00010201
  ' BUFFERPOOL BP2 USING STOGROUP STGGIS00;'                            00011001
  FROM SYSIBM.SYSTABLES T                                               00020000
     , SYSIBM.SYSINDEXES I                                              00021000
 WHERE T.CREATOR = I.TBCREATOR                                          00030000
   AND T.NAME    = I.TBNAME                                             00031000
   AND T.TYPE = 'T'                                                     00130000
   AND T.DBNAME IN ('DBEELO',                                           00140000
                    'DBEEPE',                                           00150000
                    'DBEEPR',                                           00160000
                    'DBEETA',                                           00170000
                    'DBMA02',                                           00180000
                    'DBMA03',                                           00190000
                    'DBMT01',                                           00200000
                    'DBNOVA',                                           00210000
                    'DBRE01',                                           00220000
                    'DBRE02',                                           00230000
                    'DBRE03',                                           00240000
                    'DBRE04',                                           00250000
                    'DBVD01')                                           00310000
   AND T.TSNAME IN ('CEPLOGRA',                                         00320000
                    'LOCALIEE',                                         00330000
                    'LOGRADEE',                                         00340000
                    'NEWUF   ',                                         00350000
                    'TPESTCIV',                                         00360000
                    'EEPROPOS',                                         00370000
                    'CUSDOCVG',                                         00380000
                    'CORRTCAL',                                         00390000
                    'CORRTSAU',                                         00400000
                    'DATAS   ',                                         00410000
                    'ENDERSEG',                                         00420000
                    'INTCONSA',                                         00430000
                    'PREMICAN',                                         00440000
                    'RESSEGUR',                                         00450000
                    'SEGURADO',                                         00460000
                    'SENHA   ',                                         00470000
                    'SENHAAPL',                                         00480000
                    'SENHAOPC',                                         00490000
                    'SSLGCASG',                                         00500000
                    'SSPACTCP',                                         00510000
                    'SSPADFPM',                                         00520000
                    'SSTREPTR',                                         00530000
                    'SUCURSAL',                                         00540000
                    'UCADSPRE',                                         00550000
                    'UF      ',                                         00560000
                    'UMOVSENH',                                         00570000
                    'BAIRROS ',                                         00580000
                    'CCSISERP',                                         00590000
                    'CIMPLERP',                                         00600000
                    'CMRSVSIN',                                         00610000
                    'CXPOSTAL',                                         00620000
                    'LGRCEPLC',                                         00630000
                    'LOCALFXA',                                         00640000
                    'LOCALIDA',                                         00650000
                    'LOCALTIP',                                         00660000
                    'LOGRADOU',                                         00670000
                    'LOGRAESP',                                         00680000
                    'LOGRATIP',                                         00690000
                    'LOGRCOMP',                                         00700000
                    'PARAMLCL',                                         00710000
                    'PGCOMPPC',                                         00720000
                    'SSMRSVSN',                                         00730000
                    'SUBREGSN',                                         00740000
                    'TBFXACEP',                                         00750000
                    'TBREGCEP',                                         00760000
                    'TBREGINS',                                         00770000
                    'TBSUBREG',                                         00780000
                    'TBTARFAC',                                         00790000
                    'EMPREMAR',                                         00800000
                    'BANCOS  ',                                         00810000
                    'CADAPOL ',                                         00820000
                    'CADCRPCL',                                         00830000
                    'CADPARAM',                                         00840000
                    'CADPARCL',                                         00850000
                    'CORRETOR',                                         00860000
                    'INSPETOR',                                         00870000
                    'MOVAPOL ',                                         00880000
                    'MOVDIPRD',                                         00890000
                    'MOVPARCL',                                         00900000
                    'PROPOSTA',                                         00910000
                    'RAMOS   ',                                         00920000
                    'TBCTRBCO',                                         00930000
                    'TBFERIAD',                                         00940000
                    'TBINSS  ',                                         00950000
                    'TBMOEDAS',                                         00960000
                    'MOVAPRMO',                                         00970000
                    'MOVDVPCL',                                         00980000
                    'MOVTRNCX',                                         00990000
                    'MOVVIDA ',                                         01000000
                    'TBCONBCO',                                         01010000
                    'TBMOVIMP',                                         01020000
                    'TBMVCONT',                                         01030000
                    'TBSENRES',                                         01040000
                    'TBSOLPGT',                                         01050000
                    'TBTXTCRE',                                         01060000
                    'TBTXTOBS',                                         01070000
                    'MOVCOMIS',                                         01080000
                    'PRODORC ',                                         01090000
                    'RECCAIXA',                                         01100000
                    'CADAPALT',                                         01110000
                    'CADAPRMO',                                         01120000
                    'CADVIDA ',                                         01130000
                    'AGENCMTO')                                         01140000
;                                                                       01150000
