//DBQUS001 JOB MSGCLASS=P,CLASS=A,NOTIFY=JONAS,USER=CA7ONL              JOB00924
//*-------------------------------------------------------------------          
//**JOB QUE ENVIA EMAIL DOS EXTENTS DAS TABELAS AMBIENTE PRODUCAO   **          
//**AUTOR JONAS VASSALO JR DIA 31/12/2008                                       
//**QUALQUER ABEND ENVIAR EMAIL PARA JONAS.VASSALO@T-SYSTEMS.COM.BR             
//*-------------------------------------------------------------------          
//** PROCESSA DE DOMINGO APÏS A ROTINA HSTSPACE           ************          
//*-------------------------------------------------------------------          
//* ALTERACOES                                                                  
//* 09-01-09 CICERO COLOQUEI INLINE A QUERY O COMANDO DE FTP                    
//* 09-01-09 CICERO ALTEREI A QUERY PARA TRAZER O RESULTADO MAIS                
//*                 RECENTE E O ESPACO ALOCADO EM TRILHAS (TRK)                 
//*-------------------------------------------------------------------          
//STEP01  EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=P.DBA.EXTTBIND.MRTP(+1),                                      
//            DISP=(NEW,CATLG,DELETE),                                          
//            UNIT=SYSPRD,SPACE=(CYL,(1,1),RLSE)                                
//SYSOUT   DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//*SYSIN    DD DSN=JONAS.DBA.JOB(EXTTBIND),DISP=SHR                             
//SYSIN    DD *                                                                 
SELECT DATA,DSNAME,EXTENTS,                                                     
       INTEGER((HI_A_RBA/1024)/48) AS "TRK ALLOC"                               
  FROM DB2ADM.HSTVSAM                                                           
WHERE EXTENTS >=10                                                              
  AND DATA = (SELECT MAX(DATA) FROM DB2ADM.HSTVSAM)                             
ORDER BY EXTENTS DESC;                                                          
//********************************************************************          
//** STEP DE FAZ O FTP PARA A MAQUINA HOMOLOGAù O BENNER 10.1.1.92 E *          
//** E ENVIA EMAIL DE EXTENTS DE TABELAS ACIMA DE 10 EXT PRODUCAO ****          
//********************************************************************          
//STEP02   EXEC PGM=FTP,REGION=4096K,                                           
//             PARM='10.1.1.92 (TIMEOUT 20 EXIT'                                
//STEPLIB  DD  DSN=TCPIP.SEZALINK,DISP=SHR                                      
//SYSMDUMP DD  SYSOUT=Z                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//OUTPUT   DD  SYSOUT=*                                                         
//*INPUT    DD  DSN=JONAS.DBA.JOB(FTPPRD1),DISP=SHR                             
//INPUT    DD  *                                                                
DB2ADMIN                                                                        
bennerhom                                                                       
ascii                                                                           
PUT 'P.DBA.EXTTBIND.MRTP(0)' JONAS\EXTTBINDPROD.TXT                             
QUIT                                                                            
