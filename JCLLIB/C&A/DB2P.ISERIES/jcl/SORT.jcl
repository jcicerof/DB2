//SDB801EO  JOB ,'CICERO',CLASS=S,MSGCLASS=X,NOTIFY=&SYSUID
//*--------------------------------------------------------------------
//* CLASSIFICA ARQUIVO C/ AS TRANSACOES CICS (FONTE: OSI)
//*--------------------------------------------------------------------
//SORT   EXEC  PGM=ICEMAN
//SORTLIB  DD  DSN=SYS1.SORTLIB,DISP=SHR
//SYSOUT   DD  SYSOUT=*
//SORTIN   DD  DISP=SHR,DSN=DB2P.ISERIES.GERACAO.LOAD.CMD
//SORTOUT  DD  DISP=(NEW,CATLG,DELETE),
//         SPACE=(TRK,(100,10),RLSE),
//         DSN=DB2P.ISERIES.GERACAO.LOAD.VERIFY
//SORTWK01 DD    UNIT=SYSDA,SPACE=(TRK,(3000,500))
//SYSIN    DD    *
 SORT     FIELDS=(21,40,CH,A)
 INCLUDE  COND=(21,4,CH,EQ,C'-SDB')
 //
           AND,(40,8,CH,EQ,C'COPY',OR,
                40,8,CH,EQ,C'DSN1COPY'))
//
/*EOF
 SORT     FIELDS=(20,40,CH,A)
 INCLUDE  COND=(20,4,CH,EQ,C'-SDB')
