-- DROP VIEW                                                            00001003
SELECT TYPE,DBNAME,                                                     00010001
       'DROP VIEW '||STRIP(CREATOR)||'.'||STRIP(NAME)||';'              00020000
  FROM SYSIBM.SYSTABLES                                                 00030000
 WHERE NAME LIKE 'EDI%'  AND CREATOR='DB2ACPT' AND DBNAME ='DEDI0A00'   00040002
 AND TYPE = 'V'                                                         00050000
;                                                                       00060000
