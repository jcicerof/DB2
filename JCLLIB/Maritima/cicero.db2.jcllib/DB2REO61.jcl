//AXG0221R JOB (0XW0000,000,00),ROGERIO,NOTIFY=AXG0221,                         
//            REGION=4M,CLASS=S,MSGCLASS=X,COND=(4,LT)                          
//*--------------------------------------------------------------------*        
//*           REORGANIZA DSNDB06 SYSCOPY                                        
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSCOPY) ACCESS(UT)                                    
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.A250508.DB06.SYSCOPY,DISP=(,CATLG),         
//             UNIT=VSM                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY TABLESPACE DSNDB06.SYSCOPY COPYDDN SYSCOPY                                
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//UNLOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSCOPY,DISP=(MOD,CATLG),                
//             UNIT=VSM                                                         
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSCOPY LOG NO UNLOAD PAUSE                         
//*--------------------------------------------------------------------*        
//STOP    EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STOP DB(DSNDB06) SPACE(SYSCOPY, DSNUCH01, DSNUCX01)                           
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//*            REORG ONLINE DO DIRETORIO DE PLANOS                              
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//DEFCL    EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
   DEL DB2PCAT.DSNDBC.DSNDB06.SYSCOPY.I0001.A001                                
   DEL DB2PCAT.DSNDBC.DSNDB06.DSNUCH01.I0001.A001                               
   DEL DB2PCAT.DSNDBC.DSNDB06.DSNUCX01.I0001.A001                               
   SET MAXCC = 0                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSCOPY.I0001.A001) -                     
          LINEAR REUSE VOL(DBP002) CYL(400,10) SHR(3 3)) -                      
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSCOPY.I0001.A001))                      
                                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNUCH01.I0001.A001) -                    
          LINEAR REUSE VOL(DBP002) CYL(110,10) SHR(3 3)) -                      
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNUCH01.I0001.A001))                     
                                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNUCX01.I0001.A001) -                    
          LINEAR REUSE VOL(DBP002) CYL(110,10) SHR(3 3)) -                      
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNUCX01.I0001.A001))                     
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -START DB(DSNDB06) SPACE(SYSCOPY, DSNUCH01, DSNUCX01) ACCESS(RW)               
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//RELOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R,RESTART(PHASE)'                 
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSCOPY,DISP=(MOD,CATLG),                
//             UNIT=VSM                                                         
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSCOPY LOG NO UNLOAD PAUSE                         
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                                
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.D250508.DB06.SYSCOPY,                       
//             DISP=(MOD,CATLG),UNIT=VSM                                        
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSCOPY,DISP=(OLD,DELETE)                
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY     TABLESPACE DSNDB06.SYSCOPY COPYDDN SYSCOPY                            
 RUNSTATS TABLESPACE DSNDB06.SYSCOPY TABLE ALL INDEX ALL                        
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
