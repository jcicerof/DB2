//SDBO0039 JOB ,CICERO,CLASS=S,MSGCLASS=J,REGION=0M,
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
                 DB2P.DSNDBC.LG2BP.LG228T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG229T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG230T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG231T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG232T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG234T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG235T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG236T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG237T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG238T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG239T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG240T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG241T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG242T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG243T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG244T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG245T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG246T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG247T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG2BP.LG248T.I0001.A001                 -
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
/*$VS,'$AJ''SDBO0040'''
$$
