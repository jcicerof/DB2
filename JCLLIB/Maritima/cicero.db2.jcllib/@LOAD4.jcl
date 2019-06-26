//DB@2LOA4 JOB 'CICERO',MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                       
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
//SYSREC   DD   DISP=SHR,DSN=JONAS.DB2P.DBEETA.CNDGEVAL.DADOS                   
//SYSIN    DD   *                                                               
TEMPLATE CE5UH1CI                                                               
     DSN('CICERO.UNL.DBNOVA.APORMOIT.REC.D2009170')                             
     DISP(OLD,KEEP,KEEP)                                                        
LOAD DATA INDDN CE5UH1CI LOG NO  REPLACE NOCOPYPEND                             
 STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL                                    
 EBCDIC  CCSID(00037,00000,00000)                                               
 SORTKEYS               10591                                                   
 INTO TABLE "MARITIMA"."APORMOITE"                                              
 WHEN(00001:00002) = X'02D1'                                                    
 ( "CDSUCUR"                                                                    
        POSITION(  00003:00004) SMALLINT                                        
 , "CDRMBAS"                                                                    
        POSITION(  00005:00006) SMALLINT                                        
 , "NRAPOLI"                                                                    
        POSITION(  00007:00010) INTEGER                                         
 , "NRENDOS"                                                                    
        POSITION(  00011:00014) INTEGER                                         
 , "CDRMRMO"                                                                    
        POSITION(  00015:00016) SMALLINT                                        
 , "NRITEM"                                                                     
        POSITION(  00017:00023) DECIMAL                                         
 , "CDCOB"                                                                      
        POSITION(  00024:00025) SMALLINT                                        
 , "DTINIVG_CNV"                                                                
        POSITION(  00026:00029) INTEGER                                         
 , "DTTERVG_CNV"                                                                
        POSITION(  00030:00033) INTEGER                                         
 , "DTEMISS_CNV"                                                                
        POSITION(  00034:00037) INTEGER                                         
 , "DTCANCE"                                                                    
        POSITION(  00038:00041) INTEGER                                         
 , "PRLQEMIL"                                                                   
        POSITION(  00042:00048) DECIMAL                                         
 , "PRLQEMIC"                                                                   
        POSITION(  00049:00055) DECIMAL                                         
 , "VRADIEMI"                                                                   
        POSITION(  00056:00062) DECIMAL                                         
 , "VRCUSEMI"                                                                   
        POSITION(  00063:00069) DECIMAL                                         
 , "VRASSIEMI"                                                                  
        POSITION(  00070:00076) DECIMAL                                         
 , "VRIOFEMI"                                                                   
        POSITION(  00077:00083) DECIMAL                                         
 , "VRCOMEM"                                                                    
        POSITION(  00084:00090) DECIMAL                                         
 , "VRDES"                                                                      
        POSITION(  00091:00097) DECIMAL                                         
 , "VLIS"                                                                       
        POSITION(  00098:00105) DECIMAL                                         
 , "VLISBAS"                                                                    
        POSITION(  00106:00113) DECIMAL                                         
 , "NRPROPO"                                                                    
        POSITION(  00114:00119) DECIMAL                                         
 , "NMSEGUR"                                                                    
        POSITION(  00120:00159) CHAR(00040)                                     
 )                                                                              
