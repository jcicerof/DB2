-- ALTER TABLE CREATOR.NAME ADD RESTRICT ON DROP;                       00001001
SELECT DISTINCT                                                         00010103
       'ALTER TABLE '||STRIP(A.CREATOR)||'.'||STRIP(A.NAME)||           00010202
       ' ADD RESTRICT ON DROP;'                                         00010302
  FROM SYSIBM.SYSTABLES A,                                              00011000
       SYSIBM.SYSTABLESPACE B                                           00012000
 WHERE B.SEGSIZE = 0                                                    00020000
   AND A.TYPE = 'T'                                                     00030000
   AND A.DBNAME = B.DBNAME                                              00040000
   AND A.TSNAME = B.NAME                                                00050000
-- AND A.CREATOR IN ('AZLTEST'                                          00060004
--                  ,'DBA1ADM'                                          00070004
--                  ,'DBA1DAA'                                          00080004
--                  ,'DBA1SAH'                                          00090004
--                  ,'INTTEST'                                          00100004
--                  ,'MDB1JBK'                                          00110004
--                  ,'MDB1PTS'                                          00120004
--                  ,'NALACPT'                                          00130004
--                  ,'NALACPT'                                          00140004
--                  ,'NALTEST'                                          00150004
--                  ,'NALTEST'                                          00160004
--                  ,'PER1JAH'                                          00170004
--                  ,'ERSPROD'                                          00180004
--                  ,'HIP1MDO'                                          00190004
--                  ,'SRS1CCK')                                         00200004
   AND STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                       00201004
       'DLCDB.ARCHIV11'                                                 00230004
     , 'DLCDB.DLCLP11'                                                  00240004
     , 'DLCDB.DLCUTS11'                                                 00250004
     , 'DLCDB.DRCOPY11'                                                 00260004
     , 'DLCDB.ETRIGS31'                                                 00270004
     , 'DLCDB.EXCPTN11'                                                 00280004
     , 'DLCDB.JOBS11'                                                   00290004
     , 'DLCDB.OBJECT13'                                                 00300004
     , 'DLCDB.OBJEXT31'                                                 00310004
     , 'DLCDB.PAGELOG3'                                                 00320004
     , 'DLCDB.PROFIL11'                                                 00330004
     , 'DLCDB.RSTATS11'                                                 00340004
     , 'DLCDB.SALONE22'                                                 00350004
     , 'DLCDB.SCOLUM22'                                                 00360004
     , 'DLCDB.SYSCPY11'                                                 00370004
     , 'DLCDB.UTILTY13'                                                 00380004
     , 'DRTL0P00.SRTS0P01'                                              00390004
     , 'DSNDB04.DGORDGOD'                                               00400004
     , 'DSNDB04.DGORDGOP'                                               00410004
     , 'DSNRLST.DSNRLS01'                                               00420004
     , 'DSQ1STBB.DSQ1STBT'                                              00430004
     , 'DSQDBCTL.DSQTSCT1'                                              00440004
     , 'DSQDBCTL.DSQTSCT2'                                              00450004
     , 'DSQDBCTL.DSQTSCT3'                                              00460004
     , 'DSQDBCTL.DSQTSGOV'                                              00470004
     , 'DSQDBCTL.DSQTSLOG'                                              00480004
     , 'DSQDBCTL.DSQTSPRO'                                              00490004
     , 'DSQDBCTL.DSQTSSYN'                                              00500004
     , 'DSQDBDEF.DSQTSDEF')                                             00510004
