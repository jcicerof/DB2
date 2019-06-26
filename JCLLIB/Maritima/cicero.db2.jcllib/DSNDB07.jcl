//DB@DB07A JOB (0XW0000,000,00),CICERO,MSGCLASS=X,                              
//            NOTIFY=&SYSUID,REGION=4096K,CLASS=S                               
//STOP    EXEC PGM=IKJEFT01                                             00590000
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                           00600000
//SYSTSPRT DD  SYSOUT=*                                                 00610000
//SYSPRINT DD  SYSOUT=*                                                 00620000
//SYSTSIN  DD  *                                                        00640000
 DSN SYSTEM(DB2P)                                                       00650000
 -STOP DB(DSNDB07)                                                      00684000
 END                                                                    00700000
//STEP01   EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
  DEL DB2PCAT.DSNDBC.DSNDB07.DSN4K01.I0001.A001                                 
  DEL DB2PCAT.DSNDBC.DSNDB07.DSN4K02.I0001.A001                                 
  DEL DB2PCAT.DSNDBC.DSNDB07.DSN4K03.I0001.A001                                 
  DEL DB2PCAT.DSNDBC.DSNDB07.DSN4K04.I0001.A001                                 
  SET MAXCC = 0                                                                 
                                                                                
  DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB07.DSN4K01.I0001.A001) -                      
        SHR(3 3) LINEAR REUSE CYL(1100) VOL(DB2P77) ) -                         
    DATA(NAME(DB2PCAT.DSNDBD.DSNDB07.DSN4K01.I0001.A001))                       
                                                                                
  DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB07.DSN4K02.I0001.A001) -                      
        SHR(3 3) LINEAR REUSE CYL(1100) VOL(DB2P77) ) -                         
    DATA(NAME(DB2PCAT.DSNDBD.DSNDB07.DSN4K02.I0001.A001))                       
                                                                                
  DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB07.DSN4K03.I0001.A001) -                      
        SHR(3 3) LINEAR REUSE CYL(1100) VOL(DB2P77) ) -                         
    DATA(NAME(DB2PCAT.DSNDBD.DSNDB07.DSN4K03.I0001.A001))                       
                                                                                
  DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB07.DSN4K04.I0001.A001) -                      
        SHR(3 3) LINEAR REUSE CYL(1100) VOL(DB2P77) ) -                         
    DATA(NAME(DB2PCAT.DSNDBD.DSNDB07.DSN4K04.I0001.A001))                       
                                                                                
//START   EXEC PGM=IKJEFT01                                             00590000
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                           00600000
//SYSTSPRT DD  SYSOUT=*                                                 00610000
//SYSPRINT DD  SYSOUT=*                                                 00620000
//SYSTSIN  DD  *                                                        00640000
 DSN SYSTEM(DB2P)                                                       00650000
 -STA  DB(DSNDB07)                                                      00684000
 END                                                                    00700000
