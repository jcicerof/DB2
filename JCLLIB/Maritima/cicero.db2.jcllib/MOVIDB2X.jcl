//DB@UTMOV JOB CLASS=A,MSGCLASS=T,NOTIFY=&SYSUID                                
// JCLLIB  ORDER=(DBB.PROCLIB,SYS8.PROCLIB)                                     
// INCLUDE MEMBER=JOBLIBS                                                       
//*--------------------------------------------------------------------*        
//* STOP NO DATABASE.TABLESPACE                                        *        
//*--------------------------------------------------------------------*        
//S01    EXEC PGM=IKJEFT01,DYNAMNBR=20                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
 DSN SYSTEM(DB2P)                                                               
-STOP DB(DBSS01) SPACE (SSSI1@RB)                                               
-STOP DB(DBSS01) SPACE (SSSISINI)                                               
//*                                                                             
//*--------------------------------------------------------------------*        
//* EXECUTA ALTER PARA CATALOGO DB2 RECONHECER MOVIMENTACAO            *        
//*--------------------------------------------------------------------*        
//DSNTIAD  EXEC DSNTIAD,DB2NAME=DB2P                                            
ALTER INDEX MARITIMA.SSSISINI_IX1 USING STOGROUP STGP54I;                       
ALTER TABLESPACE DBSS01.SSSISINI  USING STOGROUP STGP54D;                       
//*--------------------------------------------------------------------*        
//* MOVIMENTA PARA OUTRO DISCO                                         *        
//*--------------------------------------------------------------------*        
//S02   EXEC PGM=ADRDSSU,REGION=0M                                              
//SYSPRINT DD SYSOUT=*                                                          
//DD1      DD UNIT=SYSALLDA,DISP=SHR,VOL=SER=DB2P22                             
//DD2      DD UNIT=SYSALLDA,DISP=SHR,VOL=SER=DB2P54                             
//SYSIN    DD *                                                                 
  COPY INDDNAME(DD1) OUTDDNAME(DD2) -                                           
       DATASET(INCLUDE(DB2PCAT.DSNDB*.DBSS01.SSSI1@RB.** -                      
                       DB2PCAT.DSNDB*.DBSS01.SSSISINI.**)) -                    
       ALLEXCP ALLDATA(*) TOL(ENQF) DELETE CATALOG                              
//*--------------------------------------------------------------------*        
//* START NO DATABASE.TABLESPACE                                       *        
//*--------------------------------------------------------------------*        
//S03    EXEC PGM=IKJEFT01,DYNAMNBR=20                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
 DSN SYSTEM(DB2P)                                                               
-START DB(DBSS01) SPACE (SSSI1@RB) ACCESS (RW)                                  
-START DB(DBSS01) SPACE (SSSISINI) ACCESS (RW)                                  
