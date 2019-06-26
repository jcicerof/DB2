--DROP TABLESPACE DB2ADM.DB2PCOPY;                                              
--COMMIT;                                                                       
CREATE TABLESPACE DB2PCOPY                                                      
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
                                                                                
CREATE TABLE DB2ADM.DB2PCOPY                                                    
(                                                                               
    DSNAME  CHAR(44)     NOT NULL                                               
)                                                                               
    IN DB2ADM.DB2PCOPY                                                          
;                                                                               
COMMIT;                                                                         
                                                                                
COMMENT ON TABLE DB2ADM.DB2PCOPY IS                                             
'LISTA DE DATASETS PRESENTES NA SYSIBM.SYSCOPY'                                 
;                                                                               
COMMENT ON DB2ADM.DB2PCOPY                                                      
(   DSNAME    IS 'DATASET NAME')                                                
;                                                                               
COMMIT;                                                                         
                                                                                
CREATE INDEX DB2ADM.DB2PCOPY_I1                                                 
    ON DB2ADM.DB2PCOPY(DSNAME)                                                  
    USING STOGROUP STGP70I                                                      
        PRIQTY 22800                                                            
        SECQTY 2400                                                             
    PCTFREE 5                                                                   
    BUFFERPOOL BP2                                                              
    CLOSE NO                                                                    
    COPY NO                                                                     
;                                                                               
COMMIT;                                                                         
