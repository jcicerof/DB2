--
-- INCLUDE TABLESPACE DBNAME.TSNAME -- CREATOR.NAME
--
 SELECT
 ' INCLUDE TABLESPACE '||STRIP(T.DBNAME)||'.'||STRIP(T.TSNAME)||' --'||
 STRIP(T.CREATOR)||'.'||STRIP(T.NAME),
 INTEGER(T.CARDF) AS CARDF,S.PARTITIONS
   FROM SYSIBM.SYSTABLES T,
        SYSIBM.SYSTABLESPACE S
  WHERE T.DBNAME = S.DBNAME
    AND T.TSNAME = S.NAME
    AND T.TYPE = 'T'
    AND STRIP(T.CREATOR)||'.'||STRIP(T.NAME) IN (
        'DB2ACPT.CLIENT_TAB',
        'DB2ACPT.CLIENT_POLICY',
        'DB2ACPT.CLT_ADR_SEARCH',
        'DB2ACPT.CLT_ADR_RELATION',
        'DB2ACPT.CLT_OBJ_RELATION',
        'DB2ACPT.CLT_REF_RELATION',
        'DB2ACPT.CLT_CLT_RELATION',
        'DB2ACPT.CLIENT_ADDRESS')
;
FIM;
 SELECT
 ' INCLUDE TABLESPACE '||STRIP(DBNAME)||'.'||STRIP(NAME)
 , NACTIVE
   FROM SYSIBM.SYSTABLESPACE
  WHERE DBNAME IN (
                     'DMAC1P02',
                     'DMAC1P03',
                     'DMAC1P04',
                     'DMAC1P05',
                     'DMAC1P06',
                     'DMAC1P07',
                     'DMAC1P08',
                     'DMAC1P09',
                     'DMAC1P11',
                     'DMAC1P12',
                     'DMAC1P13',
                     'DMAP1P01',
                     'DMAP1P02',
                     'DMAP1P03',
                     'DMAP1P04',
                     'DMAP1P05',
                     'DMAP1P06',
                     'DMAP1P07',
                     'DMAP1P08',
                     'DMAP1P09',
                     'DMAP1P10',
                     'DMAP1P11',
                     'DMAP1P12',
                     'DMAP1P13',
                     'DMAR1P00')
    AND NAME IN (
                    'SCGS1P00',
                    'SSAS1P06',
                    'SSAS1P06',
                    'SSBS1P07',
                    'SSBS1P07',
                    'SSCS1P07',
                    'SSCS1P07',
                    'SSDS1P08',
                    'SSDS1P08',
                    'SSES1P08',
                    'SSES1P08',
                    'SSFS1P09',
                    'SSFS1P09',
                    'SSGS1P09',
                    'SSGS1P09',
                    'SSHS1P11',
                    'SSIS1P10',
                    'SSJS1P11',
                    'SSJS1P11',
                    'SSKS1P11',
                    'SSKS1P11',
                    'SSLS1P12',
                    'SSLS1P12',
                    'SSMS1P12',
                    'SSMS1P12',
                    'SSNS1P13',
                    'SSNS1P13',
                    'SSSS1P01',
                    'SS1S1P02',
                    'SS1S1P02',
                    'SS2S1P02',
                    'SS2S1P02',
                    'SS3S1P03',
                    'SS3S1P03',
                    'SS4S1P03',
                    'SS4S1P03',
                    'SS5S1P04',
                    'SS5S1P04',
                    'SS6S1P04',
                    'SS6S1P04',
                    'SS7S1P05',
                    'SS7S1P05',
                    'SS8S1P05',
                    'SS8S1P05',
                    'SS9S1P06',
                    'SS9S1P06');
