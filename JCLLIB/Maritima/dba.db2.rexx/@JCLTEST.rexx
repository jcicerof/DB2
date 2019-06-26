//HSTSPACE JOB 'CICERO,DBA(R.5093)',MSGCLASS=P,CLASS=A,NOTIFY=CICERO            
//*                                                                             
//         SET DSN=DB2P                                                         
//*-------------------------------------------------------------------          
//* PARA TESTE DE REXX                                                          
//*-------------------------------------------------------------------          
//* EXECUTA REXX                                                                
//*-------------------------------------------------------------------          
//RUNEXEC  EXEC PGM=IKJEFT1A,DYNAMNBR=200,PARM='RXREPLIC'                       
//SYSEXEC  DD   DSN=DBA.DB2.REXX,DISP=SHR                                       
//SYSPRINT DD   SYSOUT=*                                                        
//SYSTSPRT DD   SYSOUT=*                                                        
//SYSTSIN  DD   DUMMY                                                           
//INFILE   DD   DISP=OLD,DSN=P.DB2PDPRC.DPROP.G0021V00                          
//OUTFILE  DD   SYSOUT=*                                                        
