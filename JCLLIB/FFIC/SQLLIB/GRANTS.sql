SELECT * FROM SYSIBM.SYSUSERAUTH A                                      00001004
WHERE A.GRANTEE IN (                                                    00002004
            SELECT B.GRANTEE FROM SYSIBM.SYSUSERAUTH B                  00010004
            WHERE B.DISPLAYAUTH = 'Y'                                   00020004
              AND B.GRANTEE LIKE 'ZZ%')                                 00030004
;                                                                       00031005
--SELECT DISTINCT A.GRANTEE,COUNT(*) AS #DB                             00040010
SELECT *                                                                00040110
FROM SYSIBM.SYSDBAUTH A                                                 00041009
WHERE A.DBADMAUTH = 'Y'                                                 00050012
  AND A.GRANTEE IN (                                                    00051012
            SELECT B.GRANTEE FROM SYSIBM.SYSDBAUTH B                    00060005
            WHERE B.DISPLAYDBAUTH = 'Y'                                 00070005
              AND B.GRANTEE LIKE 'ZZ%')                                 00080005
--GROUP BY A.GRANTEE                                                    00081011
;                                                                       00090005
