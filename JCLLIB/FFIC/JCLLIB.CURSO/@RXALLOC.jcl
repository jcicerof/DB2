/* REXX */

/* Faz uma varredura em arquivo de saida do IDCAMS para determinar
   o HI-A-RBA e HI-U-RBA

   Autor: Jose Cicero
   email: jose.cicero@live.com
   data:  out/08
*/
trace off

"ALLOC FILE(infile) DDNAME(INFILE) SHR"

record. = ''
output. = ''
j = 0
"EXECIO * DISKR infile (stem record."
do i = 1 to record.0
/* say 'Processando 'record.i */
   if strip(substr(record.i, 2, 4)) = 'DATA' then do
      /* gravar anterior */
      if j > 0 then do
         output.j = substr(dataset,1,44,' ')' 'hi_a_rba' 'hi_u_rba||,
              ' 'substr(word(translate(dataset,' ','.'), 3), 1, 8)||,
              ' 'substr(word(translate(dataset,' ','.'), 4), 1, 8)||,
              ' 'extents
      end
      /* salva atual */
      dataset = strip(substr(record.i, 18, 44))
      j = j + 1
      end
   else if strip(substr(record.i, 38, 8)) = 'HI-A-RBA' then do
           hi_a_rba = strip(substr(record.i, 46, 16))
           /* limpar os hifens */
           hi_a_rba = translate(hi_a_rba,'0','-')
           end
        else if strip(substr(record.i, 38, 8)) = 'HI-U-RBA' then do
                hi_u_rba = strip(substr(record.i, 46, 16))
                /* limpar os hifens */
                hi_u_rba = translate(hi_u_rba,'0','-')
             end
             else if strip(substr(record.i, 67, 7)) = 'EXTENTS' then do
                     extents = strip(substr(record.i, 81, 10))
                     /* limpar os hifens */
                     extents = translate(extents,'0','-')
                  end
   "EXECIO * DISKR infile (stem record."
end

/* ultimo registro processado */
output.j = substr(dataset,1,44,' ')' 'hi_a_rba' 'hi_u_rba||,
     ' 'substr(word(translate(dataset,' ','.'), 3), 1, 8)||,
     ' 'substr(word(translate(dataset,' ','.'), 4), 1, 8)||,
     ' 'extents
/* say 'Gravando ' */
"ALLOC FILE(outfile) DDNAME(OUTFILE) SHR"
"EXECIO" j "DISKW outfile (stem output. FINIS"
