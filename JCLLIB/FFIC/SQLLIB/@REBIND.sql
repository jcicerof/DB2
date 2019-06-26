SELECT DISTINCT                                                         00010002
'REBIND PACKAGE ('||STRIP(A.DCOLLID)||'.'||STRIP(A.DNAME)||')'          00011030
  FROM SYSIBM.SYSPACKDEP A                                              00020046
      ,SYSIBM.SYSTABLES B                                               00030046
 WHERE                                                                  00040233
       B.TYPE       = 'T'                                               00040334
   AND A.BQUALIFIER = B.CREATOR                                         00041240
-- AND B.DBNAME     IN ('DDBA0T00'                                      00042352
--                     ,'DLCDB'                                         00042452
--                     ,'DRTL0P00')                                     00042552
   AND STRIP(A.BQUALIFIER)||'.'||STRIP(A.BNAME) IN (                    00042654
            'ERSPROD.MACT_A1_AMOUNT')                                   00042756
UNION ALL                                                               00063503
SELECT DISTINCT                                                         00063603
'REBIND PLAN ('||STRIP(A.DNAME)||')'                                    00064030
  FROM SYSIBM.SYSPLANDEP A                                              00070046
      ,SYSIBM.SYSTABLES B                                               00080046
 WHERE                                                                  00090033
       B.TYPE       = 'T'                                               00090134
-- AND B.DBNAME     IN ('DDBA0T00'                                      00090252
--                     ,'DLCDB'                                         00090352
--                     ,'DRTL0P00')                                     00090452
   AND STRIP(A.BCREATOR)||'.'||STRIP(A.BNAME) IN (                      00090554
            'ERSPROD.MACT_A1_AMOUNT')                                   00090656
