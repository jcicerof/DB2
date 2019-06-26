//SWUTELST JOB CLASS=S,MSGCLASS=S,NOTIFY=CICERO                         00010000
//S01      EXEC PGM=IDCAMS                                              00020000
//SYSPRINT DD  DSN=CICERO.ALL.DATASETS.SYSCOPY.DB2P,UNIT=SYSDBA,        00030000
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(100,100),RLSE)           00040000
//SYSIN    DD *                                                         00050000
 LISTC CATALOG (CATALOG.DB2PROD.MARITIMA)                               00060000
