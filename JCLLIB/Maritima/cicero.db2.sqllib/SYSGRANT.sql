SELECT 'GRANT SELECT ON '||        --INSERT,DELETE,UPDATE ON '||        00010004
       STRIP(CREATOR)||'.'||STRIP(NAME)||                               00020002
       ' TO AUTOMAR;',TBCREATOR,TBNAME                                  00020106
  FROM SYSIBM.SYSTABLES                                                 00021001
 WHERE TYPE = 'T'                                                       00030007
   AND NAME IN ('CONTROLEAPOL'                                          00040000
               ,'DETALHEAPOLICE'                                        00050000
               ,'PARAMETROGERAL'                                        00060000
               ,'DEPARAPOLICE')                                         00070000
;                                                                       00080000
