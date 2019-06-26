//DB@DSNTI JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               JOB00632
//*                                                                             
//DSNTIAUL EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB00) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
SELECT CDRMRMO , TPSEGURO, CDEMPDSF, CDSUCDSF,                          00010099
       CDFILDSF, CDUNPINP, CDCORDSF, DTMOVPRO,                          00020099
       SUM(VRPRMLIQ), SUM(VRPRMCOM), SUM(VRSINIST), SUM(QTEMINOV),      00030099
       SUM(QTEMIREN), SUM(QTEMITRA), SUM(QTPROCAN), SUM(QTPROTRA),      00040099
       SUM(VRCOMPGO)                                                    00050099
  FROM MARITIMA.DOSOFT                                                  00060099
 GROUP BY CDRMRMO , TPSEGURO, CDEMPDSF, CDSUCDSF,                       00070099
          CDFILDSF, CDUNPINP, CDCORDSF, DTMOVPRO                        00080099
 ORDER BY CDRMRMO                                                       00090099
   FOR READ ONLY WITH UR;                                               00100099
