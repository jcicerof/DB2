//DB@REORC JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*-------------------------------------------------------------------          
//* REORGANIZACAO DA TABELA DB2 ASN.IBMSNAP_UOW                                 
//*                                                                             
//* REORG                                                                       
//*------------------------------------------------------------------           
//         SET DSN=DB2P                                                         
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
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
                INCLUDE TABLESPACE DPROPR.DTSTSUOW                              
TEMPLATE DDCOPY                                                                 
         DSN('DB2PCOPY.FD1.&DB..&TS..P0(+1)')                                   
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
         GDGLIMIT(5)                                                            
                                                                                
TEMPLATE DDDISC DSN(DB2PWRK.UNL.&DB..&TS..DISC.D&DT.)                           
   DISP (NEW,DELETE,CATLG)                                                      
   UNIT VSM  VOLCNT(255) RETPD 10                                               
                                                                                
TEMPLATE DDPUNCH DSN(DB2PWRK.UNL.&DB..&TS..PUNCH.D&DT.)                         
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,DELETE,CATLG)                           
                                                                                
TEMPLATE DDREC DSN(DB2PWRK.UNL.&DB..&TS..REC.D&DT.)                             
   DISP (NEW,DELETE,CATLG)                                                      
   UNIT VSM  VOLCNT(255) RETPD 10                                               
                                                                                
QUIESCE LIST DBLIST                                                             
REORG TABLESPACE LIST DBLIST LOG NO                                             
      SORTDATA SORTKEYS                                                         
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL           
//                                                                              
