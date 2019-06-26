SELECT '-STO DB('||STRIP(NAME)||') SP(*) AT(COMMIT)'                    00010003
  FROM SYSIBM.SYSDATABASE                                               00020006
 WHERE NAME IN ('12345678',                                             00030006
                  'XXXXXXXX');                                          00040006
                                                                        00041004
                                                                        00042004
SELECT '-STA DB('||STRIP(NAME)||') SP(*)'                               00050004
  FROM SYSIBM.SYSDATABASE                                               00060004
 WHERE NAME IN ('12345678',                                             00070006
                  'XXXXXXXX');                                          00080006
