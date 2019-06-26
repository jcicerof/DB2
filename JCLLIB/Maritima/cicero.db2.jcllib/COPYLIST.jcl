//DB@COPY  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID TYPRUN=HOLD   00010033
//*                                                                     00020005
//         SET DSN=DB2P                                                 00030006
//*------------------------------------------------------------------   00040005
//* COPY                                                                00050005
//*------------------------------------------------------------------   00060005
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00070005
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00080005
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00090005
//SYSPRINT DD   SYSOUT=*                                                00100005
//UTPRINT  DD   SYSOUT=*                                                00110005
//SYSUDUMP DD   SYSOUT=*                                                00120005
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00130005
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00140005
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   00150005
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(1500,700),RLSE)                  00160005
//*SYSDISC  DD   DUMMY                                                  00170006
//*SYSREC   DD   DUMMY                                                  00180006
//SYSIN    DD   *                                                       00190005
OPTIONS EVENT(ITEMERROR, SKIP)                                          00200005
LISTDEF LISTA                                                           00210014
               INCLUDE TABLESPACE DBSS01.SSMOVPRM                       00213035
                                                                        00214034
TEMPLATE DDCOPY  DSN(CICERO.UNL.&DB..&TS..REC.D&DT.)                    00218034
   UNIT SYSDA SPACE (1000,1000) CYL DISP (NEW,CATLG,DELETE)             00219035
   VOLUMES(DSHR03)                                                      00220035
                                                                        00230034
COPY LIST LISTA                                                         00330007
     SHRLEVEL REFERENCE                                                 00340005
     FULL YES                                                           00350005
     COPYDDN DDCOPY                                                     00360005
