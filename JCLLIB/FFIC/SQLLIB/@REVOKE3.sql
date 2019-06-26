SELECT A.GRANTEE, B.DBNAME, A.TCREATOR, A.TTNAME,                       00000110
    A.SELECTAUTH,A.INSERTAUTH, A.UPDATEAUTH, A.DELETEAUTH,              00000211
    A.ALTERAUTH,A.INDEXAUTH, A.DBNAME                                   00000311
--' REVOKE INSERT ON '||STRIP(A.TCREATOR)||'.'||STRIP(A.TTNAME)||       00000411
--' FROM '||STRIP(A.GRANTEE)||' BY ALL;'                                00000511
  FROM SYSIBM.SYSTABAUTH A                                              00000611
     , SYSIBM.SYSTABLES  B                                              00000711
 WHERE                                                                  00000811
       A.GRANTEETYPE = ' '                                              00000911
   AND STRIP(A.GRANTEE)||'.'||STRIP(B.DBNAME) IN (                      00001011
      'SEE2MKL.DSRU0P00',                                               00001111
      'SEE2MKL.DUDT2P00',                                               00001211
      'CIE1SXR.DCEI0P00',                                               00001311
      'PER1MER.DPER0P00',                                               00001411
      'ROS1CSR.DROS0P00',                                               00001511
      'ROS1CSR.DUOLRDB0',                                               00001611
      'RVS2TJS.DUBS0P00',                                               00001711
      'REX1PMS.DCEI0P00',                                               00001811
      'REX1PMS.DCDI0P00',                                               00001911
      'REX1PMS.DROF0P00',                                               00002011
      'REX1PMS.DSIS0P00',                                               00002111
      'REX1PMS.DPAN0P00',                                               00002211
      'REX1PMS.DCIZ0P00')                                               00002311
-- AND A.SELECTAUTH = 'Y'                                               00002411
   AND A.TCREATOR = B.CREATOR                                           00002511
   AND A.TTNAME = B.NAME                                                00002611
   AND B.TYPE = 'T'                                                     00002711
 ORDER BY 1, 2,3,4                                                      00002811
;                                                                       00002911
FIM;                                                                    00003011
--                                                                      00003111
-- REVOKE INSERT ON OWNER.NAME FROM GRANTEE BY ALL;                     00003211
--                                                                      00004000
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
