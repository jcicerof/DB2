//DB@REPOR JOB MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID                        00010005
//*                                                                     00021002
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            00022002
//REPORT   EXEC PROC=REPORT,DSN='DB2P'                                  00030004
//SYSIN    DD   *                                                       00140000
REPORT TABLESPACESET TABLESPACE DBSS05.SSMMAMAR                         00170004
