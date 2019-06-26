//AXG0221R JOB (0XW0000,000,00),ROGERIO,NOTIFY=AXG0221,                         
//            REGION=4M,CLASS=S,MSGCLASS=X,COND=(4,LT)                          
//*--------------------------------------------------------------------*        
//*           REORGANIZA DSNDB06 SYSSTATS                                       
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSSTATS) ACCESS(UT)                                   
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.A250508.DB06.SYSSTATS,DISP=(,CATLG),        
//             UNIT=VSM                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY TABLESPACE DSNDB06.SYSSTATS COPYDDN SYSCOPY                               
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//UNLOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSSTATS,DISP=(MOD,CATLG),               
//             UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSSTATS LOG NO UNLOAD PAUSE                        
//*--------------------------------------------------------------------*        
//STOP    EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STOP DB(DSNDB06) SPACE(SYSSTATS, DSNTNX01, DSNTPX01, DSNTCX01)                
 -STOP DB(DSNDB06) SPACE(DSNTXX01, DSNLNX01, DSNTTX01)                          
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//*            REORG ONLINE DO DIRETORIO DE PLANOS                              
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//DEFCL    EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
 DEL DB2PCAT.DSNDBC.DSNDB06.SYSSTATS.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNTNX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNTPX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNTCX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNTXX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNLNX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNTTX01.I0001.A001                                 
 SET MAXCC = 0                                                                  
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSSTATS.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(13,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSSTATS.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNTNX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNTNX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNTPX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNTPX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNTCX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNTCX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNTXX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNTXX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNLNX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNLNX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNTTX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNTTX01.I0001.A001))                       
                                                                                
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSSTATS) ACCESS(RW)                                   
 -STA  DB(DSNDB06) SPACE(DSNTNX01, DSNTPX01, DSNTCX01)                          
 -STA  DB(DSNDB06) SPACE(DSNTXX01, DSNLNX01, DSNTTX01)                          
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//RELOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R,RESTART(PHASE)'                 
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSSTATS,DISP=(MOD,CATLG),               
//             UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSSTATS LOG NO UNLOAD PAUSE                        
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                                
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.D250508.DB06.SYSSTATS,                      
//             DISP=(MOD,CATLG),UNIT=VSM                                        
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSSTATS,DISP=(OLD,DELETE)               
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY     TABLESPACE DSNDB06.SYSSTATS COPYDDN SYSCOPY                           
 RUNSTATS TABLESPACE DSNDB06.SYSSTATS TABLE ALL INDEX ALL                       
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
