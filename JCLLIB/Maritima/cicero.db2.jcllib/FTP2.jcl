//DB@CFTP JOB MSGCLASS=X,CLASS=T,NOTIFY=&SYSUID                         JOB01385
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
//**SYSUT1   DD  DSN=T.MAINVIEW.ELAPSED.DIARIO(0),DISP=SHR                      
//**SYSUT1   DD  DSN=T.MAINVIEW.ELAPSED.DIARIO.G1365V00                         
//SYSUT1   DD  DISP=SHR,DSN=T.MAINVIEW.ELAPSED.DIARIO.G1352V00                  
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
//SYSPRINT DD  SYSOUT=(A,,A4A4),COPIES=1                                        
//INPUT    DD  *                                                                
  accdb2                                                                        
  bravo                                                                         
  PUT 'DBA.MAINVIEW.ELAPSED.ACCOUNT' dba_elapsed_d24.txt                        
//*********************************************************                     
//SDO001A0 EXEC PGM=IKJEFT01                                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
rexec -l accdb2 -p bravo 10.135.162.40 ./carrega24.sh                           
