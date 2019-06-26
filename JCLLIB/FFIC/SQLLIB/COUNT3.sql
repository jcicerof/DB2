SELECT TCH_OBJECT_KEY,CLIENT_ID,CIOR_EFF_DT,COUNT(*)                    00002001
FROM DB2CERT.CLT_OBJ_RELATION                                           00003001
WHERE HISTORY_VLD_NBR = 0                                               00004001
GROUP BY TCH_OBJECT_KEY,CLIENT_ID,CIOR_EFF_DT                           00005002
ORDER BY 4 DESC                                                         00006001
