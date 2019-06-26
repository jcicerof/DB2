--REBIND PACKAGE (MATBCOLE.AL504D1) ISOLATION(CS) EXPLAIN(YES)                  
--                                                                              
SELECT DISTINCT                                                                 
--     'REBIND PACKAGE('||STRIP(COLLID)||'.'||STRIP(NAME)||                     
--     ') ISOLATION(CS) EXPLAIN(YES)'                                           
  'INCLUDE TABLESPACE ('||                                                      
  STRIP(B.BQUALIFIER)||'.'||STRIP(B.BNAME)||')'                                 
  ,NACTIVE                                                                      
  FROM SYSIBM.SYSPACKAGE A,                                                     
       SYSIBM.SYSPACKDEP B,                                                     
       SYSIBM.SYSTABLESPACE C                                                   
 WHERE A.LOCATION = B.DLOCATION                                                 
   AND A.COLLID   = B.DCOLLID                                                   
   AND A.NAME     = B.DNAME                                                     
   AND A.CONTOKEN = B.DCONTOKEN                                                 
   AND C.DBNAME   = B.BQUALIFIER                                                
   AND C.NAME     = B.BNAME                                                     
-- AND B.BQUALIFIER LIKE 'DB%'                                                  
   AND B.BTYPE    = 'R'                                                         
-- AND A.VALID    = 'N'                                                         
--                                                                              
   AND A.NAME IN ( 'NM100D1'                                            00020125
                  ,'EN500D1'                                            00020225
                  ,'TA095D1'                                            00020325
                  ,'SSR0200L'                                           00020425
                  ,'RE71A'                                              00020525
                  ,'TA122D1'                                            00020625
                  ,'TA112D1'                                            00020725
                  ,'AL050D2'                                            00020825
                  ,'OR509D1'                                            00020925
                  ,'CB20A'                                              00021025
                  ,'RE74A'                                              00021125
                  ,'OR529D2'                                            00021325
                  ,'PR500D1'                                            00021425
                  ,'SS695A'                                             00021525
                  ,'SSR0133R'                                           00021625
                  ,'SNA9010R'                                           00021725
                  ,'SNA9005R'                                           00021825
                  ,'BM500D1'                                            00021925
                  ,'AP110R1'                                            00022025
                  ,'PW01A'                                              00022125
                  ,'TA103D1'                                            00022125
                  ,'OR507D1'                                            00022125
                  ,'AL040D1'                                            00022125
                  ,'SB172A'                                             00022125
                  ,'SA379A'                                             00022125
                  ,'MK005R1'                                            00022125
                  ,'AE500D2'                                            00022125
                  ,'PE524D1'                                            00022125
                  ,'SS230A'                                             00022125
                  ,'SNST018L'                                           00022125
                  ,'EEDATAS'                                            00022125
                  ,'PWR0001L'                                           00022125
                  ,'SS790A'                                             00022125
                  ,'PR511D1'                                            00022125
                  ,'PE525D1'                                            00022125
                  ,'OR530D1'                                            00022125
                  ,'TA099D1'                                            00022125
                  ,'TA288D2'                                            00022125
                  ,'OR155D1'                                            00022125
                  ,'AL221D1'                                            00022125
                  ,'TA273D2'                                            00022125
                  ,'AC100A'                                             00022125
                  ,'TA191D2'                                            00022125
                  ,'SS052A'                                             00022125
                  ,'AE500D1'                                            00022125
                  ,'SN60A01'                                            00022125
                  ,'OR523D1')                                           00022125
-- AND B.BNAME    IN ('GPTANEXO','MOVPROPOSTA')                                 
ORDER BY NACTIVE DESC                                                           
FOR READ ONLY WITH UR;                                                  00060000
