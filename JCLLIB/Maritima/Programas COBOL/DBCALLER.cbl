       IDENTIFICATION   DIVISION.                                       00000010
       PROGRAM-ID.      DBCALLER.                                       00000020
      *----------------------------------------------------------------*00000030
      * ADMINISTRACAO DE BANCO DE DADOS                                *00000040
      *                                                                *00000050
      * AUTOR:          IVANA/VALERIA                                  *00000060
      * ADAPTACAO:      JOSE CICERO                                    *00000070
      * DATA:           24/04/97                                       *00000080
      * OBJETIVOS:                                                     *00000090
      *   FAZER INTERFACE ENTRE APLICACOES CSP E SUBROTINAS COBOL      *00000100
      *                                                                *00000110
      * PROCEDIMENTO:                                                  *00000120
      *   ESTA APLICACAO E CHAMADA PELA APLICACAO CSP, E DINAMICAMENTE *00000130
      * CHAMA A SUBROTINA NECESSARIA.                                  *00000140
      *----------------------------------------------------------------*00000150
       DATA             DIVISION.                                       00000160
      *----------------------------------------------------------------*00000170
      *                                                                *00000180
      *----------------------------------------------------------------*00000190
       LINKAGE          SECTION.                                        00000200
       01  DFHCOMMAREA.                                                 00000210
           03  APPL-PTR                 POINTER.                        00000220
           03  LINK-PTR                 POINTER.                        00000230
                                                                        00000240
       01  LINK-APPL                    PIC  X(08).                     00000250
       01  LINK-AREA                    PIC  X(4096).                   00000260
      *----------------------------------------------------------------*00000270
      *                                                                *00000280
      *----------------------------------------------------------------*00000290
       PROCEDURE  DIVISION.                                             00000300
           SET   ADDRESS  OF  LINK-APPL  TO  APPL-PTR.                  00000310
           SET   ADDRESS  OF  LINK-AREA  TO  LINK-PTR.                  00000320
           CALL  LINK-APPL  USING  LINK-AREA.                           00000330
           GOBACK.                                                      00000340
