                                                                                
--==============================================================================
--  r11.5 SP0   CA-DB2   RC/MIGRATOR   ANALYSIS REPORT      07/02/13 13:48      
--==============================================================================
--STRATEGY INFORMATION:                                                         
--STRATEGY ==> TESTE     DESCRIPTION  ===> TESTE                                
--CREATOR  ==> JONAS     SHARE OPTION ===> N (U,Y,N,X,L)  SRC SSID ===> DB2P    
--                                                                              
--IMPLODE/EXPLODE OPTIONS:                                                      
--                                                                              
-- +--- PRIMARY OBJECT --------------------------------------------------------+
--                                                                              
--   +-- IMPLODE OPTIONS ---+ +- EXPLODE OPTIONS --+                            
--S  STOGRP DATABASE TBLSPACE INDEX VIEW SYN/AL TRIG                            
--_     _      _        A       A     _     A     _                             
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      CADAPALT                         MARITIMA                               
-- +---------------------------------------------------------------------------+
--                                                                              
--                                                                              
--OTHER MIGRATION OPTIONS:                                                      
--  AUX RTN             ALL  NUMBER                                             
--S IMP IMP RI SECURITY ROWS OF ROWS  WHERE                                     
--_  _   _  _     _      _   ________ _ ________                                
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      CADAPALT                         MARITIMA                               
-- +---------------------------------------------------------------------------+
--                                                                              
--ANALYSIS OPTIONS:                                                             
--  EXECUTION MODE    ===> O (O - ONLINE, B - BATCH)                            
--  ANALYSIS OVERRIDE ===> N                                                    
--  ACCESS MODE       ===> CATALOG                                              
--  MODEL ID          ===> @DEFAULT                                             
--  MODEL CREATOR     ===> AXW0311                                              
--  TARGET SSID       ===> DB2P                                                 
--  GLOBAL CHANGES    ===> N                                                    
--                                                                              
--  AUX IMPLODE       ===> Y             STATISTICS    ===> N                   
--  RI(LOCAL/GLOBAL)  ===> G             CHECK DATA    ===> Y                   
--  SECURITY          ===> Y             IMAGE COPY    ===> N                   
--  DROP OBJECTS      ===> Y             BIND/REBIND   ===> R                   
--  LOB OBJECTS       ===> N             RECOVER IX    ===> Y                   
--  DEFAULT SQLID     ===>                                                      
--  ALIAS SQLID       ===>                                                      
--  TABLE OBID        ===> N                                                    
--  RTN IMPLODE       ===>                                                      
--  RTN INTERACTION   ===> N                                                    
--                                                                              
--  ALL ROWS          ===> Y             VSAM DEFINES  ===> N                   
--  NUMBER ROWS       ===>               VSAM DELETES  ===> N                   
--  DATA STATISTICS   ===> N                                                    
--  TRUNCATE          ===> N                                                    
--                                                                              
--  NO .AUTHS               ===> N                                              
--  NO SET SQLID STMTS      ===> N                                              
--  BND/DAT/SQL/STAT/GRNT/RI===> S  (B nd, D at, R -Stat, S QL, G rnt, R I or N)
--  COMMIT ASAP             ===> N                                              
--                                                                              
--  DELETE UNLOAD DATASETS    ===> N                                            
--  DELETE TEMPORARY DATASETS ===> N                                            
--                                                                              
--********************** END OF ANALYSIS HEADER ********************************
                                                                                
--  RMA448W THIS ANALYSIS WAS PERFORMED WITHOUT THE LOB OBJECTS OPTION.         
--        TABLES CREATED CONTAINING LOB COLUMNS MAY BE MARKED INCOMPLETE.       
                                                                                
    ALTER TABLE MARITIMA.CADAPALT                                               
          DROP RESTRICT ON DROP;                                                
                                                                                
    DROP TABLESPACE DBRE04.CADAPALT;                                            
                                                                                
    DROP ALIAS SQLUSER.CADAPALT;                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * TABLESPACE CREATE AND ALTER STATEMENTS                     *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- DBRE04.CADAPALT WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.               
                                                                                
                                                                                
    SET CURRENT SQLID = 'SYSADM';                                               
                                                                                
                                                                                
CREATE  TABLESPACE CADAPALT                                                     
IN      DBRE04                                                                  
USING   STOGROUP STGP03D                                                        
                                    PRIQTY 67680                                
                                    SECQTY 6720                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
                     COMPRESS YES                                               
           BUFFERPOOL BP1                                                       
           LOCKSIZE ANY                                                         
           CLOSE YES                                                            
           SEGSIZE 4                                                            
           LOCKMAX SYSTEM                                                       
           CCSID EBCDIC                                                         
    ;                                                                           
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
                                                                                
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * TABLE CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
-- MARITIMA.CADAPALT WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.             
                                                                                
                                                                                
CREATE  TABLE MARITIMA.CADAPALT                                                 
(       CDALTER SMALLINT NOT NULL                                               
,       CDSUCUR SMALLINT NOT NULL                                               
,       CDRMBAS SMALLINT NOT NULL                                               
,       NRAPOLI INTEGER NOT NULL                                                
,       NRENDOS INTEGER NOT NULL                                                
,       NRITEM SMALLINT NOT NULL                                                
,       CDRMRMO SMALLINT NOT NULL                                               
,       NMDEPTO CHAR ( 10 ) NOT NULL                                            
,       CDUSUAR CHAR ( 10 ) NOT NULL                                            
,       DSALTERA CHAR ( 30 ) NOT NULL                                           
,       CDTECNIC SMALLINT                                                       
,       CDDEPTO SMALLINT                                                        
,       DTALTER_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
   )                                                                            
   WITH RESTRICT ON DROP                                                        
