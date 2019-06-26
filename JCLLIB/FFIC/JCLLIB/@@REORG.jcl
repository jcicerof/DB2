//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',
//         MSGLEVEL=(1,1),MSGCLASS=X,
//         CLASS=L,NOTIFY=IBMJCFF
/*JOBPARM Z=O,HOLD=ALL,S=ASYS,T=1439
//*
//*--------------------------------------------------------------------
//*
//*--------------------------------------------------------------------
//REORG  EXEC DSNUPROC,SYSTEM=DB2Q,
//             LIB='DB2C.DB2LOAD',
//             UID=''
//DSNUPROC.SYSDISC DD UNIT=SYSDA,SPACE=(CYL,(1200,900),RLSE)
//DSNUPROC.SYSUT1  DD UNIT=SYSDA,SPACE=(CYL,(1200,900),RLSE)
//DSNUPROC.SORTOUT DD UNIT=SYSDA,SPACE=(CYL,(1200,900),RLSE)
//DSNUPROC.SYSMAP  DD UNIT=SYSDA,SPACE=(CYL,(1200,900),RLSE)
//DSNUPROC.SYSERR  DD UNIT=SYSDA,SPACE=(CYL,(1200,900),RLSE)
//DSNUPROC.SW01WK01 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW01WK02 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW01WK03 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW01WK04 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW02WK01 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW02WK02 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW02WK03 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW02WK04 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW03WK01 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW03WK02 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW03WK03 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW03WK04 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW04WK01 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW04WK02 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW04WK03 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SW04WK04 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SORTWK01 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SORTWK02 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SORTWK03 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SORTWK04 DD UNIT=(SYSDA,20),SPACE=(CYL,(900,200),,,ROUND)
//DSNUPROC.SYSIN DD *
  LISTDEF LISTDB  INCLUDE TABLESPACE DCDI0P07.SADS0P07
                  INCLUDE TABLESPACE DCDI0P07.SAGS0P07
                  INCLUDE TABLESPACE DCDI0P07.SARS0P07
                  INCLUDE TABLESPACE DCDI0P07.SASS0P07
                  INCLUDE TABLESPACE DCDI0P07.SBRS0P07
                  INCLUDE TABLESPACE DCDI0P07.SCAS0P07
                  INCLUDE TABLESPACE DCDI0P07.SCDS0PA7
                  INCLUDE TABLESPACE DCDI0P07.SCMS0P07
                  INCLUDE TABLESPACE DCDI0P07.SCPS0P07
                  INCLUDE TABLESPACE DCDI0P07.SCRS0P07
                  INCLUDE TABLESPACE DCDI0P07.SELS0P07
                  INCLUDE TABLESPACE DCDI0P07.SMSS0P07
                  INCLUDE TABLESPACE DCDI0P07.SNAS0P07
                  INCLUDE TABLESPACE DCDI0P07.SNBS0P07
                  INCLUDE TABLESPACE DCDI0P07.SNNS0P07
                  INCLUDE TABLESPACE DCDI0P07.SNPS0P07
                  INCLUDE TABLESPACE DCDI0P07.SNTS0P07
                  INCLUDE TABLESPACE DCDI0P07.SPIS0P07
                  INCLUDE TABLESPACE DCDI0P07.SPSS0P07
                  INCLUDE TABLESPACE DCDI0P07.SRDS0P07
                  INCLUDE TABLESPACE DCDI0P07.SRPS0P07
                  INCLUDE TABLESPACE DCDI0P07.SRRS0P07
                  INCLUDE TABLESPACE DCDI0P07.STIS0P07

  TEMPLATE DDPUNCH
     DSN 'DBA5.DB2.PUN.&DB..&TS..D&DATE.'
     UNIT SYSDA SPACE (1,1) TRK
     DISP (NEW,CATLG,DELETE)

  TEMPLATE DDREC
     DSN 'DBA5.DB2.UNL.&DB..&TS..D&DATE.'
     UNIT MAGV  RETPD 7
     STACK YES
     DISP (NEW,DELETE,CATLG)

  TEMPLATE DDCOPY1
     DSN 'DBA5.DB2.IC1.&DB..&TS..D&PART.'
     UNIT MAGV  RETPD 7
     STACK YES
     DISP (NEW,CATLG,DELETE)

  REORG TABLESPACE LIST LISTDB
    LOG NO
    SORTDATA
    SORTDEVT SYSDA
    SORTNUM 4
    SHRLEVEL REFERENCE
    UNLDDN(DDREC)
    PUNCHDDN(DDPUNCH)
    COPYDDN(DDCOPY1)
    FASTSWITCH NO
    STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL KEYCARD