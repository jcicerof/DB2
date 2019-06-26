//DB@DSNTI JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID               JOB02007
//*                                                                             
//IEFBR14  EXEC PGM=IEFBR14                                                     
//*SYSUT1   DD DSN=CICERO.UNL.FIM,DISP=(OLD,DELETE,DELETE)                      
//*SYSUT2   DD DSN=CICERO.UNL.TESTE,DISP=(OLD,DELETE,DELETE)                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//*                                                                             
//DSNTIAUL EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   *                                                               
 DSN SYSTEM(DB2P)                                                               
 RUN  PROGRAM(DSNTIAUL) PLAN(DSNTIB71) PARMS('SQL') -                           
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
//SYSPRINT DD   SYSOUT=*                                                        
//SYSPUNCH DD   SYSOUT=*                                                        
//SYSREC00 DD   DSN=CICERO.UNL.TESTE,DISP=(NEW,CATLG,CATLG),                    
//         UNIT=SYSDBA,SPACE=(TRK,(1,0),RLSE)                                   
//SYSIN    DD   *                                                               
SELECT CHAR(STRIP(                                                      00010099
                   STRIP(CHAR(CDRMRMO)) ||                              00020099
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(TPSEGURO)) ||                                     
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(CDEMPDSF)) ||                                     
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(CDSUCDSF)) ||                                     
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(CDFILDSF)) ||                                     
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(CDUNPINP)) ||                                     
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(CDCORDSF)) ||                                     
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(DTMOVPRO,USA)) ||                                 
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(VRPRMLIQ))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(VRPRMCOM))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(VRSINIST))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(QTEMINOV))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(QTEMIREN))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(QTEMITRA))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(QTPROCAN))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(QTPROTRA))) ||                                
                   STRIP(CHAR('|')) ||                                          
                   STRIP(CHAR(SUM(VRCOMPGO))) ||                                
                   STRIP(CHAR('|'))  ||                                         
                   STRIP(CHAR('|'))                                             
       ))                                                                       
  FROM MARITIMA.DOSOFT                                                  00350099
 GROUP BY CDRMRMO , TPSEGURO, CDEMPDSF, CDSUCDSF,                       00360099
          CDFILDSF, CDUNPINP, CDCORDSF, DTMOVPRO                        00370099
 ORDER BY CDRMRMO                                                       00380099
   FOR READ ONLY WITH UR;                                               00390099
//*                                                                             
//ICETOOL  EXEC PGM=ICETOOL,REGION=1024K                                        
//TOOLMSG  DD   SYSOUT=*                                                        
//DFSMSG   DD   SYSOUT=*                                                        
//TOOLIN   DD   *                                                               
DEFAULTS LIST(SHOWDEF)                                                          
COPY FROM(IN1) TO(OUT1)                                                         
//SHOWDEF  DD   SYSOUT=*                                                        
//IN1      DD   DSN=CICERO.UNL.TESTE,DISP=SHR                                   
//OUT1     DD   DSN=CICERO.UNL.FIM,DISP=(NEW,CATLG,CATLG),                      
//         UNIT=SYSDBA,SPACE=(TRK,(1,0),RLSE),                                  
//         DCB=(LRECL=130,RECFM=VB)                                             
//REPORT   DD   SYSOUT=*                                                        
