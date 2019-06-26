//DBBPS001 JOB MSGCLASS=P,CLASS=A,NOTIFY=CICERO                                 
//*-------------------------------------------------------------------          
//* AJUSTA OS BPOOLS DE 4K, CONFORME ABAIXO:                                    
//*  BP0  - CATALOGO DB2                                                        
//*  BP1  - TABLESPACES >1000 PAGINAS                                           
//*  BP2  - INDICES     >1000 PAGINAS                                           
//*  BP3  - TABLESPACES <=1000 PAGINAS                                          
//*  BP4  - INDICES     <=1000 PAGINAS                                          
//*  BP24 - DBKIT1.WEBPROPO       (FIXO - DADOS + INDICES)                      
//*  BP25 - DBEETA.PPONBASE       (FIXO - DADOS + INDICES)                      
//*  BP26 - TABLESPACES NM100D1   (FIXO)                                        
//*  BP27 - INDICES NM100D1       (FIXO)                                        
//*  BP30 - IBMSNAP_UOW           (FIXO)                                        
//*  BP31 - INDICES IBMSNAP_UOW   (FIXO)                                        
//*                                                                             
//* FREQUENCIA: SEMANAL ANTES DA SAIDA DO DB2                                   
//* MAXIMO RETURN-CODE: 4                                                       
//* ABEND: EM CASO DE ABEND LIGAR PARA O DBA DE PLANTAO                         
//*                                                                             
//* AUTOR: JOSE CICERO - DBA DB2                                                
//* DATA:  12-01-2009                                                           
//* EMAIL: JOSE.CICERO@TS3.COM.BR  FONE: 4347-5093                              
//*                                                                             
//* ALTERACAO                                                                   
//* 26-01-2009 CICERO INCLUIDO NAS CLAUSULAS DE WHERE DOS TABLESPACES           
//*                   PGSIZE = 4 (SOMENTE PAGINAS DE 4K)                        
//*-------------------------------------------------------------------          
//* LISTA O ATUAL BPOOL DOS TABLESPACES E INDICES                               
//*-------------------------------------------------------------------          
//LISTALL  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||              
       ' BUFFERPOOL '||STRIP(BPOOL)||';',80)                                    
  FROM SYSIBM.SYSTABLESPACE                                                     
UNION ALL                                                                       
SELECT CHAR('ALTER INDEX '||STRIP(CREATOR)||'.'||STRIP(NAME)||          00010099
       ' BUFFERPOOL '||STRIP(BPOOL)||';',80)                            00011099
  FROM SYSIBM.SYSINDEXES                                                00012099
FOR FETCH ONLY WITH UR;                                                 00002809
//*-------------------------------------------------------------------          
//* CRIA OS COMANDOS DE ALTER PARA OS TABLESPACES                               
//*  BP1  - TABLESPACES >1000 PAGINAS                                           
//*  BP3  - TABLESPACES <=1000 PAGINAS                                          
//*-------------------------------------------------------------------          
//BP1E3    EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP1,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||              
       ' BUFFERPOOL BP1;',80)                                                   
  FROM SYSIBM.SYSTABLESPACE                                                     
 WHERE NACTIVE > 1000                                                           
   AND DBNAME LIKE 'DB%'                                                        
   AND BPOOL <> 'BP1'                                                           
   AND PGSIZE = 4                                                               
UNION ALL                                                                       
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||              
       ' BUFFERPOOL BP3;',80)                                                   
  FROM SYSIBM.SYSTABLESPACE                                                     
 WHERE NACTIVE <= 1000                                                          
   AND DBNAME LIKE 'DB%'                                                        
   AND BPOOL <> 'BP3'                                                           
   AND PGSIZE = 4                                                               
