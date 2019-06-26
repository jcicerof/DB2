SELECT * FROM DB2CERT.PLAN_TABLE                                        00010000
 WHERE PROGNAME LIKE 'CDI%'                                             00020000
   AND CREATOR = 'DB2CERT'                                              00030000
   AND ACCESSTYPE ='R'                                                  00040001
   AND PROGNAME IN (                                                    00050002
'CDITREAD', 'CDITSRCH','CDI0002X',                                      00060002
'CDI0CHK', 'CDI0F17', 'CDITFFID', 'CDITGNAC')                           00070002
   AND TNAME IN (                                                       00080003
   'CDI_PA_PARR', 'ARCH_LOK_RUP', 'CLIENT_LICENSE',                     00090003
   'CLIENT_TAX', 'CLIENT_TAB',                                          00091003
   'CLT_TABLE_ID_GEN')                                                  00100003
