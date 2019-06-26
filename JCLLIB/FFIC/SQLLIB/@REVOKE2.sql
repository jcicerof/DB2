--                                                                      00002510
-- REVOKE DE VIEWS                                                      00002624
-- REVOKE INSERT ON OWNER.NAME FROM GRANTEE BY ALL;                     00002724
--                                                                      00003010
SELECT                                                                  02082000
' REVOKE INSERT ON '||STRIP(B.DCREATOR)||'.'||STRIP(B.DNAME)||          02083013
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  02084001
  FROM SYSIBM.SYSTABAUTH A,                                             02085001
       SYSIBM.SYSVIEWDEP B                                              02085112
 WHERE B.BCREATOR = 'DB2TEST'                                           02086025
   AND B.BNAME IN ('CLIENT_TAB')                                        02086112
   AND B.BTYPE = 'T'                                                    02086220
   AND A.GRANTEETYPE = ' '                                              02086317
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    02087000
   AND A.GRANTEE IN ('ZZPMXAP', 'ZZPMXUS')                              02087125
   AND A.INSERTAUTH = 'Y'                                               02088017
   AND A.TCREATOR = B.DCREATOR                                          02088315
   AND A.TTNAME   = B.DNAME                                             02088415
UNION ALL                                                               02109800
SELECT                                                                  02109922
' REVOKE UPDATE ON '||STRIP(B.DCREATOR)||'.'||STRIP(B.DNAME)||          02110021
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  02110121
  FROM SYSIBM.SYSTABAUTH A,                                             02110221
       SYSIBM.SYSVIEWDEP B                                              02110321
 WHERE B.BCREATOR = 'DB2TEST'                                           02110425
   AND B.BNAME IN ('CLIENT_TAB')                                        02110521
   AND B.BTYPE = 'T'                                                    02110621
   AND A.GRANTEETYPE = ' '                                              02110721
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    02110821
   AND A.GRANTEE IN ('ZZPMXAP', 'ZZPMXUS')                              02110925
   AND A.UPDATEAUTH = 'Y'                                               02111021
   AND A.TCREATOR = B.DCREATOR                                          02111121
   AND A.TTNAME   = B.DNAME                                             02111221
UNION ALL                                                               04240000
SELECT                                                                  04240122
' REVOKE DELETE ON '||STRIP(B.DCREATOR)||'.'||STRIP(B.DNAME)||          04241021
' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                  04242021
  FROM SYSIBM.SYSTABAUTH A,                                             04243021
       SYSIBM.SYSVIEWDEP B                                              04244021
 WHERE B.BCREATOR = 'DB2TEST'                                           04245025
   AND B.BNAME IN ('CLIENT_TAB')                                        04246021
   AND B.BTYPE = 'T'                                                    04247021
   AND A.GRANTEETYPE = ' '                                              04248021
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    04249021
   AND A.GRANTEE IN ('ZZPMXAP', 'ZZPMXUS')                              04249125
   AND A.DELETEAUTH = 'Y'                                               04249221
   AND A.TCREATOR = B.DCREATOR                                          04249321
   AND A.TTNAME   = B.DNAME                                             04249421
