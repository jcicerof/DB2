//DB@2LOA1 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
//*                                                                             
//         JCLLIB ORDER=(CICERO.DB2.PROCLIB)                                    
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//*LOAD DATA INDDN U1465856 LOG NO  REPLACE NOCOPYPEND                          
//*STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL                                  
//* LOAD                                                                        
//*------------------------------------------------------------------           
//LOAD     EXEC PROC=LOAD,DSN=&DSN                                              
//SYSDISC  DD   SYSOUT=*                                                        
//SYSREC   DD   DUMMY                                                           
//SYSIN    DD   *                                                               
TEMPLATE CEJI7VQR                                                               
     DSN('CICERO.UNL.DBEEOR.ORCITCOB.REC.D2009156.TAPE')                        
     DISP(OLD,KEEP,KEEP)                                                        
LOAD DATA INDDN CEJI7VQR LOG NO REPLACE NOCOPYPEND                              
STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL                                     
 EBCDIC  CCSID(00037,00000,00000)                                               
 INTO TABLE "TECINFOR"."ORCAMENTOITECOB"                                        
 WHEN(00001:00002) = X'00A7'                                                    
 ( "CDNEG"                                                                      
        POSITION(  00003:00004) SMALLINT                                        
 , "NRORC"                                                                      
        POSITION(  00005:00010) DECIMAL                                         
 , "NRITE"                                                                      
        POSITION(  00011:00012) SMALLINT                                        
 , "NROPCCAL"                                                                   
        POSITION(  00013:00014) SMALLINT                                        
 , "CDPRO"                                                                      
        POSITION(  00015:00018) INTEGER                                         
 , "CDCOB"                                                                      
        POSITION(  00019:00020) SMALLINT                                        
 , "CDCOBFCL"                                                                   
        POSITION(  00021:00022) SMALLINT                                        
 , "PCTAXIS"                                                                    
        POSITION(  00023:00026) DECIMAL                                         
 , "VLIS"                                                                       
        POSITION(  00027:00035) DECIMAL                                         
 , "VLPRETAR"                                                                   
        POSITION(  00036:00044) DECIMAL                                         
 , "VLDES"                                                                      
        POSITION(  00045:00053) DECIMAL                                         
 , "VLDESCOM"                                                                   
        POSITION(  00054:00062) DECIMAL                                         
 , "VLAGV"                                                                      
        POSITION(  00063:00071) DECIMAL                                         
 , "PCFRQ"                                                                      
        POSITION(  00072:00075) DECIMAL                                         
 , "PCFRQFCL"                                                                   
        POSITION(  00076:00079) DECIMAL                                         
 , "VLFRQ"                                                                      
        POSITION(  00080:00088) DECIMAL                                         
 , "VLFRQFCL"                                                                   
        POSITION(  00089:00097) DECIMAL                                         
 , "PCCOM"                                                                      
        POSITION(  00098:00101) DECIMAL                                         
 , "PCDESFRO"                                                                   
        POSITION(  00102:00105) DECIMAL                                         
 , "PCDESPRE"                                                                   
        POSITION(  00106:00109) DECIMAL                                         
 , "PCISRLT"                                                                    
        POSITION(  00110:00113) DECIMAL                                         
 , "PCAGVFRQ"                                                                   
        POSITION(  00114:00117) DECIMAL                                         
 , "VLISCAL"                                                                    
        POSITION(  00118:00126) DECIMAL                                         
 , "PCDESGER"                                                                   
        POSITION(  00127:00130) DECIMAL                                         
 , "CDVRSCAL"                                                                   
        POSITION(  00131:00140) CHAR(00010)                                     
 , "CDLIMIS"                                                                    
        POSITION(  00141:00142) SMALLINT                                        
 , "VLAGVCOM"                                                                   
        POSITION(  00143:00151) DECIMAL                                         
 , "PCAGVPRE"                                                                   
        POSITION(  00152:00155) DECIMAL                                         
 , "PCAGVGER"                                                                   
        POSITION(  00156:00159) DECIMAL                                         
 , "PCDESCOM"                                                                   
        POSITION(  00160:00163) DECIMAL                                         
 , "PCAGVCOM"                                                                   
        POSITION(  00164:00167) DECIMAL                                         
 , "VLISCALINI"                                                                 
        POSITION(  00168:00176) DECIMAL                                         
 , "PCCOMPAD"                                                                   
        POSITION(  00177:00180) DECIMAL                                         
 , "VLPREANTLIM"                                                                
        POSITION(  00181:00189) DECIMAL                                         
 , "CDGRPSUBREG"                                                                
        POSITION(  00191:00192) SMALLINT                                        
                          NULLIF(00190)=X'FF'                                   
 , "CDSUBREG"                                                                   
        POSITION(  00194:00195) SMALLINT                                        
                          NULLIF(00193)=X'FF'                                   
 , "IDNOVTAR"                                                                   
        POSITION(  00196:00196) CHAR(00001)                                     
 )                                                                              
