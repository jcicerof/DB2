/* REXX */                                                              00010000
                                                                        00020000
/* Faz uma varredura em arquivo de saida do IDCAMS para determinar      00030001
   o HI-A-RBA e HI-U-RBA                                                00040001
                                                                        00050000
   Autor: Jose Cicero                                                   00060000
   email: josecicerofilho@hotmail.com                                   00070000
   data:  out/08                                                        00080001
*/                                                                      00090000
trace off                                                               00100037
                                                                        00130000
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00150000
                                                                        00160000
record. = ''                                                            00170000
output. = ''                                                            00180011
j = 0                                                                   00230000
"EXECIO * DISKR infile (stem record."                                   00231001
do i = 1 to record.0                                                    00250000
/* say 'Processando 'record.i */                                        00251015
   if strip(substr(record.i, 2, 4)) = 'DATA' then do                    00260004
      /* gravar anterior */                                             00261001
      if j > 0 then do                                                  00261111
         output.j = substr(dataset,1,44,' ')' 'hi_a_rba' 'hi_u_rba||,   00261325
              ' 'substr(word(translate(dataset,' ','.'), 3), 1, 8)||,   00261426
              ' 'substr(word(translate(dataset,' ','.'), 4), 1, 8)||,   00261534
              ' 'extents                                                00261634
      end                                                               00261722
      /* salva atual */                                                 00262001
      dataset = strip(substr(record.i, 18, 44))                         00270005
      j = j + 1                                                         00271011
      end                                                               00280000
   else if strip(substr(record.i, 38, 8)) = 'HI-A-RBA' then do          00281004
           hi_a_rba = strip(substr(record.i, 46, 16))                   00282006
           /* limpar os hifens */                                       00282101
           hi_a_rba = translate(hi_a_rba,'0','-')                       00282321
           end                                                          00283001
        else if strip(substr(record.i, 38, 8)) = 'HI-U-RBA' then do     00284004
                hi_u_rba = strip(substr(record.i, 46, 16))              00285033
                /* limpar os hifens */                                  00286033
                hi_u_rba = translate(hi_u_rba,'0','-')                  00288033
             end                                                        00290001
             else if strip(substr(record.i, 67, 7)) = 'EXTENTS' then do 00291035
                     extents = strip(substr(record.i, 81, 10))          00292036
                     /* limpar os hifens */                             00293033
                     extents = translate(extents,'0','-')               00294033
                  end                                                   00295033
   "EXECIO * DISKR infile (stem record."                                00300001
end                                                                     00320001
                                                                        00321003
/* ultimo registro processado */                                        00321113
output.j = substr(dataset,1,44,' ')' 'hi_a_rba' 'hi_u_rba||,            00321234
     ' 'substr(word(translate(dataset,' ','.'), 3), 1, 8)||,            00321334
     ' 'substr(word(translate(dataset,' ','.'), 4), 1, 8)||,            00321434
     ' 'extents                                                         00321534
/* say 'Gravando ' */                                                   00450015
"ALLOC FILE(outfile) DDNAME(OUTFILE) SHR"                               00460032
"EXECIO" j "DISKW outfile (stem output. FINIS"                          00480000
