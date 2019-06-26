--                                                                              
-- BBICSC.ZOS0301C.BBPARM(ACP820)                                               
--                                                                              
SELECT LOCATION,SUBSYSTEM,                                                      
   PKGFLAG,                                                                     
   DATE,                                                                        
   EXECLOCATION,                                                                
   COLLECTIONID,                                                                
   PROGRAMNAME,                                                                 
   DECIMAL(COUNT(*), 31, 0),                                                    
   DECIMAL(SUM(FLOAT(SQLCOUNT)), 31, 0),                                        
   DECIMAL(SUM(FLOAT(ELAPSEPKG)), 31, 3),                                       
   DECIMAL(SUM(FLOAT(CPUTCBPKG)), 31, 3),                                       
   DECIMAL(SUM(FLOAT(ELPLOCK+ELAPSYNCIO+ELPOTHREAD+ELPOTHWRIT+                  
               ELPUNITSW+ELPARCQIS+ELPDRAIN+                                    
               ELPCLAIM+ELPPGLAT+ELPARCREAD+GBLMSGELAP+                         
               WTELAWTK+WTELAWTM+WTELAWTN+WTELAWTO+WTELAWTQ+                    
               GBLLOKELAP+SPWAITELAP+FUNCWAIT)), 31, 3),                        
   MIN(DATETIME),MAX(DATETIME)                                                  
       FROM DMRPR.DMRAPDTL                                                      
       WHERE DATE = DATE(DAYS(CURRENT DATE)-1)                                  
       AND TIME BETWEEN '08.00.00' AND '20.00.00'                               
       AND PKGFLAG = 'PKG '                                                     
       GROUP BY LOCATION,SUBSYSTEM,PKGFLAG,DATE,EXECLOCATION,                   
                PROGRAMNAME,COLLECTIONID;                                       
