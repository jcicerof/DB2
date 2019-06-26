SELECT VCATNAME,COUNT(*) FROM SYSIBM.SYSSTOGROUP                        00010000
WHERE VCATNAME LIKE 'CLID%'                                             00011000
GROUP BY VCATNAME                                                       00020000
ORDER BY 2 DESC                                                         00030000
