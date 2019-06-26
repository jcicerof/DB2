/* rexx */                                                              00010000
                                                                        00020000
/* Inclui cartao JOB a cada quebra                                      00030001
   Processo de copia para o iSeries                                     00040000
                                                                        00041000
   Autor: Jose Cicero                                                   00042000
   email: josecicerofilho@hotmail.com                                   00043000
   data:  jun/06                                                        00044000
*/                                                                      00050000
trace off                                                               00050100
parse arg .                                                             00050202
file.output = 'DB2P.ISERIES.JCL(JCLCOPY)'                               00053002
                                                                        00054000
/*"ALLOC DA('"file.input"') File(infile) SHR REUSE"*/                   00060000
"ALLOC FILE(infile) DDNAME(INFILE) SHR"                                 00060100
                                                                        00060200
record. = ''                                                            00061000
line.   = ''                                                            00062000
                                                                        00063000
"EXECIO * DISKR infile (stem record."                                   00070000
maxrec = record.0                                                       00080006
j = 0                                                                   00080303
i = 1                                                                   00080406
jobnum = 1                                                              00080509
                                                                        00081000
do until i > maxrec;                                                    00090006
   j = j + 1                                                            00090203
   jobname = 'SDBCOP'                                                   00090309
   output.j = '//SDBCOP19 JOB ,'CICERO',CLASS=S,MSGCLASS=X,'||,         00090409
              'NOTIFY=&SYSUID'                                          00090503
   j = j + 1                                                            00090603
   output.j = '//         JCLLIB ORDER=(DB2P.ISERIES.PROCLIB)'          00090703
   j = j + 1                                                            00090803
   output.j = '//         SET DT=060830'                                00090903
   j = j + 1                                                            00091003
   output.j = '//*'                                                     00091103
                                                                        00091203
   do k = 1 to 50                                                       00091308
       line.JCL    = strip(substr(record.i, 1, 80))                     00092006
       j = j + 1                                                        00101000
       i = i + 1                                                        00101106
       say 'Processando ' j                                             00102002
       output.j = line.JCL                                              00110002
   end                                                                  00111002
   j = j + 1                                                            00111107
   output.j = '//*'                                                     00111207
end                                                                     00112002
                                                                        00112102
say 'Processando '                                                      00112202
dsname = file.output                                                    00112302
"ALLOC DA('"dsname"') File(outfile) SHR REUSE"                          00112402
"EXECIO" j "DISKW outfile (stem output. FINIS"                          00112502