FOR FETCH ONLY WITH UR;                                                 00002809
//*-------------------------------------------------------------------          
//* CRIA OS COMANDOS DE ALTER PARA OS INDICES                                   
//*  BP2  - INDICES     >1000 PAGINAS                                           
//*  BP4  - INDICES     <=1000 PAGINAS                                          
//*-------------------------------------------------------------------          
//BP2E4    EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP2,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||      00010099
       ' BUFFERPOOL BP4;',80)                                           00011099
  FROM SYSIBM.SYSINDEXES I                                              00012099
     , SYSIBM.SYSTABLES  T                                              00012199
     , SYSIBM.SYSTABLESPACE S                                           00012299
 WHERE S.NACTIVE <= 1000                                                00013099
   AND T.TYPE = 'T'                                                     00014099
   AND I.DBNAME LIKE 'DB%'                                              00014199
   AND I.TBCREATOR = T.CREATOR                                          00014299
   AND I.TBNAME = T.NAME                                                00014399
   AND T.DBNAME = S.DBNAME                                              00014499
   AND T.TSNAME = S.NAME                                                00014599
   AND I.BPOOL <> 'BP4'                                                 00014599
UNION ALL                                                                       
SELECT CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||      00010099
       ' BUFFERPOOL BP2;',80)                                           00011099
  FROM SYSIBM.SYSINDEXES I                                              00012099
     , SYSIBM.SYSTABLES  T                                              00012199
     , SYSIBM.SYSTABLESPACE S                                           00012299
 WHERE S.NACTIVE > 1000                                                 00013099
   AND T.TYPE = 'T'                                                     00014099
   AND I.DBNAME LIKE 'DB%'                                              00014199
   AND I.TBCREATOR = T.CREATOR                                          00014299
   AND I.TBNAME = T.NAME                                                00014399
   AND T.DBNAME = S.DBNAME                                              00014499
   AND T.TSNAME = S.NAME                                                00014599
   AND I.BPOOL <> 'BP2'                                                 00014599
FOR FETCH ONLY WITH UR;                                                 00014699
//*-------------------------------------------------------------------          
//* CRIA OS COMANDOS DE ALTER PARA DBKIT1.WEBPROPO                              
//*  BP24 - DBKIT1.WEBPROPO       (FIXO - DADOS + INDICES)                      
//*-------------------------------------------------------------------          
//BP24     EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP3,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||              
       ' BUFFERPOOL BP24;',80)                                                  
  FROM SYSIBM.SYSTABLESPACE                                                     
 WHERE DBNAME = 'DBKIT1'                                                        
   AND NAME   = 'WEBPROPO'                                                      
UNION ALL                                                                       
SELECT CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||      00010099
       ' BUFFERPOOL BP24;',80)                                          00011099
  FROM SYSIBM.SYSINDEXES I                                              00012099
     , SYSIBM.SYSTABLES  T                                              00012199
 WHERE T.TYPE = 'T'                                                     00014099
   AND T.DBNAME = 'DBKIT1'                                              00014499
   AND T.TSNAME = 'WEBPROPO'                                            00014599
   AND I.TBCREATOR = T.CREATOR                                          00014299
   AND I.TBNAME = T.NAME                                                00014399
FOR FETCH ONLY WITH UR;                                                 00014699
//*-------------------------------------------------------------------          
//* CRIA OS COMANDOS DE ALTER DBEETA.PPONBASE                                   
//*  BP25 - DBEETA.PPONBASE       (FIXO - DADOS + INDICES)                      
//*-------------------------------------------------------------------          
//BP25     EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP4,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||              
       ' BUFFERPOOL BP25;',80)                                                  
  FROM SYSIBM.SYSTABLESPACE                                                     
 WHERE DBNAME = 'DBEETA'                                                        
   AND NAME   = 'PPONBASE'                                                      
UNION ALL                                                                       
SELECT CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||      00010099
       ' BUFFERPOOL BP25;',80)                                          00011099
  FROM SYSIBM.SYSINDEXES I                                              00012099
     , SYSIBM.SYSTABLES  T                                              00012199
 WHERE T.TYPE = 'T'                                                     00014099
   AND T.DBNAME = 'DBEETA'                                              00014499
   AND T.TSNAME = 'PPONBASE'                                            00014599
   AND I.TBCREATOR = T.CREATOR                                          00014299
   AND I.TBNAME = T.NAME                                                00014399
