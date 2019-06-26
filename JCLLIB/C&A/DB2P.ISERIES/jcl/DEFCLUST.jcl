//SDBDEFCL JOB ,CICERO,CLASS=S,MSGCLASS=X,REGION=0M,NOTIFY=&SYSUID
//*
//*-----------------------------------------------------------------*
//* DELETE CLUSTER - VSAM LINEAR - DB2
//*-----------------------------------------------------------------*
//*
//*DELCLUS  EXEC PGM=IDCAMS
//*SYSPRINT DD  SYSOUT=*
//*SYSIN    DD  *
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A001
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A002
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A003
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A004
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A005
//*-----------------------------------------------------------------*
//* DEFINE CLUSTER - VSAM LINEAR - DB2
//*-----------------------------------------------------------------*
//DEFCLUS EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN DD *
  DEFINE CLUSTER -
     ( NAME(DB2P.DSNDBC.AISERIES.EQ003T.I0001.A002) -
            LINEAR     -
            REUSE -
            CYLINDERS(2913 292) -
            SHAREOPTIONS(3 3) ) -
     DATA -
   ( NAME(DB2P.DSNDBD.AISERIES.EQ003T.I0001.A002) -
       ) -
    CATALOG(DB2P)

  DEFINE CLUSTER -
     ( NAME(DB2P.DSNDBC.AISERIES.EQ003T.I0001.A003) -
            LINEAR     -
            REUSE -
            CYLINDERS(2913 292) -
            SHAREOPTIONS(3 3) ) -
     DATA -
   ( NAME(DB2P.DSNDBD.AISERIES.EQ003T.I0001.A003) -
       ) -
    CATALOG(DB2P)

  DEFINE CLUSTER -
     ( NAME(DB2P.DSNDBC.AISERIES.EQ003T.I0001.A004) -
            LINEAR     -
            REUSE -
            CYLINDERS(2913 292) -
            SHAREOPTIONS(3 3) ) -
     DATA -
   ( NAME(DB2P.DSNDBD.AISERIES.EQ003T.I0001.A004) -
       ) -
    CATALOG(DB2P)

  DEFINE CLUSTER -
     ( NAME(DB2P.DSNDBC.AISERIES.EQ003T.I0001.A005) -
            LINEAR     -
            REUSE -
            CYLINDERS(2913 292) -
            SHAREOPTIONS(3 3) ) -
     DATA -
   ( NAME(DB2P.DSNDBD.AISERIES.EQ003T.I0001.A005) -
       ) -
    CATALOG(DB2P)

//
  DEFINE CLUSTER -
     ( NAME(DB2P.DSNDBC.AISERIES.AT019T.I0001.A002) -
            LINEAR     -
            REUSE -
            CYLINDERS(2913 292) -
            SHAREOPTIONS(3 3) ) -
     DATA -
   ( NAME(DB2P.DSNDBD.AISERIES.AT019T.I0001.A002) -
       ) -
    CATALOG(DB2P)
//
  DEFINE CLUSTER -
     ( NAME(DB2P.DSNDBC.AISERIES.ES007T.I0001.A002) -
            LINEAR     -
            REUSE -
            CYLINDERS(1457 146) -
            SHAREOPTIONS(3 3) ) -
     DATA -
   ( NAME(DB2P.DSNDBD.AISERIES.ES007T.I0001.A002) -
       ) -
    CATALOG(DB2P)

//
