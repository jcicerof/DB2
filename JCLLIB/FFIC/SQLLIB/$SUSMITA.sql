SELECT CT_CLM_SUB_OFF_NBR                                               00010000
     , CT_CLM_ATLAS_YR                                                  00020000
     , CT_CLM_SEQ_NBR                                                   00030000
     , COUNT(*)                                                         00040000
  FROM ERSPROD.MACT_CT_CLM_TRAUMA                                       00050000
 GROUP BY CT_CLM_SUB_OFF_NBR                                            00051000
        , CT_CLM_ATLAS_YR                                               00052000
        , CT_CLM_SEQ_NBR                                                00053000
 HAVING COUNT(*) > 1                                                    00054000
