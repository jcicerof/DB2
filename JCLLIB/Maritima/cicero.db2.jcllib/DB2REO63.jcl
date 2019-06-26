//AXG0221R JOB (0XW0000,000,00),ROGERIO,NOTIFY=AXG0221,                         
//            REGION=4M,CLASS=S,MSGCLASS=X,COND=(4,LT)                          
//*--------------------------------------------------------------------*        
//*           REORGANIZA DSNDB06 SYSHIST                                        
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSHIST) ACCESS(UT)                                    
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.A250508.DB06.SYSHIST,DISP=(,CATLG),         
//             UNIT=VSM                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY TABLESPACE DSNDB06.SYSHIST COPYDDN SYSCOPY                                
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//UNLOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSHIST,DISP=(MOD,CATLG),                
//             UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSHIST LOG NO UNLOAD PAUSE                         
//*--------------------------------------------------------------------*        
//STOP    EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STOP DB(DSNDB06) SPACE(SYSHIST)                                               
 -STOP DB(DSNDB06) SPACE(DSNHBX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHCX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHDX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHEX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHFX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHGX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHHX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHHX02)                                              
 -STOP DB(DSNDB06) SPACE(DSNHIX01)                                              
 -STOP DB(DSNDB06) SPACE(DSNHJX01)                                              
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//*            REORG ONLINE DO DIRETORIO DE PLANOS                              
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//DEFCL    EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
 DEL DB2PCAT.DSNDBC.DSNDB06.SYSHIST.I0001.A001                                  
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHBX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHCX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHDX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHEX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHFX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHGX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHHX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHHX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHIX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNHJX01.I0001.A001                                 
 SET MAXCC = 0                                                                  
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSHIST.I0001.A001) -                       
          LINEAR REUSE VOL(DBP086) CYL(05,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSHIST.I0001.A001))                        
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHBX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHBX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHCX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHCX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHDX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHDX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHEX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHEX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHFX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHFX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHGX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHGX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHHX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHHX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHHX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHHX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHIX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHIX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNHJX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNHJX01.I0001.A001))                       
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSHIST)   ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHBX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHCX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHDX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHEX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHFX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHGX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHHX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHHX02)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHIX01)  ACCESS(RW)                                  
 -STA  DB(DSNDB06) SPACE(DSNHJX01)  ACCESS(RW)                                  
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//RELOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R,RESTART(PHASE)'                 
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSHIST,DISP=(MOD,CATLG),                
//             UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSHIST LOG NO UNLOAD PAUSE                         
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                                
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.D250508.DB06.SYSHIST,                       
//             DISP=(MOD,CATLG),UNIT=VSM                                        
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSHIST,DISP=(OLD,DELETE)                
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY     TABLESPACE DSNDB06.SYSHIST COPYDDN SYSCOPY                            
 RUNSTATS TABLESPACE DSNDB06.SYSHIST TABLE ALL INDEX ALL                        
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
