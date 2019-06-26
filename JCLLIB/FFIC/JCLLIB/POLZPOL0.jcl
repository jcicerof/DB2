//POLZPOL0 JOB (%POLZPOL0_CCCCRR,110),                             A W
//    USER=DB2TEST                                                      ^0020000
/*JOBPARM SYSAFF=ESYS,Z=6                                               ^0030000
/*ROUTE XEQ D2TBATCH                                                    ^0040000
//*                                                                     ^0050000
//POLPOL0  EXEC DATCIX,
//            OUT1=POLE,                                                ^0070000
//            FUNC=ZPOLIP0,                                             ^0070000
//            LIBPRFX='DB2J.FFIT',                                      ^
//            SUBSYS='DB2J',                                            ^
//            LOADLIB='DB2K',                                           ^
//            CTLMEM=POLZPOL0,                                          ^0080000
//            RETPD=16,                                                 ^0090000
//            UNIT=SYSD@,                                               ^0100000
//            UID='POLZPOL0',                                           ^0110000
//            UTPROC='',                                                ^0120000
//            OCYCLE=%POLZPOL0_CCCCRR
//**                                                                    ^0140000
//** CREATE INHOUSE COPY                                                ^0150000
//**                                                                    ^0160000
//DATDI110.COPYE01 DD DSN=POLE.ZPOL0.A&OCYCLE,                          ^0170000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0220000
//DATDI110.COPYE02 DD DSN=POLE.ZPOL0.B&OCYCLE,                          ^0230000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0280000
//DATDI110.COPYE03 DD DSN=POLE.ZPOL0.C&OCYCLE,                          ^0290000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0340000
//DATDI110.COPYE04 DD DSN=POLE.ZPOL0.D&OCYCLE,                          ^0350000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0400000
//DATDI110.COPYE05 DD DSN=POLE.ZPOL0.E&OCYCLE,                          ^0410000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0460000
//DATDI110.COPYE06 DD DSN=POLE.ZPOL0.F&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE07 DD DSN=POLE.ZPOL0.G&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE08 DD DSN=POLE.ZPOL0.H&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE09 DD DSN=POLE.ZPOL0.I&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE10 DD DSN=POLE.ZPOL0.J&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE11 DD DSN=POLE.ZPOL0.K&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE12 DD DSN=POLE.ZPOL0.L&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE13 DD DSN=POLE.ZPOL0.M&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE14 DD DSN=POLE.ZPOL0.N&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE15 DD DSN=POLE.ZPOL0.O&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE16 DD DSN=POLE.ZPOL0.P&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE17 DD DSN=POLE.ZPOL0.Q&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//DATDI110.COPYE18 DD DSN=POLE.ZPOL0.R&OCYCLE,                          ^0470000
//             DISP=(NEW,CATLG,CATLG),                                  ^0180000
//             DATACLAS=CART1,                                          ^0190000
//             LABEL=RETPD=&RETPD                                       ^0200000
//*                                                                     ^0520000
//**                                                                    ^0580000
//* LAST UPDATE 10/30/00 CCK                                            01320000
