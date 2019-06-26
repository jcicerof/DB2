/* REXX */                                                              00010000
                                                                        00020000
/* Faz uma varredura em arquivo de saida do IDCAMS para determinar      00030000
   o HI-A-RBA e HI-U-RBA                                                00040000
                                                                        00050000
   Autor: Jose Cicero                                                   00060000
   email: josecicerofilho@hotmail.com                                   00070000
   data:  out/08                                                        00080000
*/                                                                      00090000
trace off                                                               00100004
                                                                        00130000
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00150000
                                                                        00160000
record. = ''                                                            00170000
output. = ''                                                            00180000
j = 0                                                                   00230000
"EXECIO * DISKR infile (stem record."                                   00231000
do i = 1 to record.0                                                    00250000
/* say 'Processando 'record.i */                                        00251000
   if strip(substr(record.i, 7, 2)) = '1_' then do                      00260003
      saida = translate(record.i,' ','|')                               00261001
      saida = substr(word(saida,2),1,80,' ')' '||,                      00261105
              right(word(saida,3),10,'0')' '||,                         00261207
              word(saida,4)' '||,                                       00261306
              word(saida,5)                                             00261406
      j = j + 1                                                         00261508
      output.j = saida                                                  00261608
      saida = ' '                                                       00261708
      end                                                               00261800
   "EXECIO * DISKR infile (stem record."                                00300000
end                                                                     00320000
/* say 'Gravando ' */                                                   00450000
"ALLOC FILE(outfile) DDNAME(OUTFILE) NEW"                               00460009
"EXECIO" j "DISKW outfile (stem output. FINIS"                          00480000
