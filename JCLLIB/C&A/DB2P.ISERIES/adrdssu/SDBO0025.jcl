//SDBO0025 JOB ,CICERO,CLASS=S,MSGCLASS=J,REGION=0M,
//         TYPRUN=HOLD,NOTIFY=&SYSUID,
//         RESTART=*
//JOBLIB   INCLUDE MEMBER=JOBLIBS
//*-------------------------------------------------------------------*
//*                                                                   *
//*-------------------------------------------------------------------*
//COPY     EXEC PGM=ADRDSSU,COND=(0,NE) ,PARM='TYPRUN=NORUN'
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *

  PARALLEL


  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038I.A0001.I006                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038I.A0001.I007                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038I.A0001.I008                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038I.A0001.I009                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038I.A0001.I010                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A002                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A003                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A004                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A005                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A006                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A007                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A008                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A009                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ038T.I0001.A010                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ039T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ040T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ041T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ042I.A0001.I001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.EQ0BP.EQ042I.A0001.I002                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT


//*--------------------------------------------------------------------*
//* LIBERA PROXIMO JOB                                                 *
//*--------------------------------------------------------------------*
//LIBERA EXEC PGM=IEBGENER  ,COND=(0,NE)
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT2   DD SYSOUT=(,INTRDR)
//SYSUT1   DD DATA,DLM=$$
/*$VS,'$AJ''SDBO0026'''
$$
