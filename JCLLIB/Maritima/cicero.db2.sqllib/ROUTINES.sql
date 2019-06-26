 SELECT NAME, EXTERNAL_NAME                                             00002701
   FROM SYSIBM.SYSROUTINES                                              00002800
 WHERE NAME IN ('SSSPPESREFL03'                                         00002904
               ,'SSSPDVGSERL01'                                         00003004
               ,'SSSPSEHODGL01'                                         00003104
               ,'SSSPCBOL01'                                            00003204
               ,'SSSPESPMDCL01'                                         00003304
               ,'SSSPSERL01'                                            00003404
               ,'SSSPPROAMBL02'                                         00003504
               ,'SSSPPROAMBL03'                                         00003604
               ,'SSSPPROAMBL04'                                         00003704
               ,'SSSPCARGOL01'                                          00003804
               ,'SSSPSEGDEPL01'                                         00003904
               ,'SSSPSEGDEPL02'                                         00004004
               ,'SSSPORGAOEMISSL01')                                    00004104
;                                                                       00005002
 SELECT NAME, EXTERNAL_NAME                                             00006002
   FROM SYSIBM.SYSROUTINES                                              00007002
 WHERE EXTERNAL_NAME IN ('SQL84061',                                    00008003
                         'SQL07290',                                    00008103
                         'SQL52076',                                    00008203
                         'SQL80631',                                    00008303
                         'SQL28311',                                    00009003
                         'SQL36475',                                    00009103
                         'SQL88081',                                    00010003
                         'SQL01055',                                    00020003
                         'SQL79539')                                    00030003
;                                                                       00110002
