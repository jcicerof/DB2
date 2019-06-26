//DB@TESTE JOB 'CICERO,R:5627',MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID                
//*                                                                             
//*                                                                             
//ANALYZE  EXEC PGM=PTLDRIVM,REGION=4M,PARM='SUFFIX=00,EP=RML@MAIN'             
//STEPLIB  DD DISP=SHR,DSN=CAI.R115.DB2TOOLS.LOADLIB                            
//         DD DISP=SHR,DSN=DB2.DB2P.SDSNLOAD                                    
//         DD DISP=SHR,DSN=DB2.DB2P.SDSNEXIT                                    
//PTILIB   DD DISP=SHR,DSN=CAI.R115.DB2TOOLS.LOADLIB                            
//         DD DISP=SHR,DSN=DB2.DB2P.SDSNLOAD                                    
//         DD DISP=SHR,DSN=DB2.DB2P.SDSNEXIT                                    
//PTIPARM  DD DISP=SHR,DSN=CAI.R115.DB2TOOLS.PARMLIB                            
//PTIXMSG  DD   DISP=SHR,DSN=CAI.R115.DB2TOOLS.XMESSAGE                         
//MSGFILE  DD   SYSOUT=*                                                00110002
//REPFILE  DD   SYSOUT=*                                                00120002
//ABNLIGNR DD   DUMMY                 SUPPRESS ABENDAID DUMPS           00130002
//DDLFILE  DD   DISP=SHR,                                               00132002
//           DSN=CICERO.DB2.JCLLIB(RCUTB001)                                    
//PARMFILE DD   *                                                       00135002
 CREATOR  CICERO                                                                
 STRATEGY RCUBAT                                                                
 STRTSSID DB2P                                                                  
 TRGSSID  DB2P                                                                  
 SECURITY                                                                       
 UNLOAD                                                                         
 HEADER                                                                         
 TRAILER                                                                        
 RUNSTATS                                                                       
 CHEKDATA                                                                       
 IMAGCOPY                                                                       
 REBIND                                                                         
 RECOVIX                                                                        
 REORGTS                                                                        
 REORGIX                                                                        
 PREFIX   CICERO                                                                
 MODEL4   @DEFAULT                                                              
 MODEL4C  AXW0311                                                               
/*                                                                              
