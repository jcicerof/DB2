//DB@ALTBP JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*-------------------------------------------------------------------          
//* MOVIMENTA OS TABLESPACES/INDEXSPACES MENORES QUE 1000 PAGINAS               
//* ATIVAS RESPECTIVAMENTE PARA OS BUFFERPOOLS BP3/BP4.                         
//*                                                                             
//* ISTO REPRESENTA APROXIMADAMENTE 60% DOS TABLESPACES DA PRODUCAO             
//* DEIXANDO OS BP1/BP2 PARA OS DEMAIS TABLESPACES. O HIT RATIO                 
//* OBSERVADO NOS BP3/BP4 E DE MAIS DE 99%.                                     
//*                                                                             
//* OS OBJETOS DA NM100D1 DEVEM SER POSICIONADOS NO BP26/BP27                   
//*                                                                             
//* OS OBJETOS DA PROPOSTAONBASE DEVEM SER POSICIONADOS NO BP25                 
//*-------------------------------------------------------------------          
//* GERA COMANDO DE ALTER TABLESPACE                                            
//*-------------------------------------------------------------------          
//STEP01   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=&&ALTERBP,SPACE=(TRK,(5,5)),DISP=(,PASS),UNIT=SYSDA           
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
SELECT                                                                          
CHAR('ALTER TABLESPACE '||STRIP(B.DBNAME)||'.'||STRIP(B.NAME)||                 
     ' BUFFERPOOL BP3;',80)                                                     
  FROM SYSIBM.SYSTABLES A,                                                      
       SYSIBM.SYSTABLESPACE B                                                   
WHERE A.TYPE = 'T'                                                              
  AND A.DBNAME LIKE 'DB%'                                                       
  AND A.DBNAME = B.DBNAME                                                       
  AND A.TSNAME = B.NAME                                                         
  AND B.NACTIVE < 1000;                                                         
//*-------------------------------------------------------------------          
//* GERA COMANDO DE ALTER INDEX                                                 
//*-------------------------------------------------------------------          
//STEP02   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=&&ALTERIX,SPACE=(TRK,(5,5)),DISP=(,PASS),UNIT=SYSDA           
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
SELECT                                                                          
CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||                     
     ' BUFFERPOOL BP4;',80)                                                     
  FROM SYSIBM.SYSTABLES A,                                                      
       SYSIBM.SYSTABLESPACE B,                                                  
       SYSIBM.SYSINDEXES I                                                      
WHERE A.TYPE = 'T'                                                              
  AND A.DBNAME LIKE 'DB%'                                                       
  AND A.DBNAME = B.DBNAME                                                       
  AND A.TSNAME = B.NAME                                                         
  AND B.NACTIVE < 1000                                                          
  AND A.NAME   = I.TBNAME                                                       
  AND A.CREATOR = I.TBCREATOR                                                   
//*-------------------------------------------------------------------          
//* GERA COMANDOS DE STOP/START                                                 
//*-------------------------------------------------------------------          
//STEP03   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=&&STOPSTA,SPACE=(TRK,(5,5)),DISP=(,PASS),UNIT=SYSDA           
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
  SELECT                                                                00017019
  '-STO DB('||STRIP(I.CREATOR)||') SPACE('||STRIP(I.INDEXSPACE)||')'    00018019
  ,I.DBNAME,I.INDEXSPACE,1                                              00019019
    FROM SYSIBM.SYSTABLES A,                                            00020019
         SYSIBM.SYSTABLESPACE B,                                        00030019
         SYSIBM.SYSINDEXES I                                            00031019
  WHERE A.TYPE = 'T'                                                    00040019
    AND A.DBNAME LIKE 'DB%'                                             00060019
    AND A.DBNAME = B.DBNAME                                             00061019
    AND A.TSNAME = B.NAME                                               00070019
    AND B.NACTIVE < 1000                                                00080019
    AND A.NAME   = I.TBNAME                                             00081019
    AND A.CREATOR = I.TBCREATOR                                         00082019
UNION                                                                   00082116
  SELECT                                                                00083019
  '-STA DB('||STRIP(I.CREATOR)||') SPACE('||STRIP(I.INDEXSPACE)||       00084019
  ') ACC(RW)'                                                           00084119
  ,I.DBNAME,I.INDEXSPACE,2                                              00085019
    FROM SYSIBM.SYSTABLES A,                                            00086019
         SYSIBM.SYSTABLESPACE B,                                        00087019
         SYSIBM.SYSINDEXES I                                            00088019
  WHERE A.TYPE = 'T'                                                    00089019
    AND A.DBNAME LIKE 'DB%'                                             00089119
    AND A.DBNAME = B.DBNAME                                             00089219
    AND A.TSNAME = B.NAME                                               00089319
    AND B.NACTIVE < 1000                                                00089419
    AND A.NAME   = I.TBNAME                                             00089519
    AND A.CREATOR = I.TBCREATOR                                         00089619
