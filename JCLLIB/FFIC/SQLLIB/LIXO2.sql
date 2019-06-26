SELECT EDPROC, VALPROC
  FROM SYSIBM.SYSTABLES
 WHERE ' 'NOT IN (EDPROC, VALPROC)
;
FIM;
SELECT UW_SUBM_ID,CHAR('|*|'),
       UW_CATEG_CD,CHAR('|*|'),
       UW_HOST_CHNG_CD,CHAR('|*|'),
  --   REPLACE(UW_ANALYSIS_TXT,X'0A',''),CHAR('|*|')
       UW_ANALYSIS_TXT
  FROM DB2ACPT.EIST_UW_ANALY_TEXT,
       DB2ACPT.EIST_SUBMISSION
 WHERE SU_SUBM_ID = UW_SUBM_ID
   AND SU_POL_PFX = 'XPE'
   AND UW_SUBM_ID = 00068803253;
SELECT UW_SUBM_ID,CHAR('|*|'),
       UW_CATEG_CD,CHAR('|*|'),
       UW_HOST_CHNG_CD,CHAR('|*|'),
       REPLACE(UW_ANALYSIS_TXT,X'0A',''),CHAR('|*|')
   --  UW_ANALYSIS_TXT
  FROM DB2ACPT.EIST_UW_ANALY_TEXT,
       DB2ACPT.EIST_SUBMISSION
 WHERE SU_SUBM_ID = UW_SUBM_ID
   AND SU_POL_PFX = 'XPE'
   AND UW_SUBM_ID = 00068803253;
