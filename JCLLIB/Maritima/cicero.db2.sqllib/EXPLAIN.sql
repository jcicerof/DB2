DELETE FROM CICERO.PLAN_TABLE         WHERE QUERYNO=4096;                       
DELETE FROM CICERO.DSN_STATEMNT_TABLE WHERE QUERYNO=4096;                       
COMMIT;                                                                         
EXPLAIN ALL SET QUERYNO=4096 FOR                                                
SELECT STPGTBOL AS STATUS FROM DB2USER.PROPOSTAONBASE                           
WHERE DB2USER.PROPOSTAONBASE.SGSIS =?                                           
AND DB2USER.PROPOSTAONBASE.NRPPS = ?                                            
AND DB2USER.PROPOSTAONBASE.NRITE = ?                                            
    ;                                                                           
COMMIT;                                                                         
SELECT *                                                                        
  FROM CICERO.PLAN_TABLE A,                                                     
       CICERO.DSN_STATEMNT_TABLE B                                              
 WHERE A.QUERYNO = 4096                                                         
   AND B.QUERYNO = A.QUERYNO                                                    
 ORDER BY A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ;                                     
FIM                                                                             
SELECT IBMSNAP_COMMITSEQ, IBMSNAP_LOGMARKER                                     
    FROM "ASN" .IBMSNAP_UOW A                                                   
    WHERE A.IBMSNAP_COMMITSEQ = (SELECT VALUE(MIN(B.IBMSNAP_COMMITSEQ),         
          X'00000000000000000000' )                                             
    FROM "ASN" .IBMSNAP_UOW B                                                   
    WHERE (B.IBMSNAP_LOGMARKER >= TIMESTAMP(                                    
          '2007-08-17-12.06.48.852306' ) + 5 MINUTES)                           
          AND (B.IBMSNAP_LOGMARKER <= TIMESTAMP(                                
          '2007-10-23-07.43.54.337270' ))                                       
          AND (B.IBMSNAP_COMMITSEQ <= ?))                                       
    ;                                                                           
