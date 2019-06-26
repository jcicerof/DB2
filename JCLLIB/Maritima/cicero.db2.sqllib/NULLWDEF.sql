-- DROP TABLE DB2ADM.LIXOT;                                                     
--COMMIT;                                                                       
--                                                                              
--   CREATE TABLE DB2ADM.LIXOT                                                  
--   (NUMERO      INTEGER NOT NULL                                              
--   ,CODIGO_NNWD INTEGER NOT NULL WITH DEFAULT                                 
--   ,CODIGO_NND  INTEGER NOT NULL      DEFAULT                                 
--   ,CODIGO_WD   INTEGER          WITH DEFAULT                                 
--   ,CODIGO_D    INTEGER               DEFAULT)                                
--   IN DB2ADM.CICEROTS;                                                        
-- COMMIT;                                                                      
-- INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (1);                                
-- INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (2);                                
-- INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (3);                                
-- INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (4);                                
-- INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (5);                                
-- INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (6);                                
-- COMMIT;                                                                      
--SELECT * FROM DB2ADM.LIXOT;                                                   
--COMMIT;                                                                       
--ALTER TABLE DB2ADM.LIXOT                                                      
--  ADD DIAHOJE DATE NOT NULL WITH DEFAULT;                                     
--COMMIT;                                                                       
--INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (7);                                 
--INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (8);                                 
--INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (9);                                 
--COMMIT;                                                                       
--SELECT * FROM DB2ADM.LIXOT;                                                   
--COMMIT;                                                                       
--ALTER TABLE DB2ADM.LIXOT                                                      
--  ADD DDD SMALLINT NOT NULL WITH DEFAULT 011;                                 
--COMMIT;                                                                       
--INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (10);                                
--INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (11);                                
--INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (12);                                
--COMMIT;                                                                       
  SELECT * FROM DB2ADM.LIXOT;                                                   
  COMMIT;                                                                       
  ALTER TABLE DB2ADM.LIXOT                                                      
    ADD DIAONTEM DATE NOT NULL WITH DEFAULT '2007-05-01';                       
  COMMIT;                                                                       
  INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (13);                                
  INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (14);                                
  INSERT INTO DB2ADM.LIXOT (NUMERO) VALUES (15);                                
  COMMIT;                                                                       
  SELECT * FROM DB2ADM.LIXOT;                                                   