UNION                                                                   00089719
  SELECT                                                                00089819
  '-STO DB('||STRIP(B.DBNAME)||') SPACE('||STRIP(B.NAME)||')'           00089919
  ,B.DBNAME,B.NAME,3                                                    00090019
    FROM SYSIBM.SYSTABLES A,                                            00090119
         SYSIBM.SYSTABLESPACE B                                         00091019
  WHERE A.TYPE = 'T'                                                    00093019
    AND A.DBNAME LIKE 'DB%'                                             00093119
    AND A.DBNAME = B.DBNAME                                             00093219
    AND A.TSNAME = B.NAME                                               00093319
    AND B.NACTIVE < 1000                                                00093419
UNION                                                                   00093719
  SELECT                                                                00093819
  '-STA DB('||STRIP(B.DBNAME)||') SPACE('||STRIP(B.NAME)||              00093919
  ') ACC(RW)'                                                           00094019
  ,B.DBNAME,B.NAME,4                                                    00094119
    FROM SYSIBM.SYSTABLES A,                                            00094219
         SYSIBM.SYSTABLESPACE B                                         00094319
  WHERE A.TYPE = 'T'                                                    00094519
    AND A.DBNAME LIKE 'DB%'                                             00094619
    AND A.DBNAME = B.DBNAME                                             00094719
    AND A.TSNAME = B.NAME                                               00094819
    AND B.NACTIVE < 1000                                                00094919
ORDER BY 2,3,4                                                          00095219
//*-------------------------------------------------------------------          
//* SUBMIT DO ALTER TABLESPACE/INDEX                                            
//*-------------------------------------------------------------------          
//STEP04   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DSN=&&ALTERBP,DISP=(OLD,KEEP)                                     
//         DD DSN=&&ALTERIX,DISP=(OLD,KEEP)                                     
//*-------------------------------------------------------------------          
//* STOP/START DOS OBJETOS                                                      
//*-------------------------------------------------------------------          
//STEP05   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD   *                                                               
  DSN SYSTEM(DB2P)                                                              
//         DD DSN=&&STOPSTA,DISP=(OLD,KEEP)                                     
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//*-------------------------------------------------------------------          
//* PROPOSTAONBASE                                                              
//*-------------------------------------------------------------------          
//*-------------------------------------------------------------------          
//* GERA COMANDO DE ALTER TABLESPACE - PROPOSTAONBASE                           
//*-------------------------------------------------------------------          
//STEP06   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=&&PPONBTS,SPACE=(TRK,(5,5)),DISP=(,PASS),UNIT=SYSDA           
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
SELECT                                                                          
CHAR('ALTER TABLESPACE '||STRIP(B.DBNAME)||'.'||STRIP(B.NAME)||                 
     ' BUFFERPOOL BP3;',80)                                                     
  FROM SYSIBM.SYSTABLES A,                                                      
       SYSIBM.SYSTABLESPACE B                                                   
WHERE A.TYPE = 'T'                                                              
  AND A.DBNAME LIKE 'DB%'                                                       
  AND A.DBNAME = B.DBNAME                                                       
  AND A.TSNAME = B.NAME                                                         
  AND B.NAME   = 'PPONBASE'                                                     
//*-------------------------------------------------------------------          
//* GERA COMANDO DE ALTER INDEX - PROPOSTAONBASE                                
//*-------------------------------------------------------------------          
//STEP07   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=&&PPONBIX,SPACE=(TRK,(5,5)),DISP=(,PASS),UNIT=SYSDA           
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
SELECT                                                                          
CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||                     
     ' BUFFERPOOL BP4;',80)                                                     
  FROM SYSIBM.SYSTABLES A,                                                      
       SYSIBM.SYSTABLESPACE B,                                                  
       SYSIBM.SYSINDEXES I                                                      
WHERE A.TYPE = 'T'                                                              
  AND A.DBNAME LIKE 'DB%'                                                       
  AND A.DBNAME = B.DBNAME                                                       
  AND A.TSNAME = B.NAME                                                         
  AND B.NAME   = 'PPONBASE'                                                     
  AND A.NAME   = I.TBNAME                                                       
  AND A.CREATOR = I.TBCREATOR                                                   
