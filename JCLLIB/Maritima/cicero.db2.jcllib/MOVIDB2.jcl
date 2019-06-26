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
-STOP DB(DBWPC1) SPACE (DETA1KH0)                                               
-STOP DB(DBWPC1) SPACE (DETALAPO)                                               
//*                                                                             
//*--------------------------------------------------------------------*        
//* EXECUTA ALTER PARA CATALOGO DB2 RECONHECER MOVIMENTACAO            *        
//*--------------------------------------------------------------------*        
//DSNTIAD  EXEC DSNTIAD,DB2NAME=DB2P                                            
ALTER INDEX MARITIMA.DETALHEAPOLICE_PK  USING STOGROUP STGP65I;                 
ALTER TABLESPACE DBWPC1.DETALAPO        USING STOGROUP STGP64D;                 
//*--------------------------------------------------------------------*        
//* MOVIMENTA PARA OUTRO DISCO                                         *        
//*--------------------------------------------------------------------*        
//M01   EXEC PGM=ADRDSSU,REGION=0M                                              
//SYSPRINT DD SYSOUT=*                                                          
//DD1      DD UNIT=SYSALLDA,DISP=SHR,VOL=SER=DB2P88                             
//DD2      DD UNIT=SYSALLDA,DISP=SHR,VOL=SER=DB2P64                             
//SYSIN    DD *                                                                 
  COPY INDDNAME(DD1) OUTDDNAME(DD2) -                                           
       DATASET(INCLUDE(DB2PCAT.DSNDB*.DBWPC1.DETALAPO.**)) -                    
       ALLEXCP ALLDATA(*) TOL(ENQF) DELETE CATALOG                              
//*                                                                             
//M02   EXEC PGM=ADRDSSU,REGION=0M                                              
//SYSPRINT DD SYSOUT=*                                                          
//DD1      DD UNIT=SYSALLDA,DISP=SHR,VOL=SER=DB2P89                             
//DD2      DD UNIT=SYSALLDA,DISP=SHR,VOL=SER=DB2P65                             
//SYSIN    DD *                                                                 
  COPY INDDNAME(DD1) OUTDDNAME(DD2) -                                           
       DATASET(INCLUDE(DB2PCAT.DSNDB*.DBWPC1.DETA1KH0.**)) -                    
       ALLEXCP ALLDATA(*) TOL(ENQF) DELETE CATALOG                              
//*--------------------------------------------------------------------*        
//* START NO DATABASE.TABLESPACE                                       *        
//*--------------------------------------------------------------------*        
//S03    EXEC PGM=IKJEFT01,DYNAMNBR=20                                          
//SYSTSPRT DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSTSIN DD *                                                                  
 DSN SYSTEM(DB2P)                                                               
-START DB(DBWPC1) SPACE (DETA1KH0) ACCESS (RW)                                  
-START DB(DBWPC1) SPACE (DETALAPO) ACCESS (RW)                                  
