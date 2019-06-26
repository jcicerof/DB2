--UNLOAD TABLESPACE DCLI0M00.SCEN0M00 PUNCHDDN SPUN UNLDDN SREC         00010000
 -- FROMCOPY DBA5.C026654A.IC.DCLI0M00.SCEN0M00.D2010331                00020000
SELECT                                                                  00021001
CHAR('--'||STRIP(B.CREATOR)||'.'||STRIP(B.NAME)||' '||                  00022001
     CHAR(TIMESTAMP),80),                                               00023001
A.DBNAME, A.TSNAME, 0                                                   00024001
FROM SYSIBM.SYSCOPY A,                                                  00025001
     SYSIBM.SYSTABLES B                                                 00026001
WHERE STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME) IN (                        00029301
     'DUBS0P00.SAAS0P00',                                               00029401
     'DUBS0P00.SAPS0P00',                                               00029501
     'DUBS0P00.SKCS0P00',                                               00029601
     'DUBS0P00.SKTS0P00',                                               00029701
     'DUBS0P00.SBAS0P00',                                               00029801
     'DUBS0P00.SDBS0P00',                                               00029901
     'DUBS0P00.SSLS0P00',                                               00030001
     'DUBS0P00.SBSS0P00',                                               00030101
     'DUBS0P00.SBRS0P00',                                               00030201
     'DUBS0P00.SCAS0P00',                                               00030301
     'DUBS0P00.SCCS0P00',                                               00030401
     'DUBS0P00.SCXS0P00',                                               00030501
     'DUBS0P00.SCMS0P00',                                               00030601
     'DUBS0P00.SPMS0P00',                                               00030701
     'DUBS0P00.SCPS0P00',                                               00030801
     'DUBS0P00.SBIS0P00',                                               00030901
     'DUBS0P00.SFIS0P00',                                               00031001
     'DUBS0P00.SDCS0P00',                                               00031101
     'DUBS0P00.SDIS0P00',                                               00031201
     'DUBS0P00.SDPS0P00',                                               00031301
     'DUBS0P00.SDSS0P00',                                               00031401
     'DUBS0P00.SIVS0P00',                                               00031501
     'DUBS0P00.SIAS0P00',                                               00031601
     'DUBS0P00.SICS0P00',                                               00031701
     'DUBS0P00.SIPS0P00',                                               00031801
     'DUBS0P00.SISS0P00',                                               00031901
     'DUBS0P00.SSDS0P00',                                               00032001
     'DUBS0P00.SITS0P00',                                               00032101
     'DUBS0P00.SNMS0P00',                                               00032201
     'DUBS0P00.SPRS0P00',                                               00032301
     'DUBS0P00.SBPS0P00',                                               00032401
     'DUBS0P00.SRCS0P00',                                               00032501
     'DUBS0P00.SRAS0P00',                                               00032601
     'DUBS0P00.SRTS0P00',                                               00032701
     'DUBS0P00.SRDS0P00',                                               00032801
     'DUBS0P00.SRES0P00',                                               00032901
     'DUBS0P00.SRSS0P00',                                               00033001
     'DUBS0P00.SSBS0P00',                                               00033101
     'DUBS0P00.SSHS0P00',                                               00033201
     'DUBS0P00.SSCS0P00',                                               00033301
     'DUBS0P00.SSAS0P00',                                               00033401
     'DUBS0P00.SSIS0P00',                                               00033501
     'DUBS0P00.STXS0P00',                                               00033601
     'DUBS0P00.STSS0P00')                                               00033701
  AND A.ICDATE = '151010'                                               00033801
  AND A.ICTYPE = 'F'                                                    00033901
  AND A.ICBACKUP= ' '                                                   00034001
  AND A.DSNAME LIKE 'UBSE%'                                             00034101
  AND B.DBNAME = A.DBNAME                                               00034201
  AND B.TSNAME = A.TSNAME                                               00034301
  AND B.TYPE = 'T'                                                      00034401
