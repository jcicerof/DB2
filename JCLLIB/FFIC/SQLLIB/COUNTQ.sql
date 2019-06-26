--SELECT POL_RG_BR, COUNT(*)                                            00010001
--  FROM CISPROD.CPI_POLICY                                             00020001
-- GROUP BY POL_RG_BR;                                                  00030001
SELECT POL_ENTRY_YY,COUNT(*)                                            00040002
  FROM CISPROD.CPI_POLICY                                               00050001
 GROUP BY POL_ENTRY_YY;                                                 00060002
