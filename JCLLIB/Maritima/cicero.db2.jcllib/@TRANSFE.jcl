//DB@EST01 JOB MSGCLASS=X,CLASS=A,NOTIFY=ROSDXXX,COND=(4,LT)                    
//**********************************************************                    
//* STEP 01 - PGM=IDCAMS - COPIA DO CARTUCHO PARA DISCO    *                    
//**********************************************************                    
//S01      EXEC PGM=IEBGENER                                                    
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUT1   DD  DSN=P.XXX.XXXXXXXX,DISP=SHR                                      
//SYSUT2   DD  DSN=T.BACKUP.TAPE,UNIT=SYSDA,                                    
//             VOL=SER=(SHR005,SHR006),                                         
//             DCB=*.SYSUT1,                                                    
//             SPACE=(CYL,(500,500)),DISP=(,CATLG,DELETE)                       
//SYSIN    DD  DUMMY                                                            
//**********************************************************                    
//* STEP 02 - PGM=IEHPROGM - DESCATALOGA ARQUIVOS EM PROD. *                    
//**********************************************************                    
//IEHP0206 EXEC PGM=IEHPROGM                                                    
//SYSPRINT DD  SYSOUT=*                                                         
//DD1      DD  DISP=OLD,UNIT=SYSDA,VOL=SER=SHR005                               
//SYSIN DD *                                                                    
  UNCATLG DSNAME=T.BACKUP.TAPE                                                  
//**********************************************************                    
//* STEP 03 - PGM=IEBGENER - ENVIAR O JOB PARA A INTERNAL  *                    
//*                           READER DA LPAR DE TESTE      *                    
//**********************************************************                    
//IEBG0306 EXEC PGM=IEBGENER                                                    
//SYSIN    DD    DUMMY                                                          
//SYSPRINT DD    SYSOUT=Q                                                       
//SYSUT2   DD    SYSOUT=(A,INTRDR)                                              
//SYSUT1   DD    DATA,DLM=$$                                                    
//TSREST01 JOB MSGCLASS=X,CLASS=A,NOTIFY=ROSDXXX,COND=(4,LT)                    
/*XEQ MRTT                                                                      
//**********************************************************                    
//* STEP 04 - PGM=IEHPROGM - CATALOGA ARQS NA LPAR TESTE   *                    
//**********************************************************                    
//IEHP0406 EXEC PGM=IEHPROGM                                                    
//SYSPRINT DD  SYSOUT=*                                                         
//DD1      DD  DISP=OLD,UNIT=SYSDA,VOL=SER=SHR005                               
//SYSIN DD *                                                                    
 CATLG DSNAME=T.BACKUP.TAPE,VOL=SYSDA=(SHR005,SHR006)                           
//* ********************************************************                    
//* STEP 05 - IEBGENER - COPIA DO DISCO PARA VTS NO TESTE  *                    
//* ********************************************************                    
//IEBG0506 EXEC PGM=IEBGENER                                                    
//SYSPRINT DD  SYSOUT=*                                                         
//SYSIN    DD  DUMMY                                                            
//SYSUT1   DD  DSN=T.BACKUP.TAPE,DISP=SHR                                       
//SYSUT2   DD  DSN=T.XXX.VTSTAPE,UNIT=TAPV,                                     
//             DCB=*.SYSUT1,DISP=(,CATLG)                                       
//SYSIN    DD  DUMMY                                                            
//**********************************************************                    
//* STEP 06 - PGM=IEFBR14 - DESCATALOGA E DELETA OS ARQS   *                    
//*                         NA LPAR DE TESTE               *                    
//**********************************************************                    
//IEFB0606 EXEC PGM=IEFBR14,COND=(4,LT)                                         
//DD01     DD DSN=T.BACKUP.TAPE,DISP=(OLD,DELETE,KEEP)                          
$$                                                                              
