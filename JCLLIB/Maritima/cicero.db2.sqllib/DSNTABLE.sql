CREATE TABLE "CICERO"."DSN_STRUCT_TABLE"                                        
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "PARENT"  SMALLINT NOT NULL ,                                                
   "TIMES"  FLOAT(8)  NOT NULL ,                                                
   "ROWCOUNT"  INTEGER NOT NULL ,                                               
   "ATOPEN"  CHAR(1)  NOT NULL ,                                                
   "CONTEXT"  CHAR(10)  NOT NULL ,                                              
   "ORDERNO"  SMALLINT NOT NULL ,                                               
   "DOATOPEN_PARENT"  SMALLINT NOT NULL ,                                       
   "QBLOCK_TYPE"  CHAR(6)  NOT NULL ,                                           
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."STRUC_EXPIDX1" ON "CICERO"."DSN_STRUCT_TABLE"            
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
COMMIT;                                                                         
                                                                                
FIM                                                                             
-------------------------------------------------------                         
CREATE TABLE "CICERO"."DSN_DETCOST_TABLE"                                       
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "PLANNO"  SMALLINT NOT NULL ,                                                
   "OPENIO"  FLOAT(4)  NOT NULL ,                                               
   "OPENCPU"  FLOAT(4)  NOT NULL ,                                              
   "OPENCOST"  FLOAT(4)  NOT NULL ,                                             
   "DMIO"  FLOAT(4)  NOT NULL ,                                                 
   "DMCPU"  FLOAT(4)  NOT NULL ,                                                
   "DMTOT"  FLOAT(4)  NOT NULL ,                                                
   "SUBQIO"  FLOAT(4)  NOT NULL ,                                               
   "SUBQCPU"  FLOAT(4)  NOT NULL ,                                              
   "SUBQCOST"  FLOAT(4)  NOT NULL ,                                             
   "BASEIO"  FLOAT(4)  NOT NULL ,                                               
   "BASECPU"  FLOAT(4)  NOT NULL ,                                              
   "BASETOT"  FLOAT(4)  NOT NULL ,                                              
   "ONECOMPROWS"  FLOAT(4)  NOT NULL ,                                          
   "IMLEAF"  FLOAT(4)  NOT NULL ,                                               
   "IMIO"  FLOAT(4)  NOT NULL ,                                                 
   "IMPREFH"  CHAR(2)  NOT NULL ,                                               
   "IMMPRED"  INTEGER NOT NULL ,                                                
   "IMFF"  FLOAT(4)  NOT NULL ,                                                 
   "IMSRPRED"  INTEGER NOT NULL ,                                               
   "IMFFADJ"  FLOAT(4)  NOT NULL ,                                              
   "IMSCANCST"  FLOAT(4)  NOT NULL ,                                            
   "IMROWCST"  FLOAT(4)  NOT NULL ,                                             
   "IMPAGECST"  FLOAT(4)  NOT NULL ,                                            
   "IMRIDSORT"  FLOAT(4)  NOT NULL ,                                            
   "IMMERGCST"  FLOAT(4)  NOT NULL ,                                            
   "IMCPU"  FLOAT(4)  NOT NULL ,                                                
   "IMTOT"  FLOAT(4)  NOT NULL ,                                                
   "IMSEQNO"  SMALLINT NOT NULL ,                                               
   "DMPREFH"  CHAR(2)  NOT NULL ,                                               
   "DMCLUDIO"  FLOAT(4)  NOT NULL ,                                             
   "DMNCLUDIO"  FLOAT(4)  NOT NULL ,                                            
   "DMPREDS"  INTEGER NOT NULL ,                                                
   "DMSROWS"  FLOAT(4)  NOT NULL ,                                              
   "DMSCANCST"  FLOAT(4)  NOT NULL ,                                            
   "DMCOLS"  SMALLINT NOT NULL ,                                                
   "DMROWS"  FLOAT(4)  NOT NULL ,                                               
   "RDSROWCST"  FLOAT(4)  NOT NULL ,                                            
   "DMPAGECST"  FLOAT(4)  NOT NULL ,                                            
   "DMDATAIO"  FLOAT(4)  NOT NULL ,                                             
   "DMDATACPU"  FLOAT(4)  NOT NULL ,                                            
   "DMDATATOT"  FLOAT(4)  NOT NULL ,                                            
   "RDSROW"  FLOAT(4)  NOT NULL ,                                               
   "SNCOLS"  SMALLINT NOT NULL ,                                                
   "SNROWS"  FLOAT(4)  NOT NULL ,                                               
   "SNRECSZ"  INTEGER NOT NULL ,                                                
   "SNPAGES"  FLOAT(4)  NOT NULL ,                                              
   "SNRUNS"  FLOAT(4)  NOT NULL ,                                               
   "SNMERGES"  FLOAT(4)  NOT NULL ,                                             
   "SNIOCOST"  FLOAT(4)  NOT NULL ,                                             
   "SNCPUCOST"  FLOAT(4)  NOT NULL ,                                            
   "SNCOST"  FLOAT(4)  NOT NULL ,                                               
   "SNSCANIO"  FLOAT(4)  NOT NULL ,                                             
   "SNSCANCPU"  FLOAT(4)  NOT NULL ,                                            
   "SNSCANCOST"  FLOAT(4)  NOT NULL ,                                           
   "SCCOLS"  SMALLINT NOT NULL ,                                                
   "SCROWS"  FLOAT(4)  NOT NULL ,                                               
   "SCRECSZ"  INTEGER NOT NULL ,                                                
   "SCPAGES"  FLOAT(4)  NOT NULL ,                                              
   "SCRUNS"  FLOAT(4)  NOT NULL ,                                               
   "SCMERGES"  FLOAT(4)  NOT NULL ,                                             
   "SCIOCOST"  FLOAT(4)  NOT NULL ,                                             
   "SCCPUCOST"  FLOAT(4)  NOT NULL ,                                            
   "SCCOST"  FLOAT(4)  NOT NULL ,                                               
   "SCSCANIO"  FLOAT(4)  NOT NULL ,                                             
   "SCSCANCPU"  FLOAT(4)  NOT NULL ,                                            
   "SCSCANCOST"  FLOAT(4)  NOT NULL ,                                           
   "COMPCARD"  FLOAT(4)  NOT NULL ,                                             
   "COMPIOCOST"  FLOAT(4)  NOT NULL ,                                           
   "COMPCPUCOST"  FLOAT(4)  NOT NULL ,                                          
   "COMPCOST"  FLOAT(4)  NOT NULL ,                                             
   "JOINCOLS"  SMALLINT NOT NULL ,                                              
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL ,                                        
   "COSTBLK"  INTEGER NOT NULL ,                                                
   "COSTSTOR"  INTEGER NOT NULL ,                                               
   "MPBLK"  INTEGER NOT NULL ,                                                  
   "MPSTOR"  INTEGER NOT NULL ,                                                 
   "COMPOSITES"  INTEGER NOT NULL ,                                             
   "CLIPPED"  INTEGER NOT NULL ,                                                
   "PARTITION"  INTEGER NOT NULL ,                                              
   "TABREF"  VARCHAR(64)  NOT NULL                                              
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."DETCOST_EXPIDX1" ON "CICERO"."DSN_DETCOST_TABLE"         
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
COMMIT;                                                                         
                                                                                
