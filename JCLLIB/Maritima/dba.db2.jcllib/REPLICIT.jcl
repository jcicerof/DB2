//DB@REPLI JOB 'JONAS,DBA(R.5627)',MSGCLASS=P,CLASS=A,NOTIFY=JONAS      00010004
//*                                                                     00020000
//         SET DSN=DB2P                                                 00030000
//*-------------------------------------------------------------------  00040004
//* CARREGA DADOS DE TAMANHO DAS TABELAS REPLICADAS                     00050004
//* ESTE JOB DEVERA SER EXECUTADO DIARIAMENTE APOS O PRUNE              00062004
//*                                                                     00064004
//* EM CASO DE ABEND NAO HAVERA NECESSIDADE DE RETOMAR O JOB, APENAS    00065004
//* INFORMAR O GRUPO DBA VIA GENIS.                                     00066004
//*                                                                     00067004
//* AUTOR: JONAS VASSALO - DBA DB2                                      00068005
//* DATA:  14-11-2008                                                   00069005
//* EMAIL: JONAS.VASSALO@T-SYSTEMS.COM.BR                               00069104
//*-------------------------------------------------------------------  00069206
//* ALTERACAO                                                           00069306
//* 15-01-2009 CICERO INCLUIDO NO STEP DE COPY UM MODIFY AGE 10         00069406
//*                                                                     00069506
//*-------------------------------------------------------------------  00069604
//* EXECUTA REXX                                                        00070000
//*-------------------------------------------------------------------  00080000
//RUNEXEC  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXREPLIC'               00090000
//SYSEXEC  DD   DSN=DBA.DB2.REXX,DISP=SHR                               00100000
//SYSPRINT DD   SYSOUT=*                                                00110000
//SYSTSPRT DD   SYSOUT=*                                                00120000
//SYSTSIN  DD   DUMMY                                                   00130000
//INFILE   DD   DISP=OLD,DSN=P.DB2PDPRC.DPROP(0)                        00140005
//OUTFILE  DD   DSN=&&RECIN,DISP=(NEW,PASS,DELETE),                     00150000
//         UNIT=SYSDA,SPACE=(TRK,(100,100)),                            00160001
//         DCB=(LRECL=255,RECFM=FB,BLKSIZE=2550)                        00170000
//*------------------------------------------------------------------   00180000
//* LOAD DE TABELA DE CONTROLE                                          00190000
//*------------------------------------------------------------------   00200000
//LOAD     EXEC PGM=DSNUTILB,PARM='&DSN'                                00210000
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00220000
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00230000
//SYSPRINT DD   SYSOUT=*                                                00240000
//UTPRINT  DD   SYSOUT=*                                                00250000
//SYSUDUMP DD   SYSOUT=*                                                00260000
//SYSMAP   DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                  00270000
//SYSERR   DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                  00280000
//SYSUT1   DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                  00290000
//SORTOUT  DD   UNIT=SYSWDB,SPACE=(CYL,(100,100),RLSE)                  00300000
//SYSREC   DD   DSN=&&RECIN,DISP=OLD                                    00310000
//SYSIN    DD   *                                                       00320000
LOAD DATA INDDN SYSREC   LOG NO  RESUME YES NOCOPYPEND                  00330000
 EBCDIC  CCSID(00037,00000,00000)                                       00340000
 INTO TABLE "DB2ADM"."REPLICATION"                                      00350000
 ( "NMCDTB"                                                             00360000
        POSITION(  00001:00080) CHAR                                    00370001
 , "QTDLINES"                                                           00380000
        POSITION(  00082:00091) INTEGER EXTERNAL                        00390000
 , "DTMES"                                                              00400000
        POSITION(  00093:00102) DATE EXTERNAL                           00410000
 , "HRS"                                                                00420000
        POSITION(  00104:00111) TIME EXTERNAL                           00430000
 )                                                                      00440000
//*------------------------------------------------------------------   00450002
//* COPY E MODIFY AGE                                                   00460006
//*------------------------------------------------------------------   00470002
//COPY     EXEC PGM=DSNUTILB,PARM='&DSN'                                00480002
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00490002
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00500002
//SYSPRINT DD   SYSOUT=*                                                00510002
//UTPRINT  DD   SYSOUT=*                                                00520002
//SYSUDUMP DD   SYSOUT=*                                                00530002
//SYSIN    DD   *                                                       00540002
OPTIONS EVENT(ITEMERROR, SKIP)                                          00550002
LISTDEF DBLIST                                                          00560002
               INCLUDE TABLESPACE DB2ADM.REPLICTI                       00570002
TEMPLATE DDCOPY                                                         00580002
         DSN('DB2PCOPY.FS1.&DB..&TS.(+1)')                              00590002
         UNIT=VSM                                                       00600002
         VOLCNT(255)                                                    00610002
         DISP(NEW,CATLG,DELETE)                                         00620002
         STACK YES                                                      00630002
         GDGLIMIT(10)                                                   00640004
COPY LIST DBLIST                                                        00650002
     SHRLEVEL REFERENCE                                                 00660002
     FULL YES                                                           00670002
     COPYDDN DDCOPY                                                     00680002
                                                                        00681006
MODIFY RECOVERY LIST DBLIST DELETE AGE 10                               00690006
