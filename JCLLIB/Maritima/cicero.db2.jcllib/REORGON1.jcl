//DB@REORC JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//* REORG                                                                       
//*------------------------------------------------------------------           
//REORG    EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//UTPRIN01 DD   SYSOUT=*                                                        
//UTPRIN02 DD   SYSOUT=*                                                        
//UTPRIN03 DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSUT1   DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                   
//SORTOUT  DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                   
//* FIRST  GROUP OF SORT WORK DATA SETS FOR PARALLEL INDEX BUILD                
//SW01WK01 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//SW01WK02 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//SW01WK03 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//* SECOND GROUP OF SORT WORK DATA SETS FOR PARALLEL INDEX BUILD                
//SW02WK01 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//SW02WK02 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//SW02WK03 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//* SORT WORK DATA SETS FOR USE BY SORTDATA                                     
//SORTWK01 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//SORTWK02 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//SORTWK03 DD UNIT=SYSWDB,SPACE=(CYL,(900,200),,,ROUND)                         
//DFSPARM DD *                                                                  
 OPTION FILSZ=E30000000                                                         
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
                INCLUDE TABLESPACE DBNOVA.TBAUFRQN                              
                                                                                
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
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL           
//                                                                              
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
                INCLUDE TABLESPACE DBNOVA.TBAMFRQ                               
      SORTDEVT SYSWDB                                                           
      SORTNUM 4                                                                 
