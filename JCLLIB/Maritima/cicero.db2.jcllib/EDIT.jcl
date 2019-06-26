//DB@CICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID               00010002
//*                                                                     00020000
//EDIT     EXEC PGM=IKJEFT01,DYNAMNBR=20                                00030001
//SYSTSPRT DD   SYSOUT=*                                                00040001
//SYSTSIN  DD   *                                                       00050001
EDIT 'CICERO.TEXT' DATA NONUM                                           00060001
CHANGE * 30 COMANDO SELECT                                              00070001
TOP                                                                     00090001
LIST * 999                                                              00100001
END SAVE                                                                00110001
