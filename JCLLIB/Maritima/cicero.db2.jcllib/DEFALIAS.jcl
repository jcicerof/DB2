//AXS1251C JOB (0XS0000,000,00),DEOGENES,MSGLEVEL=1,                            
//         PRTY=15,NOTIFY=AXS1251,MSGCLASS=X,CLASS=A                            
//STEP01   EXEC PGM=IDCAMS                                                      
//SYSPRINT DD   SYSOUT=*                                                        
//SYSIN    DD   *                                                               
 DEF ALIAS(NAME(DB2GCAT) REL(CATALOG.DB2GIS.MARITIMA))                          
