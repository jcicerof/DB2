//DB@CSOPY JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID,TYPRUN=HOLD                    
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//COPY     EXEC PROC=COPY,DSN=DB2P                                              
//COPY.SYSIN DD *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
        INCLUDE TABLESPACE DBMA02.SENHAOPC                                      
TEMPLATE DDCOPY                                                                 
         DSN(DB2PCOPY.FE.&DB..&TS..D&DT..HR&HO.&MI.)                            
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
COPY LIST DBLIST                                                                
     SHRLEVEL CHANGE                                                            
     FULL YES                                                                   
     COPYDDN DDCOPY                                                             
