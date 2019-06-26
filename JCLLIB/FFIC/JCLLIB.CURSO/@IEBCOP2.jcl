//IBM1JCF0 JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB01274
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=O,HOLD=ALL,S=ESYS,T=1439
//*------------------------------------------------------------------
//* COPY PDS FILES INTO PDSE
//*------------------------------------------------------------------
//IEBGENER EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  COPY INDD=INFILE,OUTDD=OUTFILE
  SELECT MEMBER=(MEMBER1,MEMBER2)
//INFILE   DD DISP=SHR,DSN=                             <== PDS
//OUTFILE  DD DISP=SHR,DSN=                             <== PDS
