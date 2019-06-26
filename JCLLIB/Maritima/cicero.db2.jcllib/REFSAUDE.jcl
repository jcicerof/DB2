                                                                                
--==============================================================================
--  r11.5 SP0   CA-DB2   RC/MIGRATOR   ANALYSIS REPORT      07/04/13 18:54      
--==============================================================================
--STRATEGY INFORMATION:                                                         
--STRATEGY ==> TESTE     DESCRIPTION  ===> TESTE                                
--CREATOR  ==> CICERO    SHARE OPTION ===> N (U,Y,N,X,L)  SRC SSID ===> DB2P    
--                                                                              
--IMPLODE/EXPLODE OPTIONS:                                                      
--                                                                              
-- +--- PRIMARY OBJECT --------------------------------------------------------+
--                                                                              
--   +-- IMPLODE OPTIONS ---+ +- EXPLODE OPTIONS --+                            
--S  STOGRP DATABASE TBLSPACE INDEX VIEW SYN/AL TRIG                            
--_     _      _        A       A     A     _     _                             
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      DSN_FUNCTION_TABLE               REFSAUD                                
-- +---------------------------------------------------------------------------+
--_     _      _        A       A     A     _     _                             
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      DSN_STATEMNT_TABLE               REFSAUD                                
-- +---------------------------------------------------------------------------+
--_     _      _        A       A     A     _     _                             
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      PLAN_TABLE                       REFSAUD                                
-- +---------------------------------------------------------------------------+
--                                                                              
--                                                                              
--OTHER MIGRATION OPTIONS:                                                      
--  AUX RTN             ALL  NUMBER                                             
--S IMP IMP RI SECURITY ROWS OF ROWS  WHERE                                     
--_  _   _  _     _      _   ________ _ ________                                
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      DSN_FUNCTION_TABLE               REFSAUD                                
-- +---------------------------------------------------------------------------+
--_  _   _  _     _      _   ________ _ ________                                
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      DSN_STATEMNT_TABLE               REFSAUD                                
-- +---------------------------------------------------------------------------+
--_  _   _  _     _      _   ________ _ ________                                
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      PLAN_TABLE                       REFSAUD                                
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
-- * TABLESPACE CREATE AND ALTER STATEMENTS                     *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- DB2ADM.TSSSPL71 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.               
                                                                                
                                                                                
    SET CURRENT SQLID = 'JUNIORM';                                              
                                                                                
                                                                                
