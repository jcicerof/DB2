SELECT                                                                          
'//DB@'||SUBSTR(NAME,3,4)||'  JOB %CICERO%,MSGCLASS=P,CLASS=A,'||               
'NOTIFY=&SYSUID', NAME,1                                                        
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
'//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)',                                 
NAME,2                                                                          
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
'//         SET DSN=DB2P'                                                       
,NAME,3                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
'//'||STRIP(NAME)||'   EXEC PROC=RUNSTATS,DSN=&DSN'                             
,NAME,4                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
'//SYSIN    DD   *'                                                             
,NAME,5                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
' LISTDEF DBLIST INCLUDE TABLESPACES DATABASE '||STRIP(NAME)                    
,NAME,6                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
' RUNSTATS TABLESPACE  LIST DBLIST'                                             
,NAME,7                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
'  TABLE(ALL) INDEX(ALL) KEYCARD UPDATE ALL HISTORY ALL SHRLEVEL CHANGE'        
,NAME,8                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
UNION ALL                                                                       
SELECT                                                                          
'//*'                                                                           
,NAME,9                                                                         
  FROM SYSIBM.SYSDATABASE                                                       
 WHERE NAME LIKE 'DB%'                                                          
 ORDER BY 2,3                                                                   
