//DB@REORC JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
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
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSUT1   DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                   
//SORTOUT  DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                   
//DFSPARM DD *                                                                  
 OPTION FILSZ=E30000000                                                         
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
                INCLUDE TABLESPACE DBEETA.ALCCALVG                              
                                                                                
TEMPLATE DDCOPY DSN(&SSID.COPY.FE.&DB..&TS..D&DT.)                              
   UNIT VSM                                                                     
   DISP (NEW,CATLG,DELETE)                                                      
                                                                                
TEMPLATE DDDISC DSN(CICERO.UNL.&DB..&TS..DISC.D&DT.)                            
   UNIT SYSDA SPACE (1000,1000) TRK DISP (NEW,DELETE,CATLG)                     
                                                                                
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH.D&DT.)                          
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,DELETE,CATLG)                           
                                                                                
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                              
   UNIT SYSDA SPACE (1000,1000) TRK DISP (NEW,DELETE,CATLG)                     
                                                                                
QUIESCE LIST DBLIST                                                             
REORG TABLESPACE LIST DBLIST LOG NO                                             
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL           
//                                                                              
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