UNION ALL                                                               00034601
SELECT                                                                  00035000
CHAR('UNLOAD TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(TSNAME)||          00040000
' PUNCHDDN SPUN UNLDDN SREC',80), DBNAME, TSNAME, 1                     00050002
FROM SYSIBM.SYSCOPY                                                     00060000
WHERE STRIP(DBNAME)||'.'||STRIP(TSNAME) IN (                            00070000
     'DUBS0P00.SAAS0P00',                                               00071000
     'DUBS0P00.SAPS0P00',                                               00072000
     'DUBS0P00.SKCS0P00',                                               00073000
     'DUBS0P00.SKTS0P00',                                               00074000
     'DUBS0P00.SBAS0P00',                                               00075000
     'DUBS0P00.SDBS0P00',                                               00076000
     'DUBS0P00.SSLS0P00',                                               00077000
     'DUBS0P00.SBSS0P00',                                               00078000
     'DUBS0P00.SBRS0P00',                                               00079000
     'DUBS0P00.SCAS0P00',                                               00079100
     'DUBS0P00.SCCS0P00',                                               00079200
     'DUBS0P00.SCXS0P00',                                               00079300
     'DUBS0P00.SCMS0P00',                                               00079400
     'DUBS0P00.SPMS0P00',                                               00079500
     'DUBS0P00.SCPS0P00',                                               00079600
     'DUBS0P00.SBIS0P00',                                               00079700
     'DUBS0P00.SFIS0P00',                                               00079800
     'DUBS0P00.SDCS0P00',                                               00079900
     'DUBS0P00.SDIS0P00',                                               00080000
     'DUBS0P00.SDPS0P00',                                               00080100
     'DUBS0P00.SDSS0P00',                                               00080200
     'DUBS0P00.SIVS0P00',                                               00080300
     'DUBS0P00.SIAS0P00',                                               00080400
     'DUBS0P00.SICS0P00',                                               00080500
     'DUBS0P00.SIPS0P00',                                               00080600
     'DUBS0P00.SISS0P00',                                               00080700
     'DUBS0P00.SSDS0P00',                                               00080800
     'DUBS0P00.SITS0P00',                                               00080900
     'DUBS0P00.SNMS0P00',                                               00081000
     'DUBS0P00.SPRS0P00',                                               00081100
     'DUBS0P00.SBPS0P00',                                               00081200
     'DUBS0P00.SRCS0P00',                                               00081300
     'DUBS0P00.SRAS0P00',                                               00081400
     'DUBS0P00.SRTS0P00',                                               00081500
     'DUBS0P00.SRDS0P00',                                               00081600
     'DUBS0P00.SRES0P00',                                               00081700
     'DUBS0P00.SRSS0P00',                                               00081800
     'DUBS0P00.SSBS0P00',                                               00081900
     'DUBS0P00.SSHS0P00',                                               00082000
     'DUBS0P00.SSCS0P00',                                               00082100
     'DUBS0P00.SSAS0P00',                                               00082200
     'DUBS0P00.SSIS0P00',                                               00082300
     'DUBS0P00.STXS0P00',                                               00082400
     'DUBS0P00.STSS0P00')                                               00082500
  AND ICDATE = '151010'                                                 00082600
  AND ICTYPE = 'F'                                                      00083000
  AND ICBACKUP= ' '                                                     00083100
  AND DSNAME LIKE 'UBSE%'                                               00083200
UNION ALL                                                               00221000
SELECT                                                                  00230000
CHAR(' FROMCOPY '||STRIP(DSNAME),80), DBNAME, TSNAME, 2                 00250002
FROM SYSIBM.SYSCOPY                                                     00260000
WHERE STRIP(DBNAME)||'.'||STRIP(TSNAME) IN (                            00261000
     'DUBS0P00.SAAS0P00',                                               00262000
     'DUBS0P00.SAPS0P00',                                               00263000
     'DUBS0P00.SKCS0P00',                                               00264000
     'DUBS0P00.SKTS0P00',                                               00265000
     'DUBS0P00.SBAS0P00',                                               00266000
     'DUBS0P00.SDBS0P00',                                               00267000
     'DUBS0P00.SSLS0P00',                                               00268000
     'DUBS0P00.SBSS0P00',                                               00269000
     'DUBS0P00.SBRS0P00',                                               00269100
     'DUBS0P00.SCAS0P00',                                               00269200
     'DUBS0P00.SCCS0P00',                                               00269300
     'DUBS0P00.SCXS0P00',                                               00269400
     'DUBS0P00.SCMS0P00',                                               00269500
     'DUBS0P00.SPMS0P00',                                               00269600
     'DUBS0P00.SCPS0P00',                                               00269700
     'DUBS0P00.SBIS0P00',                                               00269800
     'DUBS0P00.SFIS0P00',                                               00269900
     'DUBS0P00.SDCS0P00',                                               00270000
     'DUBS0P00.SDIS0P00',                                               00270100
     'DUBS0P00.SDPS0P00',                                               00270200
     'DUBS0P00.SDSS0P00',                                               00270300
     'DUBS0P00.SIVS0P00',                                               00270400
     'DUBS0P00.SIAS0P00',                                               00270500
     'DUBS0P00.SICS0P00',                                               00270600
     'DUBS0P00.SIPS0P00',                                               00270700
     'DUBS0P00.SISS0P00',                                               00270800
     'DUBS0P00.SSDS0P00',                                               00270900
     'DUBS0P00.SITS0P00',                                               00271000
     'DUBS0P00.SNMS0P00',                                               00271100
     'DUBS0P00.SPRS0P00',                                               00271200
     'DUBS0P00.SBPS0P00',                                               00271300
     'DUBS0P00.SRCS0P00',                                               00271400
     'DUBS0P00.SRAS0P00',                                               00271500
     'DUBS0P00.SRTS0P00',                                               00271600
     'DUBS0P00.SRDS0P00',                                               00271700
     'DUBS0P00.SRES0P00',                                               00271800
     'DUBS0P00.SRSS0P00',                                               00271900
     'DUBS0P00.SSBS0P00',                                               00272000
     'DUBS0P00.SSHS0P00',                                               00272100
     'DUBS0P00.SSCS0P00',                                               00272200
     'DUBS0P00.SSAS0P00',                                               00272300
     'DUBS0P00.SSIS0P00',                                               00272400
     'DUBS0P00.STXS0P00',                                               00272500
     'DUBS0P00.STSS0P00')                                               00272600
  AND ICDATE = '151010'                                                 00272700
  AND ICTYPE = 'F'                                                      00272800
  AND ICBACKUP= ' '                                                     00272900
  AND DSNAME LIKE 'UBSE%'                                               00273000
ORDER BY 2,3,4                                                          00420003
