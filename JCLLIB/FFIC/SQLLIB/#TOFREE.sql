-- FREE INVALID PLANS                                                   00001001
  SELECT 'FREE   PLAN(' CONCAT STRIP(NAME, B) CONCAT ')'                00010000
     FROM SYSIBM.SYSPLAN                                                00020000
    WHERE VALID = 'N'                                                   00030000
    ORDER BY 1                                                          00040000
  ;                                                                     00050000
-- FREE INVALID PACKAGES                                                00060001
SELECT  CASE WHEN TYPE = 'T'                                            00070000
               THEN 'FREE   TRIGGER PACKAGE('                           00080000
               ELSE 'FREE   PACKAGE('                                   00090000
        END CONCAT                                                      00100000
        CASE WHEN LOCATION <> ' '                                       00110000
               THEN STRIP(LOCATION, B) CONCAT '.'                       00120000
               ELSE ''                                                  00130000
        END                                                             00140000
        CONCAT STRIP(COLLID, B) CONCAT '.'                              00150000
        CONCAT STRIP(NAME, B) CONCAT                                    00160000
        CASE WHEN VERSION <> ' '                                        00170000
               THEN '.(' CONCAT STRIP(VERSION, B) CONCAT ')'            00180000
               ELSE ''                                                  00190000
        END                                                             00200000
        CONCAT ')'                                                      00210000
   FROM SYSIBM.SYSPACKAGE                                               00220000
  WHERE VALID = 'N'                                                     00230000
  ORDER BY 1                                                            00240000
;                                                                       00250000
