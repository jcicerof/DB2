//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB01274
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//* COPY PDS FILES INTO PDSE
//*-------------------------------------------------------------------*
//* OLIMPIO SHIGUEYUKI HIGAWA: USE PARM=UNPACK PARA UNPACK
//*-------------------------------------------------------------------*
//STEP0000 EXEC PGM=TRSMAIN,PARM=PACK
//SYSPRINT DD   SYSOUT=*
//INFILE   DD   DISP=OLD,DSN=STORAGE.IBM1OSH.CNTL
//OUTFILE  DD   DSN=IBM1OSH.STORAGE.IBM1OSH.CNTL.V1PACK,
//            DISP=(,CATLG,DELETE),
//            UNIT=SYSDA,STORCLAS=STANDARD,MGMTCLAS=IBM1,
//            SPACE=(CYL,(150,50),RLSE)
