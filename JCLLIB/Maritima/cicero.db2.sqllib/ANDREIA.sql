SELECT * FROM SYSIBM.SYSPACKSTMT                                                
WHERE COLLID = 'MAPCCOLE'                                                       
  AND NAME   = 'NM100D1'                                                        
WITH UR;                                                                        
SELECT                                                                          
CAST(CAST(STMT AS VARCHAR(3500) CCSID 1208)                                     
AS VARCHAR(3500) CCSID EBCDIC)                                                  
FROM SYSIBM.SYSPACKSTMT                                                         
WHERE COLLID = 'MAPCCOLE'                                                       
  AND NAME   = 'NM100D1'                                                        
