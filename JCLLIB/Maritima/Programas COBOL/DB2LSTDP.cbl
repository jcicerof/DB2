       IDENTIFICATION DIVISION.                                         00000010
       PROGRAM-ID.    DB2LSTDP.                                         00000020
      *----------------------------------------------------------------*00000030
      * DATA:  ABR/1998                                                *00000040
      * OBJETIVOS: LISTAR DEPENDENCIAS DE RELACIONAMENTO               *00000050
      * AREA RESPONSAVEL: ADMINISTRACAO DE BANCO DE DADOS              *00000060
      *----------------------------------------------------------------*00000070
       ENVIRONMENT    DIVISION.                                         00000080
      *                                                                 00000090
       INPUT-OUTPUT       SECTION.                                      00000100
       FILE-CONTROL.                                                    00000110
           SELECT  SYSIN   ASSIGN      TO  SYSIN.                       00000120
           SELECT  LSTOUT  ASSIGN      TO  LSTOUT.                      00000130
      *----------------------------------------------------------------*00000140
      *                                                                *00000150
      *----------------------------------------------------------------*00000160
       DATA DIVISION.                                                   00000170
      *                                                                 00000180
       FILE            SECTION.                                         00000190
       FD  SYSIN                                                        00000200
           LABEL  RECORD  IS  OMITTED                                   00000210
           RECORDING MODE IS F.                                         00000220
                                                                        00000230
       01  REG-SYSIN                   PIC  X(080).                     00000240
                                                                        00000250
       FD  LSTOUT                                                       00000260
           LABEL  RECORD  IS  OMITTED                                   00000270
           RECORDING MODE IS F.                                         00000280
                                                                        00000290
       01  REG-LSTOUT                  PIC  X(132).                     00000300
      *----------------------------------------------------------------*00000310
      *                                                                *00000320
      *----------------------------------------------------------------*00000330
       WORKING-STORAGE SECTION.                                         00000340
      *----------------------------------------------------------------*00000350
      * AREAS AUXILIARES                                               *00000360
      *----------------------------------------------------------------*00000370
       01  FILLER.                                                      00000380
           02   AC-SPACES                   PIC S9(04) COMP VALUE +0.   00000390
           02   AC-FKEYS                    PIC S9(04) COMP VALUE +0.   00000400
           02   COLCOUNT-PK                 PIC S9(04) COMP VALUE +0.   00000410
           02   CH-ALIAS                    PIC  X(01)      VALUE 'N'.  00000420
           02   CH-PRIMARY                  PIC  X(01)      VALUE 'N'.  00000430
           02   WS-SQLCODE                  PIC -----9.                 00000440
           02   AC-LINHA                    PIC S9(04) COMP VALUE +99.  00000450
           02   CH-AUX                      PIC  9(01)      VALUE 1.    00000460
      *----------------------------------------------------------------*00000470
      * HOSTS SYSIBM.SYSTABLES - COMANDO DINAMICO                      *00000480
      *----------------------------------------------------------------*00000490
       01  HAUX-NAME.                                                   00000500
           49  HAUX-NAME-L                  PIC S9(04) COMP.            00000510
           49  HAUX-NAME-T                  PIC  X(18).                 00000520
       01  HAUX-CREATOR                     PIC  X(08).                 00000530
      *01  H-SYSTABLES.                                                 00000540
      *    02  H-DBNAME                     PIC  X(08).                 00000550
      *    02  H-CREATOR                    PIC  X(18).                 00000560
      *    02  H-NAME                       PIC  X(18).                 00000570
      *----------------------------------------------------------------*00000580
      * HOSTS SYSIBM.SYSTABLES                                         *00000590
      *----------------------------------------------------------------*00000600
       01  SYSTABLES.                                                   00000610
           02  SYSTABLES-NAME.                                          00000620
               49  SYSTABLES-NAME-L         PIC S9(04) COMP.            00000630
               49  SYSTABLES-NAME-T         PIC  X(18).                 00000640
           02  SYSTABLES-CREATOR            PIC  X(08).                 00000650
           02  SYSTABLES-TYPE               PIC  X(01).                 00000660
           02  SYSTABLES-DBNAME             PIC  X(08).                 00000670
           02  SYSTABLES-TSNAME             PIC  X(08).                 00000680
           02  SYSTABLES-REMARKS.                                       00000690
               49  SYSTABLES-REMARKS-L      PIC S9(04) COMP.            00000700
               49  SYSTABLES-REMARKS-T      PIC  X(254).                00000710
           02  SYSTABLES-TBCREATOR          PIC  X(08).                 00000720
           02  SYSTABLES-TBNAME.                                        00000730
               49  SYSTABLES-TBNAME-L       PIC S9(04) COMP.            00000740
               49  SYSTABLES-TBNAME-T       PIC  X(18).                 00000750
      *----------------------------------------------------------------*00000760
      * HOSTS SYSIBM.SYSCOLUMNS                                        *00000770
      *----------------------------------------------------------------*00000780
       01  SYSCOLUMNS.                                                  00000790
           02  SYSCOLUMNS-NAME.                                         00000800
               49  SYSCOLUMNS-NAME-L        PIC S9(04) COMP.            00000810
               49  SYSCOLUMNS-NAME-T        PIC  X(18).                 00000820
           02  SYSCOLUMNS-COLTYPE           PIC  X(08).                 00000830
           02  SYSCOLUMNS-LENGTH            PIC  S9(04) COMP.           00000840
           02  SYSCOLUMNS-NULLS             PIC  X(01).                 00000850
           02  SYSCOLUMNS-SCALE             PIC  S9(04) COMP.           00000860
           02  SYSCOLUMNS-REMARKS.                                      00000870
               49  SYSCOLUMNS-REMARKS-L     PIC S9(04) COMP.            00000880
               49  SYSCOLUMNS-REMARKS-T     PIC  X(254).                00000890
           02  SYSCOLUMNS-COLNO             PIC  S9(04) COMP.           00000900
           02  SYSCOLUMNS-TBNAME.                                       00000910
               49  SYSCOLUMNS-TBNAME-L      PIC S9(04) COMP.            00000920
               49  SYSCOLUMNS-TBNAME-T      PIC  X(18).                 00000930
           02  SYSCOLUMNS-TBCREATOR         PIC  X(08).                 00000940
           02  SYSCOLUMNS-DEFAULT           PIC  X(01).                 00000950
      *----------------------------------------------------------------*00000960
      * HOSTS SYSIBM.SYSRELS                                           *00000970
      *----------------------------------------------------------------*00000980
       01  SYSRELS.                                                     00000990
           02  SYSRELS-CREATOR              PIC  X(08).                 00001000
           02  SYSRELS-TBNAME.                                          00001010
               49  SYSRELS-TBNAME-L         PIC S9(04) COMP.            00001020
               49  SYSRELS-TBNAME-T         PIC  X(18).                 00001030
           02  SYSRELS-REFTBCREATOR         PIC  X(08).                 00001040
           02  SYSRELS-REFTBNAME.                                       00001050
               49  SYSRELS-REFTBNAME-L      PIC S9(04) COMP.            00001060
               49  SYSRELS-REFTBNAME-T      PIC  X(18).                 00001070
           02  SYSRELS-RELNAME              PIC  X(08).                 00001080
           02  SYSRELS-DELETERULE           PIC  X(01).                 00001090
      *----------------------------------------------------------------*00001100
      * HOSTS SYSIBM.SYSFOREIGNKEYS                                    *00001110
      *----------------------------------------------------------------*00001120
       01  SYSFOREIGNKEYS.                                              00001130
           02  SYSFOREIGNKEYS-CREATOR       PIC  X(08).                 00001140
           02  SYSFOREIGNKEYS-TBNAME.                                   00001150
               49  SYSFOREIGNKEYS-TBNAME-L  PIC S9(04) COMP.            00001160
               49  SYSFOREIGNKEYS-TBNAME-T  PIC  X(18).                 00001170
           02  SYSFOREIGNKEYS-RELNAME       PIC  X(08).                 00001180
           02  SYSFOREIGNKEYS-COLNAME.                                  00001190
               49  SYSFOREIGNKEYS-COLNAME-L PIC S9(04) COMP.            00001200
               49  SYSFOREIGNKEYS-COLNAME-T PIC  X(18).                 00001210
           02  SYSFOREIGNKEYS-COLSEQ        PIC S9(04) COMP.            00001220
      *----------------------------------------------------------------*00001230
      * HOSTS SYSIBM.SYSKEYS                                           *00001240
      *----------------------------------------------------------------*00001250
       01  SYSKEYS.                                                     00001260
           02  SYSKEYS-COLNAME.                                         00001270
               49  SYSKEYS-COLNAME-L        PIC S9(04) COMP.            00001280
               49  SYSKEYS-COLNAME-T        PIC  X(18).                 00001290
           02  SYSKEYS-COLSEQ               PIC  S9(04) COMP.           00001300
           02  SYSKEYS-COLTYPE              PIC  X(08).                 00001310
           02  SYSKEYS-LENGTH               PIC  S9(04) COMP.           00001320
           02  SYSKEYS-NULLS                PIC  X(01).                 00001330
           02  SYSKEYS-SCALE                PIC  S9(04) COMP.           00001340
      *----------------------------------------------------------------*00001350
      *                                                                *00001360
      *----------------------------------------------------------------*00001370
       01  PARAMETRO                   PIC X(80).                       00001380
       01  FILLER.                                                      00001390
           02  PARM-DBNAME             PIC X(08).                       00001400
           02  PARM-CREATOR            PIC X(18).                       00001410
           02  PARM-TABELA             PIC X(18).                       00001420
      *----------------------------------------------------------------*00001430
      *                                                                *00001440
      *----------------------------------------------------------------*00001450
       01  DYNAMIC-SQL.                                                 00001460
           49  CMD-SQL-LENGTH          PIC S9(04) COMP     VALUE +500.  00001470
           49  CMD-SQL                 PIC  X(500).                     00001480
                                                                        00001490
       01  SELECT-CMD.                                                  00001500
           02  FILLER                  PIC X(100)          VALUE        00001510
               'SELECT DBNAME, CREATOR, NAME, TYPE, TBCREATOR, TBNAME   00001520
      -        'FROM SYSIBM.SYSTABLES '.                                00001530
           02  WHERE-WORD              PIC X(06)           VALUE        00001540
               'WHERE'.                                                 00001550
                                                                        00001560
           02  WHERE-DBNAME.                                            00001570
               04  FILLER              PIC X(17)           VALUE        00001580
               '       DBNAME  = '.                                     00001590
               04  FILLER              PIC X(01)           VALUE QUOTES.00001600
               04  H-DBNAME            PIC X(08).                       00001610
               04  FILLER              PIC X(01)           VALUE QUOTES.00001620
               04  AND-DBNAME          PIC X(05)           VALUE ' AND'.00001630
                                                                        00001640
           02  WHERE-CREATOR.                                           00001650
               04  FILLER              PIC X(17)           VALUE        00001660
               '       CREATOR = '.                                     00001670
               04  FILLER              PIC X(01)           VALUE QUOTES.00001680
               04  H-CREATOR           PIC X(18).                       00001690
               04  FILLER              PIC X(01)           VALUE QUOTES.00001700
               04  AND-CREATOR         PIC X(05)           VALUE ' AND'.00001710
           02  WHERE-NAME.                                              00001720
               04  FILLER              PIC X(17)           VALUE        00001730
               '       NAME    = '.                                     00001740
               04  FILLER              PIC X(01)           VALUE QUOTES.00001750
               04  H-NAME              PIC X(18).                       00001760
               04  FILLER              PIC X(01)           VALUE QUOTES.00001770
           02  ORDER-BY                PIC X(80)           VALUE        00001780
               ' ORDER BY DBNAME, TBCREATOR, TBNAME'.                   00001790
                                                                        00001800
       01  SELECT-SYSRELS.                                              00001810
           02  FILLER                  PIC X(120)          VALUE        00001820
               'SELECT A.CREATOR, A.TBNAME, A.REFTBCREATOR, A.REFTBNAME,00001830
      -        'A.DELETERULE, A.RELNAME, B.DBNAME '.                    00001840
           02  FILLER                  PIC X(50)           VALUE        00001850
               'FROM SYSIBM.SYSRELS A, SYSIBM.SYSTABLES B '.            00001860
           02  WHERE-CLAUSE            PIC X(150).                      00001870
           02  FILLER                  PIC X(40)           VALUE        00001880
               ' ORDER BY A.RELNAME'.                                   00001890
                                                                        00001900
       01  WHERE-DYN1.                                                  00001910
           04  FILLER              PIC X(80)           VALUE            00001920
               ' WHERE A.CREATOR = B.TBCREATOR AND A.TBNAME = B.TBNAME'.00001930
           04  FILLER              PIC X(20)           VALUE            00001940
               ' AND B.TBCREATOR  = '.                                  00001950
           04  FILLER              PIC X(01)           VALUE QUOTES.    00001960
           04  H-CREATOR-DYN1      PIC X(08).                           00001970
           04  FILLER              PIC X(01)           VALUE QUOTES.    00001980
           04  FILLER              PIC X(20)           VALUE            00001990
               ' AND B.TBNAME  = '.                                     00002000
           04  FILLER              PIC X(01)           VALUE QUOTES.    00002010
           04  H-TBNAME-DYN1       PIC X(18).                           00002020
           04  FILLER              PIC X(01)           VALUE QUOTES.    00002030
                                                                        00002040
       01  WHERE-DYN2.                                                  00002050
           04  FILLER              PIC X(80)           VALUE            00002060
               ' WHERE A.CREATOR = B.CREATOR AND A.TBNAME = B.NAME'.    00002070
           04  FILLER              PIC X(22)           VALUE            00002080
               ' AND REFTBCREATOR  = '.                                 00002090
           04  FILLER              PIC X(01)           VALUE QUOTES.    00002100
           04  H-REFTBCREATOR-DYN2 PIC X(08).                           00002110
           04  FILLER              PIC X(01)           VALUE QUOTES.    00002120
           04  FILLER              PIC X(18)           VALUE            00002130
               ' AND REFTBNAME  = '.                                    00002140
           04  FILLER              PIC X(01)           VALUE QUOTES.    00002150
           04  H-REFTBNAME-DYN2    PIC X(18).                           00002160
           04  FILLER              PIC X(01)           VALUE QUOTES.    00002170
                                                                        00002180
      *----------------------------------------------------------------*00002190
      *                                                                *00002200
      *----------------------------------------------------------------*00002210
       01  CHAVES-FIM.                                                  00002220
           02  N88-FIM-SYSTABLES                 PIC  X(03) VALUE 'NAO'.00002230
               88  FIM-SYSTABLES                            VALUE 'SIM'.00002240
           02  N88-FIM-COLUMNS                   PIC  X(03) VALUE 'NAO'.00002250
               88  FIM-COLUMNS                              VALUE 'SIM'.00002260
           02  N88-FIM-PAIS                      PIC  X(03) VALUE 'NAO'.00002270
               88  FIM-PAIS                                 VALUE 'SIM'.00002280
           02  N88-FIM-SYSIN                     PIC  X(03) VALUE 'NAO'.00002290
               88  FIM-SYSIN                                VALUE 'SIM'.00002300
           02  N88-FIM-SYSRELS                   PIC  X(03) VALUE 'NAO'.00002310
               88  FIM-SYSRELS                              VALUE 'SIM'.00002320
           02  N88-FIM-SYSFOREIGNKEYS            PIC  X(03) VALUE 'NAO'.00002330
               88  FIM-SYSFOREIGNKEYS                       VALUE 'SIM'.00002340
           02  N88-FIM-PKEYS                     PIC  X(03) VALUE 'NAO'.00002350
               88  FIM-PKEYS                                VALUE 'SIM'.00002360
           02  N88-1VEZ                          PIC  X(03) VALUE 'SIM'.00002370
               88  1VEZ                                     VALUE 'SIM'.00002380
      *----------------------------------------------------------------*00002390
      *    RELATORIO                                                   *00002400
      *----------------------------------------------------------------*00002410
       01  CAB1.                                                        00002420
           03  FILLER                  PIC X(80)      VALUE             00002430
               'MARITIMA SEGUROS       ADMINISTRACAO DE BANCO DE DADOS'.00002440
       01  CAB2.                                                        00002450
           03  FILLER                  PIC X(25)      VALUE ' '.        00002460
           03  FILLER                  PIC X(30)      VALUE             00002470
               'RELACIONAMENTO ENTRE TABELAS'.                          00002480
       01  CAB3.                                                        00002490
           03  FILLER                  PIC X(132)      VALUE ALL '-'.   00002500
                                                                        00002510
       01  CAB4.                                                        00002520
           03  DBNAME                  PIC X(08).                       00002530
           03  FILLER                  PIC X(02)           VALUE ' '.   00002540
           03  CREATOR                 PIC X(08).                       00002550
           03  FILLER                  PIC X(02)           VALUE ' '.   00002560
           03  TNAME                   PIC X(18).                       00002570
           03  FILLER                  PIC X(22)           VALUE ' '.   00002580
           03  CNAME                   PIC X(18).                       00002590
           03  FILLER                  PIC X(02)           VALUE ' '.   00002600
           03  CTYPE                   PIC X(08).                       00002610
           03  FILLER                  PIC X(02)           VALUE ' '.   00002620
           03  CLENGTH                 PIC ZZZ99.                       00002630
           03  VIRG                    PIC X(01).                       00002640
           03  CSCALE                  PIC 9(02).                       00002650
           03  CSCALE-R  REDEFINES CSCALE  PIC ZZ.                      00002660
           03  FILLER                  PIC X(02)           VALUE ' '.   00002670
           03  CNULL                   PIC X(01).                       00002680
                                                                        00002690
       01  CAB5.                                                        00002700
           03  FILLER                  PIC X(132)          VALUE        00002710
               'DBNAME    CREATOR     TABELA           DELETE   CONSTRAI00002720
      -        'NT  COLUMN             DATATYPE     LENGTH  NULLS'.     00002730
                                                                        00002740
       01  CAB6.                                                        00002750
           03  FILLER                  PIC X(40)           VALUE ' '.   00002760
           03  FILLER                  PIC X(30)           VALUE        00002770
               'RULE       NAME      NAME'.                             00002780
                                                                        00002790
       01  LDET.                                                        00002800
           03  DBNAME                  PIC X(08).                       00002810
           03  FILLER                  PIC X(02)           VALUE ' '.   00002820
           03  CREATOR                 PIC X(08).                       00002830
           03  FILLER                  PIC X(02)           VALUE ' '.   00002840
           03  TNAME                   PIC X(18).                       00002850
           03  FILLER                  PIC X(02)           VALUE ' '.   00002860
           03  DELETE-RULE             PIC X(08).                       00002870
           03  FILLER                  PIC X(02)           VALUE ' '.   00002880
           03  CONSTRAINT              PIC X(08).                       00002890
           03  FILLER                  PIC X(02)           VALUE ' '.   00002900
           03  CNAME                   PIC X(18).                       00002910
           03  FILLER                  PIC X(02)           VALUE ' '.   00002920
           03  CTYPE                   PIC X(08).                       00002930
           03  FILLER                  PIC X(02)           VALUE ' '.   00002940
           03  CLENGTH                 PIC ZZZ99.                       00002950
           03  VIRG                    PIC X(01).                       00002960
           03  CSCALE                  PIC 9(02).                       00002970
           03  CSCALE-R  REDEFINES CSCALE  PIC ZZ.                      00002980
           03  FILLER                  PIC X(02)           VALUE ' '.   00002990
           03  CNULL                   PIC X(01).                       00003000
      *----------------------------------------------------------------*00003010
      *                                                                *00003020
      *----------------------------------------------------------------*00003030
           EXEC SQL INCLUDE SQLCA END-EXEC.                             00003040
       PROCEDURE   DIVISION.                                            00003050
      *----------------------------------------------------------------*00003060
      *                                                                *00003070
      *----------------------------------------------------------------*00003080
       0000-0000-PRINCIPAL.                                             00003090
           OPEN OUTPUT LSTOUT.                                          00003100
                                                                        00003110
           PERFORM  0100-0000-LE-SYSIN THRU  0100-0000-EXIT.            00003120
           PERFORM  0200-0000-DECLARE-SYSTABLES THRU  0200-0000-EXIT.   00003130
                                                                        00003140
           PERFORM  0300-9999-FETCH-SYSTABLES THRU 0300-9999-EXIT.      00003150
           PERFORM  0400-0000-TRATA-SYSTABLES THRU 0400-0000-EXIT       00003160
             UNTIL  FIM-SYSTABLES.                                      00003170
                                                                        00003180
      ***  EXEC SQL CLOSE C_CURSOR  END-EXEC.                           00003190
                                                                        00003200
           CLOSE   LSTOUT.                                              00003210
           EXEC SQL COMMIT WORK END-EXEC.                               00003220
           STOP RUN.                                                    00003230
       0000-0000-EXIT. EXIT.                                            00003240
      *----------------------------------------------------------------*00003250
      *                                                                *00003260
      *----------------------------------------------------------------*00003270
       0100-0000-LE-SYSIN.                                              00003280
           OPEN INPUT  SYSIN.                                           00003290
           READ SYSIN INTO PARAMETRO.                                   00003300
           CLOSE   SYSIN.                                               00003310
                                                                        00003320
           DISPLAY '*** PARAMETRO : ' PARAMETRO.                        00003330
           UNSTRING PARAMETRO DELIMITED BY '.' OR SPACES                00003340
               INTO PARM-DBNAME PARM-CREATOR PARM-TABELA.               00003350
                                                                        00003360
           IF  PARM-DBNAME EQUAL '*' OR SPACES                          00003370
               ADD    +1               TO  AC-SPACES                    00003380
               MOVE   SPACES           TO  WHERE-DBNAME                 00003390
           ELSE                                                         00003400
               MOVE   PARM-DBNAME      TO  H-DBNAME                     00003410
           END-IF.                                                      00003420
                                                                        00003430
           IF  PARM-CREATOR EQUAL '*' OR SPACES                         00003440
               ADD    +1               TO  AC-SPACES                    00003450
               MOVE   SPACES           TO  WHERE-CREATOR                00003460
           ELSE                                                         00003470
               MOVE   PARM-CREATOR     TO  H-CREATOR                    00003480
           END-IF.                                                      00003490
                                                                        00003500
           IF  PARM-TABELA  EQUAL '*' OR SPACES                         00003510
               ADD    +1               TO  AC-SPACES                    00003520
               MOVE   SPACES           TO  WHERE-NAME                   00003530
           ELSE                                                         00003540
               MOVE   PARM-TABELA      TO  H-NAME                       00003550
           END-IF.                                                      00003560
                                                                        00003570
           IF  AC-SPACES  EQUAL  +3                                     00003580
               MOVE   SPACES           TO  WHERE-WORD                   00003590
           ELSE                                                         00003600
               IF  AC-SPACES  EQUAL  +2                                 00003610
                   MOVE   SPACES           TO  AND-DBNAME               00003620
                   MOVE   SPACES           TO  AND-CREATOR              00003630
               ELSE                                                     00003640
                   MOVE   SPACES           TO  AND-CREATOR              00003650
               END-IF                                                   00003660
           END-IF.                                                      00003670
       0100-0000-EXIT. EXIT.                                            00003680
      *----------------------------------------------------------------*00003690
      *                                                                *00003700
      *----------------------------------------------------------------*00003710
       0200-0000-DECLARE-SYSTABLES.                                     00003720
           MOVE  SELECT-CMD            TO  CMD-SQL.                     00003730
           DISPLAY '*** CMD: ' SELECT-CMD.                              00003740
                                                                        00003750
           EXEC SQL PREPARE CMDSQL FROM :DYNAMIC-SQL END-EXEC.          00003760
           IF  SQLCODE  EQUAL  +0                                       00003770
               NEXT  SENTENCE                                           00003780
           ELSE                                                         00003790
               DISPLAY '*** ERRO DE PREPARE'                            00003800
               DISPLAY '*** SELECT-CMD: ' SELECT-CMD                    00003810
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00003820
           END-IF.                                                      00003830
                                                                        00003840
           EXEC SQL                                                     00003850
                DECLARE C_CURSOR CURSOR                                 00003860
                    FOR CMDSQL                                          00003870
           END-EXEC.                                                    00003880
                                                                        00003890
           EXEC SQL OPEN C_CURSOR  END-EXEC.                            00003900
           IF  SQLCODE  EQUAL  +0                                       00003910
               NEXT  SENTENCE                                           00003920
           ELSE                                                         00003930
               DISPLAY '*** ERRO DE OPEN'                               00003940
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00003950
           END-IF.                                                      00003960
       0200-0000-EXIT. EXIT.                                            00003970
      *----------------------------------------------------------------*00003980
      *                                                                *00003990
      *----------------------------------------------------------------*00004000
       0300-9999-FETCH-SYSTABLES.                                       00004010
           INITIALIZE  SYSTABLES.                                       00004020
           EXEC SQL                                                     00004030
                FETCH  C_CURSOR                                         00004040
                INTO   :SYSTABLES-DBNAME, :SYSTABLES-CREATOR,           00004050
                       :SYSTABLES-NAME,   :SYSTABLES-TYPE,              00004060
                       :SYSTABLES-TBCREATOR, :SYSTABLES-TBNAME          00004070
           END-EXEC.                                                    00004080
           IF  SQLCODE  EQUAL  +0                                       00004090
               NEXT  SENTENCE                                           00004100
           ELSE                                                         00004110
             IF  SQLCODE  EQUAL  +100                                   00004120
                 MOVE  'SIM'           TO  N88-FIM-SYSTABLES            00004130
             ELSE                                                       00004140
                 DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSTABLES'          00004150
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00004160
             END-IF                                                     00004170
           END-IF.                                                      00004180
       0300-9999-EXIT. EXIT.                                            00004190
      *----------------------------------------------------------------*00004200
      *                                                                *00004210
      *----------------------------------------------------------------*00004220
       0400-0000-TRATA-SYSTABLES.                                       00004230
      *-- DESPREZA AS VIEWS                                             00004240
           IF  SYSTABLES-TYPE  EQUAL  'V'                               00004250
               PERFORM  0300-9999-FETCH-SYSTABLES THRU 0300-9999-EXIT   00004260
               GO  TO  0400-0000-EXIT                                   00004270
           END-IF.                                                      00004280
                                                                        00004290
      *-- SE FOR UM ALIAS NAME, BUSCA A TABELA                          00004300
           IF  SYSTABLES-TYPE  EQUAL  'A'                               00004310
               MOVE   SYSTABLES-TBCREATOR   TO  SYSTABLES-CREATOR       00004320
               MOVE   SYSTABLES-TBNAME      TO  SYSTABLES-NAME          00004330
               PERFORM  0500-0400-SYSTABLES THRU 0500-0400-EXIT         00004340
               IF  SQLCODE  EQUAL  +100                                 00004350
                   PERFORM  0300-9999-FETCH-SYSTABLES                   00004360
                      THRU 0300-9999-EXIT                               00004370
                   GO  TO  0400-0000-EXIT                               00004380
               END-IF                                                   00004390
           END-IF.                                                      00004400
                                                                        00004410
           MOVE   SYSTABLES-DBNAME     TO   DBNAME OF CAB4.             00004420
           MOVE   SYSTABLES-CREATOR    TO   CREATOR OF CAB4.            00004430
           MOVE   SYSTABLES-NAME       TO   TNAME OF CAB4.              00004440
      *---                                                              00004450
           MOVE   SYSTABLES-CREATOR    TO   H-CREATOR-DYN1.             00004460
           MOVE   SYSTABLES-NAME-T(1:SYSTABLES-NAME-L)                  00004470
                                       TO   H-TBNAME-DYN1.              00004480
           MOVE   WHERE-DYN1           TO   WHERE-CLAUSE.               00004490
           MOVE   1                    TO   CH-AUX.                     00004500
           MOVE   'SIM'                TO   N88-1VEZ.                   00004510
           PERFORM  0600-0400-TRATA-DEPENDENCIA THRU 0600-0400-EXIT.    00004520
      *---                                                              00004530
           MOVE   SYSTABLES-CREATOR    TO   H-REFTBCREATOR-DYN2.        00004540
           MOVE   SYSTABLES-NAME-T(1:SYSTABLES-NAME-L)                  00004550
                                       TO   H-REFTBNAME-DYN2.           00004560
           MOVE   WHERE-DYN2           TO   WHERE-CLAUSE.               00004570
           MOVE   2                    TO   CH-AUX.                     00004580
           MOVE   'SIM'                TO   N88-1VEZ.                   00004590
           PERFORM  0600-0400-TRATA-DEPENDENCIA THRU 0600-0400-EXIT.    00004600
                                                                        00004610
           MOVE   99                   TO   AC-LINHA.                   00004620
           PERFORM  0300-9999-FETCH-SYSTABLES THRU 0300-9999-EXIT.      00004630
       0400-0000-EXIT. EXIT.                                            00004640
      *----------------------------------------------------------------*00004650
      *                                                                *00004660
      *----------------------------------------------------------------*00004670
       0500-0400-SYSTABLES.                                             00004680
           MOVE   SYSTABLES-NAME       TO   HAUX-NAME.                  00004690
           MOVE   SYSTABLES-CREATOR    TO   HAUX-CREATOR.               00004700
           INITIALIZE  SYSTABLES.                                       00004710
           EXEC SQL                                                     00004720
                SELECT NAME, CREATOR, TYPE, DBNAME,                     00004730
                       TBCREATOR, TBNAME                                00004740
                  INTO :SYSTABLES-NAME, :SYSTABLES-CREATOR,             00004750
                       :SYSTABLES-TYPE, :SYSTABLES-DBNAME,              00004760
                       :SYSTABLES-TBCREATOR, :SYSTABLES-TBNAME          00004770
                  FROM SYSIBM.SYSTABLES                                 00004780
                 WHERE NAME    = :HAUX-NAME                             00004790
                   AND CREATOR = :HAUX-CREATOR                          00004800
           END-EXEC.                                                    00004810
           IF  SQLCODE  EQUAL  +0                                       00004820
               NEXT  SENTENCE                                           00004830
           ELSE                                                         00004840
               IF  SQLCODE  EQUAL  +100                                 00004850
                   NEXT  SENTENCE                                       00004860
               ELSE                                                     00004870
                   DISPLAY '*** ERRO NO SELECT SYSIBM.SYSTABLES'        00004880
                   DISPLAY '*** TABELA NAO ENCONTRADA: ' PARAMETRO      00004890
                   PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT     00004900
               END-IF                                                   00004910
           END-IF.                                                      00004920
       0500-0400-EXIT. EXIT.                                            00004930
      *----------------------------------------------------------------*00004940
      *                                                                *00004950
      *----------------------------------------------------------------*00004960
       0600-0400-TRATA-DEPENDENCIA.                                     00004970
           MOVE   SELECT-SYSRELS       TO   CMD-SQL.                    00004980
           EXEC SQL PREPARE CMDSYSRELS FROM :DYNAMIC-SQL END-EXEC.      00004990
           IF  SQLCODE  EQUAL  +0                                       00005000
               NEXT  SENTENCE                                           00005010
           ELSE                                                         00005020
               DISPLAY '*** ERRO DE PREPARE'                            00005030
               DISPLAY '*** SELECT-CMD: ' SELECT-SYSRELS                00005040
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00005050
           END-IF.                                                      00005060
                                                                        00005070
           EXEC SQL                                                     00005080
                DECLARE C_PAIS CURSOR                                   00005090
                    FOR CMDSYSRELS                                      00005100
           END-EXEC.                                                    00005110
                                                                        00005120
           EXEC SQL OPEN C_PAIS END-EXEC.                               00005130
           IF  SQLCODE  EQUAL  +0                                       00005140
               NEXT  SENTENCE                                           00005150
           ELSE                                                         00005160
               DISPLAY '*** ERRO DE OPEN C_PAIS'                        00005170
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00005180
           END-IF.                                                      00005190
                                                                        00005200
           MOVE   'NAO'                TO   N88-FIM-PAIS.               00005210
           PERFORM  0700-9999-FETCH-PAIS THRU 0700-9999-EXIT.           00005220
           PERFORM  0800-0600-TRATA-PAIS THRU 0800-0600-EXIT            00005230
             UNTIL  FIM-PAIS.                                           00005240
                                                                        00005250
           EXEC SQL CLOSE C_PAIS END-EXEC.                              00005260
           IF  SQLCODE  EQUAL  +0                                       00005270
               NEXT  SENTENCE                                           00005280
           ELSE                                                         00005290
               DISPLAY '*** ERRO DE CLOSE C_PAIS'                       00005300
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00005310
           END-IF.                                                      00005320
       0600-0400-EXIT. EXIT.                                            00005330
      *----------------------------------------------------------------*00005340
      *                                                                *00005350
      *----------------------------------------------------------------*00005360
       0700-9999-FETCH-PAIS.                                            00005370
           INITIALIZE  SYSRELS.                                         00005380
           EXEC SQL                                                     00005390
                FETCH  C_PAIS                                           00005400
                 INTO  :SYSRELS-CREATOR,      :SYSRELS-TBNAME,          00005410
                       :SYSRELS-REFTBCREATOR, :SYSRELS-REFTBNAME,       00005420
                       :SYSRELS-DELETERULE,   :SYSRELS-RELNAME,         00005430
                       :SYSTABLES-DBNAME                                00005440
           END-EXEC.                                                    00005450
           IF  SQLCODE  EQUAL  +0                                       00005460
               NEXT  SENTENCE                                           00005470
           ELSE                                                         00005480
             IF  SQLCODE  EQUAL  +100                                   00005490
                 MOVE  'SIM'           TO  N88-FIM-PAIS                 00005500
             ELSE                                                       00005510
                 DISPLAY '*** ERRO NO FETCH C_PAIS'                     00005520
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00005530
             END-IF                                                     00005540
           END-IF.                                                      00005550
       0700-9999-EXIT. EXIT.                                            00005560
      *----------------------------------------------------------------*00005570
      *                                                                *00005580
      *----------------------------------------------------------------*00005590
       0800-0600-TRATA-PAIS.                                            00005600
           MOVE   SYSRELS-CREATOR      TO   SYSFOREIGNKEYS-CREATOR.     00005610
           MOVE   SYSRELS-TBNAME       TO   SYSFOREIGNKEYS-TBNAME.      00005620
           MOVE   SYSRELS-RELNAME      TO   SYSFOREIGNKEYS-RELNAME.     00005630
                                                                        00005640
           MOVE   SYSTABLES-DBNAME     TO   DBNAME OF LDET.             00005650
           IF  CH-AUX EQUAL 1                                           00005660
               MOVE   SYSRELS-REFTBCREATOR    TO   CREATOR OF LDET      00005670
               MOVE   SYSRELS-REFTBNAME       TO   TNAME OF LDET        00005680
           ELSE                                                         00005690
               MOVE   SYSRELS-CREATOR      TO   CREATOR OF LDET         00005700
               MOVE   SYSRELS-TBNAME       TO   TNAME OF LDET           00005710
           END-IF.                                                      00005720
                                                                        00005730
           EXEC SQL                                                     00005740
                DECLARE C_COLUMNS CURSOR FOR                            00005750
                SELECT A.NAME, A.COLTYPE, A.LENGTH, A.SCALE, A.NULLS,   00005760
                       B.COLSEQ                                         00005770
                  FROM SYSIBM.SYSCOLUMNS A,                             00005780
                       SYSIBM.SYSFOREIGNKEYS B                          00005790
                 WHERE B.RELNAME = :SYSFOREIGNKEYS-RELNAME              00005800
                   AND B.CREATOR = :SYSFOREIGNKEYS-CREATOR              00005810
                   AND B.TBNAME  = :SYSFOREIGNKEYS-TBNAME               00005820
                   AND A.NAME    = B.COLNAME                            00005830
                   AND A.TBCREATOR = B.CREATOR                          00005840
                   AND A.TBNAME  = B.TBNAME                             00005850
                 ORDER BY B.COLSEQ                                      00005860
           END-EXEC.                                                    00005870
                                                                        00005880
           EXEC SQL OPEN C_COLUMNS END-EXEC.                            00005890
           IF  SQLCODE  EQUAL  +0                                       00005900
               NEXT  SENTENCE                                           00005910
           ELSE                                                         00005920
               DISPLAY '*** ERRO DE OPEN'                               00005930
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00005940
           END-IF.                                                      00005950
                                                                        00005960
           IF   SYSRELS-DELETERULE  EQUAL  'C'                          00005970
                MOVE   'CASCADE'       TO   DELETE-RULE OF LDET         00005980
           ELSE                                                         00005990
             IF   SYSRELS-DELETERULE  EQUAL  'R'                        00006000
                  MOVE   'RESTRICT'    TO   DELETE-RULE OF LDET         00006010
             ELSE                                                       00006020
               IF   SYSRELS-DELETERULE  EQUAL  'N'                      00006030
                    MOVE   'SET NULL'  TO   DELETE-RULE OF LDET         00006040
               ELSE                                                     00006050
                    MOVE   SYSRELS-DELETERULE TO DELETE-RULE OF LDET    00006060
               END-IF                                                   00006070
             END-IF                                                     00006080
           END-IF.                                                      00006090
                                                                        00006100
           MOVE   SYSRELS-RELNAME      TO   CONSTRAINT OF LDET.         00006110
           MOVE   'NAO'                TO   N88-FIM-COLUMNS.            00006120
           PERFORM  0900-9999-FETCH-COLUMNS THRU 0900-9999-EXIT.        00006130
           PERFORM  1000-0800-TRATA-COLUMNS THRU 1000-0800-EXIT         00006140
             UNTIL  FIM-COLUMNS.                                        00006150
                                                                        00006160
           EXEC SQL CLOSE C_COLUMNS END-EXEC.                           00006170
           IF  SQLCODE  EQUAL  +0                                       00006180
               NEXT  SENTENCE                                           00006190
           ELSE                                                         00006200
               DISPLAY '*** ERRO DE CLOSE C_COLUMNS'                    00006210
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00006220
           END-IF.                                                      00006230
           PERFORM  0700-9999-FETCH-PAIS THRU 0700-9999-EXIT.           00006240
           MOVE   SPACES               TO  REG-LSTOUT.                  00006250
           WRITE   REG-LSTOUT.                                          00006260
       0800-0600-EXIT. EXIT.                                            00006270
      *----------------------------------------------------------------*00006280
      *                                                                *00006290
      *----------------------------------------------------------------*00006300
       0900-9999-FETCH-COLUMNS.                                         00006310
           INITIALIZE  SYSCOLUMNS, SYSFOREIGNKEYS.                      00006320
           EXEC SQL                                                     00006330
                FETCH  C_COLUMNS                                        00006340
                 INTO  :SYSCOLUMNS-NAME,   :SYSCOLUMNS-COLTYPE,         00006350
                       :SYSCOLUMNS-LENGTH, :SYSCOLUMNS-SCALE,           00006360
                       :SYSCOLUMNS-NULLS,  :SYSFOREIGNKEYS-COLSEQ       00006370
           END-EXEC.                                                    00006380
           IF  SQLCODE  EQUAL  +0                                       00006390
               NEXT  SENTENCE                                           00006400
           ELSE                                                         00006410
             IF  SQLCODE  EQUAL  +100                                   00006420
                 MOVE  'SIM'           TO  N88-FIM-COLUMNS              00006430
             ELSE                                                       00006440
                 DISPLAY '*** ERRO NO FETCH C_COLUMNS'                  00006450
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00006460
             END-IF                                                     00006470
           END-IF.                                                      00006480
       0900-9999-EXIT. EXIT.                                            00006490
      *----------------------------------------------------------------*00006500
      *                                                                *00006510
      *----------------------------------------------------------------*00006520
       1000-0800-TRATA-COLUMNS.                                         00006530
           IF  AC-LINHA  GREATER   60                                   00006540
               WRITE   REG-LSTOUT      FROM    CAB1 AFTER PAGE          00006550
               WRITE   REG-LSTOUT      FROM    CAB2                     00006560
               WRITE   REG-LSTOUT      FROM    CAB3                     00006570
               WRITE   REG-LSTOUT      FROM    CAB5 AFTER 2             00006580
               WRITE   REG-LSTOUT      FROM    CAB6                     00006590
               WRITE   REG-LSTOUT      FROM    CAB3                     00006600
               PERFORM 1100-1000-PKEYS THRU  1100-9999-EXIT             00006610
               MOVE    SPACES          TO      REG-LSTOUT               00006620
               WRITE   REG-LSTOUT                                       00006630
               MOVE    7               TO   AC-LINHA                    00006640
           END-IF.                                                      00006650
                                                                        00006660
           MOVE   SYSCOLUMNS-NAME-T(1:SYSCOLUMNS-NAME-L)                00006670
                                       TO   CNAME OF LDET.              00006680
           MOVE   SYSCOLUMNS-COLTYPE   TO   CTYPE OF LDET.              00006690
           MOVE   SYSCOLUMNS-LENGTH    TO   CLENGTH OF LDET.            00006700
           IF  SYSCOLUMNS-SCALE  EQUAL  0                               00006710
               MOVE   SPACES           TO   VIRG OF LDET                00006720
               MOVE   SYSCOLUMNS-SCALE TO   CSCALE-R OF LDET            00006730
           ELSE                                                         00006740
               MOVE   ','              TO   VIRG OF LDET                00006750
               MOVE   SYSCOLUMNS-SCALE TO   CSCALE-R OF LDET            00006760
           END-IF.                                                      00006770
           MOVE   SYSCOLUMNS-NULLS     TO   CNULL  OF LDET.             00006780
                                                                        00006790
           IF  1VEZ                                                     00006800
               IF  CH-AUX EQUAL 1                                       00006810
                   MOVE   '*** DEPENDENCIA ***' TO  REG-LSTOUT          00006820
                   WRITE  REG-LSTOUT                                    00006830
               ELSE                                                     00006840
                   MOVE   '*** DEPENDENTES ***' TO  REG-LSTOUT          00006850
                   WRITE  REG-LSTOUT                                    00006860
               END-IF                                                   00006870
               MOVE   'NAO'            TO   N88-1VEZ                    00006880
           END-IF.                                                      00006890
           WRITE   REG-LSTOUT          FROM    LDET.                    00006900
           ADD     1                   TO      AC-LINHA.                00006910
           PERFORM  0900-9999-FETCH-COLUMNS THRU 0900-9999-EXIT.        00006920
           MOVE    SPACES              TO      LDET.                    00006930
       1000-0800-EXIT. EXIT.                                            00006940
      *----------------------------------------------------------------*00006950
      *                                                                *00006960
      *----------------------------------------------------------------*00006970
       1100-1000-PKEYS.                                                 00006980
           EXEC SQL                                                     00006990
                 DECLARE C_PKEYS CURSOR FOR                             00007000
                 SELECT C.COLNAME, C.COLSEQ, D.COLTYPE,D.LENGTH,        00007010
                        D.SCALE, D.NULLS                                00007020
                   FROM SYSIBM.SYSTABLES  A,                            00007030
                        SYSIBM.SYSINDEXES B,                            00007040
                        SYSIBM.SYSKEYS    C,                            00007050
                        SYSIBM.SYSCOLUMNS D                             00007060
                  WHERE A.CREATOR    = :SYSTABLES-CREATOR               00007070
                    AND A.NAME       = :SYSTABLES-NAME                  00007080
                    AND B.TBCREATOR  = A.CREATOR                        00007090
                    AND B.TBNAME     = A.NAME                           00007100
                    AND B.UNIQUERULE = 'P'                              00007110
                    AND C.IXNAME     = B.NAME                           00007120
                    AND C.IXCREATOR  = B.CREATOR                        00007130
                    AND D.TBNAME     = A.NAME                           00007140
                    AND D.TBCREATOR  = A.CREATOR                        00007150
                    AND D.NAME       = C.COLNAME                        00007160
                  ORDER BY C.COLSEQ                                     00007170
           END-EXEC.                                                    00007180
                                                                        00007190
           EXEC SQL OPEN C_PKEYS END-EXEC.                              00007200
           IF  SQLCODE  EQUAL  +0                                       00007210
               NEXT  SENTENCE                                           00007220
           ELSE                                                         00007230
               DISPLAY '*** ERRO DE OPEN C_PKEYS'                       00007240
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00007250
           END-IF.                                                      00007260
                                                                        00007270
           PERFORM  1200-9999-FETCH-PKEYS   THRU 1200-9999-EXIT.        00007280
           MOVE     'NAO'                   TO   N88-FIM-PKEYS.         00007290
           PERFORM  1300-1100-TRATA-PKEYS   THRU 1300-1100-EXIT         00007300
             UNTIL  FIM-PKEYS.                                          00007310
                                                                        00007320
           EXEC SQL CLOSE C_PKEYS END-EXEC.                             00007330
           IF  SQLCODE  EQUAL  +0                                       00007340
               NEXT  SENTENCE                                           00007350
           ELSE                                                         00007360
               DISPLAY '*** ERRO DE CLOSE C_PKEYS'                      00007370
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00007380
           END-IF.                                                      00007390
       1100-9999-EXIT. EXIT.                                            00007400
      *----------------------------------------------------------------*00007410
      *                                                                *00007420
      *----------------------------------------------------------------*00007430
       1200-9999-FETCH-PKEYS.                                           00007440
           INITIALIZE SYSKEYS.                                          00007450
           EXEC SQL                                                     00007460
                FETCH  C_PKEYS                                          00007470
                 INTO  :SYSKEYS-COLNAME,   :SYSKEYS-COLSEQ,             00007480
                       :SYSKEYS-COLTYPE,   :SYSKEYS-LENGTH,             00007490
                       :SYSKEYS-SCALE,     :SYSKEYS-NULLS               00007500
           END-EXEC.                                                    00007510
           IF  SQLCODE  EQUAL  +0                                       00007520
               NEXT  SENTENCE                                           00007530
           ELSE                                                         00007540
             IF  SQLCODE  EQUAL  +100                                   00007550
                 MOVE  'SIM'           TO  N88-FIM-PKEYS                00007560
             ELSE                                                       00007570
                 DISPLAY '*** ERRO NO FETCH C_PKEYS'                    00007580
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00007590
             END-IF                                                     00007600
           END-IF.                                                      00007610
       1200-9999-EXIT. EXIT.                                            00007620
      *----------------------------------------------------------------*00007630
      *                                                                *00007640
      *----------------------------------------------------------------*00007650
       1300-1100-TRATA-PKEYS.                                           00007660
           MOVE    SYSKEYS-COLNAME-T(1:SYSKEYS-COLNAME-L)               00007670
                                       TO   CNAME OF CAB4.              00007680
           MOVE    SYSKEYS-COLTYPE     TO   CTYPE OF CAB4.              00007690
           MOVE    SYSKEYS-LENGTH      TO   CLENGTH OF CAB4.            00007700
           IF  SYSKEYS-SCALE  EQUAL  0                                  00007710
               MOVE   SPACES           TO   VIRG OF CAB4                00007720
               MOVE   SYSKEYS-SCALE    TO   CSCALE-R OF CAB4            00007730
           ELSE                                                         00007740
               MOVE   ','              TO   VIRG OF CAB4                00007750
               MOVE   SYSKEYS-SCALE    TO   CSCALE-R OF CAB4            00007760
           END-IF.                                                      00007770
           MOVE    SYSKEYS-NULLS       TO   CNULL OF CAB4.              00007780
           WRITE   REG-LSTOUT      FROM    CAB4 AFTER 2                 00007790
           MOVE    SPACES          TO      REG-LSTOUT CAB4.             00007800
           PERFORM  1200-9999-FETCH-PKEYS   THRU 1200-9999-EXIT.        00007810
       1300-1100-EXIT. EXIT.                                            00007820
      *----------------------------------------------------------------*00007830
      *                                                                *00007840
      *----------------------------------------------------------------*00007850
       9999-9999-ERRO-DB2.                                              00007860
           MOVE   SQLCODE              TO  WS-SQLCODE.                  00007870
           DISPLAY '*** SQLCODE  ' WS-SQLCODE.                          00007880
           DISPLAY '    SQLERRMC ' SQLERRMC.                            00007890
           DISPLAY '    SQLSTATE ' SQLSTATE.                            00007900
           MOVE   +16                  TO  RETURN-CODE.                 00007910
           STOP RUN.                                                    00007920
       9999-9999-EXIT. EXIT.                                            00007930