CREATE TABLE "CICERO"."DSN_FILTER_TABLE"                                        
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "PLANNO"  SMALLINT NOT NULL ,                                                
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "COLLID"  VARCHAR(128)  NOT NULL ,                                           
   "ORDERNO"  INTEGER NOT NULL ,                                                
   "PREDNO"  INTEGER NOT NULL ,                                                 
   "STAGE"  CHAR(9)  NOT NULL ,                                                 
   "ORDERCLASS"  INTEGER NOT NULL ,                                             
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."FILTER_EXPIDX1" ON "CICERO"."DSN_FILTER_TABLE"           
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_PGRANGE_TABLE"                                       
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "TABNO"  SMALLINT NOT NULL ,                                                 
   "RANGE"  SMALLINT NOT NULL ,                                                 
   "FIRSTPART"  SMALLINT NOT NULL ,                                             
   "LASTPART"  SMALLINT NOT NULL ,                                              
   "NUMPARTS"  SMALLINT NOT NULL ,                                              
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."PGR_EXPIDX1" ON "CICERO"."DSN_PGRANGE_TABLE"             
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_PGROUP_TABLE"                                        
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "PLANNAME"  CHAR(8)  NOT NULL ,                                              
   "COLLID"  VARCHAR(128)  NOT NULL ,                                           
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL ,                                        
   "VERSION"  VARCHAR(64)  NOT NULL ,                                           
   "GROUPID"  SMALLINT NOT NULL ,                                               
   "FIRSTPLAN"  SMALLINT NOT NULL ,                                             
   "LASTPLAN"  SMALLINT NOT NULL ,                                              
   "CPUCOST"  FLOAT(4)  NOT NULL ,                                              
   "IOCOST"  FLOAT(4)  NOT NULL ,                                               
   "BESTTIME"  FLOAT(4)  NOT NULL ,                                             
   "DEGREE"  SMALLINT NOT NULL ,                                                
   "MODE"  CHAR(1)  NOT NULL ,                                                  
   "REASON"  SMALLINT NOT NULL ,                                                
   "LOCALCPU"  SMALLINT NOT NULL ,                                              
   "TOTALCPU"  SMALLINT NOT NULL ,                                              
   "FIRSTBASE"  SMALLINT,                                                       
   "LARGETS"  CHAR(1) ,                                                         
   "PARTKIND"  CHAR(1) ,                                                        
   "GROUPTYPE"  CHAR(3) ,                                                       
   "ORDER"  CHAR(1) ,                                                           
   "STYLE"  CHAR(4) ,                                                           
   "RANGEKIND"  CHAR(1) ,                                                       
   "NKEYCOLS"  SMALLINT,                                                        
   "LOWBOUND"  VARCHAR(40) ,                                                    
   "HIGHBOUND"  VARCHAR(40) ,                                                   
   "LOWKEY"  VARCHAR(40) ,                                                      
   "HIGHKEY"  VARCHAR(40) ,                                                     
   "FIRSTPAGE"  CHAR(4) ,                                                       
   "LASTPAGE"  CHAR(4)                                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."GRP_EXPIDX1" ON "CICERO"."DSN_PGROUP_TABLE"              
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_PREDICAT_TABLE"                                      
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "PREDNO"  INTEGER NOT NULL ,                                                 
   "TYPE"  CHAR(8)  NOT NULL ,                                                  
   "LEFT_HAND_SIDE"  VARCHAR(128)  NOT NULL ,                                   
   "LEFT_HAND_PNO"  INTEGER NOT NULL ,                                          
   "LHS_TABNO"  SMALLINT NOT NULL ,                                             
   "LHS_QBNO"  SMALLINT NOT NULL ,                                              
   "RIGHT_HAND_SIDE"  VARCHAR(128)  NOT NULL ,                                  
   "RIGHT_HAND_PNO"  INTEGER NOT NULL ,                                         
   "RHS_TABNO"  SMALLINT NOT NULL ,                                             
   "RHS_QBNO"  SMALLINT NOT NULL ,                                              
   "FILTER_FACTOR"  FLOAT(8)  NOT NULL ,                                        
   "BOOLEAN_TERM"  CHAR(1)  NOT NULL ,                                          
   "SEARCHARG"  CHAR(1)  NOT NULL ,                                             
   "JOIN"  CHAR(1)  NOT NULL ,                                                  
   "AFTER_JOIN"  CHAR(1)  NOT NULL ,                                            
   "ADDED_PRED"  CHAR(1)  NOT NULL ,                                            
   "REDUNDANT_PRED"  CHAR(1)  NOT NULL ,                                        
   "DIRECT_ACCESS"  CHAR(1)  NOT NULL ,                                         
   "KEYFIELD"  CHAR(1)  NOT NULL ,                                              
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL ,                                        
   "CATEGORY"  SMALLINT NOT NULL ,                                              
   "CATEGORY_B"  SMALLINT NOT NULL ,                                            
   "TEXT"  VARCHAR(2000)  NOT NULL ,                                            
   "PRED_ENCODE"  CHAR(1)  NOT NULL ,                                           
   "PRED_CCSID"  SMALLINT NOT NULL ,                                            
   "PRED_MCCSID"  SMALLINT NOT NULL ,                                           
   "MARKER"  CHAR(1)  NOT NULL ,                                                
   "PARENT_PNO"  INTEGER NOT NULL ,                                             
   "NEGATION"  CHAR(1)  NOT NULL ,                                              
   "LITERALS"  VARCHAR(128)  NOT NULL                                           
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."PRED_EXPIDX1" ON "CICERO"."DSN_PREDICAT_TABLE"           
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_PTASK_TABLE"                                         
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "PGDNO"  SMALLINT NOT NULL ,                                                 
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "LPTNO"  SMALLINT NOT NULL ,                                                 
   "KEYCOLID"  SMALLINT,                                                        
   "DPSI"  CHAR(1)  NOT NULL ,                                                  
   "LPTLOKEY"  VARCHAR(40)  FOR BIT DATA ,                                      
   "LPTHIKEY"  VARCHAR(40)  FOR BIT DATA ,                                      
   "LPTLOPAG"  CHAR(4)  FOR BIT DATA ,                                          
   "LPTHIPAG"  CHAR(4)  FOR BIT DATA ,                                          
   "LPTLOPG#"  CHAR(4)  FOR BIT DATA ,                                          
   "LPTHIPG#"  CHAR(4)  FOR BIT DATA ,                                          
   "LPTLOPT#"  SMALLINT,                                                        
   "LPTHIPT#"  SMALLINT,                                                        
   "KEYCOLDT"  SMALLINT,                                                        
   "KEYCOLPREC"  SMALLINT,                                                      
   "KEYCOLSCAL"  SMALLINT,                                                      
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."PTASK_EXPIDX1" ON "CICERO"."DSN_PTASK_TABLE"             
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_SORT_TABLE"                                          
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "PLANNO"  SMALLINT NOT NULL ,                                                
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "COLLID"  VARCHAR(128)  NOT NULL ,                                           
   "SORTC"  CHAR(5)  NOT NULL ,                                                 
   "SORTN"  CHAR(5)  NOT NULL ,                                                 
   "SORTNO"  SMALLINT NOT NULL ,                                                
   "KEYSIZE"  SMALLINT NOT NULL ,                                               
   "ORDERCLASS"  INTEGER NOT NULL ,                                             
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."SORT_EXPIDX1" ON "CICERO"."DSN_SORT_TABLE"               
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_SORTKEY_TABLE"                                       
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "QBLOCKNO"  SMALLINT NOT NULL ,                                              
   "PLANNO"  SMALLINT NOT NULL ,                                                
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  VARCHAR(128)  NOT NULL ,                                         
   "COLLID"  VARCHAR(128)  NOT NULL ,                                           
   "SORTNO"  SMALLINT NOT NULL ,                                                
   "ORDERNO"  SMALLINT NOT NULL ,                                               
   "EXPTYPE"  CHAR(3)  NOT NULL ,                                               
   "TEXT"  VARCHAR(128)  NOT NULL ,                                             
   "TABNO"  SMALLINT NOT NULL ,                                                 
   "COLNO"  SMALLINT NOT NULL ,                                                 
   "DATATYPE"  CHAR(18)  NOT NULL ,                                             
   "LENGTH"  INTEGER NOT NULL ,                                                 
   "CCSID"  INTEGER NOT NULL ,                                                  
   "ORDERCLASS"  INTEGER NOT NULL ,                                             
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL                                          
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."SORTK_EXPIDX1" ON "CICERO"."DSN_SORTKEY_TABLE"           
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
CREATE TABLE "CICERO"."DSN_STATEMNT_TABLE"                                      
  (                                                                             
   "QUERYNO"  INTEGER NOT NULL ,                                                
   "APPLNAME"  CHAR(8)  NOT NULL ,                                              
   "PROGNAME"  CHAR(8)  NOT NULL ,                                              
   "COLLID"  CHAR(18)  NOT NULL ,                                               
   "GROUP_MEMBER"  CHAR(8)  NOT NULL ,                                          
   "EXPLAIN_TIME"  TIMESTAMP  NOT NULL ,                                        
   "STMT_TYPE"  CHAR(6)  NOT NULL ,                                             
   "COST_CATEGORY"  CHAR(1)  NOT NULL ,                                         
   "PROCMS"  INTEGER NOT NULL ,                                                 
   "PROCSU"  INTEGER NOT NULL ,                                                 
   "REASON"  VARCHAR(254)  NOT NULL                                             
  );                                                                            
COMMIT;                                                                         
CREATE INDEX "CICERO"."STMT_EXPIDX1" ON "CICERO"."DSN_STATEMNT_TABLE"           
  ( "QUERYNO" ASC,    "EXPLAIN_TIME" ASC);                                      
                                                                                
                                                                                
COMMIT;                                                                         
