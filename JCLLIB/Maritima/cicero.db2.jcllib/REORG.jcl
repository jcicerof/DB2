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
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(700,500),RLSE)                    
//SYSERR   DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(700,500),RLSE)                    
//SYSUT1   DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                   
//SORTOUT  DD   UNIT=VSM  **SYSDA,SPACE=(CYL,(2500,700),RLSE)                   
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC   DD   UNIT=SYSDA,SPACE=(CYL,(1500,1500),RLSE)                         
//SYSCOPY  DD   DSN=DB2PCOPY.FE.DBWPC1.DETALAPO.D2007114,                       
//         DISP=(NEW,CATLG,DELETE),UNIT=VSM                                     
//SYSDISC  DD   DSN=CICERO.DB2P.DBWPC1.DETALAPO.SYSDISC,                        
//         DISP=(NEW,CATLG,CATLG),UNIT=SYSDA,                                   
//         SPACE=(TRK,(1000,1000),RLSE)                                         
//SYSIN    DD   *                                                               
REORG TABLESPACE DBWPC1.DETALAPO LOG NO                                         
      SORTDATA SORTKEYS 7500000                                                 
      SORTDEVT SYSWRK                                                           
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL           
