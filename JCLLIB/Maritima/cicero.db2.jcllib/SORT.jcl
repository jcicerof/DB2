//DB@SORT  JOB 'CICERO,R:5627',MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID                
//*                                                                             
//*------------------------------------------------------------------           
//* SORT                                                                        
//* CLASSIFICA A SYSREC DA SSLOGCAD POR NMTABREF, NRSEQTABREF                   
//* PARA CLUSTERIZAR A TABELA PELO INDICE SSLOGCAD_IX1                          
//*                                                                             
//* SORT FIELDS=(20,18,CH,A,16,4,BI,A),DYNALLOC=(SYSWRK)                        
//*------------------------------------------------------------------           
//SORT    EXEC PGM=SORT                                                         
//SYSOUT  DD   SYSOUT=*                                                         
//SORTIN  DD   DISP=OLD,DSN=JR.DSN1LOGP.SYSSUMRY                                
//SORTOUT DD   SYSOUT=*                                                         
//SYSIN   DD   *                                                                
 SORT FIELDS=(120,5,CH,A)                                                       
 INCLUDE COND=(2,8,CH,EQ,C'DSN1151I',OR,58,8,CH,EQ,C'MOVPARCL',                 
            OR,15,11,CH,EQ,C'START DATE=',                                      
            OR,15,9,CH,EQ,C'STARTRBA=')                                         
 END                                                                            
/*                                                                              
