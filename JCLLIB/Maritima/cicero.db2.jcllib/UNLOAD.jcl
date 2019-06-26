//DB@UNLOA JOB 'CICERO,DBA(R:5093)',MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID   00010020
//*------------------------------------------------------------------   00021007
//* UNLOAD                                                              00022007
//*------------------------------------------------------------------   00023007
//         SET  DSN=DB2P                                                00024020
//*                                                                     00025019
//UNLOAD   EXEC PGM=DSNUTILB,PARM='&DSN'                                00031019
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                         00040020
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                         00050019
//SYSPRINT DD   SYSOUT=*                                                00060001
//SYSOUT   DD   SYSOUT=*                                                00070001
//SYSPUNCH DD   DSN=CICERO.UNL.DB2ADM.RPTMVIEW.PUNCH,                   00073123
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,SPACE=(TRK,(1,1))         00073223
//SYSREC   DD   DSN=CICERO.UNL.DB2ADM.RPTMVIEW.REC,                     00073323
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDBA,SPACE=(TRK,(4000,1000))  00073423
//SYSIN    DD   *                                                       00073807
  UNLOAD TABLESPACE DB2ADM.RPTMVIEW                                     00078023
    ASCII DELIMITED COLDEL ','                                          00078123
    FROM TABLE DB2ADM.RPTMVIEW HEADER NONE                              00078223
    SHRLEVEL CHANGE ISOLATION UR                                        00079023
