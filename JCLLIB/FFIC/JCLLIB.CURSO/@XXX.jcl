//IBM1JCF1 JOB (T00101,610,Z000900,000,A11,000),'DSNTEP2  *',           JOB11116
//         NOTIFY=IBM1JCF,CLASS=O
/*JOBPARM  L=99,S=ESYS,H=ALL,FORMS=STD,TIME=(1439),Z=O
//*
//*------------------------------------------------------------------
//* COPY
//*------------------------------------------------------------------
//COPY     EXEC PGM=DSNUTILB,PARM='DB2J',REGION=0K
//STEPLIB  DD   DISP=SHR,DSN=DB2K.DB2EXIT
//         DD   DISP=SHR,DSN=DB2K.DB2LOAD
//SYSPRINT DD   SYSOUT=*
//UTPRINT  DD   SYSOUT=*
//SYSUDUMP DD   SYSOUT=*
//SYSIN    DD   *
OPTIONS EVENT(ITEMERROR, SKIP)
LISTDEF DBLIST
               INCLUDE TABLESPACE DDBA0T00.HSTVSAM

TEMPLATE DDCOPY
         DSN('DBA5.IC0.&DB..&TS..D&DT.')
         UNIT MAGV
         VOLCNT(255)
         DISP(NEW,CATLG,DELETE)
         STACK YES
         RETPD 180

COPY LIST DBLIST
     SHRLEVEL REFERENCE
     FULL YES
     COPYDDN DDCOPY
     CHECKPAGE

MODIFY RECOVERY LIST DBLIST DELETE AGE 180                              00060003
