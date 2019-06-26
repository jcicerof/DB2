//SDB80AMS  JOB 'CICERO',CLASS=S,MSGCLASS=X,REGION=0M TYPRUN=SCAN       00010004
//*-------------------------------------------------------------------  00020000
//*    IDCAMS                                                           00030000
//*-------------------------------------------------------------------  00040000
//IDCAMS   EXEC PGM=IDCAMS                                              00050001
//SYSPRINT DD SYSOUT=*                                                  00060001
//SYSUDUMP DD SYSOUT=*                                                  00070001
//SYSIN DD *                                                            00080001
  LISTCAT ENT (DB2P.DSNDBC.EQ0BP.EQ034T.I0001.A001) ALL                 00090005
  LISTCAT ENT (DB2Z.DSNDBD.EQ0BP.EQ034T.I0001.A001) ALL                 00100005
  LISTCAT ENT (DB2P.DSNDBC.EQ0BP.EQ034I.I0001.A001) ALL                 00110005
  LISTCAT ENT (DC.EQ.DSNDBC.EQ0BP.EQ034I.I0001.A001) ALL                00120005
