//DB2COUNT JOB MSGCLASS=P,CLASS=A,NOTIFY=JONAS,USER=CA7ONL                      
//********************************************************************          
//* EM CASO DE CANCELAMENTO ENVIAR UM EMAIL PARA OS SEGUINTES USUARIOS          
//* RC=04 NORMAL, NAO E NECESSARIO ACIONAR OS DBA'S.                            
//********************************************************************          
//*-------------------------------------------------------------------          
//* CARREGA DADOS DE TAMANHO DAS TABELAS REPLICADAS                             
//* ESTE JOB DEVERA SER EXECUTADO DIARIAMENTE APOS O PRUNE                      
//*                                                                             
//* EM CASO DE ABEND NAO HAVERA NECESSIDADE DE RETOMAR O JOB, APENAS            
//* INFORMAR O GRUPO DBA VIA GENIS.                                             
//*                                                                             
//* AUTOR: JONAS VASSALO - DBA DB2                                              
//* DATA:  14-11-2008                                                           
//* JOSE.CICERO@TS3.COM.BR                                                      
//* JONAS.VASSALO@T-SYSTEMS.COM.BR                                              
//*-------------------------------------------------------------------          
//* ALTERACAO                                                                   
//* 15-01-2009 CICERO   INCLUSAO DO MODIFY AGE 10                               
//*-------------------------------------------------------------------          
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
//* STEP 02                                                                     
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
//         UNIT=SYSPRD,SPACE=(TRK,(10,1),RLSE)                                  
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   DSN=&&TEMP,DISP=OLD                                             
//********************************************************************          
//************************* EXECUTA REXX *****************************          
//         SET DSN=DB2P                                                         
//*-------------------------------------------------------------------          
//RUNEXEC  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXREPLIC'                       
//SYSEXEC  DD   DSN=DBA.DB2.REXX,DISP=SHR                                       
//SYSPRINT DD   SYSOUT=*                                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   DUMMY                                                           
//INFILE   DD   DISP=OLD,DSN=P.DB2PDPRC.DPROP(0)                                
//OUTFILE  DD   DSN=&&RECIN,DISP=(NEW,PASS,DELETE),                             
//         UNIT=SYSDA,SPACE=(TRK,(100,100)),                                    
//         DCB=(LRECL=255,RECFM=FB,BLKSIZE=2550)                                
//*------------------------------------------------------------------           
//* LOAD DE TABELA DE CONTROLE                                                  
//*------------------------------------------------------------------           
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                          
//SYSERR   DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                          
//SYSUT1   DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                          
//SORTOUT  DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                          
//SYSREC   DD   DSN=&&RECIN,DISP=OLD                                            
//SYSIN    DD   *                                                               
LOAD DATA INDDN SYSREC   LOG NO  RESUME YES NOCOPYPEND                          
 EBCDIC  CCSID(00037,00000,00000)                                               
 INTO TABLE "DB2ADM"."REPLICATION"                                              
 ( "NMCDTB"                                                                     
        POSITION(  00001:00080) CHAR                                            
 , "QTDLINES"                                                                   
        POSITION(  00082:00091) INTEGER EXTERNAL                                
 , "DTMES"                                                                      
        POSITION(  00093:00102) DATE EXTERNAL                                   
 , "HRS"                                                                        
        POSITION(  00104:00111) TIME EXTERNAL                                   
 )                                                                              
//*------------------------------------------------------------------           
//* COPY + MODIFY AGE                                                           
//*------------------------------------------------------------------           
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
               INCLUDE TABLESPACE DB2ADM.REPLICTI                               
TEMPLATE DDCOPY                                                                 
         DSN('DB2PCOPY.FS1.&DB..&TS.(+1)')                                      
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
         GDGLIMIT(10)                                                           
COPY LIST DBLIST                                                                
     SHRLEVEL REFERENCE                                                         
     FULL YES                                                                   
     COPYDDN DDCOPY                                                             
MODIFY RECOVERY LIST DBLIST DELETE AGE 10                                       
