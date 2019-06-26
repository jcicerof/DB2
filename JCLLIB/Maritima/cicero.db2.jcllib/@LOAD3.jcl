//DB@2LOA3 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
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
//SYSREC   DD   DISP=SHR,DSN=JONAS.DB2P.DBEETA.CONGENQ3.DADOS                   
//SYSIN    DD   *                                                               
LOAD DATA INDDN SYSREC   LOG NO  RESUME YES NOCOPYPEND                          
 EBCDIC  CCSID(00037,00000,00000)                                               
 INTO TABLE "TECINFOR"."CONDICAOGERENQ3"                                        
 WHEN(00001:00002) = X'00E1'                                                    
 ( "TPPRM"                                                                      
        POSITION(  00003:00004) SMALLINT                                        
 , "CDPRM"                                                                      
        POSITION(  00005:00008) INTEGER                                         
 , "TPPRMCND"                                                                   
        POSITION(  00009:00010) SMALLINT                                        
 , "NRSEQPRM"                                                                   
        POSITION(  00011:00014) INTEGER                                         
 , "IDSISSGUISL"                                                                
        POSITION(  00015:00015) CHAR(00001)                                     
 , "TPNAC"                                                                      
        POSITION(  00016:00017) SMALLINT                                        
 , "IDVEIFIB"                                                                   
        POSITION(  00018:00018) CHAR(00001)                                     
 , "CDCNG"                                                                      
        POSITION(  00019:00022) INTEGER                                         
 , "IDAVA"                                                                      
        POSITION(  00023:00023) CHAR(00001)                                     
 , "TPCRGVEI"                                                                   
        POSITION(  00024:00025) SMALLINT                                        
 , "IDFRQMIN"                                                                   
        POSITION(  00026:00026) CHAR(00001)                                     
 , "NRSEQTAB"                                                                   
        POSITION(  00027:00030) INTEGER                                         
 , "IDCOBCSC"                                                                   
        POSITION(  00031:00031) CHAR(00001)                                     
 , "QTPTOPFLINI"                                                                
        POSITION(  00032:00033) SMALLINT                                        
 , "QTPTOPFLFNL"                                                                
        POSITION(  00034:00035) SMALLINT                                        
 , "IDTIPCRGVEI"                                                                
        POSITION(  00036:00036) CHAR(00001)                                     
 , "QTCDTPFLINI"                                                                
        POSITION(  00037:00038) SMALLINT                                        
 , "QTCDTPFLFNL"                                                                
        POSITION(  00039:00040) SMALLINT                                        
 , "CDFSEPPS"                                                                   
        POSITION(  00041:00042) SMALLINT                                        
 , "CDRMOBAS"                                                                   
        POSITION(  00043:00044) SMALLINT                                        
 , "TPMEICBADEMPAR"                                                             
        POSITION(  00045:00046) SMALLINT                                        
 , "TPCIDTRF"                                                                   
        POSITION(  00047:00048) SMALLINT                                        
 , "TPCIDPNE"                                                                   
        POSITION(  00049:00050) SMALLINT                                        
 , "CDVRSCAL"                                                                   
        POSITION(  00051:00060) CHAR(00010)                                     
 , "TPEDS"                                                                      
        POSITION(  00061:00062) SMALLINT                                        
 , "TPTXTEMI"                                                                   
        POSITION(  00063:00064) SMALLINT                                        
 , "CDTXTEMI"                                                                   
        POSITION(  00065:00066) SMALLINT                                        
 , "IDGARRED"                                                                   
        POSITION(  00067:00067) CHAR(00001)                                     
 , "IDBON"                                                                      
        POSITION(  00068:00068) CHAR(00001)                                     
 , "CDPRO"                                                                      
        POSITION(  00069:00072) INTEGER                                         
 , "CDNIVAPPINI"                                                                
        POSITION(  00073:00074) SMALLINT                                        
 , "CDNIVAPPFNL"                                                                
        POSITION(  00075:00076) SMALLINT                                        
 , "IDCDTEVT"                                                                   
        POSITION(  00077:00077) CHAR(00001)                                     
 , "TPCDTEVT"                                                                   
        POSITION(  00078:00079) SMALLINT                                        
 , "CDCOBINI"                                                                   
        POSITION(  00080:00081) SMALLINT                                        
 , "CDCOBFNL"                                                                   
        POSITION(  00082:00083) SMALLINT                                        
 , "NRAPOINI"                                                                   
        POSITION(  00084:00087) INTEGER                                         
 , "NRAPOFNL"                                                                   
        POSITION(  00088:00091) INTEGER                                         
 , "PCVRCISINI"                                                                 
        POSITION(  00092:00095) DECIMAL                                         
 , "PCVRCISFNL"                                                                 
        POSITION(  00096:00099) DECIMAL                                         
 , "CDCLABON"                                                                   
        POSITION(  00100:00101) SMALLINT                                        
 , "CDGRPCATAUT"                                                                
        POSITION(  00102:00103) SMALLINT                                        
 , "CDGRPCATRCF"                                                                
        POSITION(  00104:00105) SMALLINT                                        
 , "TPSEX"                                                                      
        POSITION(  00106:00107) SMALLINT                                        
 )                                                                              
