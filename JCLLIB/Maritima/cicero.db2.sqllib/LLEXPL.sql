--SELECT MAX(EXPLAIN_TIME)                                                      
SELECT *                                                                        
  FROM CSPPUSER.PLAN_TABLE A,                                                   
       CSPPUSER.DSN_STATEMNT_TABLE B                                            
 WHERE                                                                          
       B.QUERYNO = A.QUERYNO                                                    
   AND A.COLLID   = 'MAPCCOLE'                                                  
   AND A.PROGNAME = 'NM100D1'                                                   
   AND A.PROGNAME = B.PROGNAME                                                  
   AND A.COLLID   = B.COLLID                                                    
   AND EXPLAIN_TIME = '2008-12-10-18.03.00.162094'                              
   AND BIND_TIME = '2008-12-10-18.03.00.162094'                                 
 ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ;                          
