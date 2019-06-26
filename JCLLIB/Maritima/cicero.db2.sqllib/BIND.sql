SELECT DISTINCT 'REBIND PACKAGE ('||SUBSTR(COLLID,1,8)||'.'||GRANTEE||          
') ISOLATION(CS)'                                                               
FROM SYSIBM.SYSTABAUTH WHERE TCREATOR = 'MARITIMA'  AND                         
STNAME = 'SSMTLMDTAJMAR'                                                        
