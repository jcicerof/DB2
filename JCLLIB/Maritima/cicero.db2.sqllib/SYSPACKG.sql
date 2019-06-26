  SELECT COUNT(*)                                                       00010002
    FROM SYSIBM.SYSPACKAGE                                              00020001
  WHERE EXPLAIN = 'Y'                                                   00030000
    AND VALID= 'Y'                                                      00031003
    AND OPERATIVE = 'Y'                                                 00032005
  WITH UR;                                                              00040000
