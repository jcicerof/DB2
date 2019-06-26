//SDBSTART  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID,TYPRUN=HOLD 00010005
//*-------------------------------------------------------------------  00020000
//* EXECUTA UM START INCONDICIONAL DE TODOS OS DATABASES DE PRODUCAO    00030001
//* PROCESSO DE COPIA PARA O ISERIES                                    00040001
//*                                                                     00050000
//* AUTOR: JOSE CICERO                                                  00060000
//* EMAIL: JOSECICEROFILHO@HOTMAIL.COM                                  00070000
//* DATA:  JUN/06                                                       00080000
//*-------------------------------------------------------------------  00090000
//*                                                                     00100000
//JOBLIBS  INCLUDE MEMBER=JOBDB2P                                       00110000
//*-------------------------------------------------------------------  00120001
//*    EXECUTA START DB                                                 00130002
//*-------------------------------------------------------------------  00140001
//START    EXEC PGM=IKJEFT01,DYNAMNBR=20                                00150001
//SYSTSPRT DD SYSOUT=*                                                  00160001
//SYSTSIN  DD DSN=DB2P.ISERIES.START(FULSTART),DISP=SHR                 00170001
//SYSPRINT DD SYSOUT=*                                                  00180001
//SYSUDUMP DD SYSOUT=*                                                  00190001
