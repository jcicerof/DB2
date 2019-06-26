SELECT 'DROP ALIAS '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)||            00000118
' -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME)                            00000317
  FROM SYSIBM.SYSTABLES T                                               00000517
 WHERE T.TYPE = 'A'                                                     00000917
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (                        00001017
      'QSTPRVT.QSTT_PRIDE_CD_CONV'                                      00001117
     ,'QSTPRVT.QSTT_ISO_ADDRESS'                                        00001217
     ,'QSTPRVT.QSTT_ISO_LAT_LONG'                                       00001317
     ,'QSTPRVT.QSTT_OBJECT'                                             00001417
     ,'QSTPRVT.QSTT_TERRITORY'                                          00001517
     ,'QSTPRVT.QSTT_RISK_APPR'                                          00001617
     ,'QSTPRVT.QSTT_ISO_TABLE'                                          00001717
     ,'QSTPRVT.QSTT_COUNTY'                                             00001817
     ,'QSTTEST.QSTT_PRIDE_CD_CONV'                                      00001917
     ,'QSTTEST.QSTT_ISO_ADDRESS'                                        00002017
     ,'QSTTEST.QSTT_ISO_LAT_LONG'                                       00002117
     ,'QSTTEST.QSTT_OBJECT'                                             00002217
     ,'QSTTEST.QSTT_TERRITORY'                                          00002317
     ,'QSTTEST.QSTT_RISK_APPR'                                          00002417
     ,'QSTTEST.QSTT_ISO_TABLE'                                          00002517
     ,'QSTTEST.QSTT_COUNTY'                                             00002617
     ,'DB2PRVT.QSTT_PRIDE_CD_CONV'                                      00002717
     ,'DB2BTS.QSTT_PRIDE_CD_CONV'                                       00002817
     ,'DB2PFIX.QSTT_OBJECT'                                             00002917
     ,'PERU1MTC.QSTT_PRIDE_CD_CONV'                                     00003017
     ,'PERITMTC.QSTT_PRIDE_CD_CONV'                                     00003117
     ,'PERFVMTC.QSTT_PRIDE_CD_CONV'                                     00003217
     ,'PERFVARO.QSTT_PRIDE_CD_CONV'                                     00003317
     ,'DB2PRVT.QSTT_OBJECT')                                            00003417
;                                                                       00003517
FIM;                                                                    00003617
SELECT DISTINCT 'FREE PLAN ('||STRIP(NAME)||')'                         00003716
  FROM SYSIBM.SYSPLAN                                                   00003816
WHERE STRIP(CREATOR)||'.'||STRIP(NAME) IN (                             00003916
     'DB2BTS.QST2CLTR'                                                  00004016
    ,'DB2BTS.QST2GPRD'                                                  00004116
    ,'DB2BTS.QST2UCLT'                                                  00004216
    ,'QSTTEST.QST7BF05'                                                 00004316
    ,'DB2TEST.QST7CISO'                                                 00004416
    ,'DB2TEST.QST7GPRD'                                                 00004516
    ,'QSTTEST.QST7GQTE'                                                 00004616
    ,'QSTTEST.QST7MHRM'                                                 00004716
    ,'QSTTEST.QST7PQTE'                                                 00004816
    ,'QSTTEST.QST7RTPG'                                                 00004916
    ,'QSTTEST.QST7SRSG'                                                 00005016
    ,'QSTTEST.QST7TERR'                                                 00005116
    ,'QSTTEST.QST7TEST'                                                 00005216
    ,'DB2TEST.QST7UCLT'                                                 00005316
    ,'QSTTEST.QST7URSK'                                                 00005416
    ,'QSTTEST.QST7UTER'                                                 00005516
    ,'QSTTEST.QST7WTRC'                                                 00005616
    ,'QSTTEST.QST7ZISO'                                                 00005716
    ,'QSTPRVT.QSTBBF05'                                                 00005816
    ,'DB2PRVT.QSTBCLTR'                                                 00005916
    ,'DB2PRVT.QSTBGPRD'                                                 00006016
    ,'QSTPRVT.QSTBMHRM'                                                 00006116
    ,'DB2PRVT.QSTBUCLT'                                                 00006216
    ,'QSTPRVT.QSTBWTRC'                                                 00006316
    ,'DB2PRVT.QSTCCLTR'                                                 00006416
    ,'DB2PRVT.QSTCGPRD'                                                 00006516
    ,'DB2TEST.QSTDCLTR'                                                 00006616
    ,'DB2TEST.QSTDGPRD'                                                 00006716
    ,'DB2PFIX.QSTQGQTE'                                                 00006816
    ,'DB2PFIX.QSTQPQTE'                                                 00006916
    ,'CIE1WXD.QSTWCLTR'                                                 00007016
    ,'CIE1WXD.QSTWGPRD'                                                 00007116
    ,'QSTTEST.QSTZBF05');                                               00007216
