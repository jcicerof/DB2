                                                                                
--==============================================================================
--  r11.5 SP0   CA-DB2   RC/MIGRATOR   ANALYSIS REPORT      07/07/25 19:41      
--==============================================================================
--STRATEGY INFORMATION:                                                         
--STRATEGY ==> EXPORT    DESCRIPTION  ===> EXPORT DDL                           
--CREATOR  ==> CICERO    SHARE OPTION ===> U (U,Y,N,X,L)  SRC SSID ===> DB2P    
--                                                                              
--IMPLODE/EXPLODE OPTIONS:                                                      
--                                                                              
-- +--- PRIMARY OBJECT --------------------------------------------------------+
--                                                                              
--   +-- IMPLODE OPTIONS ---+ +- EXPLODE OPTIONS --+                            
--S  STOGRP DATABASE TBLSPACE INDEX VIEW SYN/AL TRIG                            
--_     _      _        _       A     _     _     _                             
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      DMRAPSUM                         DMRPR                                  
-- +---------------------------------------------------------------------------+
--                                                                              
--                                                                              
--OTHER MIGRATION OPTIONS:                                                      
--  AUX RTN             ALL  NUMBER                                             
--S IMP IMP RI SECURITY ROWS OF ROWS  WHERE                                     
--_  _   _  _     _      _   ________ _ ________                                
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      DMRAPSUM                         DMRPR                                  
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
--  AUX IMPLODE       ===> N             STATISTICS    ===> N                   
--  RI(LOCAL/GLOBAL)  ===> L             CHECK DATA    ===> N                   
--  SECURITY          ===> Y             IMAGE COPY    ===> Y                   
--  DROP OBJECTS      ===> N             BIND/REBIND   ===> R                   
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
--  COMMIT ASAP             ===> Y                                              
--                                                                              
--  DELETE UNLOAD DATASETS    ===> N                                            
--  DELETE TEMPORARY DATASETS ===> N                                            
--                                                                              
--********************** END OF ANALYSIS HEADER ********************************
                                                                                
--  RMA234W AN IN-PLACE MIGRATION HAS BEEN GENERATED WITH THE DROP OBJECTS      
--        OPTION SET TO "N". SQL ERRORS MAY OCCUR.                              
                                                                                
