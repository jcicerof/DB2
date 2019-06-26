SELECT DISTINCT                                                         00010005
'GRANT SELECT,INSERT,DELETE,UPDATE ON TECINFOR.CTLENVCOT TO '||         00011011
STRIP(GRANTEE)||';'                                                     00011106
 FROM SYSIBM.SYSTABAUTH                                                 00012005
WHERE TTNAME = 'ORCAMENTO'                                              00020009
  AND GRANTEETYPE <> 'P'                                                00030003
