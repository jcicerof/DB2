//SDBO0010 JOB ,CICERO,CLASS=S,MSGCLASS=J,REGION=0M,
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
                 DB2P.DSNDBC.DS0BP.DS043T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS044T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS045T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS046T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS047T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS048T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS049T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS050T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS051T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS052T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS053T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS054T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS055T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS056T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS057T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS058T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS059T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS060T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS061T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.DS0BP.DS062T.I0001.A001                 -
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
/*$VS,'$AJ''SDBO0011'''
$$
