//DB@ADRDS JOB CLASS=A,MSGCLASS=S,NOTIFY=&SYSUID                        JOB01279
//*                                                                     00011000
//* COPIA COM UM NOVO HLV                                               00011000
//*                                                                     00011000
//*                                                                     00011000
//ADRDSSU  EXEC PGM=ADRDSSU                                             00020001
//SYSPRINT DD   SYSOUT=*                                                00030001
//INDD     DD   DUMMY                                                   00050001
//OUTDD    DD   DUMMY                                                   00070001
//SYSIN    DD   *                                                       00080001
 COPY DATASET (INCLUDE(DB2PCAT.DSNDBC.DB2ADM.CICERO*.*.*)) -            00090001
               RENUNC(CICERO) CAT -                                     00093001
               ODY ((DSHR01))                                           00110001