FIM;                                                                    00007316
SELECT DISTINCT 'FREE PACKAGE ('||STRIP(COLLID)||'.'||STRIP(NAME)||')'  00007416
  FROM SYSIBM.SYSPACKAGE                                                00007516
 WHERE STRIP(OWNER)||'.'||STRIP(NAME) IN (                              00007616
      'DB2BTS.QSTTCNVP'                                                 00007716
     ,'DB2PFIX.QSTTGQTE'                                                00007816
     ,'DB2PRVT.QSTPBF05'                                                00007916
     ,'DB2PRVT.QSTPBF15'                                                00008016
     ,'DB2PRVT.QSTTCNVP'                                                00008116
     ,'DB2PRVT.QSTTDESC'                                                00008216
     ,'DB2PRVT.QSTTPQTE'                                                00008316
     ,'DB2TEST.QSTPCISO'                                                00008414
     ,'DB2TEST.QSTTDESC'                                                00008514
     ,'DB2TEST.QSTTFERI'                                                00008614
     ,'QSTPRVT.QSTOF01'                                                 00008714
     ,'QSTPRVT.QSTPBF05'                                                00008814
     ,'QSTPRVT.QSTPBF06'                                                00008914
     ,'QSTPRVT.QSTPBF15'                                                00009014
     ,'QSTPRVT.QSTPURSK'                                                00009114
     ,'QSTPRVT.QSTPUTER'                                                00009214
     ,'QSTPRVT.QSTTCNVP'                                                00009314
     ,'QSTPRVT.QSTTGCTY'                                                00009414
     ,'QSTPRVT.QSTTGLOC'                                                00009514
     ,'QSTPRVT.QSTTGQTE'                                                00009614
     ,'QSTPRVT.QSTTPLOC'                                                00009714
     ,'QSTPRVT.QSTTPTER'                                                00009814
     ,'QSTPRVT.QSTTRSKA'                                                00009914
     ,'QSTPRVT.QSTTRSKB'                                                00010014
     ,'QSTPRVT.QSTTTERR'                                                00010114
     ,'QSTTEST.QSTOF01'                                                 00010214
     ,'QSTTEST.QSTPBF05'                                                00010314
     ,'QSTTEST.QSTPBF06'                                                00010414
     ,'QSTTEST.QSTPBF15'                                                00010514
     ,'QSTTEST.QSTPUCTY'                                                00010614
     ,'QSTTEST.QSTPURSK'                                                00010714
     ,'QSTTEST.QSTPUTER'                                                00010814
     ,'QSTTEST.QSTTCNVP'                                                00010914
     ,'QSTTEST.QSTTDESC'                                                00011014
     ,'QSTTEST.QSTTFERI'                                                00011114
     ,'QSTTEST.QSTTGCTY'                                                00011214
     ,'QSTTEST.QSTTGLOC'                                                00011314
     ,'QSTTEST.QSTTGQTE'                                                00011414
     ,'QSTTEST.QSTTPLOC'                                                00011514
     ,'QSTTEST.QSTTPQTE'                                                00011614
     ,'QSTTEST.QSTTPTER'                                                00011714
     ,'QSTTEST.QSTTRSKA'                                                00011814
     ,'QSTTEST.QSTTRSKB'                                                00011914
     ,'QSTTEST.QSTTSRIO'                                                00012014
     ,'QSTTEST.QSTTTERR')                                               00012114
;                                                                       00012214
FIM;                                                                    00012314
SELECT 'INCLUDE TABLESPACE '||                                          00012407
       STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||                          00012507
