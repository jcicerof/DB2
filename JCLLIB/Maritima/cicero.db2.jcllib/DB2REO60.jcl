//AXG0221R JOB (0XW0000,000,00),ROGERIO,NOTIFY=AXG0221,                         
//            REGION=4M,CLASS=S,MSGCLASS=X,COND=(4,LT)                          
//*--------------------------------------------------------------------*        
//*           REORGANIZA DSNDB06 SYSPLAN                                        
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSPLAN) ACCESS(UT)                                    
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.A250508.DB06.SYSPLAN,DISP=(,CATLG),         
//             UNIT=VSM                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY TABLESPACE DSNDB06.SYSPLAN COPYDDN SYSCOPY                                
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//UNLOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSPLAN,DISP=(MOD,CATLG),                
//             UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSPLAN LOG NO UNLOAD PAUSE                         
//*--------------------------------------------------------------------*        
//STOP    EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STOP DB(DSNDB06) SPACE(SYSPLAN,  DSNPPH01, DSNAPH01)                          
 -STOP DB(DSNDB06) SPACE(DSNAPX01, DSNGGX01)                                    
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//*            REORG ONLINE DO DIRETORIO DE PLANOS                              
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//DEFCL    EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
   DEL DB2PCAT.DSNDBC.DSNDB06.SYSPLAN.I0001.A001                                
   DEL DB2PCAT.DSNDBC.DSNDB06.DSNPPH01.I0001.A001                               
   DEL DB2PCAT.DSNDBC.DSNDB06.DSNAPH01.I0001.A001                               
   DEL DB2PCAT.DSNDBC.DSNDB06.DSNAPX01.I0001.A001                               
   DEL DB2PCAT.DSNDBC.DSNDB06.DSNGGX01.I0001.A001                               
   SET MAXCC = 0                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSPLAN.I0001.A001) -                     
          LINEAR REUSE VOL(DBP086) CYL(10,1) SHR(3 3)) -                        
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSPLAN.I0001.A001))                      
                                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNPPH01.I0001.A001) -                    
          LINEAR REUSE VOL(DBP086) CYL(2,1) SHR(3 3)) -                         
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNPPH01.I0001.A001))                     
                                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNAPH01.I0001.A001) -                    
          LINEAR REUSE VOL(DBP086) CYL(2,1) SHR(3 3)) -                         
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNAPH01.I0001.A001))                     
                                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNAPX01.I0001.A001) -                    
          LINEAR REUSE VOL(DBP086) CYL(2,1) SHR(3 3)) -                         
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNAPX01.I0001.A001))                     
                                                                                
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNGGX01.I0001.A001) -                    
          LINEAR REUSE VOL(DBP086) CYL(2,1) SHR(3 3)) -                         
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNGGX01.I0001.A001))                     
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -START DB(DSNDB06) SPACE(SYSPLAN,  DSNPPH01, DSNAPH01) ACCESS(RW)              
 -START DB(DSNDB06) SPACE(DSNAPX01, DSNGGX01)                                   
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//RELOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R,RESTART(PHASE)'                 
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSPLAN,DISP=(MOD,CATLG),                
//             UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSPLAN LOG NO UNLOAD PAUSE                         
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                                
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.D250508.DB06.SYSPLAN,                       
//             DISP=(MOD,CATLG),UNIT=VSM                                        
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY     TABLESPACE DSNDB06.SYSPLAN COPYDDN SYSCOPY                            
 RUNSTATS TABLESPACE DSNDB06.SYSPLAN TABLE ALL INDEX ALL                        
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
