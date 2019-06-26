SELECT                                                                  00010000
'GRANT SELECT,INSERT,DELETE,UPDATE ON '||STRIP(CREATOR)||'.'||          00020000
STRIP(NAME),CREATOR,NAME,1                                              00030001
FROM SYSIBM.SYSTABLES                                                   00040000
WHERE TYPE = 'T'                                                        00050000
  AND CREATOR IN ('DB2TEST', 'DB2ACPT')                                 00051002
  AND SUBSTR(NAME,1,5) IN ('MAPA_')                                     00060003
UNION ALL                                                               00201001
SELECT                                                                  00210001
 ' TO ZZMADAT;',CREATOR,NAME,2                                          00230002
FROM SYSIBM.SYSTABLES                                                   00240001
WHERE TYPE = 'T'                                                        00250001
  AND CREATOR IN ('DB2TEST', 'DB2ACPT')                                 00251002
  AND SUBSTR(NAME,1,5) IN ('MAPA_')                                     00252003
ORDER BY 2,3,4                                                          00410001
