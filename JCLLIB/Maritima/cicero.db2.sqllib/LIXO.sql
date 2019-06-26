SELECT  A.CDCHSVEI,     A.CDMTVRCS,  A.CDPLCVEIALF,                     00010099
        A.CDPLCVEINUM,  A.CDSUC,     A.CDCOR,                           00020099
        A.CDCOL,        A.NMCOR,     A.CDRMOBAS,                        00030099
        A.NRAPO,        A.NRITE,     A.NREDS,                           00040099
        A.CDSGR,        A.NMSGR,     A.NRVST,                           00050099
        A.DTMOV,        A.NRSINAUT,  A.NRSINRCF,                        00060099
        A.NMTEIRMT,     A.TPSITSSP,  A.CDPESRSPINC,                     00070099
        A.CDPESRSPALT,  A.NMDPT,     A.DTINC,                           00080099
        MAX(DTHOR)                                                      00090099
FROM    DB2USER.BEMVEICULOSSP  A                                        00100099
WHERE   A.CDCHSVEI = '9BFZCE9V39BB20332'                                00110099
GROUP BY                                                                00120099
A.CDCHSVEI,     A.CDMTVRCS,  A.CDPLCVEIALF,                             00130099
        A.CDPLCVEINUM,  A.CDSUC,     A.CDCOR,                           00140099
        A.CDCOL,        A.NMCOR,     A.CDRMOBAS,                        00150099
        A.NRAPO,        A.NRITE,     A.NREDS,                           00160099
        A.CDSGR,        A.NMSGR,     A.NRVST,                           00170099
        A.DTMOV,        A.NRSINAUT,  A.NRSINRCF,                        00180099
        A.NMTEIRMT,     A.TPSITSSP,  A.CDPESRSPINC,                     00190099
        A.CDPESRSPALT,  A.NMDPT,     A.DTINC,                           00200099
        A.DTHOR                                                         00210099
