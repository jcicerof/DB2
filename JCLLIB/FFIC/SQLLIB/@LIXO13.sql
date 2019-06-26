SELECT
'-STOP DB('||STRIP(DBNAME)||') SP('||STRIP(TSNAME)||')'||
'  --'||STRIP(CREATOR)||'.'||STRIP(NAME)
  FROM SYSIBM.SYSTABLES
 WHERE TYPE = 'T'
   AND CREATOR IN ('QSTTEST', 'QSTPRVT')
   AND NAME IN ('QSTT_COUNTY'
               ,'QSTT_ISO_ADDRESS'
               ,'QSTT_ISO_LAT_LONG'
               ,'QSTT_ISO_TABLE'
               ,'QSTT_OBJECT'
               ,'QSTT_PRIDE_CD_CONV'
               ,'QSTT_RISK_APPR'
               ,'QSTT_TERRITORY')
;
SELECT
'-STOP DB('||STRIP(I.DBNAME)||') SP('||STRIP(I.INDEXSPACE)||')'||
'  --'||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSINDEXES I
 WHERE T.CREATOR = I.TBCREATOR
   AND T.NAME = I.TBNAME
   AND T.TYPE = 'T'
   AND T.CREATOR IN ('QSTTEST', 'QSTPRVT')
   AND T.NAME IN ('QSTT_COUNTY'
               ,'QSTT_ISO_ADDRESS'
               ,'QSTT_ISO_LAT_LONG'
               ,'QSTT_ISO_TABLE'
               ,'QSTT_OBJECT'
               ,'QSTT_PRIDE_CD_CONV'
               ,'QSTT_RISK_APPR'
               ,'QSTT_TERRITORY')
