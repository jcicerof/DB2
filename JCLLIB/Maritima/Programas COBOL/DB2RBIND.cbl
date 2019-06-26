       IDENTIFICATION    DIVISION.                                      00000010
       PROGRAM-ID.       DB2RBIND.                                      00000020
      *----------------------------------------------------------------*00000030
      * AUTOR: ELCILENE FERNANDES                                      *00000040
      * OBJETIVO: GERAR COMANDO DE REBIND SOMENTE PARA OS MODULOS      *00000050
      *           INVALIDOS                                            *00000060
      * PROCEDIMENTO: LER A TABELA SYSIBM.SYSPACKAGE COM VALID = 'N'   *00000070
      *----------------------------------------------------------------*00000080
                                                                        00000090
       ENVIRONMENT       DIVISION.                                      00000100
       CONFIGURATION     SECTION.                                       00000110
       SPECIAL-NAMES.                                                   00000120
           DECIMAL-POINT IS  COMMA.                                     00000130
       INPUT-OUTPUT      SECTION.                                       00000140
       FILE-CONTROL.                                                    00000150
            SELECT DB2OUT  ASSIGN  DB2OUT.                              00000160
      *----------------------------------------------------------------*00000170
      *  DATA   DIVISION                                               *00000180
      *----------------------------------------------------------------*00000190
       DATA              DIVISION.                                      00000200
       FILE SECTION.                                                    00000210
       FD   DB2OUT                                                      00000220
            LABEL RECORD IS STANDARD                                    00000230
            RECORDING MODE IS F.                                        00000240
                                                                        00000250
       01   REG-OUT                    PIC X(80).                       00000260
                                                                        00000270
       WORKING-STORAGE   SECTION.                                       00000280
                                                                        00000290
      *----------------------------------------------------------------*00000300
      *    VARIAVEIS HOSTS                                             *00000310
      *----------------------------------------------------------------*00000320
       01  SYSPACKAGE-COLLID           PIC X(18).                       00000330
       01  SYSPACKAGE-NAME             PIC X(08).                       00000340
                                                                        00000350
           EXEC SQL INCLUDE  SQLCA  END-EXEC.                           00000360
      *----------------------------------------------------------------*00000370
      *     AUXILIARES                                                 *00000380
      *----------------------------------------------------------------*00000390
       01  N88-FIM-SYSPACKAGE          PIC  X(03)           VALUE 'NAO'.00000400
           88  FIM-SYSPACKAGE                               VALUE 'SIM'.00000410
                                                                        00000420
       01  TSO-DSN.                                                     00000430
           02   FILLER                 PIC  X(11) VALUE                 00000440
           'DSN SYSTEM('.                                               00000450
           02   DB2NAME                PIC  X(04).                      00000460
           02   FILLER                 PIC  X(01) VALUE ')'.            00000470
                                                                        00000480
       01   CMD-REBND.                                                  00000490
            02  FILLER                 PIC X(16)  VALUE                 00000500
            'REBIND PACKAGE ('.                                         00000510
            02    DB2-COLLECTION-DET   PIC X(08)  VALUE SPACES.         00000520
            02    FILLER               PIC X(01)  VALUE '.'.            00000530
            02    DB2-PACKAGE-DET      PIC X(08)  VALUE SPACES.         00000540
            02    FILLER               PIC X(15)  VALUE                 00000550
            ') ISOLATION(CS)'.                                          00000560
                                                                        00000570
       01  WS-SQLCODE                  PIC ----9.                       00000580
                                                                        00000590
       LINKAGE           SECTION.                                       00000600
       01  PARMJOB.                                                     00000610
           02  FILLER                 PIC  X(02).                       00000620
           02  DB2-SUBSYS             PIC  X(04).                       00000630
      *----------------------------------------------------------------*00000640
      *     PROCEDURE DIVISION                                         *00000650
      *----------------------------------------------------------------*00000660
       PROCEDURE         DIVISION      USING   PARMJOB.                 00000670
      *----------------------------------------------------------------*00000680
      *     ROTINA PRINCIPAL                                           *00000690
      *----------------------------------------------------------------*00000700
       0000-0000-PRINCIPAL.                                             00000710
           MOVE   DB2-SUBSYS                TO   DB2NAME.               00000720
           PERFORM 0100-0000-INICIALIZACAO  THRU 0100-0000-EXIT.        00000730
           PERFORM 0200-9999-FETCH-SYSPACKAGE THRU 0200-9999-EXIT.      00000740
           PERFORM 0300-0000-PROCESSA       THRU 0300-0000-EXIT         00000750
              UNTIL FIM-SYSPACKAGE.                                     00000760
           PERFORM 0400-0000-FINALIZACAO    THRU 0400-0000-EXIT.        00000770
       0000-0000-EXIT. EXIT.                                            00000780
      *----------------------------------------------------------------*00000790
      *     DECLARE DO CURSOR .                                        *00000800
      *----------------------------------------------------------------*00000810
       0100-0000-INICIALIZACAO.                                         00000820
           EXEC SQL                                                     00000830
                DECLARE  C-SYSPACKAGE CURSOR FOR                        00000840
                 SELECT COLLID, NAME                                    00000850
                   FROM SYSIBM.SYSPACKAGE                               00000860
                  WHERE VALID = 'N'                                     00000870
           END-EXEC.                                                    00000880
                                                                        00000890
           EXEC SQL                                                     00000900
                OPEN C-SYSPACKAGE                                       00000910
           END-EXEC.                                                    00000920
           IF  SQLCODE  EQUAL  +0                                       00000930
               NEXT  SENTENCE                                           00000940
           ELSE                                                         00000950
               PERFORM  9999-9999-ERRO-SQL  THRU   9999-9999-EXIT.      00000960
                                                                        00000970
           OPEN OUTPUT DB2OUT.                                          00000980
           WRITE REG-OUT          FROM TSO-DSN.                         00000990
           DISPLAY TSO-DSN.                                             00001000
       0100-0000-EXIT. EXIT.                                            00001010
      *----------------------------------------------------------------*00001020
      *     ROTINA DE LEITURA DA SYSIBM.PACKAGE.                       *00001030
      *----------------------------------------------------------------*00001040
       0200-9999-FETCH-SYSPACKAGE.                                      00001050
           EXEC SQL                                                     00001060
                FETCH C-SYSPACKAGE                                      00001070
                INTO :SYSPACKAGE-COLLID,                                00001080
                     :SYSPACKAGE-NAME                                   00001090
           END-EXEC.                                                    00001100
           IF  SQLCODE  EQUAL  +0                                       00001110
               NEXT  SENTENCE                                           00001120
           ELSE                                                         00001130
               IF  SQLCODE  EQUAL  +100                                 00001140
                   MOVE  'SIM'         TO   N88-FIM-SYSPACKAGE          00001150
               ELSE                                                     00001160
                   PERFORM  9999-9999-ERRO-SQL  THRU   9999-9999-EXIT.  00001170
       0200-9999-EXIT. EXIT.                                            00001180
      *----------------------------------------------------------------*00001190
      *     ROTINA DE IMPRESSAO DAS PACKAGES.                          *00001200
      *----------------------------------------------------------------*00001210
       0300-0000-PROCESSA.                                              00001220
           MOVE SYSPACKAGE-COLLID TO DB2-COLLECTION-DET.                00001230
           MOVE SYSPACKAGE-NAME   TO DB2-PACKAGE-DET.                   00001240
           WRITE REG-OUT          FROM CMD-REBND.                       00001250
           DISPLAY CMD-REBND.                                           00001260
                                                                        00001270
           PERFORM 0200-9999-FETCH-SYSPACKAGE THRU 0200-9999-EXIT.      00001280
       0300-0000-EXIT. EXIT.                                            00001290
      *----------------------------------------------------------------*00001300
      *     ROTINA DE FINALIZACAO DAS PACKAGES.                        *00001310
      *----------------------------------------------------------------*00001320
       0400-0000-FINALIZACAO.                                           00001330
           EXEC SQL CLOSE C-SYSPACKAGE END-EXEC.                        00001340
           IF  SQLCODE  EQUAL  +0                                       00001350
               NEXT  SENTENCE                                           00001360
           ELSE                                                         00001370
               PERFORM  9999-9999-ERRO-SQL  THRU   9999-9999-EXIT.      00001380
                                                                        00001390
           CLOSE DB2OUT.                                                00001400
                                                                        00001410
           EXEC SQL COMMIT WORK END-EXEC.                               00001420
                                                                        00001430
           STOP RUN.                                                    00001440
       0400-0000-EXIT. EXIT.                                            00001450
      *----------------------------------------------------------------*00001460
      *    ROTINA DE ERRO DE SQLCODE                                   *00001470
      *----------------------------------------------------------------*00001480
       9999-9999-ERRO-SQL.                                              00001490
           MOVE  SQLCODE   TO WS-SQLCODE.                               00001500
           DISPLAY '*** PROGRAMA : DB2REBND'.                           00001510
           DISPLAY '    ERRO GRAVE DE SQL'.                             00001520
           DISPLAY '    SQLCODE: ' WS-SQLCODE.                          00001530
           DISPLAY '    SQLSTATE: ' SQLSTATE.                           00001540
           DISPLAY '    SQLERRMC: ' SQLERRMC.                           00001550
           EXEC SQL ROLLBACK WORK END-EXEC.                             00001560
           MOVE   +16                  TO   RETURN-CODE.                00001570
           CALL 'ABENDA'.                                               00001580
           STOP RUN.                                                    00001590
       9999-9999-EXIT. EXIT.                                            00001600