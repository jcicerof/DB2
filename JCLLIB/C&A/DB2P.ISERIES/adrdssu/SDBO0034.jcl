//SDBO0034 JOB ,CICERO,CLASS=S,MSGCLASS=J,REGION=0M,
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
                 DB2P.DSNDBC.IF0BP.IF037T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.IF0BP.IF039T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG000T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG001T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG002T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG003T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG004T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG005T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG006T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG007T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG008T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG009T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG010T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG011T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG012T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG013T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG014T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG015T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG016T.I0001.A001                 -
        ))                                                           -
        STORCLAS(DB2Z)                                               -
        FCNOCOPY                                                     -
        RENAMEU(DB2Z)  CAT



  COPY  TOL(ENQF) REP SPHERE TGTGDS(ACTIVE)                          -
        DATAS(INC(                                                   -
                 DB2P.DSNDBC.LG0BP.LG017T.I0001.A001                 -
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
/*$VS,'$AJ''SDBO0035'''
$$
