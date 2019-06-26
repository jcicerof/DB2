/* REXX */                                                              00010001
                                                                        00020000
/* Cria membros contendo os comandos LOAD tablespace                    00030001
   Processo de copia para o iSeries                                     00040000
                                                                        00041000
   Autor: Jose Cicero                                                   00042000
   email: josecicerofilho@hotmail.com                                   00043000
   data:  nov/06                                                        00044001
*/                                                                      00050000
trace off                                                               00050110
parse arg tblspace ',' owner .                                          00050208
file.input = 'DB2P.ISERIES.'tblspace'.TXT'                              00052001
file.output = 'DB2P.ISERIES.LOAD'                                       00053001
                                                                        00054000
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00060000
/*"ALLOC FILE(infile) DDNAME(INFILE) SHR"*/                             00060103
                                                                        00060200
record. = ''                                                            00061000
output. = ''                                                            00061101
if owner = '' then owner = "NONE"                                       00061207
                                                                        00062001
"EXECIO * DISKR infile (stem record."                                   00063101
                                                                        00063201
do i = 1 to record.0                                                    00064001
    select                                                              00065004
      when strip(substr(record.i, 1, 4)) = "LOAD" then do               00065104
         output.1 = "LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND"  00065204
         output.2 = "     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL"  00065309
         output.3 = "     ENFORCE NO"                                   00065409
         j = 3                                                          00065509
         end                                                            00065609
      when strip(substr(record.i, 2, 4)) = "WHEN" then do               00065709
            nop   /* despreza linha */                                  00065809
         end                                                            00065909
      when strip(substr(record.i, 2, 4)) = "INTO" then do               00066009
         j = j + 1                                                      00066109
         output.j = substr(record.i, 1, 13)||owner||,                   00066209
                    substr(record.i, 22, 58)                            00066309
         end                                                            00066409
      otherwise                                                         00066509
         j = j + 1                                                      00066609
         output.j = record.i                                            00066709
    end                                                                 00067004
    "EXECIO * DISKR infile (stem record."                               00068005
/*  if strip(substr(record.i, 1, 4)) = "LOAD" then do                   00071004
       output.1 = "LOAD DATA INDDN SYSREC LOG NO REPLACE NOCOPYPEND"    00080004
       output.2 = "     STATISTICS TABLE(ALL) INDEX(ALL) UPDATE(ALL)"   00080101
       j = 2                                                            00080201
       end                                                              00080301
    else if strip(substr(record.i, 2, 4)) = "WHEN" then do              00080601
            nop   /* despreza linha */                                  00080701
         end                                                            00080801
         else do                                                        00080901
              j = j + 1                                                 00081001
              output.j = record.i                                       00081101
         end                                                            00081801
    "EXECIO * DISKR infile (stem record." */                            00082004
end                                                                     00083001
                                                                        00084001
dsname = file.output'('tblspace')'                                      00180001
"ALLOC DA('"dsname"') File(outfile) SHR REUSE"                          00190000
"EXECIO" j "DISKW outfile (stem output. FINIS"                          00200000
