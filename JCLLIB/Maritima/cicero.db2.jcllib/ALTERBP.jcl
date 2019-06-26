//DB@ALTBP JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//ALTERBP  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  -STO DB(DBKIT1) SPACENAM(WEBP16$7)                                            
  -STO DB(DBKIT1) SPACENAM(WEBP1AGH)                                            
  -STO DB(DBKIT1) SPACENAM(WEBP14#$)                                            
  -STO DB(DBKIT1) SPACENAM(WEBP1ILT)                                            
  -STO DB(DBKIT1) SPACENAM(WEBP1MST)                                            
  -STO DB(DBKIT1) SPACENAM(WEBPROPO)                                            
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP00) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  -STA DB(DBKIT1) SPACENAM(WEBP16$7) ACC(RW)                                    
  -STA DB(DBKIT1) SPACENAM(WEBP1AGH) ACC(RW)                                    
  -STA DB(DBKIT1) SPACENAM(WEBP14#$) ACC(RW)                                    
  -STA DB(DBKIT1) SPACENAM(WEBP1ILT) ACC(RW)                                    
  -STA DB(DBKIT1) SPACENAM(WEBP1MST) ACC(RW)                                    
  -STA DB(DBKIT1) SPACENAM(WEBPROPO) ACC(RW)                                    
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
ALTER INDEX MARITIMA.WEBPROPOSTA_IE1 BUFFERPOOL BP24;                   00010001
ALTER INDEX MARITIMA.WEBPROPOSTA_IE2 BUFFERPOOL BP24;                   00020001
ALTER INDEX MARITIMA.WEBPROPOSTA_IE3 BUFFERPOOL BP24;                   00030001
ALTER INDEX MARITIMA.WEBPROPOSTA_IPK BUFFERPOOL BP24;                   00040001
ALTER INDEX MARITIMA.WEBPROPOSTA_IX1 BUFFERPOOL BP24;                   00050001
COMMIT;                                                                 00060001
ALTER TABLESPACE DBKIT1A.WEBPROPO BUFFERPOOL BP24;                      00070001
COMMIT;                                                                 00080001
//*                                                                             
