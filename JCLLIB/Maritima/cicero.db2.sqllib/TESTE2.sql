CREATE  TABLESPACE CICEROTS                                                     
IN      DB2ADM                                                                  
USING   STOGROUP STGP03D                                                        
                     PRIQTY 48000                                               
                     SECQTY 192                                                 
                     ERASE NO                                                   
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP1                                                       
           LOCKSIZE ROW                                                         
           CLOSE NO                                                             
           LOCKMAX SYSTEM                                                       
           CCSID EBCDIC                                                         
    ;                                                                           
   COMMIT WORK;                                                                 
CREATE  TABLE DB2ADM.TESTE                                                      
(       SIGLAUF CHAR ( 2 ) NOT NULL                                             
,       NMUF CHAR ( 30 ) NOT NULL                                               
   )                                                                            
IN      DB2ADM.CICEROTS                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
COMMIT WORK;                                                                    
CREATE  INDEX DB2ADM.TESTEIX ON DB2ADM.TESTE                                    
(       SIGLAUF ASC                                                             
          )                                                                     
USING   STOGROUP STGP20I                                                        
                     PRIQTY 48                                                  
                     SECQTY 48                                                  
                     ERASE NO                                                   
                     FREEPAGE 0                                                 
                     PCTFREE 10                                                 
           BUFFERPOOL BP2                                                       
           CLOSE NO                                                             
           PIECESIZE 2G                                                         
    ;                                                                           
   COMMIT WORK;                                                                 
