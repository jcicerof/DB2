//DBQUD001 JOB MSGCLASS=P,CLASS=A,NOTIFY=JONAS                                  
//*-------------------------------------------------------------------          
//**JOB QUE ENVIA EMAIL DE TABELAS SEM BACKUP AMBIENTE PRODUCAO     **          
//**AUTOR JONAS VASSALO JR DIA 21/11/2008                                       
//**QUALQUER ABEND ENVIAR EMAIL PARA JONAS.VASSALO@T-SYSTEMS.COM.BR             
//*-------------------------------------------------------------------          
//** PROCESSA DE SEGUNDA A SEXTA-FEIRA PELO CA7 AS 06:30H ************          
//*-------------------------------------------------------------------          
//* ALTERACOES                                                                  
//* 09-01-09 CICERO COLOQUEI INLINE A QUERY O COMANDO DE FTP                    
//*                                                                             
//*-------------------------------------------------------------------          
//STEP01  EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=P.DBA.LSTCPY.MRTP(+1),                                        
//            DISP=(NEW,CATLG,DELETE),                                          
//            UNIT=SYSPRD,SPACE=(CYL,(1,1),RLSE)                                
//SYSOUT   DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//**SYSIN    DD DSN=JONAS.DBA.JOB(SEMBKP),DISP=SHR                              
//SYSIN    DD *                                                                 
SELECT DISTINCT CHAR('INCLUDE TABLESPACE '||STRIP(DBNAME)||'.'||                
            STRIP(TSNAME),80)                                                   
  FROM SYSIBM.SYSTABLES A                                                       
WHERE A.TYPE = 'T'                                                              
  AND A.DBNAME <> 'DSN8D81A'                                                    
  AND A.DBNAME <> 'DB2ADM'                                                      
  AND A.DBNAME <> 'DBINFOR'                                                     
  AND A.CREATOR IN ('ANO2000', 'MAREXCLU', 'MARHISTO', 'MARITIMA',              
                    'TECINFOR', 'SQLUSER', 'DB2USER')                           
  AND NOT EXISTS (SELECT '1' FROM SYSIBM.SYSCOPY B                              
                   WHERE B.DBNAME = A.DBNAME                                    
                     AND B.TSNAME = A.TSNAME                                    
                     AND B.ICTYPE = 'F'                                         
                     AND B.ICDATE >= '080601'                                   
                     AND B.TIMESTAMP >=(CURRENT_TIMESTAMP - 30 DAYS))                              
;                                                                               
//********************************************************************          
//** STEP DE FAZ O FTP PARA A MAQUINA HOMOLOGAù O BENNER 10.1.1.92 E *          
//** E ENVIA EMAIL DE TABELAS QUE NﬁO ESTﬁO EM ROTINAS DE BACKUP***             
//********************************************************************          
//STEP02   EXEC PGM=FTP,REGION=4096K,                                           
//             PARM='10.1.1.92 (TIMEOUT 20 EXIT'                                
//STEPLIB  DD  DSN=TCPIP.SEZALINK,DISP=SHR                                      
//SYSMDUMP DD  SYSOUT=Z                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//OUTPUT   DD  SYSOUT=*                                                         
//*INPUT    DD  DSN=JONAS.DBA.JOB(FTPPRD),DISP=SHR                              
//INPUT    DD  *                                                                
DB2ADMIN                                                                        
bennerhom                                                                       
ascii                                                                           
PUT 'P.DBA.LSTCPY.MRTP(0)' JONAS\PRODUCAO.TXT                                   
QUIT                                                                            
