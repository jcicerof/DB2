//PMXZCLI1 JOB (%PMXZCLI1_CCCCRR,110),                             A W
//    USER=DB2TEST                                                      ^
/*JOBPARM SYSAFF=ESYS,Z=6                                               ^
/*ROUTE XEQ D2TBATCH                                                    ^0040003
//*                                                                     ^0040003
//*******************************************************************   ^0040003
//* NOTE: 2-BYTE IMAGE COPY DATASET IDENTIFIERS (CORREPONDING TO TABLE- ^0040003
//*       SPACE) ARE NOT IN PURE SEQUENCE (E.G., AA, AB, AC, ETC.)      ^0040003
//*       BELOW.  BACKUPS ARE BEING DONE IN DATABASE ORDER.  TABLE-     ^0040003
//*       SPACES WERE ASSIGNED TO DATABASES BASED ON FACTORS SUCH AS    ^
//*       SIZE AND RECOVERY STRATEGY.                                   ^0040003
//*******************************************************************   ^0040003
//* NOTE: BOTH VENDOR AND FFIC DESIGNED TABLES FOR CLIENT ARE IN THE    ^0040003
//*       THE 'CLI' DATABASES AND STOGROUPS, TO AID RECOVERY.  THE      ^0040003
//*       'DB2J.FFIT.DDLTABLE' DEFINITIONS BEGINNING WITH 'CLI' AND     ^0040003
//*       'CLF' ARE BACKED UP BELOW.                                    ^
//*******************************************************************   ^0040003
//*                                                                     ^0040003
//PMXZCLI1 EXEC DATCIX,
//            OUT1=PMXE,                                                ^0060003
//            FUNC=ZCLI,                                                ^0060003
//            SUBSYS='DB2J',                                            ^0060003
//            LOADLIB='DB2K',                                           ^0060003
//            LIBPRFX='DB2J.FFIT',                                      ^0060003
//            CTLMEM=PMXZCLI1,                                          ^0070003
//            RETPD=21,                                                 ^0080003
//            UNIT=SYSD@,                                               ^0090003
//            UID='PMXZCLI1',                                           ^0100003
//            UTPROC='',                                                ^0110003
//            OCYCLE=%PMXZCLI1_CCCCRR
//*                                                                     ^0130003
//*                                                                     ^0130003
//*                                                                     ^0130003
//*-------------------------------------------------------------------  ^0130003
//* DATABASE DCLI0T00                                                   ^0130003
//*-------------------------------------------------------------------  ^0130003
//DATDI110.COPYEA DD DSN=PMXE.ZCLI1.EA&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=(MAGV,,DEFER),                                       ^
//            LABEL=(001,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99)                                         ^
//*                                                                     ^0190003
//DATDI110.COPYEB DD DSN=PMXE.ZCLI1.EB&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(002,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEA)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEC DD DSN=PMXE.ZCLI1.EC&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(003,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEB)                            ^
//*                                                                     ^0190003
//DATDI110.COPYED DD DSN=PMXE.ZCLI1.ED&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(004,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEC)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEE DD DSN=PMXE.ZCLI1.EE&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(005,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYED)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEF DD DSN=PMXE.ZCLI1.EF&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(006,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEE)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEG DD DSN=PMXE.ZCLI1.EG&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(007,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEF)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEH DD DSN=PMXE.ZCLI1.EH&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(008,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEG)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEI DD DSN=PMXE.ZCLI1.EI&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(009,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEH)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEK DD DSN=PMXE.ZCLI1.EK&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(010,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEI)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEO DD DSN=PMXE.ZCLI1.EO&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(011,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEK)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEP DD DSN=PMXE.ZCLI1.EP&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(012,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEO)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEV DD DSN=PMXE.ZCLI1.EV&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(013,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEP)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEW DD DSN=PMXE.ZCLI1.EW&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(014,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEV)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEZ DD DSN=PMXE.ZCLI1.EZ&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(015,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEW)                            ^
//*                                                                     ^0190003
//*-------------------------------------------------------------------  ^0130003
//* DATABASE DCLI0T01                                                   ^0130003
//*-------------------------------------------------------------------  ^0130003
//DATDI110.COPYEJ DD DSN=PMXE.ZCLI1.EJ&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(016,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEZ)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEL DD DSN=PMXE.ZCLI1.EL&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(017,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEJ)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEM DD DSN=PMXE.ZCLI1.EM&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(018,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEL)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEN DD DSN=PMXE.ZCLI1.EN&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(019,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEM)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEQ DD DSN=PMXE.ZCLI1.EQ&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(020,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEN)                            ^
//*                                                                     ^0190003
//DATDI110.COPYER DD DSN=PMXE.ZCLI1.ER&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(021,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEQ)                            ^
//*                                                                     ^0190003
//DATDI110.COPYES DD DSN=PMXE.ZCLI1.ES&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(022,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYER)                            ^
//*                                                                     ^0190003
//DATDI110.COPYET DD DSN=PMXE.ZCLI1.ET&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(023,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYES)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEU DD DSN=PMXE.ZCLI1.EU&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(024,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYET)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEX DD DSN=PMXE.ZCLI1.EX&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(025,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEU)                            ^
//*                                                                     ^0190003
//DATDI110.COPYEY DD DSN=PMXE.ZCLI1.EY&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(026,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEX)                            ^
//*                                                                     ^0190003
//DATDI110.COPYFA DD DSN=PMXE.ZCLI1.FA&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(027,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYEY)                            ^
//*                                                                     ^0190003
//DATDI110.COPYFB DD DSN=PMXE.ZCLI1.FB&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(028,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYFA)                            ^
//*                                                                     ^0190003
//DATDI110.COPYFC DD DSN=PMXE.ZCLI1.FC&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(029,,RETPD=&RETPD),                                ^
//            VOL=(,RETAIN,,99,REF=*.COPYFB)                            ^
//*                                                                     ^0190003
//*-------------------------------------------------------------------  ^0130003
//* DATABASE DCLI0T00                                                   ^0130003
//*-------------------------------------------------------------------  ^0130003
//DATDI110.COPYPT DD DSN=PMXE.ZCLI1.PT&OCYCLE,                          ^0140003
//            DISP=(NEW,CATLG,DELETE),                                  ^
//            UNIT=AFF=COPYEA,                                          ^
//            LABEL=(030,,RETPD=&RETPD),                                ^
//            VOL=(,,,99,REF=*.COPYFC)                                  ^
//*                                                                     ^0190003
//*  LAST UPDATE 01/22/97  (SIMS)
