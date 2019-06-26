//AXG0221X  JOB (0XW0000,000,00),ROGERIO,                               00000001
//            NOTIFY=AXG0221,REGION=4M,CLASS=S,MSGCLASS=X               00000002
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -        41750000
//DEFCL    EXEC PGM=IDCAMS                                              41060000
//SYSPRINT  DD  SYSOUT=*                                                41070000
//SYSIN     DD  *                                                       41090000
   DEL DB2PCAT.DSNDBC.DSNDB01.SPT01.J0001.A001                          41160000
   DEL DB2PCAT.DSNDBC.DSNDB01.DSNSPT01.J0001.A001                       41190000
   DEL DB2PCAT.DSNDBC.DSNDB01.DSNSPT02.J0001.A001                       41220000
   SET MAXCC = 0                                                        41500000
                                                                        41500000
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB01.SPT01.J0001.A001) -               41400000
          LINEAR REUSE VOL(DB2P78) CYL(2120,20) CISZ(8192) SHR(3 3)) -  41420000
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB01.SPT01.J0001.A001))                41400000
                                                                        41500000
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB01.DSNSPT01.J0001.A001) -            41400000
          LINEAR REUSE VOL(DB2P10) CYL(50,10) CISZ(4096) SHR(3 3)) -    41420000
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB01.DSNSPT01.J0001.A001))             41400000
                                                                        41610000
   DEF CL(NAME(DB2PCAT.DSNDBC.DSNDB01.DSNSPT02.J0001.A001) -            41400000
          LINEAR REUSE VOL(DB2P11) CYL(80,10) CISZ(4096) SHR(3 3)) -    41420000
     DATA(NAME(DB2PCAT.DSNDBD.DSNDB01.DSNSPT02.J0001.A001))             41400000
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -        41750000
//IMAGE   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                        00900000
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.A220308.SPT01,DISP=(,CATLG),        00940000
//             UNIT=VSM                                                 00970000
//SYSPRINT DD  SYSOUT=*                                                 00980000
//SYSIN    DD  *                                                        01000000
 COPY TABLESPACE DSNDB01.SPT01 COPYDDN SYSCOPY                          01010000
//* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  -        41750000
//REORG   EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R',COND=(0,NE)            41770000
//STEPLIB  DD  DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                   
//SYSPRINT DD  SYSOUT=*                                                 41780000
//UTPRINT  DD  SYSOUT=*                                                 41790000
//SYSCOPY  DD  DSN=DB2V810.IMAGCOPY.D220308.SPT01,DISP=(,CATLG),        41920000
//             UNIT=VSM                                                 41933980
//SYSIN    DD  *                                                        41810000
   REORG TABLESPACE DSNDB01.SPT01                                       41820000
         SHRLEVEL REFERENCE LOG NO COPYDDN(SYSCOPY)                     41830000
         RETRY 255 TIMEOUT TERM RETRY_DELAY 1 DRAIN_WAIT 1              41840000
         SORTDATA NOSYSREC SORTDEVT SYSDA SORTNUM 4                     41879990
//****************************************************************      41940000
//DELCL    EXEC PGM=IDCAMS,COND=(0,NE)                                  41980000
//SYSPRINT  DD  SYSOUT=*                                                41990000
//SYSIN     DD  *                                                       42010000
   DEL DB2PCAT.DSNDBC.DSNDB01.SPT01.J0001.A001                          41160000
   DEL DB2PCAT.DSNDBC.DSNDB01.DSNSPT01.J0001.A001                       41190000
   DEL DB2PCAT.DSNDBC.DSNDB01.DSNSPT02.J0001.A001                       41220000