--  RMA448W THIS ANALYSIS WAS PERFORMED WITHOUT THE LOB OBJECTS OPTION.         
--        TABLES CREATED CONTAINING LOB COLUMNS MAY BE MARKED INCOMPLETE.       
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * TABLE CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
-- DMRPR.DMRAPSUM WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.                
                                                                                
                                                                                
CREATE  TABLE DMRPR.DMRAPSUM                                                    
(       SYSTEMID CHAR ( 4 ) NOT NULL                                            
,       SUBSYSTEM CHAR ( 4 ) NOT NULL                                           
,       PLANNAME CHAR ( 8 ) NOT NULL                                            
,       AUTHID CHAR ( 8 ) NOT NULL                                              
,       "CONNECTION" CHAR ( 8 ) NOT NULL                                        
,       CORRID CHAR ( 12 ) NOT NULL                                             
,       ORIGPRIMID CHAR ( 8 ) NOT NULL                                          
,       LUWIDNID CHAR ( 8 ) NOT NULL                                            
,       LUWIDLUNM CHAR ( 8 ) NOT NULL                                           
,       LUWIDINST CHAR ( 6 ) NOT NULL                                           
,       LUWIDCOMIT REAL NOT NULL                                                
,       CONNTYPE CHAR ( 8 ) NOT NULL                                            
,       DATETIME TIMESTAMP NOT NULL                                             
,       DATE DATE NOT NULL                                                      
,       "YEAR" CHAR ( 4 ) NOT NULL                                              
,       "MONTH" CHAR ( 2 ) NOT NULL                                             
,       "DAY" CHAR ( 2 ) NOT NULL                                               
,       TIME TIME NOT NULL                                                      
,       "HOUR" CHAR ( 2 ) NOT NULL                                              
,       DAYOFWEEK# SMALLINT NOT NULL                                            
,       DAYOFWEEK CHAR ( 3 ) NOT NULL                                           
,       WEEK# INTEGER NOT NULL                                                  
,       LOCATION CHAR ( 16 ) NOT NULL                                           
,       GROUPNAME CHAR ( 8 ) NOT NULL                                           
,       MEMBERNAME CHAR ( 8 ) NOT NULL                                          
,       FIRSTPKG CHAR ( 18 ) NOT NULL                                           
,       ACCTTOKN CHAR ( 22 ) NOT NULL                                           
,       ENDUSERID CHAR ( 16 ) NOT NULL                                          
,       ENDUSERTX CHAR ( 32 ) NOT NULL                                          
,       ENDUSERWN CHAR ( 18 ) NOT NULL                                          
,       TRACEMASK INTEGER NOT NULL                                              
,       PSTNUMBER CHAR ( 4 ) NOT NULL                                           
,       PSBNAME CHAR ( 8 ) NOT NULL                                             
,       CICSTRAN CHAR ( 4 ) NOT NULL                                            
,       CORRNAME CHAR ( 8 ) NOT NULL                                            
,       REQLOCATION CHAR ( 16 ) NOT NULL                                        
,       REQPROD CHAR ( 8 ) NOT NULL                                             
,       REQPRODREL CHAR ( 8 ) NOT NULL                                          
,       NETWORKID CHAR ( 16 ) NOT NULL                                          
,       INTERVAL INTEGER NOT NULL                                               
,       TRANSCNT INTEGER NOT NULL                                               
,       IFCIDSEQ# INTEGER NOT NULL                                              
,       CPUSUCONV INTEGER NOT NULL                                              
,       OCCURRENCES INTEGER NOT NULL                                            
,       PKGFLAG CHAR ( 4 ) NOT NULL                                             
,       EXECLOCATION CHAR ( 16 ) NOT NULL                                       
,       COLLECTIONID CHAR ( 18 ) NOT NULL                                       
,       PROGRAMNAME CHAR ( 18 ) NOT NULL                                        
,       CONSISTOKEN CHAR ( 16 ) NOT NULL                                        
,       SQLCOUNT REAL NOT NULL                                                  
,       ELAPSEPKG DECIMAL ( 15 , 6 ) NOT NULL                                   
,       CPUTCBPKG DECIMAL ( 15 , 6 ) NOT NULL                                   
,       ENTEXEVENT REAL NOT NULL                                                
,       EVTSYNCIO REAL NOT NULL                                                 
,       ELAPSYNCIO DECIMAL ( 15 , 6 ) NOT NULL                                  
,       ELPLOCK DECIMAL ( 15 , 6 ) NOT NULL                                     
,       ELPOTHREAD DECIMAL ( 15 , 6 ) NOT NULL                                  
,       ELPOTHWRIT DECIMAL ( 15 , 6 ) NOT NULL                                  
,       ELPUNITSW DECIMAL ( 15 , 6 ) NOT NULL                                   
,       ELPARCQIS DECIMAL ( 15 , 6 ) NOT NULL                                   
,       EVTLOCK REAL NOT NULL                                                   
,       EVTOTHREAD REAL NOT NULL                                                
,       EVTOTHWRIT REAL NOT NULL                                                
,       EVTUNITSW REAL NOT NULL                                                 
,       EVTARCQIS REAL NOT NULL                                                 
,       EVTDRAIN REAL NOT NULL                                                  
,       ELPDRAIN DECIMAL ( 15 , 6 ) NOT NULL                                    
,       ELPCLAIM DECIMAL ( 15 , 6 ) NOT NULL                                    
,       EVTCLAIM REAL NOT NULL                                                  
,       ELPARCREAD DECIMAL ( 15 , 6 ) NOT NULL                                  
,       EVTARCREAD REAL NOT NULL                                                
,       ELPPGLAT DECIMAL ( 15 , 6 ) NOT NULL                                    
,       EVTPGLAT REAL NOT NULL                                                  
,       GBLMSGELAP DECIMAL ( 15 , 6 ) NOT NULL                                  
,       GBLMSGEVNT REAL NOT NULL                                                
,       GBLLOKELAP DECIMAL ( 15 , 6 ) NOT NULL                                  
,       GBLLOKEVNT REAL NOT NULL                                                
,       SPWAITELAP DECIMAL ( 15 , 6 ) NOT NULL                                  
,       SPWAITCNT REAL NOT NULL                                                 
,       SPROCCNT REAL NOT NULL                                                  
,       FUNCWAIT DECIMAL ( 15 , 6 ) NOT NULL                                    
,       FUNCCNT REAL NOT NULL                                                   
,       NESTSCHEMA CHAR ( 8 ) NOT NULL                                          
,       NESTNAME CHAR ( 18 ) NOT NULL                                           
,       NESTTYPE CHAR ( 5 ) NOT NULL                                            
,       WTELAWTK DECIMAL ( 15 , 6 ) NOT NULL                                    
,       WTELAWTM DECIMAL ( 15 , 6 ) NOT NULL                                    
,       WTELAWTN DECIMAL ( 15 , 6 ) NOT NULL                                    
,       WTELAWTO DECIMAL ( 15 , 6 ) NOT NULL                                    
,       WTELAWTQ DECIMAL ( 15 , 6 ) NOT NULL                                    
,       WTEVARNK REAL NOT NULL                                                  
,       WTEVARNM REAL NOT NULL                                                  
,       WTEVARNN REAL NOT NULL                                                  
,       WTEVARNO REAL NOT NULL                                                  
,       WTEVARNQ REAL NOT NULL                                                  
,       DMRACSHARE INTEGER NOT NULL                                             
,       DMRAUTOCUST INTEGER NOT NULL                                            
   )                                                                            
IN      DMRPRDB1.DMRPRTPS                                                       
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    SET CURRENT SQLID = 'SYSADM';                                               
                                                                                
    GRANT SELECT                                                                
                    ON TABLE DMRPR.DMRAPSUM TO PUBLIC;                          
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * INDEX CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- DMRPRDB1.APSMINDX WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.             
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX DMRPRDB1.APSMINDX ON DMRPR.DMRAPSUM                        
(       DATE ASC                                                                
,       LOCATION ASC                                                            
,       SUBSYSTEM ASC                                                           
,       PLANNAME ASC                                                            
,       AUTHID ASC                                                              
,       COLLECTIONID ASC                                                        
,       PROGRAMNAME ASC                                                         
,       "CONNECTION" ASC                                                        
,       CORRID ASC                                                              
,       ORIGPRIMID ASC                                                          
,       EXECLOCATION ASC                                                        
,       CONSISTOKEN ASC                                                         
,       DATETIME ASC                                                            
,       IFCIDSEQ# ASC                                                           
          )                                                                     
USING   STOGROUP DMRPRSG1                                                       
                                    PRIQTY 1200                                 
                                    SECQTY 144                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 10                                                 
           BUFFERPOOL BP0                                                       
           CLOSE NO                                                             
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
--==============================================================================
--  r11.5 SP0     CA-DB2 RC/MIGRATOR IMPACT ANALYSIS      07/07/25 19:41        
--==============================================================================
--                                                                              
--  OBJECT TYPE: TABLE                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   DMRAPSUM                                                                   
--    DMRPR                                                                     
--                                                                              
--  OBJECT TYPE: INDEX                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   APSMINDX                                                                   
--    DMRPRDB1                                                                  
