//DB@DSNTI JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               JOB00632
//*                                                                             
//* EM CASO DE CANCELAMENTO ENVIAR UM EMAIL PARA OS SEGUINTES USUARIOS          
//* RC=04 NORMAL.                                                               
//* JOSE.CICERO@TS3.COM.BR                                                      
//* JONAS.VASSALO@T-SYSTEMS.COM.BR                                              
//*                                                                             
//DSNTIAUL EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                   
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT                                                                  00001017
   CHAR('SELECT '||''''||STRIP(NAME)||''''||                            00001117
        ', COUNT(*),CURRENT DATE,CURRENT TIME ',80),                    00001218
   CREATOR,NAME,1                                                       00001218
  FROM SYSIBM.SYSTABLES                                                 00002115
 WHERE TYPE = 'T'                                                       00002215
   AND CREATOR = 'ASN'                                                  00002316
   AND NAME    = 'IBMSNAP_UOW'                                          00002316
UNION ALL                                                                       
SELECT                                                                  00001017
   CHAR(' FROM '||STRIP(CREATOR)||'.'||STRIP(NAME)||' WITH UR;',80),    00001218
   CREATOR,NAME,2                                                       00001218
  FROM SYSIBM.SYSTABLES                                                 00002115
 WHERE TYPE = 'T'                                                       00002215
   AND CREATOR = 'ASN'                                                  00002316
   AND NAME    = 'IBMSNAP_UOW'                                          00002316
UNION ALL                                                                       
SELECT                                                                  00001017
   CHAR('SELECT '||''''||STRIP(NAME)||''''||                            00001117
        ', COUNT(*),CURRENT DATE,CURRENT TIME ',80),                    00001218
   CREATOR,NAME,1                                                       00001218
  FROM SYSIBM.SYSTABLES                                                 00002115
 WHERE TYPE = 'T'                                                       00002215
   AND CREATOR = 'DB2PDPRC'                                             00002316
UNION ALL                                                                       
SELECT                                                                  00001017
   CHAR(' FROM '||STRIP(CREATOR)||'.'||STRIP(NAME)||' WITH UR;',80),    00001218
   CREATOR,NAME,2                                                       00001218
  FROM SYSIBM.SYSTABLES                                                 00002115
 WHERE TYPE = 'T'                                                       00002215
   AND CREATOR = 'DB2PDPRC'                                             00002316
ORDER BY 2,3,4                                                                  
FOR FETCH ONLY WITH UR;                                                 00002809
//*-------------------------------------------------------------------          
//*                                                                             
//*-------------------------------------------------------------------          
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                  
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                  
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  END                                                                           
//SYSPRINT DD   DSN=P.DB2PDPRC.DPROP(+1),DISP=(,CATLG,DELETE),                  
//         UNIT=SYSDA,SPACE=(TRK,(10,1),RLSE)                                   
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   DSN=&&TEMP,DISP=OLD                                             
