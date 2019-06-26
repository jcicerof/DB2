//DB@SORT  JOB 'CICERO,R:5627',MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID        JOB02196
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
//SORTIN  DD   DISP=OLD,DSN=CICERO.ALL.DATASETS.SYSCOPY.DB2P                    
//*SORTOUT DD   SYSOUT=*                                                        
//FBOUT    DD   DSN=CICERO.ALL.DATASETS.SYSCOPY.DB2P.SORTED,                    
//         DISP=(NEW,CATLG,DELETE),UNIT=SYSDBA,                                 
//         SPACE=(TRK,(100,100),RLSE)                                           
//*        DCB=(LRECL=255,BLKSIZE=25500,RECFM=FB,DSORG=PS)                      
//SYSIN   DD   *                                                                
  OPTION VLSHRT                                                                 
  SORT FIELDS=COPY                                                              
  INCLUDE COND=(22,8,CH,EQ,C'DB2PCOPY')                                         
  OUTFIL FNAMES=FBOUT,VTOF,OUTREC=(5,100)                                       
 END                                                                            
/*                                                                              
