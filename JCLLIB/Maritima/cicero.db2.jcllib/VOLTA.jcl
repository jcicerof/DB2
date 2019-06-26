//DB@VOLTA JOB CLASS=S,MSGCLASS=S,NOTIFY=&SYSUID                                
//* ********************************************************************        
//* * BACKUP FEITO NA ROTINA GEDBS004.                                 *        
//* * ESTE JOB QUEIMARA' OS COMPONENTES DE CLUSTER E DADOS DAS TABELAS.*        
//* * ANTES DE RODAR, DEVE-SE DAR STOP NOS SPACES A BAIXAR.            *        
//* * AO TERMINO, RODAR REPAIR LEVELID TABLESPACE(DBXXXX.TSXXXX) E DE- *        
//* * POIS DAR START NOS SPACES.                                       *        
//* * NAO TRAZ OS INDICES. NESTE CASO TEM QUE TRAZER INDIVIDUAL SOMENTE*        
//* * SE A TABELA TEVE MUDANCA DE LAY-OUT.                             *        
//* * ATENCAO:  O UTILITARIO NAO ACEITA RENAMEU EM RESTORE DE TABELAS. *        
//* ********************************************************************        
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -STO DB(DBMA01) SPACENAM(SNITFDSP)                                            
  -STO DB(DBMA01) SPACENAM(SINITFJU)                                            
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//*-------------------------------------------------------------------          
//*                                                                             
//*-------------------------------------------------------------------          
//S0101    EXEC PGM=ADRDSSU                                                     
//SYSPRINT DD  SYSOUT=*                                                         
//TAPV01   DD  DSN=P.GES.SSDB2P90(-1),DISP=OLD                                  
//DD02     DD  UNIT=SYSDA,VOL=SER=DB2P90,DISP=SHR                               
//SYSIN    DD  *                                                                
 RESTORE  INDDNAME(TAPV01) OUTDDNAME(DD02) -                                    
          DATASET(INCLUDE(DB2PCAT.*.DBMA01.SNITFDSP.I0001.A001)) -              
          CATALOG REPLACE -                                                     
          TOL(ENQF)                                                             
//*-------------------------------------------------------------------          
//*                                                                             
//*-------------------------------------------------------------------          
//START    EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -STA DB(DBMA01) SPACENAM(SNITFDSP) ACC(UT)                                    
  -STA DB(DBMA01) SPACENAM(SINITFJU) ACC(UT)                                    
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD DUMMY                                                             
//                                                                              
//*-------------------------------------------------------------------*         
//*    QUANDO E' FEITO RESTORE/DFDSS DE UM ARQUIVO VSAM, A PARTIR DE  *         
//* UM BACKUP FISICO, O RESTORE NAO CATALOGA O VSAM. PORTANTO, APOS   *         
//* O RESTORE DEVE SER RODADO O JOB ABAIXO.                           *         
//*    OBS: INDIQUE O TIPO DE VSAM:                                   *         
//*    KSDS - INDEXED                                                 *         
//*    ESDS - NONINDEXED                                              *         
//*    RRDS - NUMBERED                                                *         
//*    LDS  - LINEAR                                                  *         
//*-------------------------------------------------------------------*         
//S0202    EXEC PGM=IDCAMS                                                      
//SYSPRINT DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
 DEFINE CLUSTER(                -                                               
       NAME(DB2PCAT.DSNDBC.DBMA01.SNITFDSP.I0001.A001) -                        
       VOLUME(DB2P90)  -                                                        
       LINEAR  -                                                                
       RECATALOG)                                                               
