//DB@CHECK JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//* CHECK DATA                                                                  
//*------------------------------------------------------------------           
//CHECKDTA EXEC PROC=CHECK,DSN=&DSN                                             
//SYSIN    DD   *                                                               
CHECK DATA TABLESPACE DBMP01.PROPCOLE                                           
  FOR EXCEPTION                                                                 
      IN MARITIMA.PROPCOLETIVA     USE DB2ADM.PROPCOLETIVA                      
      IN MARITIMA.PROPITEMORCPAG   USE DB2ADM.PROPITEMORCPAG                    
      IN MARITIMA.PROPBANESPA      USE DB2ADM.PROPBANESPA                       
      IN MARITIMA.PROPCONTROLE     USE DB2ADM.PROPCONTROLE                      
      IN MARITIMA.PROPFORMAPAG     USE DB2ADM.PROPFORMAPAG                      
      IN MARITIMA.PROPCOLITEMORC   USE DB2ADM.PROPCOLITEMORC                    
  DELETE YES LOG YES SCOPE ALL                                                  
