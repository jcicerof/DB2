//DB@ADRDS JOB CLASS=A,MSGCLASS=S,NOTIFY=&SYSUID                        JOB01277
//*                                                                     00011000
//* MOVE DATASET                                                        00011000
//*                                                                     00011000
//*                                                                     00011000
//ADRDSSU  EXEC PGM=ADRDSSU                                             00020001
//SYSPRINT DD   SYSOUT=*                                                00030001
//INDD     DD   DUMMY                                                   00050001
//OUTDD    DD   DUMMY                                                   00070001
//SYSIN    DD   *                                                       00080001
 COPY DATASET (INCLUDE(DB2PCAT.DSNDBC.DB2ADM.CICEROTS.*.*)) -           00090001
               TOL(ENQF)  -                                             00091001
               SPHERE     -                                             00092001
               CONCURRENT RENUNC(AXG0221) CAT DEL PURGE -               00093001
               ODY ((DSHR01))                                           00110001
