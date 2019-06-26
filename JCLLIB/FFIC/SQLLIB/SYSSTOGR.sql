SELECT DISTINCT 'LISTC LVL ('||STRIP(VCATNAME)||'.DSNDBD) ALL'          00010004
  FROM SYSIBM.SYSSTOGROUP                                               00020001
 GROUP BY VCATNAME                                                      00030002
