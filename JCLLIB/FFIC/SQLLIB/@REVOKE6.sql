--                                                                      00000100
-- REVOKE PUBLIC ACCESS                                                 00000201
--                                                                      00000300
SELECT                                                                  02082000
' REVOKE INSERT ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||             02083000
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    02084000
  FROM SYSIBM.SYSTABAUTH                                                02085000
 WHERE TCREATOR = 'DB2ACPT'                                             02086000
   AND GRANTEETYPE = ' '                                                02086100
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    02087000
   AND GRANTEE IN ('ZZPMXTC', 'ZZPMXUS')                                02087100
   AND INSERTAUTH = 'Y'                                                 02088000
   AND TTNAME IN ('CLIENT_TAB')                                         02088100
UNION ALL                                                               02109800
SELECT                                                                  02109900
' REVOKE UPDATE ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||             02110000
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    02111000
  FROM SYSIBM.SYSTABAUTH                                                02120000
 WHERE TCREATOR = 'DB2ACPT'                                             02130000
   AND GRANTEETYPE = ' '                                                02131000
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    02140000
   AND GRANTEE IN ('ZZPMXTC', 'ZZPMXUS')                                02141000
   AND UPDATEAUTH = 'Y'                                                 02150000
   AND TTNAME IN ('CLIENT_TAB')                                         02151000
UNION ALL                                                               04240000
SELECT                                                                  04250000
' REVOKE DELETE ON '||STRIP(TCREATOR)||'.'||STRIP(TTNAME)||             04260000
' FROM '||STRIP(GRANTEE)||' BY ALL;'                                    04270000
  FROM SYSIBM.SYSTABAUTH                                                04280000
 WHERE TCREATOR = 'DB2ACPT'                                             04290000
   AND GRANTEETYPE = ' '                                                04291000
   --AND SUBSTR(GRANTEE,1,2) <> 'ZZ'                                    04300000
   AND GRANTEE IN ('ZZPMXTC', 'ZZPMXUS')                                04301000
   AND DELETEAUTH = 'Y'                                                 04310000
   AND TTNAME IN ('CLIENT_TAB')                                         04311000
