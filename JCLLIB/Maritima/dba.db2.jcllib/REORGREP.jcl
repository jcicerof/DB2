//REORGREP JOB MSGCLASS=P,CLASS=A,NOTIFY=JONAS                          JOB01151
//*-------------------------------------------------------------------          
//* REORGANIZACAO DE 100 TABELAS DE DB2 PRODUCAO (REPLICACAO)                   
//*                                                                             
//* ESTE REORG ONLINE DEVERA SER EXECUTADO DIARIAMENTE AS                       
//* 19:00H APOS A ROTINA REORGUOW DISPARADO PELO CA7.                           
//*                                                                             
//* EM CASO DE ABEND NAO HAVERA NECESSIDADE DE RETOMAR O JOB,                   
//* APENAS INFORMAR O GRUPO DBA VIA GENIS E EXECUTAR UM TERM UTIL.              
//*                                                                             
//* DATA     AUTOR   DESCRICAO                                                  
//* 02-10-08 JONAS   IMPLANTACAO (GENIS 1499401)                                
//* 15-01-09 CICERO  INCLUSAO DO COMANDO MODIFY AGE 5                           
//*-------------------------------------------------------------------          
//* GERA COMANDOS DE INCLUDE TABLESPACE                                         
//*-------------------------------------------------------------------          
//DSNTIAUL EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=&&TEMP,DISP=(NEW,PASS,DELETE),UNIT=SYSWDB,                  
//         SPACE=(TRK,(1,1),RLSE)                                               
//SYSIN    DD   *                                                               
SELECT CHAR(                                                                    
'            INCLUDE TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)            
,80)                                                                            
FROM SYSIBM.SYSTABLES                                                           
WHERE NAME LIKE 'CD%'                                                           
AND CREATOR = 'DB2PDPRC'                                                        
AND TYPE='T'                                                                    
WITH UR;                                                                        
//*-------------------------------------------------------------------          
//* TRUNCA ARQUIVO &&TEMP EM 80 BYTES                                           
//*-------------------------------------------------------------------          
//IEBGENER EXEC PGM=IEBGENER                                                    
//SYSUT1   DD DSN=&&TEMP,DISP=(OLD,PASS,DELETE)                                 
//SYSUT2   DD DSN=&&TEMP2,DISP=(NEW,PASS,DELETE),UNIT=SYSWDB,                   
//         SPACE=(TRK,(1,1),RLSE),                                              
//         DCB=(RECFM=FB,LRECL=80,BLKSIZE=80)                                   
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN        DD   *                                                           
  GENERATE MAXFLDS=10,MAXLITS=30                                                
  RECORD FIELD=(80,1)                                                           
//*-------------------------------------------------------------------          
//* GERA STREAM DE REORG + MODIFY AGE                                           
//*-------------------------------------------------------------------          
//STREAM   EXEC PGM=IEBGENER                                                    
//SYSUT2   DD DSN=&&TEMP3,DISP=(NEW,PASS,DELETE),UNIT=SYSWDB,                   
//         SPACE=(TRK,(1,1),RLSE),                                              
//         DCB=(RECFM=FB,LRECL=80,BLKSIZE=80)                                   
//SYSPRINT DD   SYSOUT=*                                                        
//SYSIN    DD   DUMMY                                                           
//SYSUT1   DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
//         DD   DSN=&&TEMP2,DISP=(OLD,KEEP,KEEP)   **INCLUDE TABLESPACE         
//         DD   *                                                               
TEMPLATE DDCOPY                                                                 
         DSN('DB2PCOPY.FD1.&DB..&TS..P0(+1)')                                   
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
         GDGLIMIT(5)                                                            
                                                                                
TEMPLATE DDDISC DSN(DB2PWRK.UNL.&DB..&TS..DISC.D&DT.)                           
   UNIT SYSWDB SPACE (1000,1000) TRK DISP (NEW,DELETE,CATLG)                    
                                                                                
TEMPLATE DDPUNCH DSN(DB2PWRK.UNL.&DB..&TS..PUNCH.D&DT.)                         
   UNIT SYSWDB SPACE (1,0) TRK DISP (NEW,DELETE,CATLG)                          
                                                                                
TEMPLATE DDREC DSN(DB2PWRK.UNL.&DB..&TS..REC.D&DT.)                             
   UNIT SYSWDB SPACE (1000,1000) TRK DISP (NEW,DELETE,CATLG)                    
                                                                                
QUIESCE LIST DBLIST                                                             
REORG TABLESPACE LIST DBLIST LOG NO                                             
      SORTDATA SORTKEYS                                                         
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL                       
                                                                                
MODIFY RECOVERY LIST DBLIST DELETE AGE 5                                        
//*-------------------------------------------------------------------          
//* PRINT DA STREAM DE REORG                                                    
//*-------------------------------------------------------------------          
//PRINT    EXEC PGM=IEBGENER                                                    
//SYSUT1   DD DSN=&&TEMP3,DISP=(OLD,PASS,DELETE)                                
//SYSUT2   DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//*-------------------------------------------------------------------          
//* DSNUTILB DE REORG                                                           
//*-------------------------------------------------------------------          
//REORG    EXEC PGM=DSNUTILB,PARM='DB2P'                                        
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                  
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                  
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSWDB,SPACE=(CYL,(500,400),RLSE)                          
//SYSERR   DD   UNIT=SYSWDB,SPACE=(CYL,(500,400),RLSE)                          
//SYSUT1   DD   UNIT=SYSWDB,SPACE=(CYL,(500,400),RLSE)                          
//SORTOUT  DD   UNIT=SYSWDB,SPACE=(CYL,(500,400),RLSE)                          
//SYSIN    DD   DSN=&&TEMP3,DISP=(OLD,PASS,DELETE)                              
