//SDB80ADR  JOB 'CICERO',CLASS=S,MSGCLASS=X,REGION=0M TYPRUN=SCAN       00010000
//JOBLIB   DD DSN=DB2.DSN610.SDSNEXIT,DISP=SHR                          00020000
//         DD DSN=DB2.DSN610.SDSNLOAD,DISP=SHR                          00030000
//*-------------------------------------------------------------------  00040000
//*    EXECUTA STOP                                                     00050000
//*-------------------------------------------------------------------  00060000
//STOPDB   EXEC PGM=IKJEFT01,DYNAMNBR=20                                00070000
//SYSTSPRT DD SYSOUT=*                                                  00080000
//SYSTSIN  DD *                                                         00090000
 DSN SYSTEM(DB2P)                                                       00100000
-STOP DB(AISERIES) SPACE(EQ034T)                                        00110000
 END                                                                    00120000
//SYSPRINT DD SYSOUT=*                                                  00130000
//SYSUDUMP DD SYSOUT=*                                                  00140000
//*-------------------------------------------------------------------* 00150000
//*    ADRDSSU - COPIA DATASET DB2                                    * 00160000
//*-------------------------------------------------------------------* 00170000
//COPY     EXEC PGM=ADRDSSU ,PARM='TYPRUN=NORUN'                        00180000
//SYSPRINT DD   SYSOUT=*                                                00190000
//SYSIN    DD *                                                         00200000
 PARALLEL                                                               00210001
    COPY  TOL(ENQF) CAT  -                                              00220001
          DATAS(INC(DB2P.DSNDBC.AISERIES.EQ034T.I0001.A001)) -          00230001
          RENAMEU(**,*.*.AISERIES.EQ034BK2.**)                          00240001
    COPY  TOL(ENQF) CAT  -                                              00250001
          DATAS(INC(DB2P.DSNDBC.AISERIES.EQ034T.I0001.A002)) -          00260001
          RENAMEU(**,*.*.AISERIES.EQ034BK2.**)                          00270001
    COPY  TOL(ENQF) CAT  -                                              00280001
          DATAS(INC(DB2P.DSNDBC.AISERIES.EQ034T.I0001.A003)) -          00290001
          RENAMEU(**,*.*.AISERIES.EQ034BK2.**)                          00300001
//*-------------------------------------------------------------------  00310000
//*    EXECUTA START DB                                                 00320000
//*-------------------------------------------------------------------  00330000
//STARTDB  EXEC PGM=IKJEFT01,DYNAMNBR=20                                00340000
//SYSTSPRT DD SYSOUT=*                                                  00350000
//SYSTSIN  DD *                                                         00360000
 DSN SYSTEM(DB2P)                                                       00370000
-START DB(AISERIES) SPACE(EQ034T) ACCESS(RW)                            00380000
 END                                                                    00390000
//SYSPRINT DD SYSOUT=*                                                  00400000
//SYSUDUMP DD SYSOUT=*                                                  00410000
