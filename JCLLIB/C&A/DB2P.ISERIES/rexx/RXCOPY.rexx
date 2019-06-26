/* rexx */                                                              00010000
                                                                        00020000
/* Cria membros contendo os comandos COPY tablespace                    00030001
   Processo de copia para o iSeries                                     00040000
                                                                        00041000
   Autor: Jose Cicero                                                   00042000
   email: josecicerofilho@hotmail.com                                   00043000
   data:  jun/06                                                        00044000
*/                                                                      00050000
trace off                                                               00050100
parse arg cmdtype .                                                     00050200
file.input = 'DB2P.ISERIES.'cmdtype'.TXT'                               00052000
file.output = 'DB2P.ISERIES.'cmdtype                                    00053000
                                                                        00054000
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00060000
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00060100
                                                                        00060200
record. = ''                                                            00061000
line.   = ''                                                            00062000
                                                                        00063000
"EXECIO * DISKR infile (stem record."                                   00070000
line.tsname      = strip(substr(record.1, 81, 8))                       00071002
line.prev.tsname = line.tsname                                          00080000
j = 0                                                                   00080100
                                                                        00081000
do i = 1 to record.0                                                    00090000
   line.tsname = strip(substr(record.i, 81, 8))                         00091002
   line.CMD    = strip(substr(record.i, 1, 80))                         00092000
                                                                        00094000
   if  line.prev.tsname = line.tsname then do                           00100000
       j = j + 1                                                        00101000
       output.j = '  'line.CMD                                          00110000
       end                                                              00111000
   else do                                                              00120000
       say 'Processando 'line.prev.tsname                               00121000
       dsname = file.output'('line.prev.tsname')'                       00121100
       "ALLOC DA('"dsname"') File(outfile) SHR REUSE"                   00121200
       "EXECIO" j "DISKW outfile (stem output. FINIS"                   00122000
       j = 1                                                            00131000
       output.j = '  'line.CMD                                          00131200
       line.prev.tsname = line.tsname                                   00131300
       end                                                              00160000
   "EXECIO * DISKR infile (stem record."                                00161000
end                                                                     00170000
                                                                        00171000
say 'Processando 'line.prev.tsname                                      00172000
dsname = file.output'('line.prev.tsname')'                              00180000
"ALLOC DA('"dsname"') File(outfile) SHR REUSE"                          00190000
"EXECIO" j "DISKW outfile (stem output. FINIS"                          00200000
