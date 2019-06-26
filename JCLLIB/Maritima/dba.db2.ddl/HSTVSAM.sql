--DROP TABLESPACE DB2ADM.HSTVSAM;                                               
--COMMIT;                                                                       
CREATE TABLESPACE HSTVSAM                                                       
    IN DB2ADM                                                                   
    USING STOGROUP STGP70D                                                      
    PRIQTY 22800                                                                
    SECQTY 2400                                                                 
    ERASE NO                                                                    
    PCTFREE 5                                                                   
    BUFFERPOOL BP1                                                              
    LOCKSIZE ANY                                                                
    CLOSE NO                                                                    
    COMPRESS YES                                                                
;                                                                               
COMMIT;                                                                         
                                                                                
CREATE TABLE DB2ADM.HSTVSAM                                                     
(                                                                               
    DATA      DATE         NOT NULL WITH DEFAULT,                               
    HORA      TIME         NOT NULL WITH DEFAULT,                               
    DSNAME    CHAR(44)     NOT NULL,                                            
    HI_A_RBA  FLOAT        NOT NULL,                                            
    HI_U_RBA  FLOAT        NOT NULL,                                            
    DBNAME    CHAR(8)      NOT NULL,                                            
    SPACENAM  CHAR(8)      NOT NULL                                             
)                                                                               
    IN DB2ADM.HSTVSAM                                                           
;                                                                               
COMMIT;                                                                         
                                                                                
COMMENT ON TABLE DB2ADM.HSTVSAM IS                                              
'CONTEM OS DADOS DE HIGH ALLOCATION E HIGH UTILIZATION DO VSAM DB2'             
;                                                                               
COMMENT ON DB2ADM.HSTVSAM                                                       
(DATA      IS 'DATA DO LOAD'                                                    
,HORA      IS 'HORA DO LOAD'                                                    
,DSNAME    IS 'NOME DO DATASET VSAM'                                            
,HI_A_RBA  IS 'HIGH ALLOCATION RBA'                                             
,HI_U_RBA  IS 'HIGH ALLOCATION RBA'                                             
,DBNAME    IS 'NOME DO DATABASE'                                                
,SPACENAM  IS 'NOME DO SPACENAME')                                              
;                                                                               
COMMIT;                                                                         
                                                                                
CREATE UNIQUE INDEX DB2ADM.HSTVSAM_I1                                           
    ON DB2ADM.HSTVSAM(DATA,DSNAME)                                              
    USING STOGROUP STGP70I                                                      
        PRIQTY 22800                                                            
        SECQTY 2400                                                             
    PCTFREE 5                                                                   
    BUFFERPOOL BP2                                                              
    CLOSE NO                                                                    
    COPY NO                                                                     
;                                                                               
COMMIT;                                                                         
ALTER TABLE DB2ADM.HSTVSAM                                                      
  ADD EXTENTS INTEGER NOT NULL WITH DEFAULT;                                    
COMMIT;                                                                         
