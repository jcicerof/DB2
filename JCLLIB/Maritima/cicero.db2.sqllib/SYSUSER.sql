SELECT DISTINCT GRANTEE  FROM SYSIBM.SYSUSERAUTH                        00010014
 WHERE SYSADMAUTH = 'Y'                                                 00030013
;                                                                       00031012
FIM                                                                     00032012
SELECT * FROM SYSIBM.SYSTABAUTH                                         00040012
WHERE STNAME = 'SSNTFPCD'                                               00050012
--D GRANTEE = 'AUTOMAR'                                                 00060012
;                                                                       00070012