' -- '||STRIP(T.CREATOR)||'.'||STRIP(T.NAME),                           00012608
S.NTABLES                                                               00013005
  FROM SYSIBM.SYSTABLES T,                                              00020005
       SYSIBM.SYSTABLESPACE S                                           00021005
 WHERE T.DBNAME = S.DBNAME                                              00030005
   AND T.TSNAME = S.NAME                                                00030106
   AND T.TYPE = 'T'                                                     00031005
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (                        00040005
      'QSTPRVT.QSTT_PRIDE_CD_CONV'                                      00050000
     ,'QSTPRVT.QSTT_ISO_ADDRESS'                                        00060000
     ,'QSTPRVT.QSTT_ISO_LAT_LONG'                                       00070000
     ,'QSTPRVT.QSTT_OBJECT'                                             00080000
     ,'QSTPRVT.QSTT_TERRITORY'                                          00090000
     ,'QSTPRVT.QSTT_RISK_APPR'                                          00100000
     ,'QSTPRVT.QSTT_ISO_TABLE'                                          00110000
     ,'QSTPRVT.QSTT_COUNTY'                                             00120000
     ,'QSTTEST.QSTT_PRIDE_CD_CONV'                                      00130000
     ,'QSTTEST.QSTT_ISO_ADDRESS'                                        00140000
     ,'QSTTEST.QSTT_ISO_LAT_LONG'                                       00150000
     ,'QSTTEST.QSTT_OBJECT'                                             00160000
     ,'QSTTEST.QSTT_TERRITORY'                                          00170000
     ,'QSTTEST.QSTT_RISK_APPR'                                          00180000
     ,'QSTTEST.QSTT_ISO_TABLE'                                          00190000
     ,'QSTTEST.QSTT_COUNTY'                                             00200000
     ,'DB2PRVT.QSTT_PRIDE_CD_CONV'                                      00210000
     ,'DB2BTS.QSTT_PRIDE_CD_CONV'                                       00220000
     ,'DB2PFIX.QSTT_OBJECT'                                             00230000
     ,'PERU1MTC.QSTT_PRIDE_CD_CONV'                                     00240000
     ,'PERITMTC.QSTT_PRIDE_CD_CONV'                                     00250000
     ,'PERFVMTC.QSTT_PRIDE_CD_CONV'                                     00260000
     ,'PERFVARO.QSTT_PRIDE_CD_CONV'                                     00270000
     ,'DB2PRVT.QSTT_OBJECT')                                            00280000
;                                                                       00281009
--DB='DQST0B00', TS='SCCS0B00';                                         00282009
SELECT 'DB='||''''||                                                    00291012
       STRIP(T.DBNAME)||''''||', TS='||''''||                           00300012
       STRIP(T.TSNAME)||''''||';'                                       00310013
  FROM SYSIBM.SYSTABLES T,                                              00330009
       SYSIBM.SYSTABLESPACE S                                           00340009
 WHERE T.DBNAME = S.DBNAME                                              00350009
   AND T.TSNAME = S.NAME                                                00360009
   AND T.TYPE = 'T'                                                     00370009
   AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (                        00380009
      'QSTPRVT.QSTT_PRIDE_CD_CONV'                                      00390009
     ,'QSTPRVT.QSTT_ISO_ADDRESS'                                        00400009
     ,'QSTPRVT.QSTT_ISO_LAT_LONG'                                       00410009
     ,'QSTPRVT.QSTT_OBJECT'                                             00420009
     ,'QSTPRVT.QSTT_TERRITORY'                                          00430009
     ,'QSTPRVT.QSTT_RISK_APPR'                                          00440009
     ,'QSTPRVT.QSTT_ISO_TABLE'                                          00450009
     ,'QSTPRVT.QSTT_COUNTY'                                             00460009
     ,'QSTTEST.QSTT_PRIDE_CD_CONV'                                      00470009
     ,'QSTTEST.QSTT_ISO_ADDRESS'                                        00480009
     ,'QSTTEST.QSTT_ISO_LAT_LONG'                                       00490009
     ,'QSTTEST.QSTT_OBJECT'                                             00500009
     ,'QSTTEST.QSTT_TERRITORY'                                          00510009
     ,'QSTTEST.QSTT_RISK_APPR'                                          00520009
     ,'QSTTEST.QSTT_ISO_TABLE'                                          00530009
     ,'QSTTEST.QSTT_COUNTY'                                             00540009
     ,'DB2PRVT.QSTT_PRIDE_CD_CONV'                                      00550009
     ,'DB2BTS.QSTT_PRIDE_CD_CONV'                                       00560009
     ,'DB2PFIX.QSTT_OBJECT'                                             00570009
     ,'PERU1MTC.QSTT_PRIDE_CD_CONV'                                     00580009
     ,'PERITMTC.QSTT_PRIDE_CD_CONV'                                     00590009
     ,'PERFVMTC.QSTT_PRIDE_CD_CONV'                                     00600009
     ,'PERFVARO.QSTT_PRIDE_CD_CONV'                                     00610009
     ,'DB2PRVT.QSTT_OBJECT')                                            00620009