//*-------------------------------------------------------------------          
//* GERA COMANDOS DE STOP/START - PROPOSTAONBASE                                
//*-------------------------------------------------------------------          
//STEP08   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD DSN=&&SSPPONBA,SPACE=(TRK,(5,5)),DISP=(,PASS),UNIT=SYSDA          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
  SELECT                                                                00017019
  '-STO DB('||STRIP(I.CREATOR)||') SPACE('||STRIP(I.INDEXSPACE)||')'    00018019
  ,I.DBNAME,I.INDEXSPACE,1                                              00019019
    FROM SYSIBM.SYSTABLES A,                                            00020019
         SYSIBM.SYSTABLESPACE B,                                        00030019
         SYSIBM.SYSINDEXES I                                            00031019
  WHERE A.TYPE = 'T'                                                    00040019
    AND A.DBNAME LIKE 'DB%'                                             00060019
    AND A.DBNAME = B.DBNAME                                             00061019
    AND A.TSNAME = B.NAME                                               00070019
    AND B.NAME   = 'PPONBASE'                                           00080019
    AND A.NAME   = I.TBNAME                                             00081019
    AND A.CREATOR = I.TBCREATOR                                         00082019
UNION                                                                   00082116
  SELECT                                                                00083019
  '-STA DB('||STRIP(I.CREATOR)||') SPACE('||STRIP(I.INDEXSPACE)||       00084019
  ') ACC(RW)'                                                           00084119
  ,I.DBNAME,I.INDEXSPACE,2                                              00085019
    FROM SYSIBM.SYSTABLES A,                                            00086019
         SYSIBM.SYSTABLESPACE B,                                        00087019
         SYSIBM.SYSINDEXES I                                            00088019
  WHERE A.TYPE = 'T'                                                    00089019
    AND A.DBNAME LIKE 'DB%'                                             00089119
    AND A.DBNAME = B.DBNAME                                             00089219
    AND A.TSNAME = B.NAME                                               00089319
    AND B.NAME   = 'PPONBASE'                                           00080019
    AND A.NAME   = I.TBNAME                                             00089519
    AND A.CREATOR = I.TBCREATOR                                         00089619
UNION                                                                   00089719
  SELECT                                                                00089819
  '-STO DB('||STRIP(B.DBNAME)||') SPACE('||STRIP(B.NAME)||')'           00089919
  ,B.DBNAME,B.NAME,3                                                    00090019
    FROM SYSIBM.SYSTABLES A,                                            00090119
         SYSIBM.SYSTABLESPACE B                                         00091019
  WHERE A.TYPE = 'T'                                                    00093019
    AND A.DBNAME LIKE 'DB%'                                             00093119
    AND A.DBNAME = B.DBNAME                                             00093219
    AND A.TSNAME = B.NAME                                               00093319
    AND B.NAME   = 'PPONBASE'                                           00080019
UNION                                                                   00093719
  SELECT                                                                00093819
  '-STA DB('||STRIP(B.DBNAME)||') SPACE('||STRIP(B.NAME)||              00093919
  ') ACC(RW)'                                                           00094019
  ,B.DBNAME,B.NAME,4                                                    00094119
    FROM SYSIBM.SYSTABLES A,                                            00094219
         SYSIBM.SYSTABLESPACE B                                         00094319
  WHERE A.TYPE = 'T'                                                    00094519
    AND A.DBNAME LIKE 'DB%'                                             00094619
    AND A.DBNAME = B.DBNAME                                             00094719
    AND A.TSNAME = B.NAME                                               00094819
    AND B.NAME   = 'PPONBASE'                                           00080019
ORDER BY 2,3,4                                                          00095219
//*-------------------------------------------------------------------          
//* SUBMIT DO ALTER TABLESPACE/INDEX - PROPOSTAONBASE                           
//*-------------------------------------------------------------------          
//STEP09   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DSN=&&PPONBTS,DISP=(OLD,KEEP)                                     
//         DD DSN=&&PPONBIX,DISP=(OLD,KEEP)                                     
//*-------------------------------------------------------------------          
//* STOP/START DOS OBJETOS - PROPOSTAONBASE                                     
//*-------------------------------------------------------------------          
//STEP10   EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD   *                                                               
  DSN SYSTEM(DB2P)                                                              
//         DD DSN=&&SSPPONBA,DISP=(OLD,KEEP)                                    
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
