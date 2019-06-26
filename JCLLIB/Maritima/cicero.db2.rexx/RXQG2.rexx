/* REXX */                                                              00010000
                                                                        00020000
/* Monta os cartoes DD para o IEFBR14 para catalogacao de fitas         00030010
                                                                        00050000
   Autor: Jose Cicero                                                   00060000
   email: josecicerofilho@hotmail.com                                   00070000
   data:  out/08                                                        00080000
*/                                                                      00090000
trace off                                                               00100004
                                                                        00110000
"ALLOC DA('CICERO.JESYSMSG.MARTA') FILE(infile) SHR"                    00120009
"ALLOC FILE(outfile) DDNAME(OUTFILE) SHR"                               00130000
                                                                        00140000
linha1 = '//DD1  DD DSN='                                               00150006
linha2 = '// DISP=(OLD,CATLG),UNIT=VSM,VOL=SER='                        00151006
"EXECIO 1 DISKR infile"                                                 00210000
rcode = rc                                                              00220000
do until rcode = 2   /* ate EOF */                                      00230000
   parse pull record                                                    00240000
   select                                                               00370001
     when strip(substr(record, 2, 7)) = 'IEC205I' then do               00380003
          /* acha o sinal de igual apos a string FILESEQ */             00380101
          label = substr(record,index(record,'=')+1,4)                  00380206
           "EXECIO 1 DISKR infile"                                      00380301
           rcode = rc                                                   00380401
          end                                                           00381001
     when strip(substr(record, 2, 4)) = 'DSN=' then do                  00382003
          /* DSN=dataset,VOLS=volume */                                 00382101
          i = index(record,',VOLS=')                                    00382201
          dsname = substr(record,6,i-6)                                 00382305
          vol    = substr(record,i+6,6)                                 00382401
          say linha1||dsname||','                                       00382506
          say linha2||vol||',LABEL=('||label||',SL)'                    00382607
           "EXECIO 1 DISKR infile"                                      00382806
           rcode = rc                                                   00382906
          end                                                           00383001
     otherwise                                                          00491001
           "EXECIO 1 DISKR infile"                                      00492001
           rcode = rc                                                   00493001
   end                                                                  00500001
end                                                                     00620000
