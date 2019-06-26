//*-------------------------------------------------------------------  00010000
//* AUTOR: JOSE CICERO                                                  00050000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00060000
//* DATA:  JAN/07                                                       00070000
//*-------------------------------------------------------------------  00080000
//FIXLOAD  PROC TS=NONE,                                                00090000
//           OWNER=NONE,                                                00100000
//           REXXLIB=CICERO.DB2.REXX                                    00110001
//*-------------------------------------------------------------------  00120000
//*                                                                     00130000
//*-------------------------------------------------------------------  00140000
//FIXLOAD  EXEC PGM=IKJEFT1A,DYNAMNBR=20,PARM='RXLOAD &TS,&OWNER'       00150000
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00160000
//SYSPRINT DD   SYSOUT=*                                                00170000
//SYSTSPRT DD   SYSOUT=*                                                00180000
