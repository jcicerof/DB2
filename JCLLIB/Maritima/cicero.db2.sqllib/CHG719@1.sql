CREATE TABLE TECINFOR.ORCAMENTOITEBNF                                           
    ( CDNEG              SMALLINT NOT NULL ,                                    
      NRORC              DECIMAL  (11,0) NOT NULL ,                             
      NRITE              SMALLINT NOT NULL ,                                    
      NROPCCAL           SMALLINT NOT NULL ,                                    
      CDPRO              INTEGER  NOT NULL ,                                    
      TPSISSGUVEI        SMALLINT NOT NULL ,                                    
      VLBNF              DECIMAL  (17,2) NOT NULL ,                             
      CDCOB              SMALLINT NOT NULL WITH DEFAULT ,                       
      CDSISSGUVEI        SMALLINT NOT NULL WITH DEFAULT 0 ,                     
      PCDES              DECIMAL  (7,2) NOT NULL WITH DEFAULT 0 ,               
      TPDES              SMALLINT NOT NULL WITH DEFAULT 0 ,                     
     PRIMARY KEY (CDNEG ,NRORC ,NRITE ,NROPCCAL ,CDPRO ,CDCOB ,                 
        TPSISSGUVEI ),                                                          
     FOREIGN KEY FKORCIB1 (CDNEG ,NRORC ,NRITE ,NROPCCAL ,CDPRO ,               
        CDCOB) REFERENCES TECINFOR.ORCAMENTOITECOB ON DELETE RESTRICT )         
    IN DBEEOR  .ORCITBNF                                                        
    WITH RESTRICT ON DROP                                                       
    CCSID EBCDIC                                                                
  AUDIT NONE;                                                                   
-- ***** CARD= 476277 NPAGES= 5539                                              
-- **************************                                                   
-- ***** CREATE INDEXES *****                                                   
-- **************************                                                   
CREATE TYPE 2 UNIQUE INDEX TECINFOR.ORCAMENTOITEBNF_PK ON TECINFOR.ORCAMENTOITEB
      ( CDNEG ASC ,                                                             
        NRORC ASC ,                                                             
        NRITE ASC ,                                                             
        NROPCCAL ASC ,                                                          
        CDPRO ASC ,                                                             
        CDCOB ASC ,                                                             
        TPSISSGUVEI ASC  )                                                      
     CLUSTER                                                                    
    USING STOGROUP STGP40I  PRIQTY 15120 SECQTY 1536 ERASE NO                   
    FREEPAGE 0 PCTFREE 5                                                        
    BUFFERPOOL BP2                                                              
    PIECESIZE 2097152 K                                                         
    CLOSE YES ;                                                                 
-- ***** NLEAF= 3355 NLEVELS= 3                                                 
-- ***** FIRSTKEYCARD= 2 FULLKEYCARD= 476277                                    
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
