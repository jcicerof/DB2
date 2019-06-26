/* REXX */                                                              00010000
                                                                        00020000
/* Faz uma varredura em arquivo de saida do IDCAMS para determinar      00030000
   o HI-A-RBA e HI-U-RBA                                                00040000
                                                                        00050000
   Autor: Jose Cicero                                                   00060000
   email: josecicerofilho@hotmail.com                                   00070000
   data:  out/08                                                        00080000
*/                                                                      00090000
trace off                                                               00100040
                                                                        00110000
"ALLOC DA('CICERO.DB2.RPTMVIEW.ORACLE') FILE(infile) SHR"               00120013
"ALLOC FILE(outfile) DDNAME(OUTFILE) SHR"                               00130021
                                                                        00140000
lidas = 0                                                               00150030
processadas = 0                                                         00160030
descartadas = 0                                                         00170030
record = ''                                                             00180013
output = ''                                                             00190013
j = 1                                                                   00200001
"EXECIO 1 DISKR infile"                                                 00210015
rcode = rc                                                              00220015
do until rcode = 2   /* ate EOF */                                      00230027
   parse pull record                                                    00240013
   lidas = lidas + 1                                                    00250030
   if strip(substr(record, 1, 3)) <> 'SQL' & ,                          00260039
      strip(substr(record, 1, 3)) <> 'LOC' & ,                          00270039
      strip(substr(record, 1, 3)) <> '   ' & ,                          00280039
      strip(substr(record, 1, 3)) <> '---' & ,                          00290039
      strip(substr(record, 1, 3)) <> '165' then do                      00300034
       processadas = processadas + 1                                    00310034
       dia = strip(substr(record, 28, 2))                               00320034
       mes = strip(substr(record, 31, 3))                               00330018
       ano = strip(substr(record, 35, 2))                               00340018
       ANTES  = substr(record, 1, 27)                                   00350021
       DEPOIS = substr(record, 37,55)                                   00360021
                                                                        00361041
       select                                                           00370021
         when mes = 'JAN' then mes='01'                                 00380021
         when mes = 'FEB' then mes='02'                                 00390021
         when mes = 'MAR' then mes='03'                                 00400021
         when mes = 'APR' then mes='04'                                 00410021
         when mes = 'MAY' then mes='05'                                 00420021
         when mes = 'JUN' then mes='06'                                 00430021
         when mes = 'JUL' then mes='07'                                 00440021
         when mes = 'AUG' then mes='08'                                 00450021
         when mes = 'SEP' then mes='09'                                 00460021
         when mes = 'OCT' then mes='10'                                 00470021
         when mes = 'NOV' then mes='11'                                 00480021
         when mes = 'DEC' then mes='12'                                 00490021
         otherwise say 'OUTRO MES ' record                              00491035
       end                                                              00500021
       ISODATE = '20'||ano||'-'||mes||'-'||dia                          00510021
    output.1 = substr(ANTES,1,26,' ')||ISODATE||substr(DEPOIS,1,90,' ') 00520026
    "EXECIO 1 DISKW outfile (stem output."                              00530024
   end                                                                  00540018
   else do                                                              00550032
        descartadas = descartadas + 1                                   00560032
        say record                                                      00570032
        end                                                             00580032
                                                                        00590032
   "EXECIO 1 DISKR infile"                                              00600032
   rcode = rc                                                           00610032
end                                                                     00620032
say 'LIDAS:' lidas                                                      00630032
say 'PROC :' processadas                                                00640032
say 'DESC :' descartadas                                                00650032
exit 0                                                                  00660021
