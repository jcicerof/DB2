/* REXX */                                                              00010000
                                                                        00020000
/* Cria membros contendo a translate da tabelas DB2 para serem usadas   00030000
   durante o processo de copia para o iSeries                           00040000
                                                                        00050000
   Autor: Jose Cicero                                                   00060000
   email: josecicerofilho@hotmail.com                                   00070000
   data:  jun/06                                                        00080000
*/                                                                      00090000
trace i                                                                 00100003
file.input = 'JR.DSN1LOGP.SYSSUMRY'                                     00110000
file.output = 'CICERO.DB2.JCLLIB(LIXO23)'                               00120001
                                                                        00130000
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00140000
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00150000
                                                                        00160000
record. = ''                                                            00170000
line.   = ''                                                            00180000
                                                                        00181000
"EXECIO * DISKR infile (stem record."                                   00182000
j = 0                                                                   00184000
                                                                        00185000
say 'Processando ' record.0 ' lines'                                    00185100
                                                                        00185200
do i = 1 to record.0                                                    00186000
   if strip(substr(record.i, 1, 8)) = 'DSN1151I' then do                00187000
       j=j+1                                                            00187100
       output.j = strip(substr(record.i, 1, 130))                       00188000
       end                                                              00189000
   else do                                                              00189100
        if strip(substr(record.i, 57, 8)) = 'MOVPARCL' then do          00189200
           j=j+1                                                        00189400
           output.j = strip(substr(record.i, 1, 130))                   00189500
           end                                                          00189600
        end                                                             00189700
   dsname = file.output                                                 00189800
   "ALLOC DA('"dsname"') File(outfile) SHR REUSE"                       00189900
   "EXECIO 1 DISKW outfile (stem output. FINIS"                         00190000
   "EXECIO * DISKR infile (stem record."                                00190100
end                                                                     00190200
                                                                        00190300
say 'Processando '                                                      00190400
dsname = file.output                                                    00190500
"ALLOC DA('"dsname"') File(outfile) SHR REUSE"                          00191000
"EXECIO 1 DISKW outfile (stem output. FINIS"                            00200000
