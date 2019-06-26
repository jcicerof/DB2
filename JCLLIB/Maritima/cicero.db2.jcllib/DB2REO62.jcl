//AXG0221R JOB (0XW0000,000,00),ROGERIO,NOTIFY=AXG0221,                         
//            REGION=4M,CLASS=S,MSGCLASS=X,COND=(4,LT)                          
//*--------------------------------------------------------------------*        
//*           REORGANIZA DSNDB06 SYSDBASE                                       
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSDBASE) ACCESS(UT)                                   
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.A250508.DB06.SYSDBASE,DISP=(,CATLG),        
//             UNIT=VSM                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY TABLESPACE DSNDB06.SYSDBASE COPYDDN SYSCOPY                               
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//UNLOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)                    
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(100,50),RLSE)                             
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(100,50),RLSE)                             
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(100,50),RLSE)                             
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(100,50),RLSE)                             
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSDBASE,DISP=(MOD,CATLG),               
//             UNIT=SYSDA,SPACE=(CYL,(150,50),RLSE)                             
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSDBASE LOG NO UNLOAD PAUSE                        
//*--------------------------------------------------------------------*        
//STOP    EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STOP DB(DSNDB06) SPACE(SYSDBASE, DSNACX01, DSNDCX01, DSNDCX02)                
 -STOP DB(DSNDB06) SPACE(DSNDRH01, DSNDXX01, DSNDXX02, DSNDXX03)                
 -STOP DB(DSNDB06) SPACE(DSNDXX04, DSNDRX01, DSNDRX02, DSNDKX01)                
 -STOP DB(DSNDB06) SPACE(DSNDLX01, DSNDLX02, DSNDYX01, DSNATX01)                
 -STOP DB(DSNDB06) SPACE(DSNATX02, DSNATX03, DSNATX04, DSNDPX01)                
 -STOP DB(DSNDB06) SPACE(DSNDPX02, DSNDPX03, DSNDTX01, DSNDTX02)                
 -STOP DB(DSNDB06) SPACE(DSNDTX03, DSNDSX01, DSNATX99, SYSCOLUM)                
 -STOP DB(DSNDB06) SPACE(SYSFOREI, SYSINDEX)                                    
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//*            REORG ONLINE DO DIRETORIO DE PLANOS                              
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//DEFCL    EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNACX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNATX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNATX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNATX03.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNATX04.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNATX99.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDCX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDCX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDKX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDLX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDLX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDPX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDPX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDPX03.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDRH01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDRX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDRX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDSX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDTX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDTX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDTX03.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDXX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDXX02.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDXX03.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDXX04.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.DSNDYX01.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.SYSCOLUM.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.SYSFOREI.I0001.A001                                 
 DEL DB2PCAT.DSNDBC.DSNDB06.SYSINDEX.I0001.A001                                 
 SET MAXCC = 0                                                                  
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNACX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(02,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNACX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNATX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(04,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNATX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNATX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(30,05) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNATX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNATX03.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(13,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNATX03.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNATX04.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(15,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNATX04.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNATX99.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(06,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNATX99.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDCX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(07,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDCX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDCX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(07,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDCX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDKX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(02,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDKX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDLX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDLX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDLX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDLX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDPX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDPX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDPX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDPX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDPX03.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDPX03.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDRH01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDRH01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDRX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDRX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDRX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDRX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDSX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDSX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDTX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDTX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDTX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDTX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDTX03.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDTX03.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDXX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDXX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDXX02.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDXX02.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDXX03.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDXX03.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDXX04.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDXX04.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.DSNDYX01.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.DSNDYX01.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSCOLUM.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(32,02) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSCOLUM.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSFOREI.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(01,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSFOREI.I0001.A001))                       
                                                                                
 DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB06.SYSINDEX.I0001.A001) -                      
          LINEAR REUSE VOL(DBP086) CYL(02,01) SHR(3 3)) -                       
   DATA(NAME(DB2PCAT.DSNDBD.DSNDB06.SYSINDEX.I0001.A001))                       
//*--------------------------------------------------------------------*        
//START   EXEC PGM=IKJEFT01                                                     
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSTSPRT DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSTSIN  DD  *                                                                
 DSN SYSTEM(DB2P)                                                               
 -STA  DB(DSNDB06) SPACE(SYSDBASE, DSNACX01, DSNDCX01, DSNDCX02)                
 -STA  DB(DSNDB06) SPACE(DSNDRH01, DSNDXX01, DSNDXX02, DSNDXX03)                
 -STA  DB(DSNDB06) SPACE(DSNDXX04, DSNDRX01, DSNDRX02, DSNDKX01)                
 -STA  DB(DSNDB06) SPACE(DSNDLX01, DSNDLX02, DSNDYX01, DSNATX01)                
 -STA  DB(DSNDB06) SPACE(DSNATX02, DSNATX03, DSNATX04, DSNDPX01)                
 -STA  DB(DSNDB06) SPACE(DSNDPX02, DSNDPX03, DSNDTX01, DSNDTX02)                
 -STA  DB(DSNDB06) SPACE(DSNDTX03, DSNDSX01, DSNATX99, SYSCOLUM)                
 -STA  DB(DSNDB06) SPACE(SYSFOREI, SYSINDEX)                                    
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//RELOAD  EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R,RESTART(PHASE)'                 
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SORTWK01 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK02 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK03 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SORTWK04 DD  UNIT=SYSDA,SPACE=(CYL,(300,50),RLSE)                             
//SYSPRINT DD  SYSOUT=*                                                         
//UTPRINT  DD  SYSOUT=*                                                         
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSDBASE,DISP=(MOD,CATLG),               
//             UNIT=VSM                                                         
//SYSIN    DD  *                                                                
   REORG TABLESPACE DSNDB06.SYSDBASE LOG NO UNLOAD PAUSE                        
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                                
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.D250508.DB06.SYSDBASE,                      
//             DISP=(MOD,CATLG),UNIT=VSM                                        
//SYSREC   DD  DSN=DB2V810.SYSREC.DB06.SYSDBASE,DISP=(OLD,DELETE)               
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  *                                                                
 COPY     TABLESPACE DSNDB06.SYSDBASE COPYDDN SYSCOPY                           
 RUNSTATS TABLESPACE DSNDB06.SYSDBASE TABLE ALL INDEX ALL                       
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -                