FOR FETCH ONLY WITH UR;                                                 00014699
//*-------------------------------------------------------------------          
//* CRIA OS COMANDOS DE ALTER PARA OS TABLESPACES/INDICES DO NM100D1            
//*  BP26 - TABLESPACES NM100D1   (FIXO)                                        
//*  BP27 - INDICES NM100D1       (FIXO)                                        
//*-------------------------------------------------------------------          
//BP26E27  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP5,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)||              
       ' BUFFERPOOL BP26;',80)                                                  
  FROM SYSIBM.SYSTABLESPACE                                                     
 WHERE DBNAME = 'DBEETA'                                                        
   AND NAME   IN ('PARGERSQ'                                                    
                 ,'PARAMGER'                                                    
                 ,'CONGENQ3'                                                    
                 ,'CONGENQ2'                                                    
                 ,'CONGENQ1'                                                    
                 ,'CNGEQTAC'                                                    
                 ,'CNDGEVAL'                                                    
                 ,'CNDGEANE'                                                    
                 ,'CDGEQPRR'                                                    
                 ,'CDGEQFIL'                                                    
                 ,'CDGEQCLS')                                                   
UNION ALL                                                                       
SELECT CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||      00010099
       ' BUFFERPOOL BP27;',80)                                          00011099
  FROM SYSIBM.SYSINDEXES I                                              00012099
     , SYSIBM.SYSTABLES  T                                              00012199
 WHERE T.TYPE = 'T'                                                     00014099
   AND T.DBNAME = 'DBEETA'                                              00014499
   AND T.TSNAME IN ('PARGERSQ'                                                  
                   ,'PARAMGER'                                                  
                   ,'CONGENQ3'                                                  
                   ,'CONGENQ2'                                                  
                   ,'CONGENQ1'                                                  
                   ,'CNGEQTAC'                                                  
                   ,'CNDGEVAL'                                                  
                   ,'CNDGEANE'                                                  
                   ,'CDGEQPRR'                                                  
                   ,'CDGEQFIL'                                                  
                   ,'CDGEQCLS')                                                 
   AND I.TBCREATOR = T.CREATOR                                          00014299
   AND I.TBNAME = T.NAME                                                00014399
FOR FETCH ONLY WITH UR;                                                 00014699
//*-------------------------------------------------------------------          
//* CRIA OS COMANDOS DE ALTER PARA ASN.IBMSNAP_UOW                              
//*  BP30 - IBMSNAP_UOW           (FIXO)                                        
//*  BP31 - INDICES IBMSNAP_UOW   (FIXO)                                        
//*-------------------------------------------------------------------          
//BP30E31  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP6,DISP=(NEW,PASS,DELETE),UNIT=SYSDA,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR('ALTER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||            
       ' BUFFERPOOL BP30;',80)                                                  
  FROM SYSIBM.SYSTABLES                                                         
 WHERE CREATOR = 'ASN'                                                          
   AND NAME    = 'IBMSNAP_UOW'                                                  
   AND TYPE    = 'T'                                                            
UNION ALL                                                                       
SELECT CHAR('ALTER INDEX '||STRIP(I.CREATOR)||'.'||STRIP(I.NAME)||      00010099
       ' BUFFERPOOL BP31;',80)                                          00011099
  FROM SYSIBM.SYSINDEXES I                                              00012099
     , SYSIBM.SYSTABLES  T                                              00012199
 WHERE T.TYPE = 'T'                                                     00014099
   AND T.CREATOR = 'ASN'                                                        
   AND T.NAME    = 'IBMSNAP_UOW'                                                
   AND I.TBCREATOR = T.CREATOR                                          00014299
   AND I.TBNAME = T.NAME                                                00014399
FOR FETCH ONLY WITH UR;                                                 00014699
//*-------------------------------------------------------------------          
//* PRINT STREAM DO ALTER                                                       
//*-------------------------------------------------------------------          
//IEBGENER EXEC PGM=IEBGENER                                                    
//SYSUT1   DD   DSN=&&TEMP1,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP2,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP3,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP4,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP5,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP6,DISP=(OLD,PASS)                                     
//SYSUT2   DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//*-------------------------------------------------------------------          
//* SUBMETE OS COMANDOS DE ALTER BUFFERPOOL                                     
//*-------------------------------------------------------------------          
//ALTERBP  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  END                                                                           
//SYSPRINT DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   DSN=&&TEMP1,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP2,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP3,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP4,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP5,DISP=(OLD,PASS)                                     
//         DD   DSN=&&TEMP6,DISP=(OLD,PASS)                                     
