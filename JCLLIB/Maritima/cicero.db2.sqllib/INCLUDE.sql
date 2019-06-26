SELECT CREATOR, NAME,                                                   00010003
       CHAR('INCLUDE TABLESPACE '||STRIP(DBNAME)||'.'||                 00010103
            STRIP(TSNAME),80)                                           00010203
  FROM SYSIBM.SYSTABLES                                                 00011002
WHERE TYPE = 'T'                                                        00020002
  AND NAME IN                                                           00020104
('CADAPOL'                                                              00020204
,'MOVAPOL'                                                              00020304
,'EXCAPOL'                                                              00020404
,'HSTAPOL'                                                              00020504
,'CADAURSM'                                                             00020604
,'MOVAURSM'                                                             00020704
,'EXCAURSM'                                                             00020804
,'HSTAURSM'                                                             00020904
,'PROPOSTA'                                                             00021004
,'SNSINIST'                                                             00022004
,'MOVPROPOSTA'                                                          00023004
,'PROPSEGURADO'                                                         00024004
,'SSESTIP'                                                              00025004
,'PROPOSTA'                                                             00026004
,'ORCAMENTO'                                                            00027004
,'SEGURADO'                                                             00028004
,'ENDERSEG'                                                             00029004
,'ENDSEGURADO')                                                         00030004
;                                                                       00060000
