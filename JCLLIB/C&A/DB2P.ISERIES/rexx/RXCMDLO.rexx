/* REXX */                                                              00010001
                                                                        00020000
/* Inclui cartao JOB a cada quebra                                      00030000
   Processo de copia para o iSeries                                     00040000
                                                                        00041000
   Autor: Jose Cicero                                                   00042000
   email: josecicerofilho@hotmail.com                                   00043000
   data:  jun/06                                                        00044000
*/                                                                      00050000
trace off                                                               00050100
parse arg .                                                             00050200
file.output = 'DB2P.ISERIES.JCL(JCLCMDLO)'                              00053000
                                                                        00054000
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00060000
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00060100
                                                                        00060200
record. = ''                                                            00061000
line.   = ''                                                            00062000
                                                                        00063000
"EXECIO * DISKR infile (stem record."                                   00070000
maxrec = record.0                                                       00080000
j = 0                                                                   00080300
i = 1                                                                   00080400
jobnum = 1                                                              00080500
                                                                        00081000
do until i > maxrec;                                                    00090000
   j = j + 1                                                            00090200
   jobname = 'SDBCOP'                                                   00090300
   output.j = '//SDBCOP19 JOB ,'CICERO',CLASS=S,MSGCLASS=X,'||,         00090400
              'NOTIFY=&SYSUID'                                          00090500
   j = j + 1                                                            00090600
   output.j = '//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)'          00090700
   j = j + 1                                                            00091000
   output.j = '//*'                                                     00091100
                                                                        00091200
   do k = 1 to 20                                                       00091300
       line.JCL    = strip(substr(record.i, 1, 80))                     00092000
       j = j + 1                                                        00101000
       i = i + 1                                                        00101100
       say 'Processando ' i                                             00102002
       output.j = line.JCL                                              00110000
   end                                                                  00111000
   j = j + 1                                                            00111100
   output.j = '//*'                                                     00111200
end                                                                     00112000
                                                                        00112100
say 'Processando ' i                                                    00112202
dsname = file.output                                                    00112300
"ALLOC DA('"dsname"') File(outfile) SHR REUSE"                          00112400
"EXECIO" j "DISKW outfile (stem output. FINIS"                          00112500
