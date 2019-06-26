//SDB80ADR  JOB 'CICERO',CLASS=S,MSGCLASS=X,REGION=0M TYPRUN=SCAN       00010001
//JOBLIB   DD DSN=DB2.DSN610.SDSNEXIT,DISP=SHR                          00020000
//         DD DSN=DB2.DSN610.SDSNLOAD,DISP=SHR                          00030000
//*------------------------------------------------------------------   00040000
//* QUIESCE                                                             00050000
//*------------------------------------------------------------------   00060000
//*QUIESCE  EXEC PGM=DSNUTILB,PARM='DB2P'                               00070002
//*SYSPRINT DD   SYSOUT=*                                               00080002
//*SYSIN    DD   *                                                      00090002
//*QUIESCE TABLESPACE EQ0BP.EQ034T                                      00100002
//*-------------------------------------------------------------------  00110000
//*    EXECUTA STOP                                                     00120000
//*-------------------------------------------------------------------  00130000
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00140000
//SYSTSPRT DD SYSOUT=*                                                  00150000
//SYSTSIN  DD *                                                         00160000
 DSN SYSTEM(DB2P)                                                       00170000
-STOP DB(AISERIES) SPACE(EQ034T)                                        00180002
 END                                                                    00190000
//SYSPRINT DD SYSOUT=*                                                  00200000
//SYSUDUMP DD SYSOUT=*                                                  00210000
//*-------------------------------------------------------------------  00220000
//*    IDCAMS                                                           00230000
//*-------------------------------------------------------------------  00240000
//*IDCAMS   EXEC PGM=IDCAMS                                             00250000
//*SYSPRINT DD SYSOUT=*                                                 00260000
//*SYSUDUMP DD SYSOUT=*                                                 00270000
//*SYSIN DD *                                                           00280000
//* DELETE (DB2D.DSNDBC.I5.DS068T.I0001.A001)                           00290000
//*-------------------------------------------------------------------* 00300000
//*    ADRDSSU - COPIA DATASET DB2                                    * 00310000
//*-------------------------------------------------------------------* 00320000
//COPY     EXEC PGM=ADRDSSU ,PARM='TYPRUN=NORUN'                        00330000
//SYSPRINT DD   SYSOUT=*                                                00340000
//SYSIN    DD *                                                         00350000
 COPY  TOL(ENQF) CAT -                                                  00360000
 DATAS(INC(        -                                                    00370000
      DB2P.DSNDB*.AISERIES.EQ034T.*.* -                                 00380002
           ))-                                                          00390000
 RENAMEU(**,*.*.AISERIES.EQ034BKP.**) -                                 00400002
 CONCURRENT                                                             00410002
//*-------------------------------------------------------------------  00420000
//*    EXECUTA START DB                                                 00430000
//*-------------------------------------------------------------------  00440000
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00450000
//SYSTSPRT DD SYSOUT=*                                                  00460000
//SYSTSIN  DD *                                                         00470000
 DSN SYSTEM(DB2P)                                                       00480000
-START DB(AISERIES) SPACE(EQ034T) ACCESS(RW)                            00490002
 END                                                                    00500000
//SYSPRINT DD SYSOUT=*                                                  00510000
//SYSUDUMP DD SYSOUT=*                                                  00520000
