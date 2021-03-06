SELECT DISTINCT
       CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID ,
       NAME,VCATNAME
  FROM SYSIBM.SYSSTOGROUP
WHERE NAME IN (
'ARNE',
'ARNG',
'ARNL',
'ARNQ',
'ARNX',
'HRNE',
'HRNL',
'HRNQ',
'HRNX',
'PIPE',
'PIPF',
'PIPL',
'PIPQ',
'PIPX',
'PERE',
'POLE',
'HIPE',
'HIPF',
'HIPG',
'HIPL',
'HIPQ',
'HIPX',
'FLSE',
'FLSG',
'FLSL',
'FLSQ',
'FLSX',
'QSTE',
'QSTQ',
'UDTE',
'UDTQ',
'UDTX',
'KLUE',
'KLUQ',
'PUTE',
'PUTQ',
'EDSE',
'EDSX',
'EPAE',
'EPAG',
'AGIE',
'AGIL',
'AGIQ',
'AGIX',
'CLIE',
'CLIQ',
'CLIX',
'FSCE',
'FSCG',
'FSCQ',
'FSEE',
'FSFE',
'FSHE',
'FSIE',
'FSUQ',
'DDSE',
'DDSG',
'DDSQ',
'DDSX')
;

SELECT CHAR(STRIP(GETVARIABLE('SYSIBM.SSID')),4) AS SSID ,
       T.CREATOR, T.NAME, T.DBNAME, T.TSNAME, G.NAME, G.VCATNAME
  FROM SYSIBM.SYSTABLES T,
       SYSIBM.SYSTABLEPART P,
       SYSIBM.SYSSTOGROUP G
WHERE T.TYPE ='T'
  AND T.DBNAME = P.DBNAME
  AND T.TSNAME = P.TSNAME
  AND P.STORNAME = G.NAME
  AND G.NAME IN (
'ARNE',
'ARNG',
'ARNL',
'ARNQ',
'ARNX',
'HRNE',
'HRNL',
'HRNQ',
'HRNX',
'PIPE',
'PIPF',
'PIPL',
'PIPQ',
'PIPX',
'PERE',
'POLE',
'HIPE',
'HIPF',
'HIPG',
'HIPL',
'HIPQ',
'HIPX',
'FLSE',
'FLSG',
'FLSL',
'FLSQ',
'FLSX',
'QSTE',
'QSTQ',
'UDTE',
'UDTQ',
'UDTX',
'KLUE',
'KLUQ',
'PUTE',
'PUTQ',
'EDSE',
'EDSX',
'EPAE',
'EPAG',
'AGIE',
'AGIL',
'AGIQ',
'AGIX',
'CLIE',
'CLIQ',
'CLIX',
'FSCE',
'FSCG',
'FSCQ',
'FSEE',
'FSFE',
'FSHE',
'FSIE',
'FSUQ',
'DDSE',
'DDSG',
'DDSQ',
'DDSX')
;
