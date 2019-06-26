--                                                                              
  SELECT MAX(EXPLAIN_TIME),MAX(BIND_TIME)                                       
  FROM CSPPUSER.PLAN_TABLE A,                                                   
       CSPPUSER.DSN_STATEMNT_TABLE B                                            
   WHERE                                                                        
       B.QUERYNO = A.QUERYNO                                                    
   AND A.COLLID   = 'MAPCCOLE'                                                  
   AND A.PROGNAME = 'SSR0133R'                                                  
   AND A.PROGNAME = B.PROGNAME                                                  
   AND A.COLLID   = B.COLLID                                                    
    ;                                                                           
--    FIM;                                                                      
-- SELECT *                                                                     
--   FROM CSPPUSER.PLAN_TABLE A,                                                
--        CSPPUSER.DSN_STATEMNT_TABLE B                                         
--  WHERE                                                                       
--        B.QUERYNO = A.QUERYNO                                                 
--    AND A.COLLID   = 'MAPCCOLE'                                               
--    AND A.PROGNAME = 'OR155D1'                                                
--    AND A.PROGNAME = B.PROGNAME                                               
--    AND A.COLLID   = B.COLLID                                                 
-- -- AND ACCESSNAME = 'CONDICAOGERENQ2_IX'                                     
--    AND EXPLAIN_TIME = '2008-09-07-04.02.22.550719'                           
--    AND BIND_TIME = '2008-09-07-04.02.22.550719'                              
--  ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ;                       
