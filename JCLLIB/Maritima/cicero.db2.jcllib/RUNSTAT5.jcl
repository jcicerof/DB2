//DB@2ADM  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DB2ADM  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DB2ADM  
//         SET DSN=DB2P                                                 DB2ADM  
//DB2ADM   EXEC PROC=RUNSTATS,DSN=&DSN                                  DB2ADM  
//SYSIN    DD   *                                                       DB2ADM  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DB2ADM                     DB2ADM  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DB2ADM  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DB2ADM  
//*                                                                     DB2ADM  
//DB@AD01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBAD01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBAD01  
//         SET DSN=DB2P                                                 DBAD01  
//DBAD01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBAD01  
//SYSIN    DD   *                                                       DBAD01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBAD01                     DBAD01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBAD01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBAD01  
//*                                                                     DBAD01  
//DB@AJAI  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBAJAIR 
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBAJAIR 
//         SET DSN=DB2P                                                 DBAJAIR 
//DBAJAIR   EXEC PROC=RUNSTATS,DSN=&DSN                                 DBAJAIR 
//SYSIN    DD   *                                                       DBAJAIR 
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBAJAIR                    DBAJAIR 
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBAJAIR 
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBAJAIR 
//*                                                                     DBAJAIR 
//DB@CO01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBCO01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBCO01  
//         SET DSN=DB2P                                                 DBCO01  
//DBCO01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBCO01  
//SYSIN    DD   *                                                       DBCO01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBCO01                     DBCO01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBCO01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBCO01  
//*                                                                     DBCO01  
//DB@ECCO  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBECCOX 
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBECCOX 
//         SET DSN=DB2P                                                 DBECCOX 
//DBECCOX   EXEC PROC=RUNSTATS,DSN=&DSN                                 DBECCOX 
//SYSIN    DD   *                                                       DBECCOX 
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBECCOX                    DBECCOX 
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBECCOX 
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBECCOX 
//*                                                                     DBECCOX 
//DB@EEAC  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEAC  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEAC  
//         SET DSN=DB2P                                                 DBEEAC  
//DBEEAC   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEAC  
//SYSIN    DD   *                                                       DBEEAC  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEAC                     DBEEAC  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEAC  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEAC  
//*                                                                     DBEEAC  
//DB@EEAE  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEAE  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEAE  
//         SET DSN=DB2P                                                 DBEEAE  
//DBEEAE   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEAE  
//SYSIN    DD   *                                                       DBEEAE  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEAE                     DBEEAE  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEAE  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEAE  
//*                                                                     DBEEAE  
//DB@EEAL  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEAL  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEAL  
//         SET DSN=DB2P                                                 DBEEAL  
//DBEEAL   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEAL  
//SYSIN    DD   *                                                       DBEEAL  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEAL                     DBEEAL  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEAL  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEAL  
//*                                                                     DBEEAL  
//DB@EEBM  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEBM  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEBM  
//         SET DSN=DB2P                                                 DBEEBM  
//DBEEBM   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEBM  
//SYSIN    DD   *                                                       DBEEBM  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEBM                     DBEEBM  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEBM  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEBM  
//*                                                                     DBEEBM  
//DB@EEGD  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEGD  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEGD  
//         SET DSN=DB2P                                                 DBEEGD  
//DBEEGD   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEGD  
//SYSIN    DD   *                                                       DBEEGD  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEGD                     DBEEGD  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEGD  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEGD  
//*                                                                     DBEEGD  
//DB@EELO  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEELO  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEELO  
//         SET DSN=DB2P                                                 DBEELO  
//DBEELO   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEELO  
//SYSIN    DD   *                                                       DBEELO  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEELO                     DBEELO  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEELO  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEELO  
//*                                                                     DBEELO  
//DB@EEOR  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEOR  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEOR  
//         SET DSN=DB2P                                                 DBEEOR  
//DBEEOR   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEOR  
//SYSIN    DD   *                                                       DBEEOR  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEOR                     DBEEOR  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEOR  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEOR  
//*                                                                     DBEEOR  
//DB@EEPE  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEPE  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEPE  
//         SET DSN=DB2P                                                 DBEEPE  
//DBEEPE   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEPE  
//SYSIN    DD   *                                                       DBEEPE  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEPE                     DBEEPE  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEPE  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEPE  
//*                                                                     DBEEPE  
//DB@EEPR  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEPR  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEPR  
//         SET DSN=DB2P                                                 DBEEPR  
//DBEEPR   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEPR  
//SYSIN    DD   *                                                       DBEEPR  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEPR                     DBEEPR  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEPR  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEPR  
//*                                                                     DBEEPR  
//DB@EESP  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEESP  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEESP  
//         SET DSN=DB2P                                                 DBEESP  
//DBEESP   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEESP  
//SYSIN    DD   *                                                       DBEESP  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEESP                     DBEESP  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEESP  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEESP  
//*                                                                     DBEESP  
//DB@EESR  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEESR  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEESR  
//         SET DSN=DB2P                                                 DBEESR  
//DBEESR   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEESR  
//SYSIN    DD   *                                                       DBEESR  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEESR                     DBEESR  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEESR  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEESR  
//*                                                                     DBEESR  
//DB@EETA  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEETA  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEETA  
//         SET DSN=DB2P                                                 DBEETA  
//DBEETA   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEETA  
//SYSIN    DD   *                                                       DBEETA  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEETA                     DBEETA  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEETA  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEETA  
//*                                                                     DBEETA  
//DB@EEVT  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBEEVT  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBEEVT  
//         SET DSN=DB2P                                                 DBEEVT  
//DBEEVT   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBEEVT  
//SYSIN    DD   *                                                       DBEEVT  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBEEVT                     DBEEVT  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBEEVT  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBEEVT  
//*                                                                     DBEEVT  
//DB@ER01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBER01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBER01  
//         SET DSN=DB2P                                                 DBER01  
//DBER01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBER01  
//SYSIN    DD   *                                                       DBER01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBER01                     DBER01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBER01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBER01  
//*                                                                     DBER01  
//DB@INFO  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBINFOR 
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBINFOR 
//         SET DSN=DB2P                                                 DBINFOR 
//DBINFOR   EXEC PROC=RUNSTATS,DSN=&DSN                                 DBINFOR 
//SYSIN    DD   *                                                       DBINFOR 
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBINFOR                    DBINFOR 
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBINFOR 
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBINFOR 
//*                                                                     DBINFOR 
//DB@KIT1  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBKIT1  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBKIT1  
//         SET DSN=DB2P                                                 DBKIT1  
//DBKIT1   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBKIT1  
//SYSIN    DD   *                                                       DBKIT1  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBKIT1                     DBKIT1  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBKIT1  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBKIT1  
//*                                                                     DBKIT1  
//DB@LG01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBLG01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBLG01  
//         SET DSN=DB2P                                                 DBLG01  
//DBLG01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBLG01  
//SYSIN    DD   *                                                       DBLG01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBLG01                     DBLG01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBLG01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBLG01  
//*                                                                     DBLG01  
//DB@MA01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMA01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMA01  
//         SET DSN=DB2P                                                 DBMA01  
//DBMA01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMA01  
//SYSIN    DD   *                                                       DBMA01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMA01                     DBMA01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMA01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMA01  
//*                                                                     DBMA01  
//DB@MA02  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMA02  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMA02  
//         SET DSN=DB2P                                                 DBMA02  
//DBMA02   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMA02  
//SYSIN    DD   *                                                       DBMA02  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMA02                     DBMA02  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMA02  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMA02  
//*                                                                     DBMA02  
//DB@MA03  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMA03  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMA03  
//         SET DSN=DB2P                                                 DBMA03  
//DBMA03   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMA03  
//SYSIN    DD   *                                                       DBMA03  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMA03                     DBMA03  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMA03  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMA03  
//*                                                                     DBMA03  
//DB@MO01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMO01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMO01  
//         SET DSN=DB2P                                                 DBMO01  
//DBMO01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMO01  
//SYSIN    DD   *                                                       DBMO01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMO01                     DBMO01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMO01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMO01  
//*                                                                     DBMO01  
//DB@MP01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMP01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMP01  
//         SET DSN=DB2P                                                 DBMP01  
//DBMP01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMP01  
//SYSIN    DD   *                                                       DBMP01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMP01                     DBMP01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMP01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMP01  
//*                                                                     DBMP01  
//DB@MP02  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMP02  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMP02  
//         SET DSN=DB2P                                                 DBMP02  
//DBMP02   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMP02  
//SYSIN    DD   *                                                       DBMP02  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMP02                     DBMP02  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMP02  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMP02  
//*                                                                     DBMP02  
//DB@MT01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBMT01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBMT01  
//         SET DSN=DB2P                                                 DBMT01  
//DBMT01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBMT01  
//SYSIN    DD   *                                                       DBMT01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBMT01                     DBMT01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBMT01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBMT01  
//*                                                                     DBMT01  
//DB@NA01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBNA01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBNA01  
//         SET DSN=DB2P                                                 DBNA01  
//DBNA01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBNA01  
//SYSIN    DD   *                                                       DBNA01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBNA01                     DBNA01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBNA01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBNA01  
//*                                                                     DBNA01  
//DB@NOVA  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBNOVA  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBNOVA  
//         SET DSN=DB2P                                                 DBNOVA  
//DBNOVA   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBNOVA  
//SYSIN    DD   *                                                       DBNOVA  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBNOVA                     DBNOVA  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBNOVA  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBNOVA  
//*                                                                     DBNOVA  
//DB@POLE  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBPOLEN 
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBPOLEN 
//         SET DSN=DB2P                                                 DBPOLEN 
//DBPOLEN   EXEC PROC=RUNSTATS,DSN=&DSN                                 DBPOLEN 
//SYSIN    DD   *                                                       DBPOLEN 
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBPOLEN                    DBPOLEN 
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBPOLEN 
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBPOLEN 
//*                                                                     DBPOLEN 
//DB@RE01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE01  
//         SET DSN=DB2P                                                 DBRE01  
//DBRE01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE01  
//SYSIN    DD   *                                                       DBRE01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE01                     DBRE01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE01  
//*                                                                     DBRE01  
//DB@RE02  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE02  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE02  
//         SET DSN=DB2P                                                 DBRE02  
//DBRE02   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE02  
//SYSIN    DD   *                                                       DBRE02  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE02                     DBRE02  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE02  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE02  
//*                                                                     DBRE02  
//DB@RE03  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE03  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE03  
//         SET DSN=DB2P                                                 DBRE03  
//DBRE03   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE03  
//SYSIN    DD   *                                                       DBRE03  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE03                     DBRE03  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE03  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE03  
//*                                                                     DBRE03  
//DB@RE04  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE04  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE04  
//         SET DSN=DB2P                                                 DBRE04  
//DBRE04   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE04  
//SYSIN    DD   *                                                       DBRE04  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE04                     DBRE04  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE04  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE04  
//*                                                                     DBRE04  
//DB@RE05  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE05  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE05  
//         SET DSN=DB2P                                                 DBRE05  
//DBRE05   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE05  
//SYSIN    DD   *                                                       DBRE05  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE05                     DBRE05  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE05  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE05  
//*                                                                     DBRE05  
//DB@RE06  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE06  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE06  
//         SET DSN=DB2P                                                 DBRE06  
//DBRE06   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE06  
//SYSIN    DD   *                                                       DBRE06  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE06                     DBRE06  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE06  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE06  
//*                                                                     DBRE06  
//DB@RE99  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRE99  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRE99  
//         SET DSN=DB2P                                                 DBRE99  
//DBRE99   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRE99  
//SYSIN    DD   *                                                       DBRE99  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRE99                     DBRE99  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRE99  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRE99  
//*                                                                     DBRE99  
//DB@RS01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBRS01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBRS01  
//         SET DSN=DB2P                                                 DBRS01  
//DBRS01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBRS01  
//SYSIN    DD   *                                                       DBRS01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBRS01                     DBRS01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBRS01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBRS01  
//*                                                                     DBRS01  
//DB@SMLA  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBSMLA  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBSMLA  
//         SET DSN=DB2P                                                 DBSMLA  
//DBSMLA   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBSMLA  
//SYSIN    DD   *                                                       DBSMLA  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBSMLA                     DBSMLA  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBSMLA  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBSMLA  
//*                                                                     DBSMLA  
//DB@SS01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBSS01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBSS01  
//         SET DSN=DB2P                                                 DBSS01  
//DBSS01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBSS01  
//SYSIN    DD   *                                                       DBSS01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBSS01                     DBSS01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBSS01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBSS01  
//*                                                                     DBSS01  
//DB@SS02  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBSS02  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBSS02  
//         SET DSN=DB2P                                                 DBSS02  
//DBSS02   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBSS02  
//SYSIN    DD   *                                                       DBSS02  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBSS02                     DBSS02  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBSS02  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBSS02  
//*                                                                     DBSS02  
//DB@SS03  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBSS03  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBSS03  
//         SET DSN=DB2P                                                 DBSS03  
//DBSS03   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBSS03  
//SYSIN    DD   *                                                       DBSS03  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBSS03                     DBSS03  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBSS03  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBSS03  
//*                                                                     DBSS03  
//DB@SS04  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBSS04  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBSS04  
//         SET DSN=DB2P                                                 DBSS04  
//DBSS04   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBSS04  
//SYSIN    DD   *                                                       DBSS04  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBSS04                     DBSS04  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBSS04  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBSS04  
//*                                                                     DBSS04  
//DB@SS05  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBSS05  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBSS05  
//         SET DSN=DB2P                                                 DBSS05  
//DBSS05   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBSS05  
//SYSIN    DD   *                                                       DBSS05  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBSS05                     DBSS05  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBSS05  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBSS05  
//*                                                                     DBSS05  
//DB@VD01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBVD01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBVD01  
//         SET DSN=DB2P                                                 DBVD01  
//DBVD01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBVD01  
//SYSIN    DD   *                                                       DBVD01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBVD01                     DBVD01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBVD01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBVD01  
//*                                                                     DBVD01  
//DB@VD02  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBVD02  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBVD02  
//         SET DSN=DB2P                                                 DBVD02  
//DBVD02   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBVD02  
//SYSIN    DD   *                                                       DBVD02  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBVD02                     DBVD02  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBVD02  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBVD02  
//*                                                                     DBVD02  
//DB@WAP1  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBWAP1  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBWAP1  
//         SET DSN=DB2P                                                 DBWAP1  
//DBWAP1   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBWAP1  
//SYSIN    DD   *                                                       DBWAP1  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBWAP1                     DBWAP1  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBWAP1  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBWAP1  
//*                                                                     DBWAP1  
//DB@WDC1  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBWDC1  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBWDC1  
//         SET DSN=DB2P                                                 DBWDC1  
//DBWDC1   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBWDC1  
//SYSIN    DD   *                                                       DBWDC1  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBWDC1                     DBWDC1  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBWDC1  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBWDC1  
//*                                                                     DBWDC1  
//DB@WGAT  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBWGAT  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBWGAT  
//         SET DSN=DB2P                                                 DBWGAT  
//DBWGAT   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBWGAT  
//SYSIN    DD   *                                                       DBWGAT  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBWGAT                     DBWGAT  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBWGAT  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBWGAT  
//*                                                                     DBWGAT  
//DB@WL01  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBWL01  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBWL01  
//         SET DSN=DB2P                                                 DBWL01  
//DBWL01   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBWL01  
//SYSIN    DD   *                                                       DBWL01  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBWL01                     DBWL01  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBWL01  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBWL01  
//*                                                                     DBWL01  
//DB@WL02  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBWL02  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBWL02  
//         SET DSN=DB2P                                                 DBWL02  
//DBWL02   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBWL02  
//SYSIN    DD   *                                                       DBWL02  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBWL02                     DBWL02  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBWL02  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBWL02  
//*                                                                     DBWL02  
//DB@WPC1  JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               DBWPC1  
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                            DBWPC1  
//         SET DSN=DB2P                                                 DBWPC1  
//DBWPC1   EXEC PROC=RUNSTATS,DSN=&DSN                                  DBWPC1  
//SYSIN    DD   *                                                       DBWPC1  
 LISTDEF DBLIST INCLUDE TABLESPACES DATABASE DBWPC1                     DBWPC1  
 RUNSTATS TABLESPACE  LIST DBLIST                                       DBWPC1  
  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL SHRLEVEL CHANGE              DBWPC1  
//*                                                                     DBWPC1  
