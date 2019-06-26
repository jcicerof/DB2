/* REXX */                                                              00010000
                                                                        00020000
/* Altera comando LOAD tablespace                                       00030000
   Autor: Jose Cicero                                                   00042000
   email: josecicerofilho@hotmail.com                                   00043000
   data:  jan/07                                                        00044000
*/                                                                      00050000
trace i                                                                 00050100
/* parse arg tblspace ',' owner .               */                      00050200
/* file.input = 'CICERO.DB2.'tblspace'.TXT'     */                      00052000
/* file.output = 'CICERO.DB2.LOAD'              */                      00053000
                                                                        00054000
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00060000
/*"ALLOC FILE(infile) DDNAME(INFILE) SHR"*/                             00060100
                                                                        00060200
record. = ''                                                            00061000
output. = ''                                                            00061100
/* if owner = '' then owner = "NONE" */                                 00061200
                                                                        00062000
"EXECIO * DISKR SYSPUNCH (stem record."                                 00063100
                                                                        00063200
do i = 1 to record.0                                                    00064000
    select                                                              00065000
      when strip(substr(record.i, 1, 4)) = "LOAD" then do               00065100
         output.1 = "LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND"  00065200
         output.2 = "     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL"  00065300
         output.3 = "     ENFORCE NO"                                   00065400
         j = 3                                                          00065500
         end                                                            00065600
      when strip(substr(record.i, 2, 4)) = "WHEN" then do               00065700
            nop   /* despreza linha */                                  00065800
         end                                                            00065900
      when strip(substr(record.i, 2, 4)) = "INTO" then do               00066000
         j = j + 1                                                      00066100
         output.j = record.i                                            00066200
/*       output.j = substr(record.i, 1, 13)||owner||,                   00066300
                    substr(record.i, 22, 58) */                         00066400
         end                                                            00066500
      otherwise                                                         00066600
         j = j + 1                                                      00066700
         output.j = record.i                                            00066800
    end                                                                 00067000
    "EXECIO * DISKR infile (stem record."                               00068000
/*  if strip(substr(record.i, 1, 4)) = "LOAD" then do                   00071000
       output.1 = "LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND"    00080000
       output.2 = "     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE(ALL)"   00080100
       j = 2                                                            00080200
       end                                                              00080300
    else if strip(substr(record.i, 2, 4)) = "WHEN" then do              00080600
            nop   /* despreza linha */                                  00080700
         end                                                            00080800
         else do                                                        00080900
              j = j + 1                                                 00081000
              output.j = record.i                                       00081100
         end                                                            00081800
    "EXECIO * DISKR infile (stem record." */                            00082000
end                                                                     00083000
                                                                        00084000
/* dsname = file.output'('tblspace')' */                                00180000
/* "ALLOC DA('"dsname"') File(outfile) SHR REUSE" */                    00190000
"EXECIO" j "DISKW edtpunch (stem output. FINIS"                         00200000
