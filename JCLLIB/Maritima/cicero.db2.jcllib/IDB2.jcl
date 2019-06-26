//AXG0221R JOB (0XW0000,000,00),ROGERIO,                                        
//            NOTIFY=AXG0221,REGION=0M,CLASS=S,MSGCLASS=X                       
//*-------------------------------------------------------------------          
//*   CA-INSIGHT FOR DB2 INSTALLATION                                           
//*-------------------------------------------------------------------          
//IDB2RWJ EXEC PGM=NSIGHTRW,REGION=4096K                                        
//STEPLIB  DD  DSN=CAI.R115.DB2TOOLS.LOADLIB,DISP=SHR                           
//SYSPARMS DD  DSN=CAI.R115.DB2TOOLS.IDB2.SOURCE(IDRWPRMS),DISP=SHR             
//DB2DDN   DD  DSN=SUP.SMFDIA.MAINVIEW.G1455V00,DISP=SHR  * 05/05               
//*        DD  DSN=SUP.SMFDIA.MAINVIEW.G1456V00,DISP=SHR  * 06/05               
//*        DD  DSN=SUP.SMFDIA.MAINVIEW.G1457V00,DISP=SHR  * 07/05               
//DBGIN    DD  *                                                                
 GLOBALS WHERE EVENT-TIME >= '080505095900' AND <= '080505110000'               
//         DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTACT01),DISP=SHR                   
//         DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTACTTR1),DISP=SHR                  
//*BGIN    DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTACTSMS),DISP=SHR                  
//*        DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTACTTRS),DISP=SHR                  
//*        DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTACTSML),DISP=SHR                  
//*        DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTACTTRL),DISP=SHR                  
//         DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTSTASM1),DISP=SHR                  
//         DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTSTASM2),DISP=SHR                  
//***      DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTSTATR1),DISP=SHR                  
//*        DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTSCNSM1),DISP=SHR                  
//*        DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTSQLSM1),DISP=SHR                  
//*        DD  DSN=CAI.R115.DB2TOOLS.TGTREQ(BTSQLTRL),DISP=SHR                  
//*                                                                             
//*     PRINT FILE ALLOCATIONS THAT CORRESPOND TO THE                           
//*     REPORT REQUESTS IN INPUT TO THE DBGIN DD STMT                           
//*                                                                             
//BTACTSMS DD  SYSOUT=*                                                         
//BTACTTRS DD  SYSOUT=*                                                         
//BTACTSML DD  SYSOUT=*                                                         
//BTACTTRL DD  SYSOUT=*                                                         
//BTSTASM1 DD  SYSOUT=*                                                         
//BTSTASM2 DD  SYSOUT=*                                                         
//BTSTATR1 DD  SYSOUT=*                                                         
//BTSCNSM1 DD  SYSOUT=*                                                         
//BTSQLSM1 DD  SYSOUT=*                                                         
//BTSQLTRL DD  SYSOUT=*                                                         
//DBGPRINT DD  SYSOUT=*                                                         
/*                                                                              
