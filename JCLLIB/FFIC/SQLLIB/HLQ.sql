--LISTC LVL(AIMDA.DSNDBD) ALL                                           00001003
--SELECT 'DB2A', VCATNAME, NAME                                         00002003
SELECT DISTINCT 'LISTC LVL ('||STRIP(VCATNAME)||') ALL'                 00010004
  FROM SYSIBM.SYSSTOGROUP                                               00020000
;                                                                       00021005
SELECT DISTINCT 'DB2D,40,'||STRIP(VCATNAME)                             00030005
  FROM SYSIBM.SYSSTOGROUP                                               00040005
