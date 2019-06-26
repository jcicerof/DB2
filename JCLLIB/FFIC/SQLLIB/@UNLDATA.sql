--UNLOAD DATA FROM TABLE XXXXX.PLAN_TABLE HEADER NONE                   00010003
--   PUNCHDDN DDPUN UNLDDN DDREC                                        00020000
                                                                        00030000
SELECT 'UNLOAD DATA FROM TABLE '||STRIP(CREATOR)||'.'||STRIP(NAME)||    00040002
       ' HEADER NONE',                                                  00040102
       CREATOR, NAME, 1                                                 00041000
  FROM SYSIBM.SYSTABLES                                                 00050000
 WHERE DBNAME = 'DSN8D91A'                                              00060005
   AND TYPE = 'T'                                                       00070000
-- AND CREATOR IN ('FRP2LDR'                                            00070205
--                ,'DBA1SAH'                                            00070305
--                ,'ZZGLACPT'                                           00070405
--                ,'ZZPSDEMO'                                           00070505
--                ,'DBA1SRG'                                            00070605
--                ,'FRP1MFW'                                            00070705
--                ,'PSDEVL'                                             00070805
--                ,'ZZPRDEMO'                                           00070905
--                ,'PRACPT'                                             00071005
--                ,'PRDUPD'                                             00071105
--                ,'ZZPRTEST'                                           00071205
--                ,'ZZPSTEST')                                          00071305
UNION ALL                                                               00072000
SELECT '   PUNCHDDN DDPUN UNLDDN DDREC',                                00080001
       CREATOR, NAME, 2                                                 00090000
  FROM SYSIBM.SYSTABLES                                                 00100000
 WHERE DBNAME = 'DSN8D91A'                                              00101005
   AND TYPE = 'T'                                                       00120000
-- AND CREATOR IN ('FRP2LDR'                                            00121005
--                ,'DBA1SAH'                                            00122005
--                ,'ZZGLACPT'                                           00123005
--                ,'ZZPSDEMO'                                           00124005
--                ,'DBA1SRG'                                            00125005
--                ,'FRP1MFW'                                            00126005
--                ,'PSDEVL'                                             00127005
--                ,'ZZPRDEMO'                                           00128005
--                ,'PRACPT'                                             00129005
--                ,'PRDUPD'                                             00129105
--                ,'ZZPRTEST'                                           00129205
--                ,'ZZPSTEST')                                          00129305
ORDER BY 2,3,4                                                          00130000
