--                                                                      00000107
-- REVOKE INSERT ON OWNER.NAME FROM GRANTEE BY ALL;                     00000207
--                                                                      00000307
SELECT                                                                  02082010
' REVOKE INSERT ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||             02083015
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    02084010
  FROM SYSIBM.SYSTABAUTH                                                02085010
 WHERE TCREATOR = 'DB2ACPT'                                             02086021
   AND GRANTEETYPE = ' '                                                02086112
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    02087011
   AND GRANTEE IN ('ZZPMXTC', 'ZZPMXUS')                                02087121
   AND INSERTAUTH = 'Y'                                                 02088010
   AND TTNAME IN ('CLIENT_TAB')                                         02088116
UNION ALL                                                               02109817
SELECT                                                                  02109910
' REVOKE UPDATE ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||             02110015
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    02111010
  FROM SYSIBM.SYSTABAUTH                                                02120008
 WHERE TCREATOR = 'DB2ACPT'                                             02130021
   AND GRANTEETYPE = ' '                                                02131012
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    02140011
   AND GRANTEE IN ('ZZPMXTC', 'ZZPMXUS')                                02141021
   AND UPDATEAUTH = 'Y'                                                 02150008
   AND TTNAME IN ('CLIENT_TAB')                                         02151016
UNION ALL                                                               04240017
SELECT                                                                  04250008
' REVOKE DELETE ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||             04260015
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    04270008
  FROM SYSIBM.SYSTABAUTH                                                04280008
 WHERE TCREATOR = 'DB2ACPT'                                             04290021
   AND GRANTEETYPE = ' '                                                04291012
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    04300011
   AND GRANTEE IN ('ZZPMXTC', 'ZZPMXUS')                                04301021
   AND DELETEAUTH = 'Y'                                                 04310008
   AND TTNAME IN ('CLIENT_TAB')                                         04311016
