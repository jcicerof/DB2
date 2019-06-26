  SELECT                                                                00010000
   SUBSTR(TCREATOR,1,7) || '.' ||                                       00020000
   SUBSTR(TTNAME,1,16)      AS TABLE,                                   00030000
   SUBSTR(GRANTEE,1,8)      AS GRANTEE,                                 00040000
          GRANTEETYPE       AS TYP,                                     00050000
          DELETEAUTH,                                                   00060000
          INSERTAUTH,                                                   00070000
          SELECTAUTH,                                                   00080000
          UPDATEAUTH                                                    00090000
  FROM      SYSIBM.SYSTABAUTH                                           00100000
   WHERE TTNAME    IN (                                                 00110000
                       'CLFT_POLICY_TERM ',                             00120000
                       'CLIENT_ADDRESS   ',                             00130000
                       'CLIENT_LICENSE   ',                             00140000
                       'CLIENT_PHONE     ',                             00150000
                       'CLIENT_POLICY    ',                             00160000
                       'CLIENT_TAB       ',                             00170000
                       'CLIENT_UCT       ',                             00180000
                       'CLT_ADD_NAME_TEXT',                             00190000
                       'CLT_ADR_RELATION ',                             00200000
                       'CLT_ADR_SEARCH   ',                             00210000
                       'CLT_CLT_RELATION ',                             00220000
                       'CLT_OBJ_RELATION ',                             00230000
                       'CLT_OTHER_OBJECTS',                             00240000
                       'CLT_OWNING_SYSTEM',                             00250000
                       'CLT_REF_RELATION ',                             00260000
                       'CLT_TABLE_ID_GEN ',                             00270000
                       'INDIVIDUAL_CLIENT'                              00280000
                           )                                            00290000
     AND TCREATOR  IN ('DB2CERT','DB2ACP4')                             00300000
     AND GRANTEETYPE <> 'P'                                             00310000
   ORDER BY 1, 3 DESC, 2                                                00320000
  WITH UR;                                                              00330000
