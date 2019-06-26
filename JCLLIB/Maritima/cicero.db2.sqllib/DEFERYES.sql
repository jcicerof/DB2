CREATE  INDEX SYSADM.CADAPOL_IE4 ON DB2ADM.CADAPOL                              
(       DTMVEMI_CNV DESC                                                        
          )                                                                     
USING   STOGROUP STGP08I                                                        
                                    PRIQTY 13308                                
                                    SECQTY 1332                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- DB2ADM.CADAPOL_IX3 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  INDEX SYSADM.CADAPOL_IX3 ON DB2ADM.CADAPOL                              
(       CDSUCUR ASC                                                             
,       NRCORRT ASC                                                             
,       NRCOLAB ASC                                                             
          )                                                                     
USING   STOGROUP STGP07I                                                        
                                    PRIQTY 19440                                
                                    SECQTY 1944                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- DB2ADM.CADAPOL_IX4 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  INDEX SYSADM.CADAPOL_IX4 ON DB2ADM.CADAPOL                              
(       CDSUCUR ASC                                                             
,       NRCORRT ASC                                                             
,       NRCOLAB ASC                                                             
,       CDRMBAS ASC                                                             
,       NRAPOLI ASC                                                             
          )                                                                     
USING   STOGROUP STGP32I                                                        
                                    PRIQTY 43752                                
                                    SECQTY 4376                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- DB2ADM.CADAPOL_IX5 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  INDEX SYSADM.CADAPOL_IX5 ON DB2ADM.CADAPOL                              
(       CDSUCUR ASC                                                             
,       NRCORRT ASC                                                             
,       NRCOLAB ASC                                                             
,       DTMVEMI_CNV ASC                                                         
          )                                                                     
USING   STOGROUP STGP32I                                                        
                                    PRIQTY 43752                                
                                    SECQTY 4376                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- DB2ADM.CADAPOL_IX6 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  INDEX SYSADM.CADAPOL_IX6 ON DB2ADM.CADAPOL                              
(       NRPROPO ASC                                                             
          )                                                                     
USING   STOGROUP STGP41I                                                        
                                    PRIQTY 21600                                
                                    SECQTY 2112                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- DB2ADM.CADAPOL_IX1 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX SYSADM.CADAPOL_IX1 ON DB2ADM.CADAPOL                       
(       CDSUCUR ASC                                                             
,       CDRMBAS ASC                                                             
,       NRAPOLI ASC                                                             
,       NRENDOS ASC                                                             
          )                                                                     
USING   STOGROUP STGP09I                                                        
                                    PRIQTY 17280                                
                                    SECQTY 1728                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- DB2ADM.CADAPOL_IX2 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX SYSADM.CADAPOL_IX2 ON DB2ADM.CADAPOL                       
(       CDSEGUR ASC                                                             
,       CDSUCUR ASC                                                             
,       CDRMBAS ASC                                                             
,       NRAPOLI ASC                                                             
,       NRENDOS ASC                                                             
          )                                                                     
USING   STOGROUP STGP09I                                                        
                                    PRIQTY 41760                                
                                    SECQTY 4176                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * NEW INDEX CREATE AND ALTER STATEMENTS                      *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- DB2ADM.CADAPOL_IE4 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.            
                                                                                
                                                                                
                                                                                
CREATE  INDEX SYSADM.CADAPOL_IE4 ON DB2ADM.CADAPOL                              
(       DTMVEMI_CNV DESC                                                        
          )                                                                     
USING   STOGROUP STGP08I                                                        
                                    PRIQTY 13308                                
                                    SECQTY 1332                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
           DEFER YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
