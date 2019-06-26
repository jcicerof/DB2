//DB@TPBI  JOB ,MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID,COND=(0,LT)                   
// JCLLIB   ORDER=SYS8.PROCLIB                                                  
// INCLUDE  MEMBER=JOBLIBS                                                      
/*JOBPARM  LINECT=0                                                             
//* ********************************************************                    
//* STEP 05 - PGM=FTP - TRANSMITE MAINFRAME PARA SERVIDOR  *                    
//*                     DO (B.I) SOLARIS.                  *                    
//* ********************************************************                    
//FTPI0507 EXEC PGM=FTP,REGION=4096K,                                           
//             PARM='10.1.1.103 (TIMEOUT 20'                                    
//STEPLIB  DD  DSN=TCPIP.SEZALINK,DISP=SHR                                      
//SYSMDUMP DD  SYSOUT=Z                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//OUTPUT   DD  SYSOUT=*                                                         
//INPUT    DD  *                                                                
  sybase mar1234                                                                
  ascii                                                                         
  PUT 'P.SSS.#SCAINHO'  /transfer/CAINHOTEST.TXT                                
  PUT 'P.SSS.#SCORRET'  /transfer/CORRETEST.TXT                                 
  PUT 'P.SSS.#SDESVER'  /transfer/DESVERTEST.TXT                                
  QUIT                                                                          
//                                                                              
