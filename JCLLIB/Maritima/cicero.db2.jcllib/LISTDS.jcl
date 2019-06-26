//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID               00010001
//*                                                                     00020000
//EDIT     EXEC PGM=IKJEFT01,DYNAMNBR=20                                00030000
//SYSTSPRT DD   SYSOUT=*                                                00040000
//SYSTSIN  DD   *                                                       00050000
PROFILE NOPREFIX                                                        00060000
LISTDS DB2PCOPY.*                                                       00070002
LISTDS DB2PCOPY.* MEMBERS                                               00080002
