//SDB8STO1  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD 00010006
//*-------------------------------------------------------------------  00020000
//* EXECUTA UM STOP INCONDICIONAL DE TODOS OS DATABASES DE PRODUCAO     00030001
//* PROCESSO DE COPIA PARA O ISERIES                                    00040000
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  JUN/06                                                       00080000
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110000
//*-------------------------------------------------------------------  00120000
//*    EXECUTA STOP DB                                                  00130000
//*-------------------------------------------------------------------  00140000
//STOP     EXEC PGM=IKJEFT01,DYNAMNBR=20                                00150001
//SYSTSPRT DD SYSOUT=*                                                  00160000
//SYSTSIN  DD DSN=DB2P.ISERIES.STOP(FULSTOP),DISP=SHR                   00170001
//SYSPRINT DD SYSOUT=*                                                  00180000
//SYSUDUMP DD SYSOUT=*                                                  00190000
//*                                                                     00200005
//SDB8STO2  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD 00210006
//*-------------------------------------------------------------------  00220005
//* EXECUTA UM STOP INCONDICIONAL DE TODOS OS DATABASES DE PRODUCAO     00230005
//* PROCESSO DE COPIA PARA O ISERIES                                    00240005
//*                                                                     00250005
//* AUTOR: JOSE CICERO                                                  00260005
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00270005
//* DATA:  JUN/06                                                       00280005
//*-------------------------------------------------------------------  00290005
//*                                                                     00300005
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00310005
//*-------------------------------------------------------------------  00320005
//*    EXECUTA STOP DB                                                  00330005
//*-------------------------------------------------------------------  00340005
//STOP     EXEC PGM=IKJEFT01,DYNAMNBR=20                                00350005
//SYSTSPRT DD SYSOUT=*                                                  00360005
//SYSTSIN  DD *                                                         00370005
  DSN SYSTEM(DB2P)                                                      00380005
  -STOP DB(AISERIES) SPACE(*)                                           00390005
  END                                                                   00400005
//SYSPRINT DD SYSOUT=*                                                  00410005
//SYSUDUMP DD SYSOUT=*                                                  00420005
