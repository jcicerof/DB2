//DB@IKJEF JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID,TYPRUN=SCAN           
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//         SET    DSN=DB2P                                                      
//*--------------------------------------------------------------------         
//*                                                                             
//*--------------------------------------------------------------------         
//ALTER    EXEC PROC=DSNTEP2                                                    
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSIN    DD *                                                                 
ALTER INDEX MARITIMA.CADAPFRA_IX1    PRIQTY 266400 SECQTY 26640;                
ALTER INDEX MARITIMA.PAGAMENTO_IE1   PRIQTY 257040 SECQTY 25728;                
ALTER INDEX MARITIMA.RETDLLBANSP_IX1 PRIQTY 105840 SECQTY 10608;                
ALTER INDEX MARITIMA.SSLIMSEG_IX1    PRIQTY 243360 SECQTY 24336;                
ALTER INDEX MARITIMA.SSMOVPROC_PK    PRIQTY 167760 SECQTY 16800;                
ALTER INDEX MARITIMA.TBSOLPRE_IX1    PRIQTY 228240 SECQTY 22848;                
ALTER TABLESPACE BMCPERF.BMCPPLAN PRIQTY 203040 SECQTY 20304;                   
ALTER TABLESPACE DBEETA.HISEVTAB PRIQTY 136080 SECQTY 13632;                    
ALTER TABLESPACE DBMA02.CONSCORR PRIQTY 257040 SECQTY 25728;                    
ALTER TABLESPACE DBNOVA.TSCDCADP PRIQTY 110160 SECQTY 11040;                    
ALTER TABLESPACE DBSS04.SSSEGDEP PRIQTY 142560 SECQTY 14256;                    
COMMIT;                                                                         
//*--------------------------------------------------------------------         
//*                                                                             
//*--------------------------------------------------------------------         
//REBUILD  EXEC PROC=REBUILD,DSN=&DSN                                   00030000
//SYSIN    DD   *                                                       00040000
 REBUILD INDEX (MARITIMA.CADAPFRA_IX1)                                  00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
 REBUILD INDEX (MARITIMA.PAGAMENTO_IE1)                                 00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
 REBUILD INDEX (MARITIMA.RETDLLBANSP_IX1)                               00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
 REBUILD INDEX (MARITIMA.SSLIMSEG_IX1)                                  00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
 REBUILD INDEX (MARITIMA.SSMOVPROC_PK)                                  00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
 REBUILD INDEX (MARITIMA.TBSOLPRE_IX1)                                  00042216
  STATISTICS KEYCARD UPDATE ALL                                         00042316
//*--------------------------------------------------------------------         
//*                                                                             
//*--------------------------------------------------------------------         
//REORG    EXEC PROC=REORG,DSN=&DSN                                     00030000
//DFSPARM DD *                                                                  
  OPTION FILSZ=E3000000                                                         
//SYSIN    DD   *                                                       00040000
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
                INCLUDE TABLESPACE BMCPERF.BMCPPLAN                             
                INCLUDE TABLESPACE DBEETA.HISEVTAB                              
                INCLUDE TABLESPACE DBMA02.CONSCORR                              
                INCLUDE TABLESPACE DBNOVA.TSCDCADP                              
                INCLUDE TABLESPACE DBSS04.SSSEGDEP                              
                                                                                
TEMPLATE DDCOPY DSN(&SSID.COPY.FE.&DB..&TS..D&DT.)                              
   UNIT VSM                                                                     
   DISP (NEW,CATLG,DELETE)                                                      
                                                                                
TEMPLATE DDDISC DSN(CICERO.UNL.&DB..&TS..DISC.D&DT.)                            
   UNIT SYSDA SPACE (500,500) CYL DISP (NEW,DELETE,CATLG)                       
                                                                                
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                          
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,DELETE,CATLG)                           
                                                                                
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                              
   UNIT SYSDA SPACE (500,500) CYL DISP (NEW,DELETE,CATLG)                       
                                                                                
QUIESCE LIST DBLIST                                                             
REORG TABLESPACE LIST DBLIST LOG NO                                             
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL           
