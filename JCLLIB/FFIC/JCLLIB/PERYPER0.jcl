//PERYPER0 JOB (%PERYPER0_CCCCRR,110),                             A W
//    USER=DB2ACPT                                                      ^0020000
/*JOBPARM SYSAFF=ESYS,Z=6                                               ^0020000
/*ROUTE XEQ D2TBATCH                                                    00030000
//*                                                                     ^0040000
//PERYPER0 EXEC DAACIX,
//            OUT1=PERE,                                                ^0060000
//            FUNC=YPER0,                                               ^0060000
//            SUBSYS='DB2J',                                            ^0060000
//            LOADLIB='DB2K',                                           ^0060000
//            LIBPRFX='DB2J.FFIA',                                      ^0060000
//            CTLMEM=PERYPER0,                                          ^0070000
//            RETPD=21,                                                 ^0080000
//            UNIT=SYSD@,                                               ^0090001
//            UID='PERYPER0',                                           ^0100000
//            UTPROC='',                                                ^0110000
//            OCYCLE=%PERYPER0_CCCCRR
//*                                                                     ^0130000
//DAADI110.COPYE01 DD DSN=PERE.YPER0.A&OCYCLE,                          ^0140000
//             DISP=(NEW,CATLG,DELETE),                                 ^0150000
//             LABEL=(01,,RETPD=&RETPD),                                ^0160000
//             VOL=(,RETAIN,,99),                                       ^0170000
//             UNIT=(MAGV,,DEFER)                                       ^0180000
//*                                                                     ^0190000
//DAADI110.COPYE02 DD DSN=PERE.YPER0.B&OCYCLE,                          ^0200000
//             DISP=(NEW,CATLG,DELETE),                                 ^0210000
//             LABEL=(02,,RETPD=&RETPD),                                ^0220000
//             VOL=(,RETAIN,,99,REF=*.COPYE01),                         ^0230000
//             UNIT=AFF=COPYE01                                         ^0240000
//*                                                                     ^0250000
//DAADI110.COPYE03 DD DSN=PERE.YPER0.C&OCYCLE,                          ^0260000
//             DISP=(NEW,CATLG,DELETE),                                 ^0270000
//             LABEL=(03,,RETPD=&RETPD),                                ^0280000
//             VOL=(,RETAIN,,99,REF=*.COPYE02),                         ^0290000
//             UNIT=AFF=COPYE01                                         ^0300000
//*                                                                     ^0310000
//DAADI110.COPYE04 DD DSN=PERE.YPER0.D&OCYCLE,                          ^0320000
//             DISP=(NEW,CATLG,DELETE),                                 ^0330000
//             LABEL=(04,,RETPD=&RETPD),                                ^0340000
//             VOL=(,RETAIN,,99,REF=*.COPYE03),                         ^0350000
//             UNIT=AFF=COPYE01                                         ^0360000
//*                                                                     ^0370000
//DAADI110.COPYE05 DD DSN=PERE.YPER0.E&OCYCLE,                          ^0380000
//             DISP=(NEW,CATLG,DELETE),                                 ^0390000
//             LABEL=(05,,RETPD=&RETPD),                                ^0400000
//             VOL=(,RETAIN,,99,REF=*.COPYE04),                         ^0410000
//             UNIT=AFF=COPYE01                                         ^0420000
//*                                                                     ^0430000
//DAADI110.COPYE06 DD DSN=PERE.YPER0.F&OCYCLE,                          ^0440000
//             DISP=(NEW,CATLG,DELETE),                                 ^0450000
//             LABEL=(06,,RETPD=&RETPD),                                ^0460000
//             VOL=(,RETAIN,,99,REF=*.COPYE05),                         ^0470000
//             UNIT=AFF=COPYE01                                         ^0480000
//*                                                                     ^0490000
//DAADI110.COPYE07 DD DSN=PERE.YPER0.G&OCYCLE,                          ^0500000
//             DISP=(NEW,CATLG,DELETE),                                 ^0510000
//             LABEL=(07,,RETPD=&RETPD),                                ^0520000
//             VOL=(,RETAIN,,99,REF=*.COPYE06),                         ^0530000
//             UNIT=AFF=COPYE01                                         ^0540000
//*                                                                     ^0550000
//DAADI110.COPYE08 DD DSN=PERE.YPER0.H&OCYCLE,                          ^0560000
//             DISP=(NEW,CATLG,DELETE),                                 ^0570000
//             LABEL=(08,,RETPD=&RETPD),                                ^0580000
//             VOL=(,RETAIN,,99,REF=*.COPYE07),                         ^0590000
//             UNIT=AFF=COPYE01                                         ^0600000
//*                                                                     ^0610000
//DAADI110.COPYE09 DD DSN=PERE.YPER0.I&OCYCLE,                          ^0620000
//             DISP=(NEW,CATLG,DELETE),                                 ^0630000
//             LABEL=(09,,RETPD=&RETPD),                                ^0640000
//             VOL=(,RETAIN,,99,REF=*.COPYE08),                         ^0650000
//             UNIT=AFF=COPYE01                                         ^0660000
//*                                                                     ^0670000
//DAADI110.COPYE10 DD DSN=PERE.YPER0.J&OCYCLE,                          ^0680000
//             DISP=(NEW,CATLG,DELETE),                                 ^0690000
//             LABEL=(10,,RETPD=&RETPD),                                ^0700000
//             VOL=(,RETAIN,,99,REF=*.COPYE09),                         ^0710000
//             UNIT=AFF=COPYE01                                         ^0720000
//*                                                                     ^0730000
//DAADI110.COPYE11 DD DSN=PERE.YPER0.K&OCYCLE,                          ^0740000
//             DISP=(NEW,CATLG,DELETE),                                 ^0750000
//             LABEL=(11,,RETPD=&RETPD),                                ^0760000
//             VOL=(,RETAIN,,99,REF=*.COPYE10),                         ^0770000
//             UNIT=AFF=COPYE01                                         ^0780000
//*                                                                     ^0790000
//DAADI110.COPYE12 DD DSN=PERE.YPER0.L&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(12,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE11),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE13 DD DSN=PERE.YPER0.M&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(13,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE12),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE14 DD DSN=PERE.YPER0.N&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(14,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE13),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE15 DD DSN=PERE.YPER0.O&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(15,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE14),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE16 DD DSN=PERE.YPER0.P&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(16,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE15),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE17 DD DSN=PERE.YPER0.Q&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(17,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE16),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE18 DD DSN=PERE.YPER0.R&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(18,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE17),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE19 DD DSN=PERE.YPER0.S&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(19,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE18),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^0790000
//DAADI110.COPYE20 DD DSN=PERE.YPER0.T&OCYCLE,                          ^0800000
//             DISP=(NEW,CATLG,DELETE),                                 ^0810000
//             LABEL=(20,,RETPD=&RETPD),                                ^0820000
//             VOL=(,RETAIN,,99,REF=*.COPYE19),                         ^0830000
//             UNIT=AFF=COPYE01                                         ^0840000
//*                                                                     ^
//DAADI110.COPYE21 DD DSN=PERE.YPER0.U&OCYCLE,                          ^
//             DISP=(NEW,CATLG,DELETE),                                 ^
//             LABEL=(21,,RETPD=&RETPD),                                ^
//             VOL=(,RETAIN,,99,REF=*.COPYE20),                         ^
//             UNIT=AFF=COPYE01                                         ^
//*                                                                     ^
//DAADI110.COPYE22 DD DSN=PERE.YPER0.V&OCYCLE,                          ^
//             DISP=(NEW,CATLG,DELETE),                                 ^
//             LABEL=(22,,RETPD=&RETPD),                                ^
//             VOL=(,RETAIN,,99,REF=*.COPYE21),                         ^
//             UNIT=AFF=COPYE01                                         ^
//*                                                                     ^
//DAADI110.COPYE23 DD DSN=PERE.YPER0.W&OCYCLE,                          ^
//             DISP=(NEW,CATLG,DELETE),                                 ^
//             LABEL=(23,,RETPD=&RETPD),                                ^
//             VOL=(,RETAIN,,99,REF=*.COPYE22),                         ^
//             UNIT=AFF=COPYE01                                         ^
//*                                                                     ^
//DAADI110.COPYE24 DD DSN=PERE.YPER0.X&OCYCLE,                          ^
//             DISP=(NEW,CATLG,DELETE),                                 ^
//             LABEL=(24,,RETPD=&RETPD),                                ^
//             VOL=(,RETAIN,,99,REF=*.COPYE23),                         ^
//             UNIT=AFF=COPYE01                                         ^
//*                                                                     ^
//DAADI110.COPYE25 DD DSN=PERE.YPER0.Y&OCYCLE,                          ^
//             DISP=(NEW,CATLG,DELETE),                                 ^
//             LABEL=(25,,RETPD=&RETPD),                                ^
//             VOL=(,RETAIN,,99,REF=*.COPYE24),                         ^
//             UNIT=AFF=COPYE01                                         ^
//*                                                                     ^
//DAADI110.COPYE26 DD DSN=PERE.YPER0.Z&OCYCLE,                          ^
//             DISP=(NEW,CATLG,DELETE),                                 ^
//             LABEL=(26,,RETPD=&RETPD),                                ^
//             VOL=(,,,99,REF=*.COPYE25),                               ^
//             UNIT=AFF=COPYE01                                         ^
//**                                                                    ^
//*                                                                     ^
//*                                                                     ^0970000
//* LAST UPDATE 06/06/03 BILL DUNKERLY                                  00980000
