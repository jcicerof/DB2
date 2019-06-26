//DB@REORC JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//*                                                                             
//*------------------------------------------------------------------           
//DSNTEP2  EXEC PROC=DSNTEP2                                                    
//DSNTEP2.SYSTSIN DD *                                                          
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//DSNTEP2.SYSIN DD *                                                            
ALTER INDEX MARITIMA.SEGURADO_IX1 NOT CLUSTER;                                  
COMMIT;                                                                         
ALTER INDEX MARITIMA.SEGURADO_IX2 CLUSTER;                                      
COMMIT;                                                                         
//*------------------------------------------------------------------           
//* REORG                                                                       
//*------------------------------------------------------------------           
//REORG    EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//*SYSUT1   DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                  
//*SORTOUT  DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                  
//DFSPARM DD *                                                                  
 OPTION FILSZ=E3000000                                                          
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
                INCLUDE TABLESPACE DBMA02.SEGURADO                              
                                                                                
TEMPLATE DDCOPY DSN(&SSID.COPY.FE.&DB..&TS..D&DT.)                              
   UNIT VSM                                                                     
   DISP (NEW,CATLG,DELETE)                                                      
                                                                                
TEMPLATE DDDISC DSN(CICERO.UNL.&DB..&TS..DISC.D&DT.)                            
   DISP (NEW,CATLG,CATLG)                                                       
   UNIT VSM  VOLCNT(255) RETPD 30                                               
                                                                                
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                          
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,DELETE,CATLG)                           
                                                                                
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                              
   DISP (NEW,DELETE,CATLG)                                                      
   UNIT VSM  VOLCNT(255) RETPD 30                                               
                                                                                
QUIESCE LIST DBLIST                                                             
REORG TABLESPACE LIST DBLIST LOG NO                                             
      SORTDATA SORTKEYS                                                         
      SORTDEVT SYSWDB                                                           
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL           
//*-------------------------------------------------------------------          
//* REBIND                                                                      
//*-------------------------------------------------------------------          
//REBIND   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSOUT   DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
DSN SYSTEM(DB2P)                                                                
REBIND PACKAGE(MAPCCOLE.AP110R1) ISOLATION(CS) EXPLAIN(YES)                     
END                                                                             
