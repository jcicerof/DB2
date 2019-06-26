--DROP TABLESPACE DB2ADM.RPTMVIEW;                                              
--COMMIT;                                                                       
CREATE TABLESPACE RPTMVIEW                                                      
    IN DB2ADM                                                                   
    USING STOGROUP STGP70D                                                      
    PRIQTY 22800                                                                
    SECQTY 2400                                                                 
    ERASE NO                                                                    
    PCTFREE 0                                                                   
    BUFFERPOOL BP1                                                              
    LOCKSIZE ANY                                                                
    CLOSE NO                                                                    
    COMPRESS YES                                                                
;                                                                               
COMMIT;                                                                         
                                                                                
CREATE TABLE DB2ADM.RPTMVIEW                                                    
(                                                                               
    DATA      DATE         NOT NULL WITH DEFAULT,                               
    LOCATION  CHAR(16)     NOT NULL,                                            
    COLLID    CHAR(18)     NOT NULL,                                            
    PROGRAM   CHAR(18)     NOT NULL,                                            
    #EXEC     INTEGER      NOT NULL,                                            
    #SQL      INTEGER      NOT NULL,                                            
    ELAPSED   DECIMAL(9,3) NOT NULL,                                            
    CPUTIME   DECIMAL(9,3) NOT NULL,                                            
    WAITTIME  DECIMAL(9,3) NOT NULL                                             
)                                                                               
    IN DB2ADM.RPTMVIEW                                                          
;                                                                               
COMMIT;                                                                         
                                                                                
COMMENT ON TABLE DB2ADM.RPTMVIEW IS                                             
'RELATORIO DO MAINVIEW NO INTERVALO ENTRE 08:00 E 20:00'                        
;                                                                               
COMMENT ON DB2ADM.RPTMVIEW                                                      
(   DATA      IS 'DATA'                                                         
   ,LOCATION  IS 'LOCATION DB2'                                                 
   ,COLLID    IS 'COLLECTION DB2'                                               
   ,PROGRAM   IS 'NOME DO PROGRAMA'                                             
   ,#EXEC     IS 'NUMERO DE EXECUCOES'                                          
   ,#SQL      IS 'NUMERO DE COMANDOS SQL'                                       
   ,ELAPSED   IS 'ELAPSED TIME EM SEGUNDOS'                                     
   ,CPUTIME   IS 'CPU TIME EM SEGUNDOS'                                         
   ,WAITTIME  IS 'WAIT TIME EM SEGUNDOS')                                       
;                                                                               
COMMIT;                                                                         
                                                                                
CREATE INDEX DB2ADM.RPTMVIEW_I1                                                 
    ON DB2ADM.RPTMVIEW(DATA)                                                    
    USING STOGROUP STGP70I                                                      
        PRIQTY 22800                                                            
        SECQTY 2400                                                             
    PCTFREE 5                                                                   
    BUFFERPOOL BP2                                                              
    CLOSE NO                                                                    
    COPY NO                                                                     
;                                                                               
COMMIT;                                                                         
CREATE INDEX DB2ADM.RPTMVIEW_I2                                                 
    ON DB2ADM.RPTMVIEW(COLLID, PROGRAM)                                         
    USING STOGROUP STGP70I                                                      
        PRIQTY 22800                                                            
        SECQTY 2400                                                             
    PCTFREE 5                                                                   
    BUFFERPOOL BP2                                                              
    CLOSE NO                                                                    
    COPY NO                                                                     
;                                                                               
COMMIT;                                                                         
