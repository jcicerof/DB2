/* REXX */                                                              00010000
                                                                        00020000
/* Altera comando LOAD tablespace                                       00030000
   Autor: Jose Cicero                                                   00042000
   email: josecicerofilho@hotmail.com                                   00043000
   data:  jan/07                                                        00044000
*/                                                                      00050000
trace i                                                                 00050103
                                                                        00060200
record. = ''                                                            00061000
output. = ''                                                            00061100
j = 0                                                                   00061205
                                                                        00062000
"EXECIO * DISKR SYSPUNCH (stem record."                                 00063101
                                                                        00063200
do i = 1 to record.0                                                    00064000
    select                                                              00065000
      when strip(substr(record.i, 1, 8)) = "TEMPLATE" then do           00065107
         template = strip(substr(record.i, 10, 8))                      00065207
         j = j + 1                                                      00065308
         output.j = record.i                                            00065408
         end                                                            00065800
      when strip(substr(record.i, 1, 4)) = "LOAD" then do               00065907
         j = j + 1                                                      00066007
   output.j = "LOAD DATA INDDN" template "LOG NO REPLACE NOCOPYPEND"    00066107
         j = j + 1                                                      00066207
         output.j = "     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL"  00066307
         j = j + 1                                                      00066407
         output.j = "     ENFORCE NO"                                   00066507
         end                                                            00066607
      otherwise                                                         00066707
         j = j + 1                                                      00066807
         output.j = record.i                                            00066907
    end                                                                 00067000
    "EXECIO * DISKR infile (stem record."                               00068000
end                                                                     00083000
                                                                        00084000
"EXECIO" j "DISKW edtpunch (stem output. FINIS"                         00200001
