--ALTER TABLESPACE DB2ADM.CICEROTS PRIQTY 48000;                                
--COMMIT;                                                                       
--  SELECT * FROM DB2ADM.TESTE;                                                 
--                                                                              
--  CREATE  TABLESPACE CICEROTS                                                 
--  IN      DB2ADM                                                              
--  USING   STOGROUP STGP03D                                                    
--             PRIQTY 192                                                       
--             SECQTY 192                                                       
--             ERASE NO                                                         
--             FREEPAGE 0                                                       
--             PCTFREE  0                                                       
--             BUFFERPOOL BP1                                                   
--             LOCKSIZE ROW                                                     
--             CLOSE NO                                                         
--             LOCKMAX SYSTEM                                                   
--             CCSID EBCDIC                                                     
--      ;                                                                       
--  COMMIT;                                                                     
--                                                                              
--  CREATE  TABLE DB2ADM.TESTE                                                  
--          LIKE  MARITIMA.UF                                                   
--            IN DB2ADM.CICEROTS;                                               
--  COMMIT;                                                                     
--  DROP TABLE DB2ADM.TESTE;                                                    
--                                                                              
-- CREATE INDEX DB2ADM.TESTEIX                                                  
--     ON DB2ADM.TESTE                                                          
--  (SIGLAUF)                                                                   
--     USING STOGROUP STGP20I                                                   
--         PRIQTY 48                                                            
--         SECQTY 48                                                            
--     PCTFREE 10                                                               
--     BUFFERPOOL BP2                                                           
--     CLOSE NO                                                                 
--     COPY NO                                                                  
-- ;                                                                            
-- COMMIT;                                                                      
