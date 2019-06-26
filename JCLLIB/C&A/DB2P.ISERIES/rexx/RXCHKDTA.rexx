/* REXX */                                                              00010002
                                                                        00020002
/* Cria membros contendo a translate da tabelas DB2 para serem usadas   00030002
   durante o processo de copia para o iSeries                           00040002
                                                                        00041002
   Autor: Jose Cicero                                                   00042002
   email: josecicerofilho@hotmail.com                                   00043002
   data:  jun/06                                                        00044002
*/                                                                      00045002
trace off                                                               00046002
file.input = 'DB2P.ISERIES.SAIDA.REXX'                                  00047002
file.output = 'DB2P.ISERIES.CHECKDTA'                                   00048002
                                                                        00049002
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00050002
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00060002
                                                                        00060102
record. = ''                                                            00060202
line.   = ''                                                            00060302
                                                                        00060402
"EXECIO * DISKR infile (stem record."                                   00060502
tsname = strip(substr(record.1, 81, 8))                                 00060602
j = 0                                                                   00060802
                                                                        00060902
do i = 1 to record.0                                                    00061002
   tsname   = strip(substr(record.i, 81, 8))                            00062002
   output.1 = strip(substr(record.i, 1, 80))                            00063002
                                                                        00064002
   say 'Processando 'tsname                                             00070002
   dsname = file.output'('tsname')'                                     00080002
   "ALLOC DA('"dsname"') File(outfile) SHR REUSE"                       00090002
   "EXECIO 1 DISKW outfile (stem output. FINIS"                         00100002
   "EXECIO * DISKR infile (stem record."                                00150002
end                                                                     00160002
                                                                        00170002
say 'Processando 'tsname                                                00171002
dsname = file.output'('tsname')'                                        00172002
"ALLOC DA('"dsname"') File(outfile) SHR REUSE"                          00173002
"EXECIO 1 DISKW outfile (stem output. FINIS"                            00174002