IN      DBRE04.CADAPALT                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
COMMENT ON MARITIMA.CADAPALT                                                    
(       CDALTER IS 'CD.ALTERACAO         .(002)'                                
,       CDSUCUR IS 'CD.SUCURSAL          .(002)'                                
,       CDRMBAS IS 'CD.RAMO BASE         .(002)'                                
,       NRAPOLI IS 'NR.APOLICE           .(006)'                                
,       NRENDOS IS 'NR.ENDOSSO           .(006)'                                
,       NRITEM IS 'NR.ITEM              .(004)'                                 
,       CDRMRMO IS 'CD.RAMO RAMO         .(002)'                                
,       NMDEPTO IS 'NM.DEPARTAMENTO'                                            
,       CDUSUAR IS 'CD.USUARIO'                                                 
,       DSALTERA IS 'DESCRICAO DA ALTERACAO'                                    
,       CDTECNIC IS 'CODIGO DO TECNICO'                                         
,       CDDEPTO IS 'CODIGO DO DEPARTAMENTO'                                     
,       DTALTER_CNV IS 'DT.ALTERACAO'                                           
                ) ;                                                             
COMMENT ON TABLE MARITIMA.CADAPALT IS 'CADASTRO  DE APOLICES ALTERADOS'         
        ;                                                                       
                                                                                
                                                                                
                                                                                
-- SQLUSER.CADAPALT WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.              
                                                                                
CREATE  ALIAS SQLUSER.CADAPALT FOR MARITIMA.CADAPALT ;                          
                                                                                
                                                                                
                                                                                
    SET CURRENT SQLID = 'SYSADM';                                               
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO AUTO;                         
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO SAUDE;                        
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO VIDA;                         
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO ROSDBP;                       
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO CSPPUSER;                     
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO MVSPUSER;                     
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO CORDSIS;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO PROJETO;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO DBAUSER;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO TMONDB2;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO IFXPUSER;                     
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO INFORMIX;                     
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO CSPPUSER;                     
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO MVSPUSER;                     
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO DBAUSER;                      
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO TMONDB2;                      
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO IFXPUSER;                     
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO INFORMIX;                     
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO ADMDADOS;                     
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO CLAUDIO;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO SCHED;                        
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO JCARLOS;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO AGUIAR;                       
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO LUIS;                         
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO SEDA;                         
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO AGUIAR;                       
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO CLAUDIO;                      
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO LUIS;                         
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO SCHED;                        
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,UPDATE                                                                
                    ON TABLE MARITIMA.CADAPALT TO JCARLOS;                      
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO DETAIL;                       
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO BRAINP;                       
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO ROSCORP;                      
                                                                                
    SET CURRENT SQLID = 'ROSCOED';                                              
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.CADAPALT TO AUTOMAR;                      
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * INDEX CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- MARITIMA.CADAPALT_IX2 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.         
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.CADAPALT_IX2 ON MARITIMA.CADAPALT                        
(       CDSUCUR ASC                                                             
,       CDRMBAS ASC                                                             
,       NRAPOLI ASC                                                             
,       NRENDOS ASC                                                             
,       NRITEM ASC                                                              
,       DTALTER_CNV DESC                                                        
,       CDALTER ASC                                                             
          )                                                                     
USING   STOGROUP STGP24I                                                        
                                    PRIQTY 64800                                
                                    SECQTY 6432                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
-- MARITIMA.CADAPALT_IX1 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.         
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX MARITIMA.CADAPALT_IX1 ON MARITIMA.CADAPALT                 
(       CDALTER ASC                                                             
,       DTALTER_CNV ASC                                                         
,       CDSUCUR ASC                                                             
,       CDRMBAS ASC                                                             
,       NRAPOLI ASC                                                             
,       NRENDOS ASC                                                             
,       NRITEM ASC                                                              
,       CDRMRMO ASC                                                             
          )                                                                     
USING   STOGROUP STGP08I                                                        
                                    PRIQTY 34752                                
                                    SECQTY 3456                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           CLUSTER                                                              
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
--==============================================================================
--  r11.5 SP0     CA-DB2 RC/MIGRATOR IMPACT ANALYSIS      07/02/13 13:48        
--==============================================================================
--                                                                              
--  OBJECT TYPE: TABLESPACE                 TOTAL:                1             
--                                                                              
--   OBJECT NAME/DBNAME          EDITED NEW NAME/DBNAME                         
--                                                                              
--   CADAPALT                                                                   
--    DBRE04                                                                    
--                                                                              
--  OBJECT TYPE: TABLE                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   CADAPALT                                                                   
--    MARITIMA                                                                  
--                                                                              
--  OBJECT TYPE: INDEX                      TOTAL:                2             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   CADAPALT_IX2                                                               
--    MARITIMA                                                                  
--   CADAPALT_IX1                                                               
--    MARITIMA                                                                  
--                                                                              
--  OBJECT TYPE: ALIAS                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   CADAPALT                                                                   
--    SQLUSER                                                                   
