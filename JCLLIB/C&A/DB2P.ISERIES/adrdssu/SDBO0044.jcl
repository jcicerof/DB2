//SDBO0044 JOB ,CICERO,CLASS=S,MSGCLASS=J,REGION=0M,
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
                 DB2P.DSNDBC.LG4BP.LG413T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG414T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG415T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG416T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG417T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG418T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG423T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG424T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG425T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG426T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG427T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG428T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG429T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG430T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG431T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG432T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG433T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG4BP.LG434T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG5BP.LG500T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG5BP.LG501T.I0001.A001                 -
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
/*$VS,'$AJ''SDBO0045'''
$$
