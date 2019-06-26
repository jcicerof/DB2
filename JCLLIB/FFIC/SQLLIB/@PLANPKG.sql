SELECT DISTINCT 'DB2Q' AS SUBSYS,                                       00010015
'PACKAGE' AS TYPE, STRIP(A.DCOLLID)||'.'||STRIP(A.DNAME) AS NAME,       00011003
C.VALID, C.OPERATIVE,                                                   00011106
C.OWNER, C.CREATOR,C.BINDTIME                                           00011204
  FROM SYSIBM.SYSPACKDEP A,                                             00012000
       SYSIBM.SYSTABLES B,                                              00013003
       SYSIBM.SYSPACKAGE C                                              00013103
 WHERE                                                                  00014000
       B.TYPE       = 'T'                                               00015000
-- AND B.DBNAME     IN ('DIRB0PPR')                                     00016000
-- AND A.BQUALIFIER IN ('FINPROD', 'IRBPPR')                            00017000
-- AND A.BNAME IN ('PERT_NC_REASONS')                                   00018000
   AND A.BQUALIFIER = B.CREATOR                                         00019000
   AND A.BNAME      = B.NAME                                            00020000
   AND A.DCOLLID    = C.COLLID                                          00021003
   AND A.DNAME      = C.NAME                                            00022003
   AND A.DCONTOKEN  = C.CONTOKEN                                        00023003
;                                                                       00024009
SELECT DISTINCT 'DB2Q' AS SUBSYS,                                       00040015
'PLAN' AS TYPE, STRIP(A.DNAME) AS NAME,                                 00050005
C.VALID, C.OPERATIVE,                                                   00051005
C.NAME,  C.CREATOR                                                      00052009
  FROM SYSIBM.SYSPLANDEP A,                                             00060000
       SYSIBM.SYSTABLES B,                                              00070005
       SYSIBM.SYSPLAN   C                                               00071005
 WHERE                                                                  00080000
       B.TYPE       = 'T'                                               00090000
-- AND B.DBNAME     IN ('DIRB0PPR')                                     00090100
-- AND A.BCREATOR   IN ('FINPROD', 'IRBPPR')                            00090200
-- AND A.BNAME IN ('PERT_NC_REASONS')                                   00090300
   AND A.BCREATOR   = B.CREATOR                                         00090400
   AND A.BNAME      = B.NAME                                            00090500
   AND C.NAME       = A.DNAME                                           00090605
