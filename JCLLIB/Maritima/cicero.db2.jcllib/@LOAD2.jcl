//DB@2LOA2 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//*LOAD DATA INDDN U1465856 LOG NO  REPLACE NOCOPYPEND                          
//*STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL                                  
//* LOAD                                                                        
//*------------------------------------------------------------------           
//LOAD     EXEC PROC=LOAD,DSN=&DSN                                              
//SYSDISC  DD   SYSOUT=*                                                        
//SYSREC   DD   DISP=SHR,DSN=CICERO.ALL.DATASETS.SYSCOPY.DB2P.SORTED            
//SYSIN    DD   *                                                               
LOAD DATA INDDN SYSREC   LOG NO  REPLACE NOCOPYPEND                             
 INTO TABLE "DB2ADM"."DB2PCOPY"                                                 
 ( "DSNAME"                                                                     
        POSITION(  00018) CHAR(00044)                                           
 )                                                                              
