//HSTSPACE JOB 'CICERO,DBA(R.5093)',MSGCLASS=P,CLASS=A,NOTIFY=CICERO,           
//   REGION=0M                                                                  
//         SET DSN=DB2P                                                         
//*-------------------------------------------------------------------          
//* CARREGA DADOS DE HI-A-RBA E HI-U-RBA DOS VSAM DB2 NA TABELA                 
//* DB2ADM.HSTVSAM                                                              
//*                                                                             
//* ESTE JOB DEVERA SER EXECUTADO SEMANALMENTE APOS OS REORGS                   
//* SEMANAIS (DBPR*BIN). DISPARADO PELO CA7.                                    
//*                                                                             
//* EM CASO DE ABEND NAO HAVERA NECESSIDADE DE RETOMAR O JOB, APENAS            
//* INFORMAR O GRUPO DBA VIA GENIS.                                             
//*                                                                             
//* AUTOR: JOSE CICERO - DBA DB2                                                
//* DATA:  28-10-2008                                                           
//* EMAIL: JOSE.CICERO@TS3.COM.BR                                               
//*-------------------------------------------------------------------          
//* ALTERACAO                                                                   
//* 15-01-2009 CICERO INCLUIDO NO STEP DE COPY UM MODIFY AGE 30                 
//*                                                                             
//*-------------------------------------------------------------------          
//* LISTCAT DO LEVEL DB2PCAT.DSNDBD                                             
//*-------------------------------------------------------------------          
//IDCAMS   EXEC  PGM=IDCAMS                                                     
//SYSPRINT DD    DSN=&&TEMP,DISP=(NEW,PASS,DELETE),                             
//         UNIT=SYSWDB,SPACE=(CYL,(10,10),RLSE)                                 
//SYSIN    DD *                                                                 
  LISTCAT LVL(DB2PCAT.DSNDBD) ALL                                               
//*-------------------------------------------------------------------          
//* EXECUTA REXX RXALLOC QUE GERA ARQUIVO SEQUENCIAL PARA LOAD                  
//*-------------------------------------------------------------------          
//RUNEXEC  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXALLOC'                        
//SYSEXEC  DD   DSN=DBA.DB2.REXX,DISP=SHR                                       
//SYSPRINT DD   SYSOUT=*                                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   DUMMY                                                           
//INFILE   DD   DSN=&&TEMP,DISP=OLD                                             
//OUTFILE  DD   DSN=&&RECIN,DISP=(NEW,PASS,DELETE),                             
//         UNIT=SYSWDB,SPACE=(TRK,(150,150),RLSE),                              
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
 INTO TABLE DB2ADM.HSTVSAM                                                      
 ( "DSNAME"                                                                     
        POSITION(  00001:00044) CHAR(00044)                                     
 , "HI_A_RBA"                                                                   
        POSITION(  00046:00061) FLOAT EXTERNAL                                  
 , "HI_U_RBA"                                                                   
        POSITION(  00063:00078) FLOAT EXTERNAL                                  
 , "DBNAME"                                                                     
        POSITION(  00080:00087) CHAR(00008)                                     
 , "SPACENAM"                                                                   
        POSITION(  00089:00096) CHAR(00008)                                     
 , "EXTENTS"                                                                    
        POSITION(  00098:00107) INTEGER EXTERNAL                                
 )                                                                              
//*------------------------------------------------------------------           
//* COPY                                                                        
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
               INCLUDE TABLESPACE DB2ADM.HSTVSAM                                
TEMPLATE DDCOPY                                                                 
         DSN('DB2PCOPY.FS1.&DB..&TS.(+1)')                                      
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
         GDGLIMIT(5)                                                            
COPY LIST DBLIST                                                                
     SHRLEVEL REFERENCE                                                         
     FULL YES                                                                   
     COPYDDN DDCOPY                                                             
                                                                                
MODIFY RECOVERY LIST DBLIST DELETE AGE 30                               00060003
