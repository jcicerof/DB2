CREATE TABLE TECINFOR.ORCAMENTOITECOB                                           
    ( CDNEG              SMALLINT NOT NULL ,                                    
      NRORC              DECIMAL  (11,0) NOT NULL ,                             
      NRITE              SMALLINT NOT NULL ,                                    
      NROPCCAL           SMALLINT NOT NULL ,                                    
      CDPRO              INTEGER  NOT NULL ,                                    
      CDCOB              SMALLINT NOT NULL ,                                    
      CDCOBFCL           SMALLINT NOT NULL ,                                    
      PCTAXIS            DECIMAL  (7,4) NOT NULL ,                              
      VLIS               DECIMAL  (17,2) NOT NULL ,                             
      VLPRETAR           DECIMAL  (17,2) NOT NULL ,                             
      VLDES              DECIMAL  (17,2) NOT NULL ,                             
      VLDESCOM           DECIMAL  (17,2) NOT NULL ,                             
      VLAGV              DECIMAL  (17,2) NOT NULL ,                             
      PCFRQ              DECIMAL  (7,4) NOT NULL ,                              
      PCFRQFCL           DECIMAL  (7,4) NOT NULL ,                              
      VLFRQ              DECIMAL  (17,2) NOT NULL ,                             
      VLFRQFCL           DECIMAL  (17,2) NOT NULL ,                             
      PCCOM              DECIMAL  (7,4) NOT NULL ,                              
      PCDESFRO           DECIMAL  (7,4) NOT NULL ,                              
      PCDESPRE           DECIMAL  (7,4) NOT NULL ,                              
      PCISRLT            DECIMAL  (7,4) NOT NULL ,                              
      PCAGVFRQ           DECIMAL  (7,4) NOT NULL ,                              
      VLISCAL            DECIMAL  (17,2) NOT NULL ,                             
      PCDESGER           DECIMAL  (7,4) NOT NULL ,                              
      CDVRSCAL           CHAR     (10) NOT NULL ,                               
      CDLIMIS            SMALLINT NOT NULL ,                                    
      VLAGVCOM           DECIMAL  (17,2) NOT NULL WITH DEFAULT ,                
      PCAGVPRE           DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCAGVGER           DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCDESCOM           DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCAGVCOM           DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      VLISCALINI         DECIMAL  (17,2) NOT NULL WITH DEFAULT ,                
      PCCOMPAD           DECIMAL  (7,4) NOT NULL WITH DEFAULT 0 ,               
      VLPREANTLIM        DECIMAL  (17,2) NOT NULL WITH DEFAULT 0 ,              
      CDSUBREG           SMALLINT ,                                             
      IDNOVTAR           CHAR     (1) NOT NULL WITH DEFAULT 'N' ,               
      CDGRPSUBREG        SMALLINT ,                                             
     PRIMARY KEY (CDNEG ,NRORC ,NRITE ,NROPCCAL ,CDPRO , CDCOB ),               
     FOREIGN KEY FKORCIC1 (CDNEG ,NRORC ,NRITE ,NROPCCAL ,CDPRO)                
        REFERENCES TECINFOR.ORCAMENTOITEPRO ON DELETE RESTRICT,                 
     FOREIGN KEY FORCITC1 (CDGRPSUBREG ,CDSUBREG) REFERENCES                    
        TECINFOR.SUBREG ON DELETE RESTRICT )                                    
    IN DBEEOR.ORCITCOB                                                          
    WITH RESTRICT ON DROP                                                       
    CCSID EBCDIC                                                                
  AUDIT NONE;                                                                   
-- ***** CARD= 1.502E07 NPAGES= 214695                                          
-- **************************                                                   
-- ***** CREATE INDEXES *****                                                   
-- **************************                                                   
                                                                                
COMMIT;                                                                         
CREATE TYPE 2 UNIQUE INDEX TECINFOR.ORCAMENTOITECOB_PK                          
    ON TECINFOR.ORCAMENTOITECOB                                                 
      ( CDNEG ASC ,                                                             
        NRORC ASC ,                                                             
        NRITE ASC ,                                                             
        NROPCCAL ASC ,                                                          
        CDPRO ASC ,                                                             
        CDCOB ASC  )                                                            
     CLUSTER                                                                    
    USING STOGROUP STGP34I  PRIQTY 170640 SECQTY 17040 ERASE NO                 
    FREEPAGE 0 PCTFREE 5                                                        
    BUFFERPOOL BP2                                                              
    PIECESIZE 2097152 K                                                         
    CLOSE YES ;                                                                 
-- ***** NLEAF= 98229 NLEVELS= 4                                                
-- ***** FIRSTKEYCARD= 2 FULLKEYCARD= 1.502E07                                  
-- **************************                                                   
-- ***** ALTER TABLE - FOREIGN KEYS*****                                        
-- **************************                                                   
-- **************************                                                   
-- ***** CREATE VIEWS   *****                                                   
-- **************************                                                   
-- *****   NO RELATED VIEWS                                                     
-- **************************                                                   
-- *****     DDL END    *****                                                   
-- **************************                                                   
