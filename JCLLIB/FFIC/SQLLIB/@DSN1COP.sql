SELECT COUNT(*) FROM DB2TEST.CPI_POLICY;                                00001004
SELECT DBID, PSID FROM SYSIBM.SYSTABLESPACE WHERE NAME='SZPP0T00'       00010001
AND DBNAME='DCPI0T00';                                                  00020001
                                                                        00020101
SELECT NAME, OBID FROM SYSIBM.SYSTABLES                                 00021001
WHERE TSNAME='SZPP0T00' AND CREATOR= 'DB2TEST';                         00030001
