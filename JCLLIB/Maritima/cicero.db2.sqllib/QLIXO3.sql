SELECT DISTINCT STRIP(A.DCOLLID)||'.'||STRIP(A.DNAME)                   00001021
FROM SYSIBM.SYSPACKDEP A                                                00002014
   , SYSIBM.SYSTABLES B                                                 00002114
WHERE A.DNAME IN ('RP51A', 'RE71A')                                     00003023
  AND A.BTYPE = 'T'                                                     00004022
  AND A.BTYPE = B.TYPE                                                  00004114
  AND A.BNAME = B.NAME                                                  00005014
  AND A.BQUALIFIER = B.CREATOR                                          00006014
  AND B.CREATOR = 'TECINFOR'                                            00007019
--AND B.NAME   IN ('CNDGERENQANE'   ,                                   00008022
--                 'CNDGERENQCLS'   ,                                   00009022
--                 'CNDGERENQFILA'  ,                                   00010022
--                 'CNDGERENQPRR'   ,                                   00020022
--                 'CNDGERENQTIPACT',                                   00030022
--                 'CNDGERENQVAL'   ,                                   00040022
--                 'CONDICAOGERENQ1',                                   00050022
--                 'CONDICAOGERENQ2',                                   00060022
--                 'CONDICAOGERENQ3',                                   00070022
--                 'PARAMETROGERAL' ,                                   00071022
--                 'PARAMETROGERSEQ')                                   00072022
WITH UR;                                                                00080008
