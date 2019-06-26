//RPTMVIEW JOB 'CICERO,DBA(R.5093)',MSGCLASS=P,CLASS=A,NOTIFY=CICERO            
//*                                                                             
//         SET DSN=DB2P                                                         
//*-------------------------------------------------------------------          
//* CARREGA DADOS DOS RELATORIOS DO MAINVIEW PARA A TABELA                      
//* DB2ADM.RPTMVIEW                                                             
//*                                                                             
//* CARREGA DADOS HISTORICOS DO ORACLE LUMA                                     
//*                                                                             
//* AUTOR: JOSE CICERO - DBA DB2                                                
//* DATA:  10-04-2009                                                           
//* EMAIL: JOSE.CICERO@TS3.COM.BR                                               
//*-------------------------------------------------------------------          
//* EXECUTA SORT DA ULTIMA GERACAO DO T.MAINVIEW.ELAPSED.DE8A20HS               
//*-------------------------------------------------------------------          
//SORT     EXEC PGM=SORT                                                00020000
//SYSOUT   DD SYSOUT=*                                                  00030000
//SORTIN   DD DISP=SHR,DSN=CICERO.DB2.SAIDA.ORACLE                      00040000
//SORTOUT  DD DSN=&&RECIN,                                              00050001
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,                          00060000
//         SPACE=(TRK,(5000,500),RLSE),                                 00070000
//         DCB=(LRECL=255,BLKSIZE=25500,RECFM=FB,DSORG=PS)              00080000
//SYSIN    DD *                                                         00090000
   ALTSEQ CODE=(40F0)                    CONVERTE X'40' PARA X'F0'      00100002
   SORT FIELDS=(1,10,CH,A)                                              00110000
   OUTREC FIELDS=(27,10,                 DATA                           00130000
                   1,8,                  LOCATION                       00140000
                  10,8,                  COLLID                         00150000
                  19,8,                  PROGRAM                        00160000
                  38,10,TRAN=ALTSEQ,     #EXEC                          00170000
                  49,10,TRAN=ALTSEQ,     #SQL                           00180000
                  60,10,TRAN=ALTSEQ,     ELAPSED TIME                   00190000
                  71,10,TRAN=ALTSEQ,     CPUTIME                        00200000
                  82,10,TRAN=ALTSEQ)     WAITTIME                       00210000
   END                                                                  00220000
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
LOAD DATA INDDN SYSREC LOG NO  RESUME YES                                       
 INTO TABLE "DB2ADM"."RPTMVIEW"                                                 
 ( "DATA"                                                                       
        POSITION(  00001:00010) DATE EXTERNAL                                   
 , "LOCATION"                                                                   
        POSITION(  00011:00018) CHAR(00016)                                     
 , "COLLID"                                                                     
        POSITION(  00019:00026) CHAR(00018)                                     
 , "PROGRAM"                                                                    
        POSITION(  00027:00034) CHAR(00018)                                     
 , "#EXEC"                                                                      
        POSITION(  00035:00044) INTEGER EXTERNAL                                
 , "#SQL"                                                                       
        POSITION(  00045:00054) INTEGER EXTERNAL                                
 , "ELAPSED"                                                                    
        POSITION(  00055:00064) DECIMAL EXTERNAL                                
 , "CPUTIME"                                                                    
        POSITION(  00065:00074) DECIMAL EXTERNAL                                
 , "WAITTIME"                                                                   
        POSITION(  00075:00084) DECIMAL EXTERNAL                                
 )                                                                              
                                                                                
RUNSTATS TABLESPACE DB2ADM.RPTMVIEW                                             
         TABLE(ALL) INDEX(ALL)                                                  
         KEYCARD UPDATE ALL HISTORY ALL                                         
         SHRLEVEL CHANGE                                                        
//                                                                              
//*------------------------------------------------------------------           
//* COPY E MODIFY AGE(5)                                                        
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
               INCLUDE TABLESPACE DB2ADM.RPTMVIEW                               
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
                                                                                
MODIFY RECOVERY LIST DBLIST DELETE AGE 5                                        
