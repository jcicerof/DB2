--                                                                              
--  CREATE  TABLESPACE CTRLTSQY                                                 
--  IN      DB2ADM                                                              
--  USING   STOGROUP STGP03D                                                    
--             PRIQTY 48                                                        
--             SECQTY 48                                                        
--             ERASE NO                                                         
--             FREEPAGE 0                                                       
--             PCTFREE  0                                                       
--             BUFFERPOOL BP1                                                   
--             LOCKSIZE ROW                                                     
--             CLOSE NO                                                         
--             LOCKMAX SYSTEM                                                   
--             CCSID EBCDIC                                                     
--      ;                                                                       
--  COMMIT;                                                                     
--                                                                              
    CREATE  TABLE DB2ADM.CONTROLE_TSQUERY                                       
            LIKE  SYSIBM.SYSDUMMY1                                              
              IN DB2ADM.CTRLTSQY;                                               
    COMMIT;                                                                     
--                                                                              
    COMMENT ON TABLE DB2ADM.CONTROLE_TSQUERY IS                                 
'DUMMY TABLE USADA PARA QUIESCE DA ROTINA TSQUERY - JOSE CICERO(DBA)';          
    COMMIT;                                                                     
