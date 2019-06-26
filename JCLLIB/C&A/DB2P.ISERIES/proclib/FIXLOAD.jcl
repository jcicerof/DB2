//*-------------------------------------------------------------------  00010000
//* CRIA MEMBROS CONTENDO LOAD DE TABLESPACES                           00020000
//* PROCESSO DE COPIA PARA O ISERIES                                    00030000
//*                                                                     00040000
//* AUTOR: JOSE CICERO                                                  00050000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00060000
//* DATA:  NOV/06                                                       00070000
//*-------------------------------------------------------------------  00080000
//FIXLOAD  PROC TS=NONE,                                                00160000
//           OWNER=NONE,                                                00170000
//           REXXLIB=DB2P.ISERIES.REXX                                  00171000
//*-------------------------------------------------------------------  00180000
//*                                                                     00190000
//*-------------------------------------------------------------------  00200000
//FIXLOAD  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXLOAD &TS,&OWNER'      00210000
//SYSEXEC  DD   DSN=&REXXLIB,DISP=SHR                                   00220000
//SYSPRINT DD   SYSOUT=*                                                00230000
//SYSTSPRT DD   SYSOUT=*                                                00240000
//SYSTSIN  DD   DUMMY                                                   00250000
//INFILE   DD   DSN=DB2P.ISERIES.&TS..SYSPUNCH,DISP=OLD                 00260000
// PEND                                                                 00270000
