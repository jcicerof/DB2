                                                                                
SELECT *                                                                        
  FROM CSPPUSER.PLAN_TABLE A,                                                   
       CSPPUSER.DSN_STATEMNT_TABLE B,                                           
       SYSIBM.SYSINDEXES           C                                            
 WHERE B.QUERYNO = A.QUERYNO                                                    
   AND B.APPLNAME = A.APPLNAME                                                  
   AND B.PROGNAME = A.PROGNAME                                                  
   AND B.PROGNAME IN (                                                          
'NM100D1   ',                                                                   
'AU65A     ',                                                                   
'SSR0200L  ',                                                                   
'SS345A    ',                                                                   
'REMO221R  ',                                                                   
'GR001R1   ',                                                                   
'REMI635R  ',                                                                   
'RE71A     ',                                                                   
'SB145A1   ',                                                                   
'SS569A    ',                                                                   
'MK005R1   ',                                                                   
'PW01A     ',                                                                   
'SNST018L  ',                                                                   
'PP09A     ',                                                                   
'PWR0001L  ',                                                                   
'SB28A01   ',                                                                   
'GD500D3   ',                                                                   
'AP110R1   ',                                                                   
'SNA9005R  ',                                                                   
'REMO225L  ')                                                                   
-- AND A.TNAME    = 'SSPGMSEG'                                                  
   AND C.CREATOR = A.ACCESSCREATOR                                              
   AND C.NAME    = A.ACCESSNAME                                                 
-- AND A.QUERYNO = 4096                                                         
   ORDER BY A.QUERYNO, A.QBLOCKNO, A.PLANNO, A.MIXOPSEQ                         
WITH UR;                                                                        
