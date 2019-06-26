   SELECT DISTINCT ' CREATE ALIAS ' ||                                  00010007
          STRIP(CREATOR) || '.' || STRIP(NAME)                          00020000
          ,CREATOR,NAME,LOCATION,TBCREATOR,TBNAME,1                     00030003
     FROM SYSIBM.SYSTABLES , SYSIBM.SYSPACKDEP                          00060000
    WHERE TYPE = 'A'                                                    00070000
      AND CREATOR = BQUALIFIER                                          00080000
      AND NAME    = BNAME                                               00090000
      AND BTYPE   = 'A'                                                 00100000
      AND LOCATION NOT IN (' ','DB2J') -- EXCLUDE LOCAL ALIAS           00120000
  UNION                                                                 00130000
   SELECT DISTINCT                                                      00130100
          '          FOR ' || STRIP(LOCATION) || '.' ||                 00130304
          STRIP(TBCREATOR) || '.' || STRIP(TBNAME)||';'                 00130404
          ,CREATOR,NAME,LOCATION,TBCREATOR,TBNAME,2                     00130500
     FROM SYSIBM.SYSTABLES , SYSIBM.SYSPACKDEP                          00130600
    WHERE TYPE = 'A'                                                    00130700
      AND CREATOR = BQUALIFIER                                          00130800
      AND NAME    = BNAME                                               00130900
      AND BTYPE   = 'A'                                                 00131000
      AND LOCATION NOT IN (' ','DB2J') -- EXCLUDE LOCAL ALIAS           00131107
  UNION                                                                 00141006
   SELECT DISTINCT ' CREATE ALIAS ' ||                                  00150007
          STRIP(CREATOR) || '.' || STRIP(NAME)                          00160005
          ,CREATOR,NAME,LOCATION,TBCREATOR,TBNAME,1                     00161005
     FROM SYSIBM.SYSTABLES , SYSIBM.SYSPLANDEP                          00200000
    WHERE TYPE = 'A'                                                    00210000
      AND CREATOR = BCREATOR                                            00220000
      AND NAME    = BNAME                                               00230000
      AND BTYPE   = 'A'                                                 00240000
      AND LOCATION NOT IN (' ','DB2J') -- EXCLUDE LOCAL ALIAS           00260000
 UNION                                                                  00271005
   SELECT DISTINCT                                                      00272005
          '          FOR ' || STRIP(LOCATION) || '.' ||                 00274008
          STRIP(TBCREATOR) || '.' || STRIP(TBNAME)                      00275005
          || ';'                                                        00276005
          ,CREATOR,NAME,LOCATION,TBCREATOR,TBNAME,2                     00276105
     FROM SYSIBM.SYSTABLES , SYSIBM.SYSPLANDEP                          00277005
    WHERE TYPE = 'A'                                                    00278005
      AND CREATOR = BCREATOR                                            00279005
      AND NAME    = BNAME                                               00279105
      AND BTYPE   = 'A'                                                 00279205
      AND LOCATION NOT IN (' ','DB2J') -- EXCLUDE LOCAL ALIAS           00279305
    ORDER BY 2,3,4,5,6,7                                                00279407
   ;                                                                    00280000
-- FIM;                                                                 00281009
-- CREATE ALL EXISTING REMOTE ALIAS                                     00290000
   SELECT DISTINCT  'CREATE ALIAS ' ||                                  00300000
          STRIP(CREATOR) || '.' || STRIP(NAME)                          00310009
          ,CREATOR,NAME,LOCATION,TBCREATOR,TBNAME,1                     00341009
     FROM SYSIBM.SYSTABLES                                              00350000
    WHERE TYPE = 'A'                                                    00360000
      AND LOCATION NOT IN (' ','DB2J') -- EXCLUDE LOCAL ALIAS           00380000
UNION                                                                   00390009
   SELECT DISTINCT                                                      00391009
          '   FOR ' || STRIP(LOCATION, B) || '.' ||                     00393009
          STRIP(TBCREATOR) || '.' || STRIP(TBNAME)                      00394009
          || ';'                                                        00395009
          ,CREATOR,NAME,LOCATION,TBCREATOR,TBNAME,2                     00395109
     FROM SYSIBM.SYSTABLES                                              00396009
    WHERE TYPE = 'A'                                                    00397009
      AND LOCATION NOT IN (' ','DB2J') -- EXCLUDE LOCAL ALIAS           00398009
    ORDER BY 2,3,4,5,6,7                                                00399009
   ;                                                                    00400000
