ALTER TABLESPACE DBEETA.PPONBASE                                                
      BUFFERPOOL BP25                                                           
      CLOSE NO;                                                                 
COMMIT;                                                                         
ALTER INDEX TECINFOR.PROPOSTAONBASE_PK                                          
      BUFFERPOOL BP25                                                           
      CLOSE NO;                                                                 
COMMIT;                                                                         
ALTER INDEX TECINFOR.PROPOSTAONBASE_AK1                                         
      BUFFERPOOL BP25                                                           
      CLOSE NO;                                                                 
COMMIT;                                                                         
ALTER INDEX TECINFOR.PROPOSTAONBASE_AK2                                         
      BUFFERPOOL BP25                                                           
      CLOSE NO;                                                                 
COMMIT;                                                                         
ALTER INDEX TECINFOR.PROPOSTAONBASE_IX1                                         
      BUFFERPOOL BP25                                                           
      CLOSE NO;                                                                 
COMMIT;                                                                         
