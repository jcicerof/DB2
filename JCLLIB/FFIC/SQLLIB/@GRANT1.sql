--                                                                      00000100
-- GRANTS PARA GRUPOS ZZ%                                               00000200
--                                                                      00000300
SELECT 6 AS "#REQUEST",                                                 00000517
       B.GRANTEE, A.CREATOR, A.NAME, B.GRANTEETYPE,                     00000607
       B.INSERTAUTH,B.UPDATEAUTH,B.DELETEAUTH,B.SELECTAUTH              00000707
  FROM SYSIBM.SYSTABLES A,                                              00000800
       SYSIBM.SYSTABAUTH B                                              00000900
 WHERE A.TYPE ='T'                                                      00001000
   AND A.CREATOR = B.TCREATOR                                           00001100
   AND A.CREATOR = B.TCREATOR                                           00001200
   AND A.NAME    = B.TTNAME                                             00001300
   AND B.GRANTEETYPE = ' '                                              00001400
   AND B.GRANTEETYPE <> 'P'                                             00001618
   AND A.CREATOR IN ('PERPROD')                                         00001720
   AND 'Y' IN (B.INSERTAUTH,B.DELETEAUTH,B.UPDATEAUTH)                  00001819
-- AND B.SELECTAUTH = 'Y'                                               00001919
-- AND B.GRANTEE LIKE 'ZZ%'                                             00002019
-- AND A.CREATOR IN ('DB2PRVT','DB2TEST','DB2ACPT',                     00002119
--                   'DB2PRV2','DB2TES2','DB2ACP2','DB2ACP4','DB2CERT') 00002219
-- AND A.NAME IN ('CLIENT_TAB'                                          00002319
--               ,'CLT_ADR_RELATION'                                    00002419
--               ,'CLT_CLT_RELATION'                                    00002519
--               ,'CLIENT_ADDRESS'                                      00002619
--               ,'CLT_OBJ_RELATION'                                    00002719
--               ,'CLIENT_POLICY'                                       00002819
--               ,'CLT_REF_RELATION'                                    00002919
--               ,'ARCH_LOK_RUP'                                        00003019
--               ,'CLIENT_PHONE'                                        00003119
--               ,'CLT_ADR_SEARCH')                                     00003219
 ORDER BY 2,3,4;                                                        00003514
