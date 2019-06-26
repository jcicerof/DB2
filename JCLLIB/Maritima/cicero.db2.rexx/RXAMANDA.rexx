/* REXX */                                                              00010000
                                                                        00020000
/* le os arquivos que a Amanda mandou dos logs e coloca na frente de    00030001
   cada linha o appl handle, para exportar para o excel                 00040001
                                                                        00050000
   Autor: Jose Cicero                                                   00060000
   email: josecicerofilho@hotmail.com                                   00070000
   data:  jul/09                                                        00080001
*/                                                                      00090000
trace off                                                               00100000
                                                                        00110000
"ALLOC DA('CICERO.DB2.AMANDA.LOCKS') FILE(infile) SHR"                  00120005
"ALLOC FILE(outfile) DDNAME(OUTFILE) SHR"                               00130000
                                                                        00140000
"EXECIO 1 DISKR infile"                                                 00210000
rcode = rc                                                              00220000
do until rcode = 2   /* ate EOF */                                      00230000
   parse pull record                                                    00240000
   record = translate(record, ' ', '0D'X)                               00241006
   select                                                               00250006
   when strip(substr(record, 1, 18)) = 'Application handle' then do     00380006
        /* acha o sinal de igual apos a string FILESEQ */               00380105
        handle = strip(substr(record, 46, 50))                          00380205
        output. = ''                                                    00380406
        output.1 = handle||' = '||record                                00380506
        "EXECIO 1 DISKW outfile (stem output."                          00380606
        "EXECIO 1 DISKR infile"                                         00380706
        rcode = rc                                                      00380806
   when strip(substr(record, 1, 16)) = 'Application name' || ,          00380906
        strip(substr(record, 1, 24)) = 'CONNECT Authorization ID' || ,  00381006
        strip(substr(record, 1, 18)) = 'Application status' || ,        00381106
        strip(substr(record, 1, 18)) = 'Status change time' || ,        00381206
        strip(substr(record, 1, 18)) = ' Lock Count       ' || ,        00381306
        strip(substr(record, 1, 18)) = ' Hold Count       ' || ,        00381406
        strip(substr(record, 1, 18)) = ' Lock Object Name ' || ,        00381506
        strip(substr(record, 1, 18)) = ' Object Type      ' || ,        00381606
        strip(substr(record, 1, 18)) = ' Tablespace Name  ' || ,        00381706
        strip(substr(record, 1, 18)) = ' Table Schema     ' || ,        00381806
        strip(substr(record, 1, 18)) = ' Table Name       ' || ,        00381906
        strip(substr(record, 1, 18)) = ' Mode             ' then do     00382006
        output. = ''                                                    00382106
        output.1 = handle||' = '||record                                00382206
        "EXECIO 1 DISKW outfile (stem output."                          00382306
        "EXECIO 1 DISKR infile"                                         00382406
        rcode = rc                                                      00382506
    otherwise                                                           00382606
        "EXECIO 1 DISKR infile"                                         00383006
        rcode = rc                                                      00383106
    end                                                                 00383206
end                                                                     00620000
