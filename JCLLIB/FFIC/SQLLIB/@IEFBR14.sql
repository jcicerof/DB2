SELECT DISTINCT                                                         00010004
       ' DELETE '||                                                     00020013
       SUBSTR(DSNAME,1,(LOCATE_IN_STRING(DSNAME,'.',10)))||'*'          00021015
  FROM SYSIBM.SYSCOPY                                                   00030000
 WHERE ICTYPE = 'F'                                                     00040000
