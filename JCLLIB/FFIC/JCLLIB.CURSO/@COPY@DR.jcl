//IBM1JCFA JOB (T00101,520,AU88100,658,000,581),'DB2 TOOLS',            JOB02912
//         MSGLEVEL=(1,1),MSGCLASS=X,USER=ERSPROD,
//         CLASS=L,NOTIFY=IBM1JCF
/*JOBPARM Z=G,HOLD=ALL,S=ASYS,T=1439
//*
//****************************************************************  **
//ICOPY     EXEC PGM=DSNUTILB,REGION=0M,COND=(4,LT),
//          PARM=('DB2E')
//*         PARM=('DB2E',,'RESTART')
//STEPLIB   DD   DSN=DB2C.DB2LOAD,DISP=SHR
//SYSPRINT  DD   SYSOUT=*
//UTPRINT   DD   SYSOUT=*
//SYSIN    DD  *
 LISTDEF DCBR0PD
    INCLUDE TABLESPACE DMAPAP03.SS3PAP03 PARTLEVEL
  TEMPLATE LCL1
     DSN 'ERPE.&SS..&DB..&TS..P&PART.(+1)'
     UNIT MAGV  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
  TEMPLATE RMT1
     DSN 'ERPX.&SS..&DB..&TS..P&PART.(+1)'
     UNIT OFFS  EXPDL '1999000'
     STACK YES
     DISP (NEW,CATLG,CATLG)
  COPY LIST DCBR0PD COPYDDN (LCL1) RECOVERYDDN(RMT1) SHRLEVEL CHANGE
-------------------------------------------------------------------
 INCLUDE TABLESPACE DMAC1P02.SS1S1P02                                         12
 INCLUDE TABLESPACE DMAC1P02.SS2S1P02                                          1
 INCLUDE TABLESPACE DMAC1P03.SS3S1P03                                         12
 INCLUDE TABLESPACE DMAC1P03.SS4S1P03                                          1
 INCLUDE TABLESPACE DMAC1P04.SS5S1P04                                          1
 INCLUDE TABLESPACE DMAC1P04.SS6S1P04                                          3
 INCLUDE TABLESPACE DMAC1P05.SS7S1P05                                         23
 INCLUDE TABLESPACE DMAC1P05.SS8S1P05                                          3
 INCLUDE TABLESPACE DMAC1P06.SS9S1P06                                          1
 INCLUDE TABLESPACE DMAC1P06.SSAS1P06                                          3
 INCLUDE TABLESPACE DMAC1P07.SSBS1P07                                          1
 INCLUDE TABLESPACE DMAC1P07.SSCS1P07                                          1
 INCLUDE TABLESPACE DMAC1P08.SSDS1P08                                          1
 INCLUDE TABLESPACE DMAC1P08.SSES1P08                                          1
 INCLUDE TABLESPACE DMAC1P09.SSFS1P09                                          4
 INCLUDE TABLESPACE DMAC1P09.SSGS1P09                                          1
 INCLUDE TABLESPACE DMAC1P11.SSJS1P11                                          1
 INCLUDE TABLESPACE DMAC1P11.SSKS1P11                                          1
 INCLUDE TABLESPACE DMAC1P12.SSLS1P12                                          1
 INCLUDE TABLESPACE DMAC1P12.SSMS1P12                                          1
 INCLUDE TABLESPACE DMAC1P13.SSNS1P13                                          1
 INCLUDE TABLESPACE DMAP1P01.SSSS1P01                                         18
 INCLUDE TABLESPACE DMAP1P02.SS1S1P02                                         16
 INCLUDE TABLESPACE DMAP1P02.SS2S1P02                                          3
 INCLUDE TABLESPACE DMAP1P03.SS3S1P03                                         22
 INCLUDE TABLESPACE DMAP1P03.SS4S1P03                                          3
 INCLUDE TABLESPACE DMAP1P04.SS5S1P04                                         43
 INCLUDE TABLESPACE DMAP1P04.SS6S1P04                                         49
 INCLUDE TABLESPACE DMAP1P05.SS7S1P05                                        142
 INCLUDE TABLESPACE DMAP1P05.SS8S1P05                                         41
 INCLUDE TABLESPACE DMAP1P06.SS9S1P06                                          7
 INCLUDE TABLESPACE DMAP1P06.SSAS1P06                                          3
 INCLUDE TABLESPACE DMAP1P07.SSBS1P07                                          3
 INCLUDE TABLESPACE DMAP1P07.SSCS1P07                                          3
 INCLUDE TABLESPACE DMAP1P08.SSDS1P08                                          3
 INCLUDE TABLESPACE DMAP1P08.SSES1P08                                          5
 INCLUDE TABLESPACE DMAP1P09.SSFS1P09                                         36
 INCLUDE TABLESPACE DMAP1P09.SSGS1P09                                          3
 INCLUDE TABLESPACE DMAP1P10.SSHS1P11                                          7
 INCLUDE TABLESPACE DMAP1P10.SSIS1P10                                         14
 INCLUDE TABLESPACE DMAP1P11.SSJS1P11                                          7
 INCLUDE TABLESPACE DMAP1P11.SSKS1P11                                          3
 INCLUDE TABLESPACE DMAP1P12.SSLS1P12                                          3
 INCLUDE TABLESPACE DMAP1P12.SSMS1P12                                          3
 INCLUDE TABLESPACE DMAP1P13.SSNS1P13                                          3
 INCLUDE TABLESPACE DMAR1P00.SCGS1P00                                          1
