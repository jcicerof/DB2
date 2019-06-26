SELECT   'DB2H;'||GRANTEE||';'||NAME||';DBADM;'                         00010004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00020000
DBADMAUTH  IN('Y','G')                                                  00030000
UNION SELECT 'DB2H;'||GRANTEE||';'||NAME||';DBCTRL;'                    00040004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00050000
DBCTRLAUTH IN('Y','G')  AND DBADMAUTH = ' '                             00060000
UNION SELECT 'DB2H;'||GRANTEE||';'||NAME||';DBMAINT;'                   00070004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00080000
DBMAINTAUTH IN('Y','G')  AND DBADMAUTH = ' ' AND DBCTRLAUTH = ' '       00090000
UNION SELECT 'DB2H;'||GRANTEE||';'||NAME||';LOAD;'                      00100004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00110000
LOADAUTH    IN('Y','G')  AND DBADMAUTH = ' ' AND DBCTRLAUTH = ' '       00120000
       AND DBMAINTAUTH  = ' '                                           00130000
UNION SELECT  'DB2H;'||GRANTEE||';'||NAME||';DROP;'                     00140004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00150000
DROPAUTH    IN('Y','G')  AND DBADMAUTH = ' ' AND DBCTRLAUTH = ' '       00160000
       AND DBMAINTAUTH  = ' ' AND LOADAUTH = ' '                        00170000
UNION SELECT  'DB2H;'||GRANTEE||';'||NAME||';RECOVERDB;'                00180004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00190000
RECOVERDBAUTH    IN('Y','G')  AND DBADMAUTH = ' ' AND DBCTRLAUTH = ' '  00200000
       AND DBMAINTAUTH  = ' ' AND LOADAUTH = ' ' AND DROPAUTH = ' '     00210000
UNION SELECT  'DB2H;'||GRANTEE||';'||NAME||';REPAIR;'                   00220004
       FROM SYSIBM.SYSDBAUTH WHERE                                      00230000
REPAIRAUTH  IN('Y','G')  AND DBADMAUTH = ' ' AND DBCTRLAUTH = ' '       00240000
       AND DBMAINTAUTH  = ' ' AND LOADAUTH = ' ' AND DROPAUTH = ' '     00250000
       AND RECOVERDBAUTH = ' '                                          00260000
UNION SELECT  'DB2H;'||GRANTEE||';;SYSADM;'                             00270004
  FROM SYSIBM.SYSUSERAUTH WHERE  SYSADMAUTH IN('Y','G')                 00280000
UNION     SELECT   'DB2H;'||GRANTEE||';;SYSCTRL;'                       00290004
  FROM SYSIBM.SYSUSERAUTH WHERE  SYSCTRLAUTH IN('Y','G')                00300000
UNION SELECT 'DB2H;'||GRANTEE||';;SYSOPER;'                             00310004
  FROM SYSIBM.SYSUSERAUTH WHERE  SYSOPRAUTH IN('Y','G') ;               00320000
