//IBM1JCFA JOB (T00101,520,AU88100,658,A28,083),'DB2 DBA TOOL',         JOB13169
//*      RESTART=STEPNAME, <== FOR RESTART REMOVE * AND ENTER STEP NAME
//         NOTIFY=IBM1JFC,MSGLEVEL=(1,1),MSGCLASS=X,USER=DB2ACPT,
//         CLASS=L
//*
/*JOBPARM L=99,Z=O,HOLD=ALL,SYSAFF=ESYS,U=0,TIME=1439
//*
//JOBLIB DD DISP=SHR,DSN=DB2K.DB2LOAD
//*
//DSN1CO01 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER1.A113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SAPS0A00.I0001.A001
//SYSXLAT DD *
407,407
207,207
218,10
/*
//*
//DSN1CO02 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER1.B113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SATS0A00.I0001.A001
//SYSXLAT DD *
407,407
205,205
217,17
/*
//*
//DSN1CO03 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.U113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SCAS0A00.I0001.A001
//SYSXLAT DD *
407,407
164,164
177,26
/*
//*
//DSN1CO05 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.N113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SCXS0A00.I0001.A001
//SYSXLAT DD *
407,407
110,110
111,37
/*
//*
//DSN1CO06 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.B113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SCVS0A00.I0001.A001
//SYSXLAT DD *
407,407
9,9
86,34
/*
//*
//DSN1CO07 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.P113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SENS0A00.I0001.A001
//SYSXLAT DD *
407,407
130,130
133,46
/*
//*
//DSN1CO08 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER1.D113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SFFS0A00.I0001.A001
//SYSXLAT DD *
407,407
201,201
229,51
/*
//*
//DSN1CO09 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.E113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SIPS0A00.I0001.A001
//SYSXLAT DD *
407,407
24,24
85,73
/*
//*
//DSN1CO10 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.C113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SIAS0A00.I0001.A001
//SYSXLAT DD *
407,407
14,14
83,56
/*
//*
//DSN1CO11 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.Q113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SIDS0A00.I0001.A001
//SYSXLAT DD *
407,407
128,128
136,61
/*
//*
//DSN1CO12 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.D113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SINS0A00.I0001.A001
//SYSXLAT DD *
407,407
19,19
82,68
/*
//*
//DSN1CO13 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.A113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SCLS0A00.I0001.A001
//SYSXLAT DD *
407,407
2,2
81,29
/*
//*
//DSN1CO14 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.F113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SNTS0A00.I0001.A001
//SYSXLAT DD *
407,407
44,44
80,113
/*
//*
//DSN1CO15 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.G113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SOPS0A00.I0001.A001
//SYSXLAT DD *
407,407
49,49
227,132
/*
//*
//DSN1CO16 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.Y113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SLKS0A00.I0001.A001
//SYSXLAT DD *
407,407
155,155
169,76
/*
//*
//DSN1CO17 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.H113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SPMS0A00.I0001.A001
//SYSXLAT DD *
407,407
54,54
78,146
/*
//*
//DSN1CO18 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER1.G113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SPIS0A00.I0001.A001
//SYSXLAT DD *
407,407
167,167
226,139
/*
//*
//DSN1CO19 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER1.E113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SNFS0A00.I0001.A001
//SYSXLAT DD *
407,407
199,199
212,97
/*
//*
//DSN1CO20 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.J112001
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.STRS0A00.I0001.A001
//SYSXLAT DD *
407,407
64,64
209,173
/*
//*
//DSN1CO21 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER1.I113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.STMS0A00.I0001.A001
//SYSXLAT DD *
407,407
92,92
210,166
/*
//*
//DSN1CO22 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.R113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SUWS0A00.I0001.A001
//SYSXLAT DD *
407,407
126,126
131,186
/*
//*
//DSN1CO23 EXEC PGM=DSN1COPY,PARM='FULLCOPY,OBIDXLAT,RESET'
//SYSPRINT DD SYSOUT=A
//SYSUT1 DD DISP=SHR,DSN=PERE.YPER0.I113401
//SYSUT2 DD DISP=SHR,DSN=PERDA.DSNDBC.DPER0A00.SPOS0A00.I0001.A001
//SYSXLAT DD *
407,407
59,59
6,149
/*
