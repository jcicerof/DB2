//DB@THIST JOB 'CICERO',MSGCLASS=S,CLASS=S,NOTIFY=&SYSUID               JOB00663
//SORT     EXEC PGM=SORT                                                        
//SYSOUT   DD SYSOUT=*                                                          
//SORTIN   DD DISP=SHR,DSN=T.MAINVIEW.ELAPSED.DE8A20HS                          
//SORTOUT  DD DSN=CICERO.MAINVIEW.ELAPSED.DE8A20HS,                             
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDBA,                                 
//         SPACE=(CYL,(050,09),RLSE),                                           
//         DCB=(LRECL=0131,BLKSIZE=13100,RECFM=FB,DSORG=PS)                     
//SYSIN    DD *                                                                 
   SORT FIELDS=(7,10,CH,A)                                                      
   INCLUDE COND=(35,8,CH,EQ,C'MAPCCOLE',AND,7,10,CH,GE,C'2008-02-26')           
   END                                                                          
//                                                                              
   INCLUDE COND=(2,3,CH,EQ,C'PKG',AND,7,10,CH,GT,C'2008-02-26')                 