CREATE  TABLESPACE TSSSPL71                                                     
IN      DB2ADM                                                                  
USING   STOGROUP STGP55D                                                        
                                    PRIQTY 85680                                
                                    SECQTY 8544                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 5                                                  
           BUFFERPOOL BP1                                                       
           LOCKSIZE ANY                                                         
           CLOSE YES                                                            
           LOCKMAX SYSTEM                                                       
           CCSID EBCDIC                                                         
    ;                                                                           
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * TABLE CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
-- REFSAUD.DSN_FUNCTION_TABLE WILL BE CREATED VIA THESE NATIVE DB2 COMMA        
-- NDS.                                                                         
                                                                                
                                                                                
CREATE  TABLE REFSAUD.DSN_FUNCTION_TABLE                                        
(       "QUERYNO" INTEGER NOT NULL                                              
          WITH DEFAULT                                                          
,       QBLOCKNO INTEGER NOT NULL                                               
          WITH DEFAULT                                                          
,       APPLNAME CHAR ( 8 ) NOT NULL                                            
          WITH DEFAULT                                                          
,       PROGNAME CHAR ( 8 ) NOT NULL                                            
          WITH DEFAULT                                                          
,       "COLLID" CHAR ( 18 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       GROUP_MEMBER CHAR ( 8 ) NOT NULL                                        
          WITH DEFAULT                                                          
,       EXPLAIN_TIME TIMESTAMP NOT NULL                                         
          WITH DEFAULT                                                          
,       SCHEMA_NAME CHAR ( 8 ) NOT NULL                                         
          WITH DEFAULT                                                          
,       FUNCTION_NAME CHAR ( 18 ) NOT NULL                                      
          WITH DEFAULT                                                          
,       SPEC_FUNC_NAME CHAR ( 18 ) NOT NULL                                     
          WITH DEFAULT                                                          
,       FUNCTION_TYPE CHAR ( 2 ) NOT NULL                                       
          WITH DEFAULT                                                          
,       VIEW_CREATOR CHAR ( 8 ) NOT NULL                                        
          WITH DEFAULT                                                          
,       VIEW_NAME CHAR ( 18 ) NOT NULL                                          
          WITH DEFAULT                                                          
,       "PATH" VARCHAR ( 254 ) NOT NULL                                         
          WITH DEFAULT                                                          
,       FUNCTION_TEXT VARCHAR ( 254 ) NOT NULL                                  
          WITH DEFAULT                                                          
   )                                                                            
IN      DB2ADM.TSSSPL71                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
-- REFSAUD.DSN_STATEMNT_TABLE WILL BE CREATED VIA THESE NATIVE DB2 COMMA        
-- NDS.                                                                         
                                                                                
                                                                                
CREATE  TABLE REFSAUD.DSN_STATEMNT_TABLE                                        
(       "QUERYNO" INTEGER NOT NULL                                              
          WITH DEFAULT                                                          
,       APPLNAME CHAR ( 8 ) NOT NULL                                            
          WITH DEFAULT                                                          
,       PROGNAME CHAR ( 8 ) NOT NULL                                            
          WITH DEFAULT                                                          
,       "COLLID" CHAR ( 18 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       GROUP_MEMBER CHAR ( 8 ) NOT NULL                                        
          WITH DEFAULT                                                          
,       EXPLAIN_TIME TIMESTAMP NOT NULL                                         
          WITH DEFAULT                                                          
,       STMT_TYPE CHAR ( 6 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       COST_CATEGORY CHAR ( 1 ) NOT NULL                                       
          WITH DEFAULT                                                          
,       PROCMS INTEGER NOT NULL                                                 
          WITH DEFAULT                                                          
,       PROCSU INTEGER NOT NULL                                                 
          WITH DEFAULT                                                          
,       REASON VARCHAR ( 254 ) NOT NULL                                         
          WITH DEFAULT                                                          
   )                                                                            
IN      DB2ADM.TSSSPL71                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
-- REFSAUD.PLAN_TABLE WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
CREATE  TABLE REFSAUD.PLAN_TABLE                                                
(       "QUERYNO" INTEGER NOT NULL                                              
,       QBLOCKNO SMALLINT NOT NULL                                              
,       APPLNAME CHAR ( 8 ) NOT NULL                                            
,       PROGNAME CHAR ( 8 ) NOT NULL                                            
,       PLANNO SMALLINT NOT NULL                                                
,       METHOD SMALLINT NOT NULL                                                
,       CREATOR CHAR ( 8 ) NOT NULL                                             
,       TNAME CHAR ( 18 ) NOT NULL                                              
,       TABNO SMALLINT NOT NULL                                                 
,       ACCESSTYPE CHAR ( 2 ) NOT NULL                                          
,       MATCHCOLS SMALLINT NOT NULL                                             
,       ACCESSCREATOR CHAR ( 8 ) NOT NULL                                       
,       ACCESSNAME CHAR ( 18 ) NOT NULL                                         
,       INDEXONLY CHAR ( 1 ) NOT NULL                                           
,       SORTN_UNIQ CHAR ( 1 ) NOT NULL                                          
,       SORTN_JOIN CHAR ( 1 ) NOT NULL                                          
,       SORTN_ORDERBY CHAR ( 1 ) NOT NULL                                       
,       SORTN_GROUPBY CHAR ( 1 ) NOT NULL                                       
,       SORTC_UNIQ CHAR ( 1 ) NOT NULL                                          
,       SORTC_JOIN CHAR ( 1 ) NOT NULL                                          
,       SORTC_ORDERBY CHAR ( 1 ) NOT NULL                                       
,       SORTC_GROUPBY CHAR ( 1 ) NOT NULL                                       
,       TSLOCKMODE CHAR ( 3 ) NOT NULL                                          
,       TIMESTAMP CHAR ( 16 ) NOT NULL                                          
,       REMARKS VARCHAR ( 254 ) NOT NULL                                        
,       PREFETCH CHAR ( 1 ) NOT NULL                                            
          WITH DEFAULT                                                          
,       COLUMN_FN_EVAL CHAR ( 1 ) NOT NULL                                      
          WITH DEFAULT                                                          
,       MIXOPSEQ SMALLINT NOT NULL                                              
          WITH DEFAULT                                                          
,       VERSION VARCHAR ( 64 ) NOT NULL                                         
          WITH DEFAULT                                                          
,       "COLLID" CHAR ( 18 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       ACCESS_DEGREE SMALLINT                                                  
,       ACCESS_PGROUP_ID SMALLINT                                               
,       JOIN_DEGREE SMALLINT                                                    
,       JOIN_PGROUP_ID SMALLINT                                                 
,       SORTC_PGROUP_ID SMALLINT                                                
,       SORTN_PGROUP_ID SMALLINT                                                
,       PARALLELISM_MODE CHAR ( 1 )                                             
,       MERGE_JOIN_COLS SMALLINT                                                
,       CORRELATION_NAME CHAR ( 18 )                                            
,       PAGE_RANGE CHAR ( 1 ) NOT NULL                                          
          WITH DEFAULT                                                          
,       JOIN_TYPE CHAR ( 1 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       GROUP_MEMBER CHAR ( 8 ) NOT NULL                                        
          WITH DEFAULT                                                          
,       IBM_SERVICE_DATA VARCHAR ( 254 ) NOT NULL                               
          WITH DEFAULT                                                          
,       WHEN_OPTIMIZE CHAR ( 1 ) NOT NULL                                       
          WITH DEFAULT                                                          
,       QBLOCK_TYPE CHAR ( 6 ) NOT NULL                                         
          WITH DEFAULT                                                          
,       BIND_TIME TIMESTAMP NOT NULL                                            
          WITH DEFAULT                                                          
,       OPTHINT CHAR ( 8 ) NOT NULL                                             
          WITH DEFAULT                                                          
,       HINT_USED CHAR ( 8 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       PRIMARY_ACCESSTYPE CHAR ( 1 ) NOT NULL                                  
          WITH DEFAULT                                                          
,       PARENT_QBLOCKNO SMALLINT NOT NULL                                       
          WITH DEFAULT                                                          
,       TABLE_TYPE CHAR ( 1 )                                                   
   )                                                                            
IN      DB2ADM.TSSSPL71                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    SET CURRENT SQLID = 'CICERO';                                               
                                                                                
    GRANT SELECT                                                                
                    ON TABLE REFSAUD.PLAN_TABLE TO PUBLIC;                      
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    GRANT SELECT                                                                
                    ON TABLE REFSAUD.DSN_STATEMNT_TABLE TO PUBLIC;              
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * INDEX CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- REFSAUD.PLAN_TABLE_HINT_IX WILL BE CREATED VIA THESE NATIVE DB2 COMMA        
-- NDS.                                                                         
                                                                                
                                                                                
                                                                                
CREATE  INDEX REFSAUD.PLAN_TABLE_HINT_IX ON REFSAUD.PLAN_TABLE                  
(       "QUERYNO" ASC                                                           
,       APPLNAME ASC                                                            
,       PROGNAME ASC                                                            
,       VERSION ASC                                                             
,       "COLLID" ASC                                                            
,       OPTHINT ASC                                                             
          )                                                                     
USING   STOGROUP STGP31I                                                        
                                    PRIQTY 1776                                 
                                    SECQTY 144                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 10                                                 
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
--==============================================================================
--  r11.5 SP0     CA-DB2 RC/MIGRATOR IMPACT ANALYSIS      07/04/13 18:54        
--==============================================================================
--                                                                              
--  OBJECT TYPE: TABLESPACE                 TOTAL:                1             
--                                                                              
--   OBJECT NAME/DBNAME          EDITED NEW NAME/DBNAME                         
--                                                                              
--   TSSSPL71                                                                   
--    DB2ADM                                                                    
--                                                                              
--  OBJECT TYPE: TABLE                      TOTAL:                3             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   DSN_FUNCTION_TABLE                                                         
--    REFSAUD                                                                   
--   DSN_STATEMNT_TABLE                                                         
--    REFSAUD                                                                   
--   PLAN_TABLE                                                                 
--    REFSAUD                                                                   
--                                                                              
--  OBJECT TYPE: INDEX                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   PLAN_TABLE_HINT_IX                                                         
--    REFSAUD                                                                   
