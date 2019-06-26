//DB@CFTP1 JOB MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID                        JOB01385
//* **************************************************                          
//* * ESTE JOB PERTENCE AO DBA (CARLOS).             *                          
//* * EM CASO DE CANCELAMENTO, INTERROMPER O PROCES- *                          
//* * SAMENTO.                                       *                          
//* **************************************************                          
//* *           DELETA ARQUIVO                       *                          
//* **************************************************                          
//DELETA01 EXEC PGM=IDCAMS                                                      
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
      DEL DBA.MAINVIEW.ELAPSED.ACCOUNT                                          
          SET LASTCC = 0                                                        
          SET MAXCC = 0                                                         
//* **************************************************                          
//* *     COPIA GDG PARA NOVO NOME DE ARQUIVO        *                          
//* **************************************************                          
//ICEGENER EXEC PGM=ICEGENER                                                    
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  DUMMY                                                            
//SYSUT1   DD  DSN=T.MAINVIEW.ELAPSED.DIARIO(-2),DISP=SHR                       
//SYSUT2   DD  DSN=DBA.MAINVIEW.ELAPSED.ACCOUNT,                                
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=SYSDA,SPACE=(TRK,(10,10),RLSE),                                 
//         DCB=(LRECL=133,RECFM=FBA,BLKSIZE=133)                                
//* ********************************************************                    
//* * FTP  MAINFRAME PARA RISK                             *                    
//* ********************************************************                    
//FTP00000 EXEC PGM=FTP,REGION=4096K,                                           
//             PARM='10.135.162.40 (TIMEOUT 200 EXIT'                           
//STEPLIB  DD  DSN=TCPIP.SEZALINK,DISP=SHR                                      
//SYSMDUMP DD  SYSOUT=Z                                                         
//SYSPRINT DD  SYSOUT=(H,,LIXO),COPIES=1                                        
//INPUT    DD  DSN=DBA.DB2.JOB(INPUTCC),DISP=SHR                                
//*********************************************************                     
//SDO001A0 EXEC PGM=IKJEFT01                                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD    DSN=DBA.DB2.JOB(SYSACCNT),DISP=SHR                             
