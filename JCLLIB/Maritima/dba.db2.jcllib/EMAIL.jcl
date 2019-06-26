//DBVTM001 JOB ,MSGCLASS=P,CLASS=A,NOTIFY=ROSDP02,USER=CA7ONL                   
// JCLLIB   ORDER=(DBB.PROCLIB,SYS8.PROCLIB)                                    
// INCLUDE  MEMBER=JOBLIBS                                                      
/*JOBPARM  LINECT=0                                                             
//**********************************************************************        
//*                                                                    *        
//* VERIFICA SE TEM TABELA DO CATALOGO DO DB2 A SER REORGANIZADA.      *        
//* RC=1 NAO HA NECESSIDADE DE REORG.                                  *        
//* RC=2 EXISTE TABELA A SER REORGANIZADA, VER SYSOUT PARA IDENTIFICAR *        
//* AS TABELAS NECESSARIAS, ENVIAR EMAIL PARA O DBA PROGRAMAR O REORG  *        
//*                                                                    *        
//**********************************************************************        
//STEP001 EXEC PGM=DSNUTILB,PARM='DB2P,AXG0221X'                                
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
//**********************************************************                    
//* => O STEP A SEGUIR SO EXECUTA SE RETURN-CODE DO STEP   *                    
//*    ANTERIOR FOR IGUAL A 2 (ENVIA EMAIL PARA O DBA )    *                    
//**********************************************************                    
// IF (STEP001.RC = 2) THEN                                                     
//STEP002  EXEC PGM=IEBGENER                                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//SYSUT2   DD SYSOUT=A,DEST=(SACM,SMTP)                                         
//SYSUT1   DD *                                                                 
HELO SACM                                                                       
MAIL FROM:<mainframe.maritima@t-systems.com.br>                                 
RCPT TO:<GILBERTO.SIQUEIRA@TS3.COM.BR>                                          
RCPT TO:<JOSE.CICERO@TS3.COM.BR>                                                
RCPT TO:<ROGERIO.SEABRA@T-SYSTEMS.COM.BR>                                       
RCPT TO:<LUIZ.MARTINS@T-SYSTEMS.COM.BR>                                         
DATA                                                                            
DATE: 14 JAN 2009 10:00:00 -0300                                                
FROM: "Mainframe Maritima" <mainframe.maritima@t-systems.com.br>                
TO: GILBERTO.SIQUEIRA@TS3.COM.BR                                                
TO: JOSE.CICERO@TS3.COM.BR                                                      
TO: ROGERIO.SEABRA@T-SYSTEMS.COM.BR                                             
TO: LUIZ.MARTINS@T-SYSTEMS.COM.BR                                               
SUBJECT: ENVIO DE EMIAL - MAINFRAME MARITIMA                                    
                                                                                
*********************************************************************           
*JOB=DBVTM001********************************************************           
*********************************************************************           
*********** EXISTE TABELA DB2 DO CATALOGO PARA REORGANIZAR **********           
*********************************************************************           
*********************************************************************           
*********************************************************************           
.                                                                               
QUIT                                                                            
// ENDIF                                                                        
