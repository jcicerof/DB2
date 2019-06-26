 SELECT MAX(BIND_TIME),MAX(EXPLAIN_TIME)                                        
 FROM MVSPUSER.PLAN_TABLE A,                                                    
      MVSPUSER.DSN_STATEMNT_TABLE B                                             
  WHERE                                                                         
      B.QUERYNO = A.QUERYNO                                                     
  AND A.COLLID   = 'MAPCCOLE'                                                   
  AND A.PROGNAME = 'SSR0133R'                                                   
  AND A.PROGNAME = B.PROGNAME                                                   
  AND A.COLLID   = B.COLLID                                                     
   ;                                                                            
