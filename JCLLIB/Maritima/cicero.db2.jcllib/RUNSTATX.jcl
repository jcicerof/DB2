//DB@RUNS2 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         SET DSN=DB2P                                                         
//*-----------------------------------------------------------                  
//* RUNSTATS                                                                    
//*-----------------------------------------------------------                  
//RUNSTATS EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
RUNSTATS INDEX (MARITIMA.SSCARERR_IX6                                           
    KEYCARD FREQVAL NUMCOLS 10) SHRLEVEL CHANGE                                 
RUNSTATS INDEX (MARITIMA.SSCARERR_IX7                                           
    KEYCARD FREQVAL NUMCOLS 10) SHRLEVEL CHANGE                                 
