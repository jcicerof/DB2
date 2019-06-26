SELECT                                                                  00010005
    SCHEMA,OWNER,NAME,ROUTINETYPE,                                      00012007
    LANGUAGE,COLLID,EXTERNAL_NAME,WLM_ENVIRONMENT                       00013035
  FROM SYSIBM.SYSROUTINES                                               00014005
WHERE NAME = 'SISESPMOVPROPS'                                           00020040
--WHERE EXTERNAL_NAME IN ('SQL60252')                                   00041036
ORDER BY NAME                                                           00041133
;                                                                       00042018
SELECT *                                                                00043022
  FROM SYSIBM.SYSROUTINES_SRC                                           00046025
WHERE ROUTINENAME = 'SISESPMOVPROPS'                                    00047040
--WHERE EXTERNAL_NAME IN ('SQL05624','SQL48808','SQL77117','SQL31289')  00048022
ORDER BY SCHEMA,ROUTINENAME,BUILDDATE,BUILDTIME,BUILDSTATUS,SEQNO       00048228
;                                                                       00049022
