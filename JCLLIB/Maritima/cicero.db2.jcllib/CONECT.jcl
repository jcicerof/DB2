//AXS1251C JOB (0XS0000,000,00),DEOGENES,MSGCLASS=X,CLASS=0,PRTY=15,            
//      NOTIFY=AXS1251                                                          
//STEP01 EXEC PGM=IDCAMS                                                        
//SYSPRINT  DD SYSOUT=*                                                         
//SYSIN    DD  *                                                                
  IMP CON OBJ((CATALOG.DB2GIS.MARITIMA DEVT(3390) VOL(DB2G01)))                 
