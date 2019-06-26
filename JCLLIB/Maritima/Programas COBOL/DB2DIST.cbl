DATA SET NAME   MATCH (DB2D*)                VOLSER  MEMS ORG RECFM BLKSZ LRECL
P.LIBR.MASTER                                MRT005     1  DA F     27998     0
   MODULE   STATUS   PSWD LAST MODIFIED PROGRAMMER      LANG  SSTAT  BLKS  RECS
   DB2DIST  *COPY         981125111831  CICERO           CS   TEST    1     150
       IDENTIFICATION DIVISION.                                         00000010
       PROGRAM-ID.    DB2DIST.                                          00000020
      *----------------------------------------------------------------*00000030
      * AUTOR: JOSE CICERO                                             *00000040
      * DATA:  NOV/1998                                                *00000050
      * OBJETIVOS: DISTRIBUICAO DAS TABELAS X NPAGES                   *00000060
      *----------------------------------------------------------------*00000070
       DATA DIVISION.                                                   00000080
       WORKING-STORAGE SECTION.                                         00000090
      *----------------------------------------------------------------*00000100
      *                                                                *00000110
      *----------------------------------------------------------------*00000120
       01  SYSTABLES.                                                   00000130
           02  SYSTABLES-CREATOR            PIC  X(08).                 00000140
           02  SYSTABLES-NAME.                                          00000150
               49  SYSTABLES-NAME-L         PIC S9(04) COMP.            00000160
               49  SYSTABLES-NAME-T         PIC  X(18).                 00000170
           02  SYSTABLES-TBCREATOR          PIC  X(08).                 00000180
           02  SYSTABLES-TBNAME.                                        00000190
               49  SYSTABLES-TBNAME-L       PIC S9(04) COMP.            00000200
               49  SYSTABLES-TBNAME-T       PIC  X(18).                 00000210
           02  SYSTABLES-TYPE               PIC  X(01).                 00000220
           02  SYSTABLES-TSNAME             PIC  X(08).                 00000230
           02  SYSTABLES-NPAGES             PIC S9(09) COMP.            00000240
      *----------------------------------------------------------------*00000250
      *                                                                *00000260
      *----------------------------------------------------------------*00000270
       77  IND                    PIC S9(004)  COMP  VALUE +0.          00000280
       77  AUX-COUNT              PIC S9(009)  COMP  VALUE +0.          00000290
       77  WS-SQLCODE             PIC ----9.                            00000300
       77  ZLIMIT                 PIC ZZZZZZ9.                          00000310
       77  ZCOUNT                 PIC ZZZZ9.                            00000320
      *----------------------------------------------------------------*00000330
      *                                                                *00000340
      *----------------------------------------------------------------*00000350
       01  N88-FIM-SYSTABLES      PIC  X(01)         VALUE 'N'.         00000360
           88  FIM-SYSTABLES                         VALUE 'S'.         00000370
      *----------------------------------------------------------------*00000380
      *                                                                *00000390
      *----------------------------------------------------------------*00000400
       01  TAB-DISTRIBUICAO.                                            00000410
           02  FILLER     OCCURS  301 TIMES.                            00000420
               04  LIMIT-PAGE     PIC S9(09) COMP    VALUE +0.          00000430
               04  COUNT-TABLES   PIC S9(04) COMP    VALUE +0.          00000440
      *----------------------------------------------------------------*00000450
      *                                                                *00000460
      *----------------------------------------------------------------*00000470
           EXEC SQL INCLUDE SQLCA END-EXEC.                             00000480
      *----------------------------------------------------------------*00000490
      *                                                                *00000500
      *----------------------------------------------------------------*00000510
       PROCEDURE   DIVISION.                                            00000520
      *----------------------------------------------------------------*00000530
      *                                                                *00000540
      *----------------------------------------------------------------*00000550
       0100-0000-PRINCIPAL.                                             00000560
           PERFORM VARYING IND FROM +1 BY +1                            00000570
             UNTIL IND  GREATER  +200                                   00000580
               ADD  +50                TO   AUX-COUNT                   00000590
               MOVE AUX-COUNT          TO   LIMIT-PAGE(IND)             00000600
           END-PERFORM.                                                 00000610
                                                                        00000620
           PERFORM VARYING IND FROM +201 BY +1                          00000630
             UNTIL IND  GREATER  +300                                   00000640
               ADD  +10000             TO   AUX-COUNT                   00000650
               MOVE AUX-COUNT          TO   LIMIT-PAGE(IND)             00000660
           END-PERFORM.                                                 00000670
                                                                        00000680
           EXEC SQL                                                     00000690
                DECLARE C_SYSTABLES CURSOR FOR                          00000700
                SELECT NPAGES                                           00000710
                  FROM SYSIBM.SYSTABLES                                 00000720
                 WHERE NPAGES > 0                                       00000730
           END-EXEC.                                                    00000740
                                                                        00000750
           EXEC SQL OPEN C_SYSTABLES END-EXEC.                          00000760
           IF  SQLCODE  EQUAL  +0                                       00000770
               NEXT  SENTENCE                                           00000780
           ELSE                                                         00000790
               DISPLAY '*** ERRO NO OPEN'                               00000800
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00000810
           END-IF.                                                      00000820
                                                                        00000830
           PERFORM  0200-9999-FETCH    THRU 0200-9999-EXIT.             00000840
           PERFORM  0300-0100-PROCESSA THRU 0300-0100-EXIT              00000850
             UNTIL  FIM-SYSTABLES.                                      00000860
                                                                        00000870
           EXEC SQL CLOSE C_SYSTABLES END-EXEC.                         00000880
           IF  SQLCODE  EQUAL  +0                                       00000890
               NEXT  SENTENCE                                           00000900
           ELSE                                                         00000910
               DISPLAY '*** ERRO NO CLOSE'                              00000920
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00000930
           END-IF.                                                      00000940
                                                                        00000950
           PERFORM VARYING IND FROM +1 BY +1                            00000960
             UNTIL IND  GREATER  +301                                   00000970
               MOVE   LIMIT-PAGE(IND)       TO  ZLIMIT                  00000980
               MOVE   COUNT-TABLES(IND)     TO  ZCOUNT                  00000990
               DISPLAY  ZLIMIT '    ' ZCOUNT                            00001000
           END-PERFORM.                                                 00001010
           STOP RUN.                                                    00001020
                                                                        00001030
       0100-0000-EXIT. EXIT.                                            00001040
      *----------------------------------------------------------------*00001050
      *                                                                *00001060
      *----------------------------------------------------------------*00001070
       0200-9999-FETCH.                                                 00001080
           EXEC SQL                                                     00001090
                FETCH C_SYSTABLES                                       00001100
                 INTO :SYSTABLES-NPAGES                                 00001110
           END-EXEC.                                                    00001120
           IF  SQLCODE  EQUAL  +0                                       00001130
               NEXT  SENTENCE                                           00001140
           ELSE                                                         00001150
               IF  SQLCODE  EQUAL  +100                                 00001160
                   MOVE   'S'          TO   N88-FIM-SYSTABLES           00001170
               ELSE                                                     00001180
                   DISPLAY '*** ERRO NO FETCH'                          00001190
                   PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT     00001200
               END-IF                                                   00001210
           END-IF.                                                      00001220
       0200-9999-EXIT. EXIT.                                            00001230
      *----------------------------------------------------------------*00001240
      *                                                                *00001250
      *----------------------------------------------------------------*00001260
       0300-0100-PROCESSA.                                              00001270
           PERFORM VARYING IND FROM +1 BY +1                            00001280
             UNTIL IND  GREATER +300                                    00001290
                OR SYSTABLES-NPAGES <= LIMIT-PAGE(IND)                  00001300
           END-PERFORM.                                                 00001310
           ADD  +1                 TO   COUNT-TABLES(IND).              00001320
                                                                        00001330
           PERFORM  0200-9999-FETCH    THRU 0200-9999-EXIT.             00001340
       0300-0100-EXIT. EXIT.                                            00001350
      *----------------------------------------------------------------*00001360
      *                                                                *00001370
      *----------------------------------------------------------------*00001380
       9999-9999-ERRO-DB2.                                              00001390
           MOVE    SQLCODE  TO  WS-SQLCODE.                             00001400
           DISPLAY '*** ERRO PROG. DB2DIST ' WS-SQLCODE.                00001410
           DISPLAY '    SQLSTATE: ' SQLSTATE.                           00001420
           DISPLAY '    SQLERRMC: ' SQLERRMC.                           00001430
           EXEC SQL                                                     00001440
                ROLLBACK WORK                                           00001450
           END-EXEC.                                                    00001460
           MOVE    8                   TO   RETURN-CODE.                00001470
           STOP RUN.                                                    00001480
       9999-9999-EXIT. EXIT.                                            00001490
                                                                       00001500
