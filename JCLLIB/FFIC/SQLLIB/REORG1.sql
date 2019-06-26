SELECT A.CREATOR, A.NAME,                                               00150013
       STRIP(B.VCATNAME)||'.DSNDBD.'||                                  00160013
       STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)                            00170009
  FROM SYSIBM.SYSTABLES A ,                                             00180006
       SYSIBM.SYSTABLEPART B                                            00181006
 WHERE A.CREATOR = 'DB2CERT'                                            00190006
   AND A.TYPE = 'T'                                                     00200006
   AND A.NAME IN ('CLIENT_CROSS_REF' ,                                  00210006
                'CLIENT_PHONE'     ,                                    00220006
                'CLIENT_TAB'       ,                                    00230006
                'CLT_ADR_RELATION' ,                                    00240006
                'CLT_CLT_RELATION' ,                                    00250006
                'CLT_OBJ_RELATION' ,                                    00260006
                'CLT_OTHER_OBJECTS',                                    00270006
                'CLT_REF_RELATION' ,                                    00280006
                'CLIENT_ADDRESS')                                       00290006
   AND A.DBNAME = B.DBNAME                                              00291006
   AND A.TSNAME = B.TSNAME                                              00292007
;                                                                       00300006
