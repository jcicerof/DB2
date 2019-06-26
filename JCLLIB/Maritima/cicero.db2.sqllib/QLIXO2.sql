SELECT DISTINCT ' INCLUDE TABLESPACE '                                  00010006
             || STRIP(DBNAME)||'.'||STRIP(TSNAME)                       00011006
  FROM SYSIBM.SYSTABLES                                                 00012006
 WHERE TYPE = 'T'                                                       00013006
   AND CREATOR = 'RE99'                                                 00014006
   AND NAME IN (                                                        00015006
    'CADAPMES','CADBANES','CADBCOFX','CADAPOL','CADPARCL',              00016006
    'CADCALPRNE','CADAPRMO','CADCOMIS','CADAPPCP',                      00017006
    'CADOBSER','CADAUXIL','CADAPCOB','CADAPFRA','CADAPLCR',             00018006
    'CADVIDA','CADAPCOR','CADAURSM','CADAUAUT',                         00019006
    'CADAURCF','CADAUAPP','CADAUVID','CADAUTXE','CADAUPCL',             00020006
    'CADAUPCP','CADAMCOB','CADAMRSM','CADAPCHQ',                        00030006
    'CADAPEMI','CADAPLIB','CADAUDIS','CADITEBNF','CADAUASS',            00040006
    'CADAURES','CADAUCOP','CADPERFIL','CADAUOPC',                       00041006
    'CADAUCEX','CADCOMPL','CADDESAG','CADLEASI','CADTRCIA',             00041106
    'CADAUASS')                                                         00041206
     ;                                                                  00041306
