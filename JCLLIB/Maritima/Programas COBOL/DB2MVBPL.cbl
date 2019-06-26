       IDENTIFICATION   DIVISION.                                       00000010
       PROGRAM-ID.      DB2MVBPL.                                       00000020
      *----------------------------------------------------------------*00000030
      * DATA:        NOV/1998                                          *00000040
      * AUTOR:       JOSE CICERO                                       *00000050
      * RESPONSAVEL: ADMINISTRACAO DE BANCO DE DADOS                   *00000060
      * OBJETIVOS:   GERAR COMANDOS DE ALTER BUFFER POOL PARA MOVER OS *00000070
      *              TABLESPACES E INDICES, CONFORME TABELA            *00000080
      *                                                                *00000090
      *                                                                *00000100
      * NPAGES                     DADOS      INDICES                  *00000110
      *                                                                *00000120
      * <= 50                      BP11       BP21                     *00000130
      * BETWEEN   51 AND 400       BP12       BP22                     *00000140
      * BETWEEN  401 AND 1000      BP13       BP23                     *00000150
      * BETWEEN 1000 AND 5000      BP14       BP24                     *00000160
      * > 5000                     BP15       BP25                     *00000170
      *                                                                *00000180
      * OBSERVACAO:  INTERPRETACAO DO RETURN-CODE                      *00000190
      *                                                                *00000200
      * RC           TABLESPACE            INDEX                       *00000210
      * 00             N                     N                         *00000220
      * 01             N                     Y                         *00000230
      * 10             Y                     N                         *00000240
      * 11             Y                     Y                         *00000250
      * 16            *ERRO*                *ERRO*                     *00000260
      *----------------------------------------------------------------*00000270
       ENVIRONMENT    DIVISION.                                         00000280
       CONFIGURATION  SECTION.                                          00000290
       SPECIAL-NAMES.                                                   00000300
           DECIMAL-POINT IS COMMA.                                      00000310
      *----------------------------------------------------------------*00000320
      *                                                                *00000330
      *----------------------------------------------------------------*00000340
       INPUT-OUTPUT       SECTION.                                      00000350
       FILE-CONTROL.                                                    00000360
           SELECT  ALTERTS  ASSIGN      TO  ALTERTS.                    00000370
           SELECT  ALTERIX  ASSIGN      TO  ALTERIX.                    00000380
           SELECT  OPTIONAL EXCLUDE  ASSIGN      TO  EXCLUDE.           00000390
           SELECT  ALTERLOG ASSIGN      TO  ALTERLOG.                   00000400
      *----------------------------------------------------------------*00000410
      *                                                                *00000420
      *----------------------------------------------------------------*00000430
       DATA DIVISION.                                                   00000440
      *                                                                 00000450
       FILE            SECTION.                                         00000460
       FD  ALTERTS                                                      00000470
           LABEL  RECORD  IS  OMITTED                                   00000480
           RECORDING MODE IS F.                                         00000490
                                                                        00000500
       01  REG-ALTERTS                 PIC  X(080).                     00000510
      *                                                                 00000520
       FD  ALTERIX                                                      00000530
           LABEL  RECORD  IS  OMITTED                                   00000540
           RECORDING MODE IS F.                                         00000550
                                                                        00000560
       01  REG-ALTERIX                 PIC  X(080).                     00000570
      *                                                                 00000580
       FD  EXCLUDE                                                      00000590
           LABEL  RECORD  IS  OMITTED                                   00000600
           RECORDING MODE IS F.                                         00000610
                                                                        00000620
       01  REG-EXCLUDE                 PIC  X(080).                     00000630
      *                                                                 00000640
       FD  ALTERLOG                                                     00000650
           LABEL  RECORD  IS  OMITTED                                   00000660
           RECORDING MODE IS F.                                         00000670
                                                                        00000680
       01  REG-ALTERLOG                PIC  X(080).                     00000690
      *----------------------------------------------------------------*00000700
      *                                                                *00000710
      *----------------------------------------------------------------*00000720
       WORKING-STORAGE SECTION.                                         00000730
      *----------------------------------------------------------------*00000740
      * AREAS DE TRABALHO                                              *00000750
      *----------------------------------------------------------------*00000760
       77  IND                         PIC S9(04) COMP.                 00000770
       77  IND-EXCL                    PIC S9(04) COMP.                 00000780
       77  WS-SQLCODE                  PIC ----9.                       00000790
       77  PARAMETRO-EXCL              PIC  X(80).                      00000800
       77  SEARCH-OWNER                PIC  X(20).                      00000810
       77  SEARCH-OBJECT               PIC  X(20).                      00000820
       77  COMMENT-AREA                PIC  X(80).                      00000830
                                                                        00000840
       01  STRING-AREA.                                                 00000850
           02  CHAR    OCCURS   40  TIMES        PIC  X(01).            00000860
                                                                        00000870
       01  REG-EXCL.                                                    00000880
           02  FILLER  OCCURS   200 TIMES.                              00000890
               04  OWNER-EXCL          PIC  X(20).                      00000900
               04  OBJECT-EXCL         PIC  X(20).                      00000910
                                                                        00000920
       01  CONTROLES.                                                   00000930
           02  N88-FIM-TS                        PIC  X(03) VALUE 'NAO'.00000940
               88  FIM-TS                                   VALUE 'SIM'.00000950
           02  N88-FIM-IX                        PIC  X(03) VALUE 'NAO'.00000960
               88  FIM-IX                                   VALUE 'SIM'.00000970
           02  N88-ALTER-TS                      PIC  X(03) VALUE 'NAO'.00000980
               88  ALTER-TS                                 VALUE 'SIM'.00000990
           02  N88-ALTER-IX                      PIC  X(03) VALUE 'NAO'.00001000
               88  ALTER-IX                                 VALUE 'SIM'.00001010
           02  N88-FIM-EXCLUDE                   PIC  X(03) VALUE 'NAO'.00001020
               88  FIM-EXCLUDE                              VALUE 'SIM'.00001030
           02  N88-EXCLUDE-OBJECT                PIC  X(03) VALUE 'NAO'.00001040
               88  EXCLUDE-OBJECT                           VALUE 'SIM'.00001050
           02  N88-1VEZ                          PIC  X(03) VALUE 'SIM'.00001060
               88  1VEZ                                     VALUE 'SIM'.00001070
      *----------------------------------------------------------------*00001080
      * HOSTS SYSIBM.SYSTABLES                                         *00001090
      *----------------------------------------------------------------*00001100
       01  SYSTABLES.                                                   00001110
           02  SYSTABLES-NAME.                                          00001120
               49  SYSTABLES-NAME-L         PIC S9(04) COMP.            00001130
               49  SYSTABLES-NAME-T         PIC  X(18).                 00001140
           02  SYSTABLES-CREATOR            PIC  X(08).                 00001150
           02  SYSTABLES-TYPE               PIC  X(01).                 00001160
           02  SYSTABLES-DBNAME             PIC  X(08).                 00001170
           02  SYSTABLES-TSNAME             PIC  X(08).                 00001180
           02  SYSTABLES-REMARKS.                                       00001190
               49  SYSTABLES-REMARKS-L      PIC S9(04) COMP.            00001200
               49  SYSTABLES-REMARKS-T      PIC  X(254).                00001210
           02  SYSTABLES-TBCREATOR          PIC  X(08).                 00001220
           02  SYSTABLES-TBNAME.                                        00001230
               49  SYSTABLES-TBNAME-L       PIC S9(04) COMP.            00001240
               49  SYSTABLES-TBNAME-T       PIC  X(18).                 00001250
           02  SYSTABLES-CLUSTERTYPE        PIC  X(01).                 00001260
           02  SYSTABLES-CHECKS             PIC S9(04) COMP.            00001270
           02  SYSTABLES-NPAGES             PIC S9(09) COMP.            00001280
      *----------------------------------------------------------------*00001290
      * HOSTS SYSIBM.SYSTABLESPACE                                     *00001300
      *----------------------------------------------------------------*00001310
       01  SYSTABLESPACE.                                               00001320
           02  SYSTABLESPACE-NAME           PIC  X(08).                 00001330
           02  SYSTABLESPACE-DBNAME         PIC  X(08).                 00001340
           02  SYSTABLESPACE-ERASERULE      PIC  X(01).                 00001350
           02  SYSTABLESPACE-SEGSIZE        PIC  S9(04) COMP.           00001360
           02  SYSTABLESPACE-BPOOL          PIC  X(08).                 00001370
           02  SYSTABLESPACE-LOCKRULE       PIC  X(01).                 00001380
           02  SYSTABLESPACE-PARTITIONS     PIC S9(04) COMP.            00001390
      *----------------------------------------------------------------*00001400
      * HOSTS SYSIBM.SYSINDEXES                                        *00001410
      *----------------------------------------------------------------*00001420
       01  SYSINDEXES.                                                  00001430
           02  SYSINDEXES-CREATOR           PIC  X(08).                 00001440
           02  SYSINDEXES-NAME.                                         00001450
               49  SYSINDEXES-NAME-L        PIC S9(04) COMP.            00001460
               49  SYSINDEXES-NAME-T        PIC  X(18).                 00001470
           02  SYSINDEXES-TBCREATOR         PIC  X(08).                 00001480
           02  SYSINDEXES-TBNAME.                                       00001490
               49  SYSINDEXES-TBNAME-L      PIC S9(04) COMP.            00001500
               49  SYSINDEXES-TBNAME-T      PIC  X(18).                 00001510
           02  SYSINDEXES-UNIQUERULE        PIC  X(01).                 00001520
           02  SYSINDEXES-CLUSTERING        PIC  X(01).                 00001530
           02  SYSINDEXES-BPOOL             PIC  X(08).                 00001540
           02  SYSINDEXES-ERASERULE         PIC  X(01).                 00001550
           02  SYSINDEXES-INDEXTYPE         PIC  X(01).                 00001560
           02  SYSINDEXES-COLCOUNT          PIC S9(04) COMP.            00001570
           02  SYSINDEXES-NPAGES            PIC S9(09) COMP.            00001580
      *----------------------------------------------------------------*00001590
      * COMANDOS ALTER BUFFERPOOL                                      *00001600
      *----------------------------------------------------------------*00001610
       01  ALTER-TABLESPACE.                                            00001620
           02  FILLER                       PIC  X(17) VALUE            00001630
               'ALTER TABLESPACE '.                                     00001640
           02  TABLESPACE                   PIC  X(18).                 00001650
           02  FILLER                       PIC  X(11) VALUE            00001660
               'BUFFERPOOL '.                                           00001670
           02  BPOOL                        PIC  X(04).                 00001680
           02  FILLER                       PIC  X(01) VALUE ';'.       00001690
                                                                        00001700
       01  ALTER-INDEX.                                                 00001710
           02  FILLER                       PIC  X(12) VALUE            00001720
               'ALTER INDEX '.                                          00001730
           02  INDEXNAME                    PIC  X(39).                 00001740
           02  FILLER                       PIC  X(11) VALUE            00001750
               'BUFFERPOOL '.                                           00001760
           02  BPOOL                        PIC  X(04).                 00001770
           02  FILLER                       PIC  X(01) VALUE ';'.       00001780
      *----------------------------------------------------------------*00001790
      * RELATORIO DO LOG                                               *00001800
      *----------------------------------------------------------------*00001810
       01  LOG-CAB1.                                                    00001820
           02  FILLER                       PIC  X(80) VALUE            00001830
               'DBALTGEN     Administracao de Banco de Dados'.          00001840
       01  LOG-CAB2.                                                    00001850
           02  FILLER                       PIC  X(80) VALUE            00001860
               'Movimentacao de Buffer Pools'.                          00001870
       01  LOG-CAB3.                                                    00001880
           02  FILLER                       PIC  X(06) VALUE 'Data.:'.  00001890
           02  CAB3-DATA                    PIC  X(10).                 00001900
       01  LOG-CAB4.                                                    00001910
           02  FILLER                       PIC  X(29) VALUE 'Objeto'.  00001920
           02  FILLER                       PIC  X(80) VALUE            00001930
               'Origem     Destino    NPAGES'.                          00001940
                                                                        00001950
       01  LOG-MSG.                                                     00001960
           02  OBJETO-SQL                   PIC  X(28).                 00001970
           02  FILLER                       PIC  X(03) VALUE SPACES.    00001980
           02  BPOOL-I                      PIC  X(08).                 00001990
           02  FILLER                       PIC  X(03) VALUE SPACES.    00002000
           02  BPOOL-F                      PIC  X(04).                 00002010
           02  FILLER                       PIC  X(02) VALUE SPACES.    00002020
           02  NPAGES                       PIC  Z.ZZZ.ZZ9.             00002030
      *----------------------------------------------------------------*00002040
      *                                                                *00002050
      *----------------------------------------------------------------*00002060
           EXEC SQL INCLUDE SQLCA END-EXEC.                             00002070
      *----------------------------------------------------------------*00002080
      *                                                                *00002090
      *----------------------------------------------------------------*00002100
       PROCEDURE   DIVISION.                                            00002110
       0100-0000-INICIO.                                                00002120
           MOVE   +0                   TO  RETURN-CODE.                 00002130
           OPEN  OUTPUT  ALTERTS, ALTERIX, ALTERLOG.                    00002140
                                                                        00002150
           PERFORM  1000-0100-LOAD-EXCL  THRU 1000-0100-EXIT.           00002160
           PERFORM  0200-0100-TABLESPACE THRU 0200-0100-EXIT.           00002170
           PERFORM  0500-0100-INDEX      THRU 0500-0100-EXIT.           00002180
                                                                        00002190
           CLOSE  ALTERTS, ALTERIX, ALTERLOG.                           00002200
           IF  ALTER-TS                                                 00002210
               ADD   +10               TO  RETURN-CODE                  00002220
           END-IF.                                                      00002230
           IF  ALTER-IX                                                 00002240
               ADD   +1                TO  RETURN-CODE                  00002250
           END-IF.                                                      00002260
           STOP  RUN.                                                   00002270
       0100-0000-EXIT. EXIT.                                            00002280
      *----------------------------------------------------------------*00002290
      *                                                                *00002300
      *----------------------------------------------------------------*00002310
       0200-0100-TABLESPACE.                                            00002320
           EXEC SQL                                                     00002330
                DECLARE C_TS CURSOR FOR                                 00002340
                SELECT B.DBNAME, B.TSNAME, A.BPOOL, B.NPAGES            00002350
                  FROM SYSIBM.SYSTABLESPACE A,                          00002360
                       SYSIBM.SYSTABLES B                               00002370
                 WHERE B.TSNAME = A.NAME                                00002380
                   AND B.DBNAME = A.DBNAME                              00002390
                   AND A.BPOOL NOT IN ('BP0', 'BP31','BP32K')           00002400
           END-EXEC.                                                    00002410
                                                                        00002420
           EXEC SQL OPEN C_TS END-EXEC.                                 00002430
           IF  SQLCODE  EQUAL  +0                                       00002440
               NEXT  SENTENCE                                           00002450
           ELSE                                                         00002460
               DISPLAY '*** ERRO NO OPEN C_TS'                          00002470
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00002480
           END-IF.                                                      00002490
                                                                        00002500
           PERFORM  0300-9999-FETCH-TS THRU 0300-9999-EXIT.             00002510
           PERFORM  0400-0300-TRATA-TS THRU 0400-0300-EXIT              00002520
             UNTIL  FIM-TS.                                             00002530
                                                                        00002540
           EXEC SQL CLOSE C_TS END-EXEC.                                00002550
           IF  SQLCODE  EQUAL  +0                                       00002560
               NEXT  SENTENCE                                           00002570
           ELSE                                                         00002580
               DISPLAY '*** ERRO NO CLOSE C_TS'                         00002590
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00002600
           END-IF.                                                      00002610
       0200-0100-EXIT. EXIT.                                            00002620
      *----------------------------------------------------------------*00002630
      *                                                                *00002640
      *----------------------------------------------------------------*00002650
       0300-9999-FETCH-TS.                                              00002660
           EXEC SQL                                                     00002670
                FETCH C_TS                                              00002680
                 INTO :SYSTABLES-DBNAME, :SYSTABLES-TSNAME,             00002690
                      :SYSTABLESPACE-BPOOL, :SYSTABLES-NPAGES           00002700
           END-EXEC.                                                    00002710
           IF  SQLCODE  EQUAL  +0                                       00002720
               NEXT  SENTENCE                                           00002730
           ELSE                                                         00002740
             IF  SQLCODE  EQUAL  +100                                   00002750
                 MOVE  'SIM'           TO  N88-FIM-TS                   00002760
             ELSE                                                       00002770
                 DISPLAY '*** ERRO NO FETCH C_TS'                       00002780
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00002790
             END-IF                                                     00002800
           END-IF.                                                      00002810
       0300-9999-EXIT. EXIT.                                            00002820
      *----------------------------------------------------------------*00002830
      * TRATA ALTER TABLESPACE                                         *00002840
      *----------------------------------------------------------------*00002850
       0400-0300-TRATA-TS.                                              00002860
           MOVE   SYSTABLES-DBNAME      TO  SEARCH-OWNER.               00002870
           MOVE   SYSTABLES-TSNAME      TO  SEARCH-OBJECT.              00002880
           PERFORM 1200-9999-SEARCH  THRU  1200-9999-EXIT.              00002890
           IF  EXCLUDE-OBJECT                                           00002900
               MOVE 'BP1'         TO  BPOOL OF ALTER-TABLESPACE         00002910
           ELSE                                                         00002920
             EVALUATE TRUE                                              00002930
               WHEN SYSTABLES-NPAGES    <= 50                           00002940
                    MOVE 'BP11'         TO  BPOOL OF ALTER-TABLESPACE   00002950
               WHEN SYSTABLES-NPAGES    >  50                           00002960
                AND SYSTABLES-NPAGES    <= 400                          00002970
                    MOVE 'BP12'         TO  BPOOL OF ALTER-TABLESPACE   00002980
               WHEN SYSTABLES-NPAGES    >  400                          00002990
                AND SYSTABLES-NPAGES    <= 1000                         00003000
                    MOVE 'BP13'         TO  BPOOL OF ALTER-TABLESPACE   00003010
               WHEN SYSTABLES-NPAGES    >  1000                         00003020
                AND SYSTABLES-NPAGES    <= 5000                         00003030
                    MOVE 'BP14'         TO  BPOOL OF ALTER-TABLESPACE   00003040
               WHEN SYSTABLES-NPAGES    >  5000                         00003050
                    MOVE 'BP15'         TO  BPOOL OF ALTER-TABLESPACE   00003060
             END-EVALUATE                                               00003070
           END-IF.                                                      00003080
                                                                        00003090
           IF  BPOOL OF ALTER-TABLESPACE NOT EQUAL SYSTABLESPACE-BPOOL  00003100
               MOVE  SYSTABLES-DBNAME            TO   STRING-AREA       00003110
               PERFORM 0800-9999-COUNT-CHAR THRU 0800-9999-EXIT         00003120
               MOVE  SYSTABLES-DBNAME(1:IND)     TO   STRING-AREA       00003130
               ADD   +1                          TO   IND               00003140
               MOVE  '.'              TO   STRING-AREA(IND:1)           00003150
               ADD   +1                          TO   IND               00003160
               MOVE  SYSTABLES-TSNAME TO   STRING-AREA(IND:8)           00003170
               MOVE  STRING-AREA      TO   TABLESPACE                   00003180
               MOVE  SYSTABLES-NPAGES            TO   NPAGES            00003190
               WRITE REG-ALTERTS   FROM  ALTER-TABLESPACE               00003200
                                                                        00003210
               MOVE  TABLESPACE                  TO   OBJETO-SQL        00003220
               MOVE  SYSTABLESPACE-BPOOL         TO   BPOOL-I           00003230
               MOVE  BPOOL OF ALTER-TABLESPACE   TO   BPOOL-F           00003240
               PERFORM  0900-9999-LOG THRU 0900-9999-EXIT               00003250
               MOVE  'SIM'                       TO   N88-ALTER-TS      00003260
           END-IF.                                                      00003270
           PERFORM  0300-9999-FETCH-TS THRU 0300-9999-EXIT.             00003280
       0400-0300-EXIT. EXIT.                                            00003290
      *----------------------------------------------------------------*00003300
      *                                                                *00003310
      *----------------------------------------------------------------*00003320
       0500-0100-INDEX.                                                 00003330
           EXEC SQL                                                     00003340
                DECLARE C_IX CURSOR FOR                                 00003350
                SELECT B.CREATOR, B.NAME, B.BPOOL, A.NPAGES             00003360
                  FROM SYSIBM.SYSTABLES A,                              00003370
                       SYSIBM.SYSINDEXES B                              00003380
                 WHERE B.TBCREATOR = A.CREATOR                          00003390
                   AND B.TBNAME = A.NAME                                00003400
                   AND B.BPOOL NOT IN ('BP0', 'BP31','BP32K')           00003410
           END-EXEC.                                                    00003420
                                                                        00003430
           EXEC SQL OPEN C_IX END-EXEC.                                 00003440
           IF  SQLCODE  EQUAL  +0                                       00003450
               NEXT  SENTENCE                                           00003460
           ELSE                                                         00003470
               DISPLAY '*** ERRO NO OPEN C_IX'                          00003480
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00003490
           END-IF.                                                      00003500
                                                                        00003510
           PERFORM  0600-9999-FETCH-IX THRU 0600-9999-EXIT.             00003520
           PERFORM  0700-0600-TRATA-IX THRU 0700-0600-EXIT              00003530
             UNTIL  FIM-IX.                                             00003540
                                                                        00003550
           EXEC SQL CLOSE C_IX END-EXEC.                                00003560
           IF  SQLCODE  EQUAL  +0                                       00003570
               NEXT  SENTENCE                                           00003580
           ELSE                                                         00003590
               DISPLAY '*** ERRO NO CLOSE C_IX'                         00003600
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00003610
           END-IF.                                                      00003620
       0500-0100-EXIT. EXIT.                                            00003630
      *----------------------------------------------------------------*00003640
      *                                                                *00003650
      *----------------------------------------------------------------*00003660
       0600-9999-FETCH-IX.                                              00003670
           MOVE   SPACES               TO   SYSINDEXES-NAME.            00003680
           EXEC SQL                                                     00003690
                FETCH C_IX                                              00003700
                 INTO :SYSINDEXES-CREATOR, :SYSINDEXES-NAME,            00003710
                      :SYSINDEXES-BPOOL, :SYSINDEXES-NPAGES             00003720
           END-EXEC.                                                    00003730
           IF  SQLCODE  EQUAL  +0                                       00003740
               NEXT  SENTENCE                                           00003750
           ELSE                                                         00003760
             IF  SQLCODE  EQUAL  +100                                   00003770
                 MOVE  'SIM'           TO  N88-FIM-IX                   00003780
             ELSE                                                       00003790
                 DISPLAY '*** ERRO NO FETCH C_IX'                       00003800
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00003810
             END-IF                                                     00003820
           END-IF.                                                      00003830
       0600-9999-EXIT. EXIT.                                            00003840
      *----------------------------------------------------------------*00003850
      * TRATA ALTER INDEX                                              *00003860
      *----------------------------------------------------------------*00003870
       0700-0600-TRATA-IX.                                              00003880
           MOVE   SYSINDEXES-CREATOR    TO  SEARCH-OWNER.               00003890
           MOVE   SYSINDEXES-NAME-T(1:SYSINDEXES-NAME-L)                00003900
                                        TO  SEARCH-OBJECT.              00003910
           PERFORM 1200-9999-SEARCH  THRU  1200-9999-EXIT.              00003920
           IF  EXCLUDE-OBJECT                                           00003930
               MOVE 'BP1'         TO  BPOOL OF ALTER-INDEX              00003940
           ELSE                                                         00003950
             EVALUATE TRUE                                              00003960
               WHEN SYSINDEXES-NPAGES <=  50                            00003970
                    MOVE 'BP21'         TO  BPOOL OF ALTER-INDEX        00003980
               WHEN SYSINDEXES-NPAGES >   50                            00003990
                AND SYSINDEXES-NPAGES <= 400                            00004000
                    MOVE 'BP22'         TO  BPOOL OF ALTER-INDEX        00004010
               WHEN SYSINDEXES-NPAGES >   400                           00004020
                AND SYSINDEXES-NPAGES <= 1000                           00004030
                    MOVE 'BP23'         TO  BPOOL OF ALTER-INDEX        00004040
               WHEN SYSINDEXES-NPAGES >  1000                           00004050
                AND SYSINDEXES-NPAGES <= 5000                           00004060
                    MOVE 'BP24'         TO  BPOOL OF ALTER-INDEX        00004070
               WHEN SYSINDEXES-NPAGES >  5000                           00004080
                    MOVE 'BP25'         TO  BPOOL OF ALTER-INDEX        00004090
             END-EVALUATE                                               00004100
           END-IF.                                                      00004110
                                                                        00004120
           IF  BPOOL OF ALTER-INDEX NOT EQUAL SYSINDEXES-BPOOL          00004130
               MOVE  SYSINDEXES-CREATOR          TO   STRING-AREA       00004140
               PERFORM 0800-9999-COUNT-CHAR THRU 0800-9999-EXIT         00004150
               MOVE  SYSINDEXES-CREATOR(1:IND)   TO   STRING-AREA       00004160
               ADD   +1                          TO   IND               00004170
               MOVE  '.'              TO   STRING-AREA(IND:1)           00004180
               ADD   +1                          TO   IND               00004190
               MOVE  SYSINDEXES-NAME-T TO                               00004200
                               STRING-AREA(IND:SYSINDEXES-NAME-L)       00004210
               MOVE  STRING-AREA      TO   INDEXNAME                    00004220
               WRITE REG-ALTERIX   FROM  ALTER-INDEX                    00004230
                                                                        00004240
               MOVE  INDEXNAME                   TO   OBJETO-SQL        00004250
               MOVE  SYSINDEXES-BPOOL            TO   BPOOL-I           00004260
               MOVE  BPOOL OF ALTER-INDEX        TO   BPOOL-F           00004270
               MOVE  SYSINDEXES-NPAGES           TO   NPAGES            00004280
               PERFORM  0900-9999-LOG THRU 0900-9999-EXIT               00004290
               MOVE  'SIM'                       TO   N88-ALTER-IX      00004300
           END-IF.                                                      00004310
           PERFORM  0600-9999-FETCH-IX THRU 0600-9999-EXIT.             00004320
       0700-0600-EXIT. EXIT.                                            00004330
      *----------------------------------------------------------------*00004340
      *                                                                *00004350
      *----------------------------------------------------------------*00004360
       0800-9999-COUNT-CHAR.                                            00004370
           PERFORM VARYING IND FROM +1 BY +1                            00004380
             UNTIL IND     GREATER  +12                                 00004390
                OR CHAR(IND) EQUAL  SPACES                              00004400
                CONTINUE                                                00004410
           END-PERFORM.                                                 00004420
           SUBTRACT   +1               FROM  IND.                       00004430
       0800-9999-EXIT. EXIT.                                            00004440
      *----------------------------------------------------------------*00004450
      *                                                                *00004460
      *----------------------------------------------------------------*00004470
       0900-9999-LOG.                                                   00004480
           IF  1VEZ                                                     00004490
               WRITE REG-ALTERLOG  FROM  LOG-CAB1 AFTER PAGE            00004500
               WRITE REG-ALTERLOG  FROM  LOG-CAB2                       00004510
               ACCEPT CAB3-DATA    FROM  DATE                           00004520
               WRITE REG-ALTERLOG  FROM  LOG-CAB3                       00004530
               WRITE REG-ALTERLOG  FROM  LOG-CAB4                       00004540
               MOVE  'NAO'         TO    N88-1VEZ                       00004550
           END-IF.                                                      00004560
                                                                        00004570
           WRITE REG-ALTERLOG  FROM  LOG-MSG.                           00004580
       0900-9999-EXIT. EXIT.                                            00004590
      *----------------------------------------------------------------*00004600
      *                                                                *00004610
      *----------------------------------------------------------------*00004620
       1000-0100-LOAD-EXCL.                                             00004630
           OPEN  INPUT   EXCLUDE.                                       00004640
           PERFORM  1100-1000-READ-EXCL  THRU 1100-1000-EXIT.           00004650
           PERFORM  VARYING  IND-EXCL  FROM  +1  BY  +1                 00004660
                    UNTIL FIM-EXCLUDE                                   00004670
              IF  IND-EXCL  GREATER  +200                               00004680
                  DISPLAY 'DB2MVBPL - Erro - Estouro de tabela interna d00004690
      -                   'e objetos a serem excluidos. Maximo (200)'   00004700
                  MOVE    +16          TO  RETURN-CODE                  00004710
                  STOP  RUN                                             00004720
              END-IF                                                    00004730
              UNSTRING PARAMETRO-EXCL DELIMITED BY '.' OR SPACES        00004740
                  INTO OWNER-EXCL(IND-EXCL), OBJECT-EXCL(IND-EXCL),     00004750
                       COMMENT-AREA                                     00004760
              PERFORM  1100-1000-READ-EXCL  THRU 1100-1000-EXIT         00004770
           END-PERFORM.                                                 00004780
                                                                        00004790
           CLOSE  EXCLUDE.                                              00004800
       1000-0100-EXIT. EXIT.                                            00004810
      *----------------------------------------------------------------*00004820
      *                                                                *00004830
      *----------------------------------------------------------------*00004840
       1100-1000-READ-EXCL.                                             00004850
           READ  EXCLUDE  INTO  PARAMETRO-EXCL                          00004860
             AT  END  MOVE   'SIM'     TO  N88-FIM-EXCLUDE.             00004870
       1100-1000-EXIT. EXIT.                                            00004880
      *----------------------------------------------------------------*00004890
      *                                                                *00004900
      *----------------------------------------------------------------*00004910
       1200-9999-SEARCH.                                                00004920
           MOVE   'NAO'                TO  N88-EXCLUDE-OBJECT.          00004930
           PERFORM  VARYING  IND-EXCL  FROM  +1  BY  +1                 00004940
                    UNTIL  IND-EXCL  GREATER  +200                      00004950
                       OR (SEARCH-OWNER  EQUAL OWNER-EXCL(IND-EXCL) AND 00004960
                           SEARCH-OBJECT EQUAL OBJECT-EXCL(IND-EXCL))   00004970
                    CONTINUE                                            00004980
           END-PERFORM.                                                 00004990
                                                                        00005000
           IF  IND-EXCL  NOT GREATER  +200                              00005010
               MOVE   'SIM'            TO  N88-EXCLUDE-OBJECT           00005020
           END-IF.                                                      00005030
       1200-9999-EXIT. EXIT.                                            00005040
      *----------------------------------------------------------------*00005050
      *                                                                *00005060
      *----------------------------------------------------------------*00005070
       9999-9999-ERRO-DB2.                                              00005080
           MOVE   SQLCODE              TO  WS-SQLCODE.                  00005090
           DISPLAY '*** SQLCODE  ' WS-SQLCODE.                          00005100
           DISPLAY '    SQLERRMC ' SQLERRMC.                            00005110
           DISPLAY '    SQLSTATE ' SQLSTATE.                            00005120
           MOVE   +16                  TO  RETURN-CODE.                 00005130
           STOP RUN.                                                    00005140
       9999-9999-EXIT. EXIT.                                            00005150