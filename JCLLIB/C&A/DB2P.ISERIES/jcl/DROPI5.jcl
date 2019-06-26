//SDBI5DRO  JOB 'CICERO',CLASS=S,MSGCLASS=X,REGION=0M,TYPRUN=SCAN       00010002
//*                                                                     00020000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00030000
//*                                                                     00040000
//*        DROP DATABASE AISERIES                                       00050002
//*        DEIXAR JOB EM TYPRUN=SCAN                                    00060002
//*                                                                     00070000
//QUERY01 EXEC PGM=IKJEFT01,DYNAMNBR=20                                 00080000
//SYSTSPRT DD SYSOUT=*                                                  00090000
//SYSTSIN  DD *                                                         00100000
  DSN SYSTEM(DB2P)                                                      00110000
  RUN  PROGRAM(DSNTEP2) PLAN(DSNTEP61) PARMS('/ALIGN(LHS)') -           00120000
       LIB('DB2.DSN610.RUNLIB.LOAD')                                    00130000
//SYSPRINT DD SYSOUT=*                                                  00140000
//SYSUDUMP DD SYSOUT=*                                                  00150000
//SYSIN    DD *                                                         00160000
--DROP DATABASE AISERIES;                                               00170002
