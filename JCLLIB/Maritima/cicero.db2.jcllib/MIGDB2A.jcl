//DB@MIGV8 JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
// SET DSN=DB2P                                                                 
//*                                                                             
//CREATTS EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
CREATE  TABLESPACE MIGVRS08                                                     
  IN DB2ADM                                                                     
  USING STOGROUP STGP30D                                                        
  PRIQTY 96                                                                     
  SECQTY 96                                                                     
  PCTFREE 5                                                                     
  BUFFERPOOL BP1                                                                
  LOCKSIZE  ANY                                                                 
  LOCKMAX SYSTEM                                                                
  CLOSE NO                                                                      
  COMPRESS NO                                                                   
  CCSID EBCDIC                                                                  
;                                                                               
COMMIT;                                                                         
//*                                                                             
//CREATTB EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
CREATE TABLE DB2ADM.MIGVRS08 LIKE TECINFOR.BAIRRO                               
IN DB2ADM.MIGVRS08;                                                             
//*                                                                             
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN'                                00070000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00080000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00090000
//SYSPRINT DD   SYSOUT=*                                                00100000
//UTPRINT  DD   SYSOUT=*                                                00110000
//SYSUDUMP DD   SYSOUT=*                                                00120000
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00130000
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00140000
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00150000
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(100,100),RLSE)                   00160000
//SYSDISC  DD   DUMMY                                                   00170000
//SYSREC   DD   DUMMY                                                   00180000
//SYSIN    DD   *                                                       00190000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200000
LISTDEF LISTDBA INCLUDE TABLESPACE DBEELO.BAIRRO                        00210002
TEMPLATE DDPUNCH DSN(CICERO.UNL.&DB..&TS..PUNCH)                        00220002
   UNIT=SYSDBA SPACE (90,90) TRK DISP(NEW,CATLG,DELETE)                 00230002
TEMPLATE DDREC DSN(CICERO.UNL.&DB..&TS..REC)                            00240002
   DISP(NEW,CATLG,DELETE)                                               00250000
   UNIT=SYSDBA                                                          00260001
UNLOAD LIST LISTDBA PUNCHDDN DDPUNCH                                    00270000
       UNLDDN DDREC                                                     00280000
       SHRLEVEL REFERENCE                                               00290000
//*                                                                             
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUT1   DD  UNIT=VSM                                                         
//SORTOUT  DD  UNIT=VSM                                                         
//SYSERR   DD  DSN=&&SYSERR,                                                    
//             DISP=(,DELETE),                                                  
//             UNIT=SYSDBA,SPACE=(TRK,(100,220),RLSE)                           
//SYSMAP   DD  DSN=&SYSMAP,                                                     
//             DISP=(,DELETE),                                                  
//             UNIT=SYSDBA,SPACE=(TRK,(100,215),RLSE)                           
//SYSDISC  DD  DSN=&&SYSDISC,                                                   
//             DISP=(,DELETE),                                                  
//             UNIT=SYSDBA,SPACE=(TRK,(100,215),RLSE)                           
//SYSIN     DD *                                                                
TEMPLATE SREC                                                                   
     DSN('CICERO.UNL.DBEELO.BAIRRO.REC')                                        
     DISP(OLD,DELETE,KEEP)                                                      
LOAD DATA INDDN SREC LOG NO  REPLACE                                            
STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL                                     
 INTO TABLE "DB2ADM"."MIGVRS08          "                                       
 ( "CDBAI             " POSITION(  00003:00006) INTEGER                         
 , "NMBAIECT          " POSITION(  00007:00078) CHAR(072)                       
 , "NMBAIABR          " POSITION(  00079:00114) CHAR(036)                       
 , "CDLCL             " POSITION(  00115:00118) INTEGER                         
 , "DTINC             " POSITION(  00119:00128) DATE EXTERNAL                   
 , "DTALT             " POSITION(  00129:00138) DATE EXTERNAL                   
 , "TPSIT             " POSITION(  00139:00140) SMALLINT                        
 )                                                                              
//*                                                                             
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                          
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                          
//SYSDISC  DD   DUMMY                                                           
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF MYLIST INCLUDE TABLESPACE DB2ADM.MIGVRS08                               
TEMPLATE DDCOPY                                                                 
         DSN(DB2PCOPY.FE.&DB..&TS..D&DT..H&TIME.)                               
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
COPY LIST MYLIST                                                                
     SHRLEVEL REFERENCE                                                         
     FULL YES                                                                   
     COPYDDN DDCOPY                                                             
