//DB@DSNTI JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               JOB02007
//*-------------------------------------------------------------------          
//*                                                                             
//*-------------------------------------------------------------------          
//IEFBR14  EXEC PGM=IEFBR14                                                     
//*SYSUT1   DD DSN=CICERO.UNL.FIM,DISP=(OLD,DELETE,DELETE)                      
//*SYSUT2   DD DSN=CICERO.UNL.TESTE,DISP=(OLD,DELETE,DELETE)                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//*-------------------------------------------------------------------          
//*                                                                             
//*-------------------------------------------------------------------          
//DSNTIAUL EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=CICERO.UNL.TESTE,DISP=(NEW,CATLG,CATLG),                    
//         UNIT=SYSDBA,SPACE=(TRK,(1000,1000),RLSE)                             
//SYSIN    DD   *                                                               
SELECT CHAR(DIGITS(CDRMRMO))     AS CDRMRMO,                            00020099
       CHAR(TPSEGURO)            AS TPSEGURO,                                   
       CHAR(CDEMPDSF)            AS CDEMPDSF,                                   
       CHAR(CDSUCDSF)            AS CDSUCDSF,                                   
       CHAR(CDFILDSF)            AS CDFILDSF,                                   
       CHAR(DIGITS(CDUNPINP))    AS CDUNPINP,                                   
       CHAR(DIGITS(CDCORDSF))    AS CDCORDSF,                                   
       CHAR(DTMOVPRO,USA)        AS DTMOVPRO,                                   
       CHAR(SUM(VRPRMLIQ)) AS VRPRMLIQ,                                         
       CHAR(SUM(VRPRMCOM)) AS VRPRMCOM,                                         
       CHAR(SUM(VRSINIST)) AS VRSINIST,                                         
       CHAR(DIGITS(SUM(QTEMINOV))) AS QTEMINOV,                                 
       CHAR(DIGITS(SUM(QTEMIREN))) AS QTEMIREN,                                 
       CHAR(DIGITS(SUM(QTEMITRA))) AS QTEMITRA,                                 
       CHAR(DIGITS(SUM(QTPROCAN))) AS QTPROCAN,                                 
       CHAR(DIGITS(SUM(QTPROTRA))) AS QTPROTRA,                                 
       CHAR(SUM(VRCOMPGO)) AS VRCOMPGO                                          
  FROM MARITIMA.DOSOFT                                                  00350099
 GROUP BY CDRMRMO , TPSEGURO, CDEMPDSF, CDSUCDSF,                       00360099
          CDFILDSF, CDUNPINP, CDCORDSF, DTMOVPRO                        00370099
 ORDER BY CDRMRMO                                                       00380099
   FOR READ ONLY WITH UR;                                               00390099
//                                                                              
//* finalizou aqui                                                              
//                                                                              
//*-------------------------------------------------------------------          
//* TRANSFERE ARQUIVO                                                           
//*-------------------------------------------------------------------          
//FTP      EXEC PGM=FTP,REGION=4096K,                                           
//             PARM='10.135.162.40 (TIMEOUT 200 EXIT'                           
//STEPLIB  DD  DSN=TCPIP.SEZALINK,DISP=SHR                                      
//SYSMDUMP DD  SYSOUT=Z                                                         
//SYSPRINT DD  SYSOUT=(A,,A4A4),COPIES=1                                        
//INPUT    DD  *                                                                
  accdb2                                                                        
  bravo                                                                         
  PUT 'CICERO.UNL.TESTE' dosoft.txt                                             
  PUT 'ARQUIVO DE CONTROLE' controle.txt                                        
//*-------------------------------------------------------------------          
//* EXECUTA CARGA NO INFORMIX                                                   
//*-------------------------------------------------------------------          
//CALLAIX  EXEC PGM=IKJEFT01                                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
rexec -l accdb2 -p bravo 10.135.162.40 ./carrega24.sh                           
