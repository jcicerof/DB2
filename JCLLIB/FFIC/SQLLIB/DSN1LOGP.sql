SELECT NAME, DBNAME, HEX(DBID) AS XDBID, HEX(PSID) AS XPSID             00010002
FROM SYSIBM.SYSTABLESPACE                                               00011000
WHERE DBNAME = 'DQSTBT00'                                               00020000
  AND NAME IN ( 'SPOS0T00','SPNS0T00','SPMS0T00','SPLS0T00',            00030000
                'SPSS0T00')                                             00040000