//*                                                                             
//SELECT  EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                          
     LIB('DB2.DB2P.RUNLIB.LOAD')                                                
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSPUNCH DD SYSOUT=*                                                          
//SYSREC00 DD SYSOUT=*                                                          
//SYSIN DD *                                                                    
SELECT * FROM DB2ADM.MIGVRS08 FETCH FIRST 50 ROW ONLY WITH UR;                  
//*                                                                             
//UPDATE  EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                          
     LIB('DB2.DB2P.RUNLIB.LOAD')                                                
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSPUNCH DD SYSOUT=*                                                          
//SYSREC00 DD SYSOUT=*                                                          
//SYSIN DD *                                                                    
 UPDATE DB2ADM.MIGVRS08 SET NMBAIECT = 'TESTE';                                 
//*                                                                             
//RECOVER  EXEC PGM=DSNUTILB,REGION=5M,                                         
//         PARM='&DSN'                                                          
//SYSPRINT DD SYSOUT=*                                                          
//UTPRINT  DD SYSOUT=*                                                          
//SYSUT1   DD DSN=DB2PWRK.SYSUT1,DISP=(MOD,CATLG,CATLG),                        
//         SPACE=(CYL,(200,100)),UNIT=SYSWRK                                    
//SYSIN    DD *                                                                 
  RECOVER TABLESPACE DB2ADM.MIGVRS08 TOLASTFULLCOPY                             
//REORG    EXEC PGM=DSNUTILB,PARM='&DSN'                                00044003
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00045001
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00046001
//SYSPRINT DD   SYSOUT=*                                                00047001
//UTPRINT  DD   SYSOUT=*                                                00048001
//SYSUDUMP DD   SYSOUT=*                                                00049001
//SYSIN    DD   *                                                       00200000
OPTIONS EVENT(ITEMERROR, SKIP)                                          00420001
LISTDEF LISTA INCLUDE TABLESPACE DB2ADM.MIGVRS08                        00440004
TEMPLATE DDCOPY                                                         00450000
         DSN(DB2PCOPY.FS.&DB..&TS..H&HO.&MI.)                           00460000
         UNIT=SYSDA                                                     00470000
         DISP(NEW,CATLG,DELETE)                                         00490000
TEMPLATE SREC                                                           00450000
         DSN(DB2PCOPY.FE.&DB..&TS..SREC)                                00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK                                                    
TEMPLATE SDISC                                                          00450000
         DSN(DB2PCOPY.FE.&DB..&TS..SDISC)                               00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK                                                    
TEMPLATE SPUNCH                                                         00450000
         DSN(DB2PCOPY.FE.&DB..&TS..SPUNCH)                              00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1,1) TRK                                                         
TEMPLATE SUT1                                                           00450000
         DSN(DB2PCOPY.FE.&DB..&TS..SUT1)                                00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK                                                    
TEMPLATE SOUT                                                           00450000
         DSN(DB2PCOPY.FE.&DB..&TS..SOUT)                                00460000
         UNIT=SYSDA                                                     00470000
         DISP(MOD,DELETE,CATLG)                                         00490000
         SPACE(1500,700) TRK                                                    
QUIESCE LIST LISTA                                                              
REORG TABLESPACE LIST LISTA                                                     
      LOG NO SHRLEVEL REFERENCE                                                 
      SORTKEYS SORTDATA                                                         
      COPYDDN DDCOPY                                                            
      STATISTICS TABLE(ALL)                                                     
                 INDEX(ALL) UPDATE ALL                                          
      PUNCHDDN SPUNCH                                                           
      UNLDDN SREC                                                               
      DISCARDDN SDISC                                                           
      WORKDDN (SUT1,SOUT)                                                       
//LOADNUL  EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                          
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                          
//SYSDISC  DD   SYSOUT=*                                                        
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   *                                                               
LOAD DATA INDDN SYSREC LOG NO  REPLACE NOCOPYPEND                               
 INTO TABLE "DB2ADM"."MIGVRS08"                                                 
//DELTAB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
DROP TABLE DB2ADM.MIGVRS08;                                                     
//*                                                                             
//DELTBSP EXEC PGM=IKJEFT01,DYNAMNBR=20                                         
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
DROP TABLESPACE DB2ADM.MIGVRS08;                                                
