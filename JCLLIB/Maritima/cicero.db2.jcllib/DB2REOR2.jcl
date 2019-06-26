//AXG0221R JOB (0XW0000,000,00),'ROGERIO DB2',NOTIFY=AXG0221,           JOB00807
//            REGION=0M,CLASS=S,MSGCLASS=X                                      
//**********************************************************************        
//DB2REOR EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221R'                                
//STEPLIB  DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSPRINT DD SYSOUT=*                                                          
//UTPRINT  DD SYSOUT=*                                                          
//SYSOUT   DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
 REORG TABLESPACE DSNDB06.SYSALTER                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSCOPY                                               
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSDBASE                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSDBAUT                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSDDF                                                
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSEBCDC                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSGPAUT                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSGROUP                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSGRTNS                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSHIST                                               
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSJAVA                                               
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSOBJ                                                
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSPKAGE                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSPLAN                                               
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSSEQ                                                
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSSEQ2                                               
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSSTATS                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSSTR                                                
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSUSER                                               
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
 REORG TABLESPACE DSNDB06.SYSVIEWS                                              
       LOG NO REPORTONLY INDREFLIMIT OFFPOSLIMIT                                
