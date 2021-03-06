-- ./ ADD NAME=CADCRPCL,LIST=ALL                                                
-- RUNSTATS TABLESPACE DBSS01.SSFORPRE TABLE(ALL) INDEX(ALL) UPDATE ALL         
SELECT CHAR('./ ADD NAME='||STRIP(TSNAME)||',LIST=ALL',80),                     
       DBNAME,TSNAME,1                                                          
  FROM SYSIBM.SYSTABLES                                                         
 WHERE CREATOR = 'MARITIMA'                                                     
   AND TYPE = 'T'                                                               
   AND NAME IN (                                                                
'SSTIPRLAPTR',                                                                  
'SSCPVEQUIPE',                                                                  
'SSPCDEQUIPE',                                                                  
'SSDIVLHO',                                                                     
'SSGRAPTPPTR        ',                                                          
'SSGRPGLO           ',                                                          
'SSGRPMTVSAIINA     ',                                                          
'SSIDACD            ',                                                          
'SSMTVSAIINA        ',                                                          
'SSOBTMLH           ',                                                          
'SSRGMINA           ',                                                          
'SSTECUTL           ',                                                          
'SSTIPACO           ',                                                          
'SSTIPATD           ',                                                          
'SSTIPCAESOLGUI     ',                                                          
'SSTIPCNS           ',                                                          
'SSTIPDOE           ',                                                          
'SSTIPINA           ',                                                          
'SSTIPRLATPR        ',                                                          
'SSTIPSAI           ',                                                          
'SSTIPSAIGUI        ',                                                          
'SSTIPTAB           ',                                                          
'SSTIPTABPTR        ',                                                          
'SSTMPDOE           ',                                                          
'SSVIAACS           ',                                                          
'SSCNLDISGUI        ',                                                          
'SSCTLTIPGUI        ',                                                          
'SSCTLRSVGUI        ',                                                          
'SSCTLDISGUIPTR     ',                                                          
'SSGLOSAS           ',                                                          
'SSGIINSTCPMTISS    ',                                                          
'SSGIINSTCPMCID     ',                                                          
'SSGIINSTCPMOPM     ',                                                          
'SSUTLGUIPTR        ',                                                          
'SSGICOMP           ',                                                          
'SSGIPROG           ',                                                          
'SSLOTEGUIA         ',                                                          
'SSDADOCMUGUI       ',                                                          
'SSGUICONSULTAMDC   ',                                                          
'SSSERPRFSADT       ',                                                          
'SSHONMEDICOIND     ',                                                          
'SSRESUMOGUINA      ',                                                          
'SSPCDMDCREALIZADO  ',                                                          
'SSIDFEQUIPEMDC     ',                                                          
'SSOPMUTILIZADO     ',                                                          
'SSDESPESMDCADI     ',                                                          
'SSCARERRCPM        ',                                                          
'SSCAAMEMCPM        ',                                                          
'SSCAINHOCPM        ',                                                          
'SSCAPROCCPM        ',                                                          
'SSCPVEQU           ',                                                          
'SSEQUPCD           ',                                                          
'SSVENPRE           ',                                                          
'SSCACONS           ',                                                          
'SSCAHONO           ',                                                          
'SSDIVILHO          ')                                                          
UNION                                                                           
SELECT CHAR('RUNSTATS TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||         
           ' TABLE(ALL) INDEX(ALL) UPDATE ALL',80),                             
       DBNAME,TSNAME,2                                                          
  FROM SYSIBM.SYSTABLES                                                         
 WHERE CREATOR = 'MARITIMA'                                                     
   AND TYPE = 'T'                                                               
   AND NAME IN (                                                                
'SSTIPRLAPTR',                                                                  
'SSCPVEQUIPE',                                                                  
'SSPCDEQUIPE',                                                                  
'SSDIVLHO',                                                                     
'SSGRAPTPPTR        ',                                                          
'SSGRPGLO           ',                                                          
'SSGRPMTVSAIINA     ',                                                          
'SSIDACD            ',                                                          
'SSMTVSAIINA        ',                                                          
'SSOBTMLH           ',                                                          
'SSRGMINA           ',                                                          
'SSTECUTL           ',                                                          
'SSTIPACO           ',                                                          
'SSTIPATD           ',                                                          
'SSTIPCAESOLGUI     ',                                                          
'SSTIPCNS           ',                                                          
'SSTIPDOE           ',                                                          
'SSTIPINA           ',                                                          
'SSTIPRLATPR        ',                                                          
'SSTIPSAI           ',                                                          
'SSTIPSAIGUI        ',                                                          
'SSTIPTAB           ',                                                          
'SSTIPTABPTR        ',                                                          
'SSTMPDOE           ',                                                          
'SSVIAACS           ',                                                          
'SSCNLDISGUI        ',                                                          
'SSCTLTIPGUI        ',                                                          
'SSCTLRSVGUI        ',                                                          
'SSCTLDISGUIPTR     ',                                                          
'SSGLOSAS           ',                                                          
'SSGIINSTCPMTISS    ',                                                          
'SSGIINSTCPMCID     ',                                                          
'SSGIINSTCPMOPM     ',                                                          
'SSUTLGUIPTR        ',                                                          
'SSGICOMP           ',                                                          
'SSGIPROG           ',                                                          
'SSLOTEGUIA         ',                                                          
'SSDADOCMUGUI       ',                                                          
'SSGUICONSULTAMDC   ',                                                          
'SSSERPRFSADT       ',                                                          
'SSHONMEDICOIND     ',                                                          
'SSRESUMOGUINA      ',                                                          
'SSPCDMDCREALIZADO  ',                                                          
'SSIDFEQUIPEMDC     ',                                                          
'SSOPMUTILIZADO     ',                                                          
'SSDESPESMDCADI     ',                                                          
'SSCARERRCPM        ',                                                          
'SSCAAMEMCPM        ',                                                          
'SSCAINHOCPM        ',                                                          
'SSCAPROCCPM        ',                                                          
'SSCPVEQU           ',                                                          
'SSEQUPCD           ',                                                          
'SSVENPRE           ',                                                          
'SSCACONS           ',                                                          
'SSCAHONO           ',                                                          
'SSDIVILHO          ')                                                          
ORDER BY 2,3,4                                                                  
