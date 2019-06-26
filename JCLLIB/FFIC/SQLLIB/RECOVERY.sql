SELECT                                                                  00000101
 'RECOVER TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||' TOCOPY',   00000202
 DBNAME,TSNAME,1                                                        00000301
 FROM SYSIBM.SYSCOPY                                                    00000501
WHERE DBNAME = 'DCIA0B66'                                               00000601
  AND ICDATE = '110205'                                                 00000701
  AND TSNAME IN ('SCIS6B07'                                             00000801
            ,'SCIS6B21'                                                 00000901
            ,'SCIS6B22'                                                 00001001
            ,'SCIS6B23'                                                 00001101
            ,'SCIS6B24'                                                 00001201
            ,'SCIS6B26'                                                 00001301
            ,'SCIS6B27'                                                 00001401
            ,'SCIS6B28'                                                 00001501
            ,'SCIS6B41'                                                 00001601
            ,'SCIS6B42'                                                 00001701
            ,'SCIS6B43'                                                 00001801
            ,'SCIS6B44'                                                 00001901
            ,'SCIS6B45'                                                 00002001
            ,'SCIS6B52')                                                00003001
UNION ALL                                                               00003101
SELECT                                                                  00004001
 STRIP(DSNAME),                                                         00005001
 DBNAME,TSNAME,2                                                        00006001
 FROM SYSIBM.SYSCOPY                                                    00007001
WHERE DBNAME = 'DCIA0B66'                                               00008001
  AND ICDATE = '110205'                                                 00009001
  AND TSNAME IN ('SCIS6B07'                                             00010001
            ,'SCIS6B21'                                                 00020001
            ,'SCIS6B22'                                                 00030001
            ,'SCIS6B23'                                                 00040001
            ,'SCIS6B24'                                                 00050001
            ,'SCIS6B26'                                                 00060001
            ,'SCIS6B27'                                                 00070001
            ,'SCIS6B28'                                                 00080001
            ,'SCIS6B41'                                                 00090001
            ,'SCIS6B42'                                                 00100001
            ,'SCIS6B43'                                                 00110001
            ,'SCIS6B44'                                                 00120001
            ,'SCIS6B45'                                                 00130001
            ,'SCIS6B52')                                                00140001
ORDER BY 2,3,4                                                          00150003
