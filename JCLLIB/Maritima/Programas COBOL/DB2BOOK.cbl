       IDENTIFICATION DIVISION.                                         00000010
       PROGRAM-ID.    DB2BOOK.                                          00000020
      *----------------------------------------------------------------*00000030
      * AUTOR: JOSE CICERO                                             *00000040
      * DATA:  NOV/1996                                                *00000050
      * OBJETIVOS: CRIAR A PARTIR DA SYSIBM.SYSCOLUMNS BOOKS COBOL/CSP *00000060
      *            ESTE PROGRAMA E' A VERSAO ATUALIZADA DO PROGRAMA    *00000070
      *            QUE EXECUTAVA NO VM/SQL. AGORA ESTA VERSAO ESTA'    *00000080
      *            TRATANDO TODOS OS TIPOS DE DADOS DO SQL, CONFORME   *00000090
      *            MANUAL SQL REFERENCE (SC26-4890-00) DO DB2 V3       *00000100
      *----------------------------------------------------------------*00000110
      * 01.12.02   HIRANO - ACERTO PARA CAMPO COM VARCHAR              *00000120
      *----------------------------------------------------------------*00000130
       ENVIRONMENT    DIVISION.                                         00000140
      *                                                                 00000150
       INPUT-OUTPUT       SECTION.                                      00000160
       FILE-CONTROL.                                                    00000170
           SELECT  BOOK   ASSIGN  TO  BOOKO.                            00000180
      *                                                                 00000190
       DATA DIVISION.                                                   00000200
      *                                                                 00000210
       FILE            SECTION.                                         00000220
       FD  BOOK                                                         00000230
           LABEL  RECORD  IS  OMITTED                                   00000240
           RECORDING MODE IS F.                                         00000250
                                                                        00000260
       01  REG-BOOK                    PIC  X(080).                     00000270
                                                                        00000280
       WORKING-STORAGE SECTION.                                         00000290
      *----------------------------------------------------------------*00000300
      *                                                                *00000310
      *----------------------------------------------------------------*00000320
       01  SYSTABLES.                                                   00000330
           02  SYSTABLES-CREATOR            PIC  X(08).                 00000340
           02  SYSTABLES-NAME.                                          00000350
               49  SYSTABLES-NAME-L         PIC S9(04) COMP.            00000360
               49  SYSTABLES-NAME-T         PIC  X(18).                 00000370
           02  SYSTABLES-TBCREATOR          PIC  X(08).                 00000380
           02  SYSTABLES-TBNAME.                                        00000390
               49  SYSTABLES-TBNAME-L       PIC S9(04) COMP.            00000400
               49  SYSTABLES-TBNAME-T       PIC  X(18).                 00000410
           02  SYSTABLES-TYPE               PIC  X(01).                 00000420
           02  SYSTABLES-TSNAME             PIC  X(08).                 00000430
      *----------------------------------------------------------------*00000440
      *                                                                *00000450
      *----------------------------------------------------------------*00000460
       01  SYSCOLUMNS.                                                  00000470
           02  SYSCOLUMNS-NAME.                                         00000480
               49  SYSCOLUMNS-NAME-L        PIC S9(04) COMP.            00000490
               49  SYSCOLUMNS-NAME-T        PIC  X(18).                 00000500
           02  SYSCOLUMNS-LENGTH            PIC S9(04) COMP.            00000510
           02  SYSCOLUMNS-SCALE             PIC S9(04) COMP.            00000520
           02  SYSCOLUMNS-COLTYPE           PIC  X(08).                 00000530
           02  SYSCOLUMNS-COLNO             PIC S9(04) COMP.            00000540
      *----------------------------------------------------------------*00000550
      *                                                                *00000560
      *----------------------------------------------------------------*00000570
       77  WX-CRIAD               PIC  X(008)        VALUE SPACES.      00000580
       77  WX-TABEL               PIC  X(018)        VALUE SPACES.      00000590
       77  WN-TAMAN               PIC S9(004)  COMP  VALUE +0.          00000600
       77  WN-RESTO               PIC S9(002)  COMP  VALUE +0.          00000610
       77  WN-FIM-CARTAO          PIC S9(009)  COMP  VALUE ZEROS.       00000620
       77  WX-FDLINHA             PIC  X(080)        VALUE SPACES.      00000630
       77  LINHA                  PIC  X(080)        VALUE SPACES.      00000640
       77  MAX-LENGTH             PIC S9(04)   COMP  VALUE +0.          00000650
      *----------------------------------------------------------------*00000660
      *                                                                *00000670
      *----------------------------------------------------------------*00000680
       01  LONGNAME               PIC  X(70).                           00000690
       01  N88-FIM-SYSCOLUMNS     PIC  X(01)         VALUE 'N'.         00000700
           88  FIM-SYSCOLUMNS                        VALUE 'S'.         00000710
                                                                        00000720
       01  N88-TIPO-FORMATO       PIC  X(01)         VALUE 'N'.         00000730
           88  FORMATO-NOVO                          VALUE 'N'.         00000740
           88  FORMATO-ANTIGO                        VALUE 'O'.         00000750
      *----------------------------------------------------------------*00000760
      *                                                                *00000770
      *----------------------------------------------------------------*00000780
       01  LINHA-COBOL-01.                                              00000790
           02  FILLER             PIC  X(07)         VALUE SPACES.      00000800
           02  FILLER             PIC  X(04)         VALUE '01'.        00000810
           02  LCOBOL-TNAME       PIC  X(61).                           00000820
                                                                        00000830
       01  LINHA-COBOL-G.                                               00000840
           02  FILLER             PIC  X(11)         VALUE SPACES.      00000850
           02  FILLER             PIC  X(04)         VALUE '02'.        00000860
           02  LCOBOL-NAME-G      PIC  X(23).                           00000870
           02  FILLER             PIC  X(01)         VALUE SPACES.      00000880
           02  LCOBOL-PIC-G       PIC  X(38).                           00000890
                                                                        00000900
      *----------------------------------------------------------------*00000910
      *    LINHA ESPECIFICA PARA  PARTE NOVA DO BOOK                   *00000920
      *----------------------------------------------------------------*00000930
       01  LINHA-COBOL-I.                                               00000940
           02  FILLER             PIC  X(12)         VALUE SPACES.      00000950
           02  FILLER             PIC  X(03)         VALUE '49'.        00000960
           02  LCOBOL-NAME-I      PIC  X(23).                           00000970
           02  FILLER             PIC  X(01)         VALUE SPACES.      00000980
           02  LCOBOL-PIC-I       PIC  X(38).                           00000990
                                                                        00001000
      *----------------------------------------------------------------*00001010
      *                                                                *00001020
      *----------------------------------------------------------------*00001030
       01  WS-INTEGER             PIC  X(37)         VALUE              00001040
           'PIC S9(009)      COMP.'.                                    00001050
                                                                        00001060
       01  WS-SMALLINT            PIC  X(37)         VALUE              00001070
           'PIC S9(004)      COMP.'.                                    00001080
                                                                        00001090
       01  WS-DATE.                                                     00001100
           02  FILLER             PIC  X(30)         VALUE              00001110
               'PIC  X(010).'.                                          00001120
                                                                        00001130
       01  WS-TIME.                                                     00001140
           02  FILLER             PIC  X(30)         VALUE              00001150
               'PIC  X(008).'.                                          00001160
                                                                        00001170
       01  WS-TIMESTMP.                                                 00001180
           02  FILLER             PIC  X(30)         VALUE              00001190
               'PIC  X(026).'.                                          00001200
                                                                        00001210
       01  WS-FLOAT.                                                    00001220
           02  FILLER             PIC  X(16)         VALUE SPACES.      00001230
           02  FILLER             PIC  X(05)         VALUE 'COMP-'.     00001240
           02  WS-FLOAT-TIPO      PIC  9(01)B(02).                      00001250
                                                                        00001260
       01  WS-CHAR.                                                     00001270
           02  FILLER             PIC  X(05)         VALUE 'PIC'.       00001280
           02  PIC-TYPE           PIC  X(01).                           00001290
           02  FILLER             PIC  X(01)         VALUE '('.         00001300
           02  WS-CHAR-L          PIC  9(03).                           00001310
           02  FILLER             PIC  X(20)         VALUE              00001320
               ').'.                                                    00001330
                                                                        00001340
       01  WS-CHAR-LONG.                                                00001350
           02  FILLER             PIC  X(05)         VALUE 'PIC'.       00001360
           02  PIC-TYPE-LONG      PIC  X(01).                           00001370
           02  FILLER             PIC  X(01)         VALUE '('.         00001380
           02  WS-CHAR-LONG-L     PIC  9(05).                           00001390
           02  FILLER             PIC  X(02)         VALUE              00001400
               ').'.                                                    00001410
                                                                        00001420
       01  WS-GRAPHIC.                                                  00001430
           02  FILLER             PIC  X(07)         VALUE 'PIC  G('.   00001440
           02  WS-GRAPHIC-L       PIC  9(03).                           00001450
           02  FILLER             PIC  X(21)         VALUE              00001460
               ').'.                                                    00001470
                                                                        00001480
       01  WS-DECIMAL.                                                  00001490
           02  FILLER             PIC  X(07)         VALUE 'PIC S9('.   00001500
           02  WS-DEC-P           PIC  9(02).                           00001510
           02  FILLER             PIC  X(01)         VALUE ')'.         00001520
           02  VIRGULA            PIC  X(03)         VALUE 'V9('.       00001530
           02  WS-DEC-S           PIC  9(02)        BLANK WHEN ZERO.    00001540
           02  PARENTESES-DIR     PIC  X(01)B(01)    VALUE ')'.         00001550
           02  FILLER             PIC  X(20)         VALUE              00001560
               'COMP-3.'.                                               00001570
      *----------------------------------------------------------------*00001580
      *                                                                *00001590
      *----------------------------------------------------------------*00001600
       01  TABELA-COLUNAS.                                              00001610
           02  IND-CTAB           PIC S9(04) COMP    VALUE +0.          00001620
           02  FILLER             OCCURS    800  TIMES.                 00001630
               04  CNAME          PIC  X(18)         VALUE ' '.         00001640
               04  CLENGTH        PIC S9(04) COMP    VALUE +0.          00001650
               04  CSCALE         PIC S9(04) COMP    VALUE +0.          00001660
               04  CCOLTYPE       PIC  X(08)         VALUE ' '.         00001670
               04  CFILLER        PIC S9(04) COMP    VALUE +0.          00001680
      *----------------------------------------------------------------*00001690
      *                                                                *00001700
      *----------------------------------------------------------------*00001710
           EXEC  SQL INCLUDE SQLCA          END-EXEC.                   00001720
      *                                                                 00001730
       01  CURDATA                PIC  9(06).                           00001740
       01  CURDATA-R  REDEFINES  CURDATA.                               00001750
           03  ANO                PIC 9(02).                            00001760
           03  MES                PIC 9(02).                            00001770
           03  DIA                PIC 9(02).                            00001780
      *                                                                 00001790
       01  CURHORA                PIC  9(08).                           00001800
       01  CURHORA-R  REDEFINES  CURHORA.                               00001810
           03  HORA               PIC 9(002).                           00001820
           03  MINUTO             PIC 9(002).                           00001830
           03  SEGUNDO            PIC 9(002).                           00001840
           03  MICROSEGUNDO       PIC 9(002).                           00001850
      *                                                                 00001860
       01  PARAMETRO.                                                   00001870
           05  PAR-CRIADOR        PIC X(08).                            00001880
           05  FILLER             PIC X(01).                            00001890
           05  PAR-TABELA         PIC X(18).                            00001900
           05  FILLER             PIC X(01).                            00001910
           05  PAR-PGMR           PIC X(08).                            00001920
           05  FILLER             PIC X(01).                            00001930
           05  PAR-FLAG-EXISTE    PIC X(01).                            00001940
      *                                                                 00001950
       01  RESTO                  PIC S9(04) COMP    VALUE +0.          00001960
       01  WK-POS                 PIC 9(03)          VALUE ZEROS.       00001970
       01  WK-SQLCODE             PIC ----9          VALUE ZEROS.       00001980
                                                                        00001990
       01  WX-HORA.                                                     00002000
           03      WX-HOR         PIC X(02).                            00002010
           03      WX-MIN         PIC X(02).                            00002020
           03      WX-SEG         PIC X(02).                            00002030
           03      FILLER         PIC X(02).                            00002040
                                                                        00002050
       01  WX-COMENTARIO-01.                                            00002060
           03      FILLER         PIC X(06)          VALUE SPACES.      00002070
           03      FILLER         PIC X(66)          VALUE '*'.         00002080
      *                                                                 00002090
       01  WX-COMENTARIO-02.                                            00002100
           03      FILLER         PIC X(06)          VALUE SPACES.      00002110
           03      FILLER         PIC X(01)          VALUE '*'.         00002120
           03      FILLER         PIC X(64)          VALUE              00002130
                   ALL '-'.                                             00002140
           03      FILLER         PIC X(01)          VALUE '*'.         00002150
      *                                                                 00002160
       01  WX-COMENTARIO-03.                                            00002170
           03      FILLER         PIC X(06)          VALUE SPACES.      00002180
           03      FILLER         PIC X(45)          VALUE              00002190
                   '* A MARITIMA - CIA DE SEGUROS GERAIS         '.     00002200
           03      WX-DATA-CO.                                          00002210
               05  DIA            PIC 9(02)/.                           00002220
               05  MES            PIC 9(02)/.                           00002230
               05  ANO            PIC 9(02).                            00002240
           03      FILLER         PIC X(03)          VALUE ' - '.       00002250
           03      WX-HORA-CO.                                          00002260
               05  HORA           PIC 9(02).                            00002270
               05  FILLER         PIC X(01)          VALUE ':'.         00002280
               05  MINUTO         PIC 9(02).                            00002290
               05  FILLER         PIC X(01)          VALUE ':'.         00002300
               05  SEGUNDO        PIC 9(02).                            00002310
           03      FILLER         PIC X(02)          VALUE ' *'.        00002320
      *                                                                 00002330
       01  WX-COMENTARIO-04.                                            00002340
           03      FILLER         PIC X(06)          VALUE SPACES.      00002350
           03      FILLER         PIC X(01)          VALUE '*'.         00002360
           03      FILLER         PIC X(64)          VALUE SPACES.      00002370
           03      FILLER         PIC X(01)          VALUE '*'.         00002380
      *                                                                 00002390
       01  WX-COMENTARIO-05.                                            00002400
           03      FILLER         PIC X(06)          VALUE SPACES.      00002410
           03      FILLER         PIC X(17)          VALUE              00002420
                   '* BOOK COBOL SQL:'.                                 00002430
           03      FILLER         PIC X(48)          VALUE SPACES.      00002440
           03      FILLER         PIC X(01)          VALUE '*'.         00002450
      *                                                                 00002460
       01  WX-COMENTARIO-06.                                            00002470
           03      FILLER         PIC X(06)          VALUE SPACES.      00002480
           03      FILLER         PIC X(32)          VALUE              00002490
                   '*                 CRIADOR.....: '.                  00002500
           03      WX-CREATOR-CO  PIC X(15)          VALUE SPACES.      00002510
           03      FILLER         PIC X(18)          VALUE SPACES.      00002520
           03      FILLER         PIC X(01)          VALUE '*'.         00002530
      *                                                                 00002540
       01  WX-COMENTARIO-07.                                            00002550
           03      FILLER         PIC X(06)          VALUE SPACES.      00002560
           03      FILLER         PIC X(32)          VALUE              00002570
                   '*                 TABELA SQL..: '.                  00002580
           03      WX-TNAME-CO    PIC X(18)          VALUE SPACES.      00002590
           03      FILLER         PIC X(15)          VALUE SPACES.      00002600
           03      FILLER         PIC X(01)          VALUE '*'.         00002610
      *                                                                 00002620
       01  WX-COMENTARIO-08.                                            00002630
           03      FILLER         PIC X(06)          VALUE SPACES.      00002640
           03      FILLER         PIC X(01)          VALUE '*'.         00002650
           03      FILLER         PIC X(64)          VALUE              00002660
                   ALL '-'.                                             00002670
           03      FILLER         PIC X(01)          VALUE '*'.         00002680
      *                                                                 00002690
       01  WX-COMENTARIO-09.                                            00002700
           03      FILLER         PIC X(06)          VALUE SPACES.      00002710
           03      FILLER         PIC X(66)          VALUE '*'.         00002720
      *                                                                 00002730
       01  LIBRARIAN-DLM.                                               00002740
           03  FILLER             PIC X(05)          VALUE '-DLM'.      00002750
           03  DLM-NAME           PIC X(08).                            00002760
       01  LIBRARIAN-SEL.                                               00002770
           03  FILLER             PIC X(05)          VALUE '-SEL'.      00002780
           03  SEL-NAME           PIC X(08).                            00002790
       01  LIBRARIAN-REP.                                               00002800
           03  FILLER             PIC X(08)          VALUE '-REP ALL'.  00002810
       01  LIBRARIAN-ADD.                                               00002820
           03  FILLER             PIC X(05)          VALUE '-ADD'.      00002830
           03  ADD-NAME           PIC X(08).                            00002840
       01  LIBRARIAN-LANG.                                              00002850
           03  FILLER             PIC X(09)          VALUE '-LANG BOO'. 00002860
       01  LIBRARIAN-PGMR.                                              00002870
           03  FILLER             PIC X(06)          VALUE '-PGMR'.     00002880
           03  PGMR-NAME          PIC X(08).                            00002890
       01  LIBRARIAN-END.                                               00002900
           03  FILLER             PIC X(05)          VALUE '-END'.      00002910
      *                                                                 00002920
       PROCEDURE   DIVISION.                                            00002930
      *----------------------------------------------------------------*00002940
      *                                                                *00002950
      *----------------------------------------------------------------*00002960
       0000-0000-PRINCIPAL.                                             00002970
           PERFORM 0100-0000-INICIO THRU 0100-0000-EXIT.                00002980
           PERFORM 0200-0000-CARGA THRU 0200-0000-EXIT.                 00002990
           PERFORM 1700-0000-COMENTARIO THRU 1700-0000-EXIT.            00003000
                                                                        00003010
           MOVE   'N'                   TO   N88-TIPO-FORMATO.          00003020
      *** GERA VARIAVEIS HOST                                           00003030
           STRING SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) '.'              00003040
                  DELIMITED BY SPACE INTO LONGNAME.                     00003050
           MOVE   LONGNAME             TO   LCOBOL-TNAME.               00003060
           MOVE   LINHA-COBOL-01       TO   LINHA.                      00003070
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00003080
                                                                        00003090
           PERFORM     VARYING   IND-CTAB   FROM   +1   BY   +1         00003100
                   UNTIL IND-CTAB  GREATER  +800                        00003110
                      OR CNAME(IND-CTAB)  EQUAL  SPACES                 00003120
                   PERFORM 0400-0000-HOSTS    THRU 0400-0000-EXIT       00003130
           END-PERFORM.                                                 00003140
                                                                        00003150
      *** GERA INDICADORES DE NULO                                      00003160
           MOVE    SPACES              TO     LINHA.                    00003170
           WRITE   REG-BOOK            FROM   LINHA.                    00003180
           STRING SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) '-I'             00003190
                  DELIMITED BY SPACE                                    00003200
                  ' REDEFINES '                                         00003210
                  DELIMITED BY SIZE                                     00003220
                  SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) '.'              00003230
                  DELIMITED BY SPACE INTO LONGNAME.                     00003240
           MOVE   LONGNAME             TO   LCOBOL-TNAME.               00003250
           MOVE   LINHA-COBOL-01       TO   LINHA.                      00003260
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00003270
           PERFORM     VARYING   IND-CTAB   FROM   +1   BY   +1         00003280
                   UNTIL IND-CTAB  GREATER  +800                        00003290
                      OR CNAME(IND-CTAB)  EQUAL  SPACES                 00003300
                   PERFORM 2100-0000-INDICADORES THRU 2100-0000-EXIT    00003310
           END-PERFORM.                                                 00003320
                                                                        00003330
      *** GERA BOOK NO FORMATO ANTIGO                                   00003340
           MOVE   'O'                  TO     N88-TIPO-FORMATO.         00003350
           MOVE    SPACES              TO     LINHA.                    00003360
           WRITE   REG-BOOK            FROM   LINHA.                    00003370
           STRING SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) '-OLD'           00003380
                  DELIMITED BY SPACE                                    00003390
                  ' REDEFINES ' DELIMITED BY SIZE                       00003400
                  SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) '.'              00003410
                  DELIMITED BY SPACE INTO LONGNAME.                     00003420
           MOVE   LONGNAME             TO   LCOBOL-TNAME.               00003430
           MOVE   LINHA-COBOL-01       TO   LINHA.                      00003440
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00003450
           PERFORM     VARYING   IND-CTAB   FROM   +1   BY   +1         00003460
                   UNTIL IND-CTAB  GREATER  +800                        00003470
                      OR CNAME(IND-CTAB)  EQUAL  SPACES                 00003480
                   PERFORM 0400-0000-HOSTS    THRU 0400-0000-EXIT       00003490
           END-PERFORM.                                                 00003500
                                                                        00003510
           PERFORM 2000-0000-FIM THRU 2000-0000-EXIT.                   00003520
           MOVE   +0                   TO  RETURN-CODE.                 00003530
           STOP  RUN.                                                   00003540
       0000-0000-EXIT. EXIT.                                            00003550
      *----------------------------------------------------------------*00003560
      *                                                                *00003570
      *----------------------------------------------------------------*00003580
       0100-0000-INICIO.                                                00003590
           OPEN OUTPUT BOOK.                                            00003600
           ACCEPT PARAMETRO.                                            00003610
                                                                        00003620
           DISPLAY ' PARAMETRO ==> ' PARAMETRO.                         00003630
           DISPLAY ' CREATOR       ' PAR-CRIADOR.                       00003640
           DISPLAY ' TABELA        ' PAR-TABELA.                        00003650
           DISPLAY ' PROGRAMADOR   ' PAR-PGMR.                          00003660
           DISPLAY ' FLAG          ' PAR-FLAG-EXISTE.                   00003670
       0100-0000-EXIT. EXIT.                                            00003680
           EXIT.                                                        00003690
      *----------------------------------------------------------------*00003700
      *                                                                *00003710
      *----------------------------------------------------------------*00003720
       0200-0000-CARGA.                                                 00003730
           MOVE   PAR-CRIADOR     TO   SYSTABLES-CREATOR.               00003740
           MOVE   +18             TO   SYSTABLES-NAME-L.                00003750
           MOVE   PAR-TABELA      TO   SYSTABLES-NAME-T.                00003760
           PERFORM  0210-0200-SYSTABLES THRU 0210-0200-EXIT.            00003770
                                                                        00003780
           IF  SYSTABLES-TYPE  EQUAL  'A'                               00003790
               MOVE   SYSTABLES-TBCREATOR   TO   SYSTABLES-CREATOR      00003800
               MOVE   SYSTABLES-TBNAME      TO   SYSTABLES-NAME         00003810
               PERFORM  0210-0200-SYSTABLES THRU 0210-0200-EXIT.        00003820
                                                                        00003830
           EXEC SQL                                                     00003840
                DECLARE C-SYSCOLUMNS CURSOR FOR                         00003850
                 SELECT NAME, LENGTH, SCALE, COLTYPE, COLNO             00003860
                   FROM SYSIBM.SYSCOLUMNS                               00003870
                  WHERE TBCREATOR = :SYSTABLES-CREATOR                  00003880
                    AND TBNAME    = :SYSTABLES-NAME                     00003890
                  ORDER BY COLNO                                        00003900
           END-EXEC.                                                    00003910
                                                                        00003920
           EXEC SQL OPEN C-SYSCOLUMNS  END-EXEC.                        00003930
           IF  SQLCODE  EQUAL  +0                                       00003940
               NEXT  SENTENCE                                           00003950
           ELSE                                                         00003960
               DISPLAY '*** ERRO NO OPEN'                               00003970
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00003980
           END-IF.                                                      00003990
                                                                        00004000
           PERFORM 0300-0200-FETCH THRU 0300-0200-EXIT.                 00004010
           IF  FIM-SYSCOLUMNS                                           00004020
               DISPLAY '*** TABELA INFORMADA ACIMA NAO ENCONTRADA'      00004030
               DISPLAY '*** EM CASO DE DUVIDAS, CONSULTAR DBA'          00004040
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00004050
           END-IF.                                                      00004060
                                                                        00004070
           INITIALIZE  TABELA-COLUNAS.                                  00004080
           PERFORM     VARYING   IND-CTAB   FROM   +1   BY   +1         00004090
                   UNTIL FIM-SYSCOLUMNS                                 00004100
               MOVE  SYSCOLUMNS-NAME-T(1:SYSCOLUMNS-NAME-L)             00004110
                                         TO   CNAME(IND-CTAB)           00004120
               INSPECT CNAME(IND-CTAB) REPLACING ALL '_' BY '-'         00004130
               MOVE  SYSCOLUMNS-LENGTH   TO   CLENGTH(IND-CTAB)         00004140
               MOVE  SYSCOLUMNS-SCALE    TO   CSCALE(IND-CTAB)          00004150
               MOVE  SYSCOLUMNS-COLTYPE  TO   CCOLTYPE(IND-CTAB)        00004160
               PERFORM 0300-0200-FETCH THRU 0300-0200-EXIT              00004170
           END-PERFORM.                                                 00004180
                                                                        00004190
           EXEC SQL CLOSE  C-SYSCOLUMNS END-EXEC.                       00004200
           IF  SQLCODE  EQUAL  +0                                       00004210
               NEXT  SENTENCE                                           00004220
           ELSE                                                         00004230
               DISPLAY '*** ERRO NO OPEN'                               00004240
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00004250
           END-IF.                                                      00004260
                                                                        00004270
           EXEC SQL COMMIT WORK END-EXEC.                               00004280
       0200-0000-EXIT. EXIT.                                            00004290
           EXIT.                                                        00004300
      *----------------------------------------------------------------*00004310
      *                                                                *00004320
      *----------------------------------------------------------------*00004330
       0210-0200-SYSTABLES.                                             00004340
           EXEC SQL                                                     00004350
                 SELECT CREATOR, NAME, TBCREATOR, TBNAME, TYPE, TSNAME  00004360
                   INTO :SYSTABLES-CREATOR, :SYSTABLES-NAME,            00004370
                        :SYSTABLES-TBCREATOR, :SYSTABLES-TBNAME,        00004380
                        :SYSTABLES-TYPE, :SYSTABLES-TSNAME              00004390
                   FROM SYSIBM.SYSTABLES                                00004400
                  WHERE CREATOR = :SYSTABLES-CREATOR                    00004410
                    AND NAME    = :SYSTABLES-NAME                       00004420
           END-EXEC.                                                    00004430
           IF  SQLCODE  EQUAL  +0                                       00004440
               NEXT  SENTENCE                                           00004450
           ELSE                                                         00004460
               DISPLAY '*** ERRO NO SELECT'                             00004470
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00004480
           END-IF.                                                      00004490
       0210-0200-EXIT. EXIT.                                            00004500
      *----------------------------------------------------------------*00004510
      *                                                                *00004520
      *----------------------------------------------------------------*00004530
       0300-0200-FETCH.                                                 00004540
           EXEC  SQL FETCH   C-SYSCOLUMNS                               00004550
                     INTO :SYSCOLUMNS-NAME,                             00004560
                          :SYSCOLUMNS-LENGTH,                           00004570
                          :SYSCOLUMNS-SCALE,                            00004580
                          :SYSCOLUMNS-COLTYPE,                          00004590
                          :SYSCOLUMNS-COLNO                             00004600
           END-EXEC.                                                    00004610
           IF  SQLCODE  EQUAL  +0                                       00004620
               NEXT  SENTENCE                                           00004630
           ELSE                                                         00004640
               IF  SQLCODE  EQUAL  +100                                 00004650
                   MOVE   'S'          TO   N88-FIM-SYSCOLUMNS          00004660
               ELSE                                                     00004670
               DISPLAY '*** ERRO NO FETCH'                              00004680
                   PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT     00004690
               END-IF                                                   00004700
           END-IF.                                                      00004710
       0300-0200-EXIT. EXIT.                                            00004720
      *----------------------------------------------------------------*00004730
      *                                                                *00004740
      *----------------------------------------------------------------*00004750
       0400-0000-HOSTS.                                                 00004760
      *--- ATENCAO, A CODIFICACAO DOS DATATYPES ESTA NA ORDEM DE MAIOR  00004770
      *--- PARA MENOR UTILIZACAO, AQUI NA INSTALACAO                    00004780
           EVALUATE CCOLTYPE(IND-CTAB)                                  00004790
               WHEN 'SMALLINT'                                          00004800
                    PERFORM   0500-0400-SMALLINT  THRU  0500-0400-EXIT  00004810
               WHEN 'DECIMAL'                                           00004820
                    PERFORM   0600-0400-DECIMAL   THRU  0600-0400-EXIT  00004830
               WHEN 'INTEGER'                                           00004840
                    PERFORM   0700-0400-INTEGER   THRU  0700-0400-EXIT  00004850
               WHEN 'CHAR'                                              00004860
                    PERFORM   0800-0400-CHAR      THRU  0800-0400-EXIT  00004870
               WHEN 'DATE'                                              00004880
                    PERFORM   0900-0400-DATE      THRU  0900-0400-EXIT  00004890
               WHEN 'VARCHAR'                                           00004900
                    PERFORM   1000-0400-VARCHAR   THRU  1000-0400-EXIT  00004910
               WHEN 'TIME'                                              00004920
                    PERFORM   1100-0400-TIME      THRU  1100-0400-EXIT  00004930
               WHEN 'TIMESTMP'                                          00004940
                    PERFORM   1200-0400-TIMESTMP  THRU  1200-0400-EXIT  00004950
               WHEN 'LONGVAR'                                           00004960
                    PERFORM   1000-0400-VARCHAR   THRU  1000-0400-EXIT  00004970
               WHEN 'FLOAT'                                             00004980
                    PERFORM   1400-0400-FLOAT     THRU  1400-0400-EXIT  00004990
               WHEN 'GRAPHIC'                                           00005000
                    PERFORM   0800-0400-CHAR      THRU  0800-0400-EXIT  00005010
               WHEN 'VARG'                                              00005020
                    PERFORM   1000-0400-VARCHAR   THRU  1000-0400-EXIT  00005030
               WHEN 'LONGVARG'                                          00005040
                    PERFORM   1000-0400-VARCHAR   THRU  1000-0400-EXIT  00005050
               WHEN OTHER     CONTINUE                                  00005060
           END-EVALUATE.                                                00005070
       0400-0000-EXIT. EXIT.                                            00005080
      *----------------------------------------------------------------*00005090
      *                                                                *00005100
      *----------------------------------------------------------------*00005110
       0500-0400-SMALLINT.                                              00005120
           MOVE   +4                   TO   CFILLER(IND-CTAB).          00005130
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00005140
           IF FORMATO-NOVO                                              00005150
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00005160
           ELSE                                                         00005170
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00005180
                  DELIMITED BY SPACE INTO LONGNAME                      00005190
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00005200
           END-IF.                                                      00005210
           MOVE   WS-SMALLINT          TO   LCOBOL-PIC-G.               00005220
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00005230
                                                                        00005240
           IF FORMATO-NOVO                                              00005250
              STRING LINHA DELIMITED BY '.'                             00005260
                     '  VALUE  +0.' DELIMITED BY SIZE INTO LINHA        00005270
           END-IF.                                                      00005280
                                                                        00005290
           PERFORM   1800-9999-WRITE   THRU   1800-9999-EXIT.           00005300
       0500-0400-EXIT. EXIT.                                            00005310
      *----------------------------------------------------------------*00005320
      *                                                                *00005330
      *----------------------------------------------------------------*00005340
       0600-0400-DECIMAL.                                               00005350
           DIVIDE CLENGTH(IND-CTAB) BY 2 GIVING CFILLER(IND-CTAB)       00005360
                  REMAINDER RESTO.                                      00005370
      *---------------------------------------------------------------* 00005380
      *    IF  RESTO  NOT EQUAL  +0                                   * 00005390
      *        ADD   RESTO             TO   CFILLER(IND-CTAB).        * 00005400
      *                                                               * 00005410
      *    ADD   +2                    TO   CFILLER(IND-CTAB).        * 00005420
      *---------------------------------------------------------------* 00005430
      *-- TADEU - 11/07/2002 :(PARTE INTEIRA DA METADE DE CLENGTH)+1+2* 00005440
           ADD   +3                    TO   CFILLER(IND-CTAB).          00005450
      *---------------------------------------------------------------* 00005460
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00005470
                                                                        00005480
           IF FORMATO-NOVO                                              00005490
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00005500
           ELSE                                                         00005510
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00005520
                  DELIMITED BY SPACE INTO LONGNAME                      00005530
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00005540
           END-IF.                                                      00005550
           COMPUTE WS-DEC-P = CLENGTH(IND-CTAB) - CSCALE(IND-CTAB).     00005560
           IF  CSCALE(IND-CTAB)  GREATER  +0                            00005570
               MOVE   CSCALE(IND-CTAB) TO   WS-DEC-S                    00005580
               MOVE   'V9('            TO   VIRGULA                     00005590
               MOVE   ')'              TO   PARENTESES-DIR              00005600
           ELSE                                                         00005610
               MOVE   ZEROS            TO   WS-DEC-S                    00005620
               MOVE   SPACES           TO   VIRGULA                     00005630
               MOVE   SPACES           TO   PARENTESES-DIR              00005640
           END-IF.                                                      00005650
                                                                        00005660
           MOVE   WS-DECIMAL           TO   LCOBOL-PIC-G.               00005670
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00005680
                                                                        00005690
           IF FORMATO-NOVO                                              00005700
              STRING LINHA DELIMITED BY '.'                             00005710
                     ' VALUE +0.' DELIMITED BY SIZE INTO LINHA          00005720
           END-IF.                                                      00005730
                                                                        00005740
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00005750
       0600-0400-EXIT. EXIT.                                            00005760
      *----------------------------------------------------------------*00005770
      *                                                                *00005780
      *----------------------------------------------------------------*00005790
       0700-0400-INTEGER.                                               00005800
           MOVE   +6                   TO   CFILLER(IND-CTAB).          00005810
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00005820
           IF FORMATO-NOVO                                              00005830
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00005840
           ELSE                                                         00005850
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00005860
                  DELIMITED BY SPACE INTO LONGNAME                      00005870
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00005880
           END-IF.                                                      00005890
           MOVE   WS-INTEGER           TO   LCOBOL-PIC-G.               00005900
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00005910
                                                                        00005920
           IF FORMATO-NOVO                                              00005930
              STRING LINHA DELIMITED BY '.'                             00005940
                     '  VALUE  +0.' DELIMITED BY SIZE INTO LINHA        00005950
           END-IF.                                                      00005960
                                                                        00005970
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00005980
       0700-0400-EXIT. EXIT.                                            00005990
      *----------------------------------------------------------------*00006000
      *                                                                *00006010
      *----------------------------------------------------------------*00006020
       0800-0400-CHAR.                                                  00006030
           ADD    +2 CLENGTH(IND-CTAB) GIVING CFILLER(IND-CTAB).        00006040
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00006050
           IF  CCOLTYPE(IND-CTAB)  EQUAL  'CHAR'                        00006060
               MOVE   'X'              TO   PIC-TYPE                    00006070
           ELSE                                                         00006080
               MOVE   'G'              TO   PIC-TYPE                    00006090
           END-IF.                                                      00006100
                                                                        00006110
           IF FORMATO-NOVO                                              00006120
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00006130
           ELSE                                                         00006140
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00006150
                  DELIMITED BY SPACE INTO LONGNAME                      00006160
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00006170
           END-IF.                                                      00006180
           MOVE   CLENGTH(IND-CTAB)    TO   WS-CHAR-L.                  00006190
           MOVE   WS-CHAR              TO   LCOBOL-PIC-G.               00006200
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00006210
                                                                        00006220
           IF FORMATO-NOVO                                              00006230
              STRING LINHA  DELIMITED BY '.'                            00006240
                     '            VALUE ' DELIMITED BY SIZE             00006250
                     QUOTE  DELIMITED BY SIZE                           00006260
                     ' '    DELIMITED BY SIZE                           00006270
                     QUOTE  DELIMITED BY SIZE                           00006280
                     '.'    DELIMITED BY SIZE INTO LINHA                00006290
           END-IF.                                                      00006300
                                                                        00006310
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00006320
       0800-0400-EXIT. EXIT.                                            00006330
      *----------------------------------------------------------------*00006340
      *                                                                *00006350
      *----------------------------------------------------------------*00006360
       0900-0400-DATE.                                                  00006370
           MOVE   +12                  TO   CFILLER(IND-CTAB).          00006380
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00006390
           IF FORMATO-NOVO                                              00006400
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00006410
           ELSE                                                         00006420
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00006430
                  DELIMITED BY SPACE INTO LONGNAME                      00006440
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00006450
           END-IF.                                                      00006460
           MOVE   WS-DATE              TO   LCOBOL-PIC-G.               00006470
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00006480
                                                                        00006490
           IF FORMATO-NOVO                                              00006500
              STRING LINHA  DELIMITED BY '.'                            00006510
                     '            VALUE ' DELIMITED BY SIZE             00006520
                     QUOTE  DELIMITED BY SIZE                           00006530
                     ' '    DELIMITED BY SIZE                           00006540
                     QUOTE  DELIMITED BY SIZE                           00006550
                     '.'    DELIMITED BY SIZE INTO LINHA                00006560
           END-IF.                                                      00006570
                                                                        00006580
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00006590
       0900-0400-EXIT. EXIT.                                            00006600
      *----------------------------------------------------------------*00006610
      *                                                                *00006620
      *----------------------------------------------------------------*00006630
       1000-0400-VARCHAR.                                               00006640
           ADD    +2 CLENGTH(IND-CTAB) TO   CFILLER(IND-CTAB).          00006650
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00006660
           IF  CCOLTYPE(IND-CTAB)  EQUAL  'CHAR' OR 'VARCHAR'           00006670
                                      OR  'LONGVAR'                     00006680
               MOVE   'X'              TO   PIC-TYPE                    00006690
               MOVE   'X'              TO   PIC-TYPE-LONG               00006700
      *--- MAXIMO VALOR ANTES DO CAMPO TER ATRIBUTO LONG                00006710
               MOVE   +254             TO   MAX-LENGTH                  00006720
           ELSE                                                         00006730
               MOVE   'G'              TO   PIC-TYPE                    00006740
               MOVE   'G'              TO   PIC-TYPE-LONG               00006750
      *--- MAXIMO VALOR ANTES DO CAMPO TER ATRIBUTO LONG                00006760
               MOVE   +127             TO   MAX-LENGTH                  00006770
           END-IF.                                                      00006780
                                                                        00006790
      *--- FORMATA A MASCARA DA LINHA DE ITEM DE GRUPO                  00006800
                                                                        00006810
           IF FORMATO-NOVO                                              00006820
              STRING CNAME(IND-CTAB) '-G.'                              00006830
                  DELIMITED BY ' ' INTO LONGNAME                        00006840
           ELSE                                                         00006850
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB) '-G.'         00006860
                  DELIMITED BY SPACE INTO LONGNAME                      00006870
           END-IF.                                                      00006880
                                                                        00006890
           MOVE   LONGNAME             TO   LCOBOL-NAME-G.              00006900
           MOVE   SPACES               TO   LCOBOL-PIC-G.               00006910
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00006920
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00006930
                                                                        00006940
      *--- FORMATA A MASCARA DA PRIMEIRA LINHA                          00006950
                                                                        00006960
           IF FORMATO-NOVO                                              00006970
              STRING CNAME(IND-CTAB) '-T'                               00006980
                  DELIMITED BY ' ' INTO LONGNAME                        00006990
           ELSE                                                         00007000
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB) '-T'          00007010
                  DELIMITED BY SPACE INTO LONGNAME                      00007020
           END-IF.                                                      00007030
                                                                        00007040
           MOVE   LONGNAME             TO   LCOBOL-NAME-I               00007050
           MOVE   WS-SMALLINT          TO   LCOBOL-PIC-I                00007060
           MOVE   LINHA-COBOL-I        TO   LINHA.                      00007070
                                                                        00007080
           IF FORMATO-NOVO                                              00007090
              STRING LINHA DELIMITED BY '.'                             00007100
                     '  VALUE  +0.' DELIMITED BY SIZE INTO LINHA        00007110
           END-IF.                                                      00007120
                                                                        00007130
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00007140
                                                                        00007150
      *--- FORMATA A MASCARA DA SEGUNDA  LINHA                          00007160
                                                                        00007170
           IF FORMATO-NOVO                                              00007180
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-I            00007190
           ELSE                                                         00007200
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00007210
                  DELIMITED BY SPACE INTO LONGNAME                      00007220
              MOVE   LONGNAME             TO   LCOBOL-NAME-I            00007230
           END-IF.                                                      00007240
           IF  CLENGTH(IND-CTAB) <= MAX-LENGTH                          00007250
               MOVE   CLENGTH(IND-CTAB)  TO   WS-CHAR-L                 00007260
               MOVE   WS-CHAR            TO   LCOBOL-PIC-I              00007270
           ELSE                                                         00007280
               MOVE   CLENGTH(IND-CTAB)  TO   WS-CHAR-LONG-L            00007290
               MOVE   WS-CHAR-LONG       TO   LCOBOL-PIC-I              00007300
           END-IF.                                                      00007310
           MOVE   LINHA-COBOL-I        TO   LINHA.                      00007320
                                                                        00007330
           IF FORMATO-NOVO                                              00007340
              STRING LINHA  DELIMITED BY '.'                            00007350
                     '      VALUE ' DELIMITED BY SIZE                   00007360
                     QUOTE  DELIMITED BY SIZE                           00007370
                     ' '    DELIMITED BY SIZE                           00007380
                     QUOTE  DELIMITED BY SIZE                           00007390
                     '.'    DELIMITED BY SIZE INTO LINHA                00007400
           END-IF.                                                      00007410
                                                                        00007420
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00007430
       1000-0400-EXIT. EXIT.                                            00007440
      *----------------------------------------------------------------*00007450
      *                                                                *00007460
      *----------------------------------------------------------------*00007470
       1100-0400-TIME.                                                  00007480
           MOVE   +12                  TO   CFILLER(IND-CTAB).          00007490
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00007500
           IF FORMATO-NOVO                                              00007510
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00007520
           ELSE                                                         00007530
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00007540
                  DELIMITED BY SPACE INTO LONGNAME                      00007550
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00007560
           END-IF.                                                      00007570
           MOVE   WS-TIME              TO   LCOBOL-PIC-G.               00007580
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00007590
                                                                        00007600
           IF FORMATO-NOVO                                              00007610
              STRING LINHA  DELIMITED BY '.'                            00007620
                     '            VALUE ' DELIMITED BY SIZE             00007630
                     QUOTE  DELIMITED BY SIZE                           00007640
                     ' '    DELIMITED BY SIZE                           00007650
                     QUOTE  DELIMITED BY SIZE                           00007660
                     '.'    DELIMITED BY SIZE INTO LINHA                00007670
           END-IF.                                                      00007680
                                                                        00007690
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00007700
       1100-0400-EXIT. EXIT.                                            00007710
      *----------------------------------------------------------------*00007720
      *                                                                *00007730
      *----------------------------------------------------------------*00007740
       1200-0400-TIMESTMP.                                              00007750
           MOVE   +28                  TO   CFILLER(IND-CTAB).          00007760
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00007770
           IF FORMATO-NOVO                                              00007780
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00007790
           ELSE                                                         00007800
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00007810
                  DELIMITED BY SPACE INTO LONGNAME                      00007820
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00007830
           END-IF.                                                      00007840
           MOVE   WS-TIMESTMP          TO   LCOBOL-PIC-G.               00007850
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00007860
                                                                        00007870
           IF FORMATO-NOVO                                              00007880
              STRING LINHA  DELIMITED BY '.'                            00007890
                     '            VALUE ' DELIMITED BY SIZE             00007900
                     QUOTE  DELIMITED BY SIZE                           00007910
                     ' '    DELIMITED BY SIZE                           00007920
                     QUOTE  DELIMITED BY SIZE                           00007930
                     '.'    DELIMITED BY SIZE INTO LINHA                00007940
           END-IF.                                                      00007950
                                                                        00007960
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00007970
       1200-0400-EXIT. EXIT.                                            00007980
      *----------------------------------------------------------------*00007990
      *                                                                *00008000
      *----------------------------------------------------------------*00008010
       1400-0400-FLOAT.                                                 00008020
           MOVE   +10                  TO   CFILLER(IND-CTAB).          00008030
           PERFORM   2200-9999-FILLER  THRU   2200-9999-EXIT.           00008040
           IF FORMATO-NOVO                                              00008050
              MOVE   CNAME(IND-CTAB)      TO   LCOBOL-NAME-G            00008060
           ELSE                                                         00008070
              STRING SYSTABLES-TSNAME '-' CNAME(IND-CTAB)               00008080
                  DELIMITED BY SPACE INTO LONGNAME                      00008090
              MOVE   LONGNAME             TO   LCOBOL-NAME-G            00008100
           END-IF.                                                      00008110
                                                                        00008120
           IF  CLENGTH(IND-CTAB)  <=  +21                               00008130
               MOVE   1                TO   WS-FLOAT-TIPO               00008140
           ELSE                                                         00008150
               MOVE   2                TO   WS-FLOAT-TIPO               00008160
           END-IF.                                                      00008170
                                                                        00008180
           MOVE   WS-FLOAT             TO   LCOBOL-PIC-G.               00008190
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00008200
                                                                        00008210
           IF FORMATO-NOVO                                              00008220
              STRING LINHA DELIMITED BY '.'                             00008230
                     '  VALUE  +0.' DELIMITED BY SIZE INTO LINHA        00008240
           END-IF.                                                      00008250
                                                                        00008260
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00008270
       1400-0400-EXIT. EXIT.                                            00008280
      *----------------------------------------------------------------*00008290
      *                                                                *00008300
      *----------------------------------------------------------------*00008310
       1700-0000-COMENTARIO.                                            00008320
           MOVE    SYSTABLES-TSNAME                                     00008330
                   TO   DLM-NAME ADD-NAME SEL-NAME.                     00008340
           IF PAR-FLAG-EXISTE EQUAL 'N'                                 00008350
              WRITE   REG-BOOK  FROM   LIBRARIAN-ADD                    00008360
              WRITE   REG-BOOK  FROM   LIBRARIAN-LANG                   00008370
              MOVE    PAR-PGMR    TO   PGMR-NAME                        00008380
              WRITE   REG-BOOK  FROM   LIBRARIAN-PGMR                   00008390
           ELSE                                                         00008400
              WRITE   REG-BOOK  FROM   LIBRARIAN-SEL                    00008410
              WRITE   REG-BOOK  FROM   LIBRARIAN-LANG                   00008420
              MOVE    PAR-PGMR    TO   PGMR-NAME                        00008430
              WRITE   REG-BOOK  FROM   LIBRARIAN-PGMR                   00008440
              WRITE   REG-BOOK  FROM   LIBRARIAN-REP                    00008450
           END-IF.                                                      00008460
                                                                        00008470
           ACCEPT CURDATA              FROM DATE.                       00008480
           MOVE CORR  CURDATA-R        TO   WX-DATA-CO.                 00008490
           ACCEPT CURHORA              FROM TIME.                       00008500
           MOVE CORR  CURHORA-R        TO   WX-HORA-CO.                 00008510
           MOVE   SYSTABLES-CREATOR    TO   WX-CREATOR-CO.              00008520
           MOVE   SYSTABLES-NAME-T     TO   WX-TNAME-CO.                00008530
           MOVE   WX-COMENTARIO-01     TO   LINHA.                      00008540
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008550
           MOVE   WX-COMENTARIO-02     TO   LINHA.                      00008560
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008570
           MOVE   WX-COMENTARIO-03     TO   LINHA.                      00008580
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008590
           MOVE   WX-COMENTARIO-04     TO   LINHA.                      00008600
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008610
           MOVE   WX-COMENTARIO-05     TO   LINHA.                      00008620
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008630
           MOVE   WX-COMENTARIO-06     TO   LINHA.                      00008640
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008650
           MOVE   WX-COMENTARIO-07     TO   LINHA.                      00008660
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008670
           MOVE   WX-COMENTARIO-08     TO   LINHA.                      00008680
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT              00008690
           MOVE   WX-COMENTARIO-09     TO   LINHA.                      00008700
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00008710
       1700-0000-EXIT. EXIT.                                            00008720
      *----------------------------------------------------------------*00008730
      *                                                                *00008740
      *----------------------------------------------------------------*00008750
       1800-9999-WRITE.                                                 00008760
           WRITE   REG-BOOK            FROM   LINHA.                    00008770
           MOVE    SPACES              TO     LONGNAME.                 00008780
       1800-9999-EXIT. EXIT.                                            00008790
      *----------------------------------------------------------------*00008800
      *                                                                *00008810
      *----------------------------------------------------------------*00008820
       2000-0000-FIM.                                                   00008830
           WRITE   REG-BOOK  FROM   LIBRARIAN-END.                      00008840
           CLOSE   BOOK.                                                00008850
           EXEC SQL COMMIT  WORK  END-EXEC.                             00008860
       2000-0000-EXIT. EXIT.                                            00008870
      *----------------------------------------------------------------*00008880
      *                                                                *00008890
      *----------------------------------------------------------------*00008900
       2100-0000-INDICADORES.                                           00008910
           STRING CNAME(IND-CTAB) '-I'                                  00008920
                  DELIMITED BY SPACE INTO LONGNAME.                     00008930
           MOVE   LONGNAME             TO   LCOBOL-NAME-G.              00008940
           MOVE   WS-SMALLINT          TO   LCOBOL-PIC-G.               00008950
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00008960
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00008970
                                                                        00008980
           MOVE   'X'                  TO   PIC-TYPE.                   00008990
           MOVE   'FILLER'             TO   LCOBOL-NAME-G.              00009000
           MOVE   CFILLER(IND-CTAB)    TO   WS-CHAR-L.                  00009010
           MOVE   WS-CHAR              TO   LCOBOL-PIC-G.               00009020
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00009030
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00009040
       2100-0000-EXIT. EXIT.                                            00009050
      *----------------------------------------------------------------*00009060
      *                                                                *00009070
      *----------------------------------------------------------------*00009080
       2200-9999-FILLER.                                                00009090
           MOVE   'FILLER'             TO   LCOBOL-NAME-G.              00009100
           MOVE   'X'                  TO   PIC-TYPE.                   00009110
           IF  CCOLTYPE(IND-CTAB)  EQUAL  'VARCHAR' OR  'LONGVAR'       00009120
                                      OR  'VARG'    OR  'LONGVARG'      00009130
               MOVE   +2                   TO   WS-CHAR-L               00009140
           ELSE                                                         00009150
               MOVE   +4                   TO   WS-CHAR-L.              00009160
           MOVE   WS-CHAR              TO   LCOBOL-PIC-G.               00009170
           MOVE   LINHA-COBOL-G        TO   LINHA.                      00009180
           PERFORM   1800-9999-WRITE THRU   1800-9999-EXIT.             00009190
       2200-9999-EXIT. EXIT.                                            00009200
      *----------------------------------------------------------------*00009210
      *                                                                *00009220
      *----------------------------------------------------------------*00009230
       9999-9999-ERRO-DB2.                                              00009240
           MOVE    SQLCODE  TO  WK-SQLCODE.                             00009250
           DISPLAY '*** ERRO PROG. DBGENBOK - COD.SQL = ' WK-SQLCODE.   00009260
           DISPLAY '    SQLSTATE: ' SQLSTATE.                           00009270
           DISPLAY '    SQLERRMC: ' SQLERRMC.                           00009280
           EXEC SQL                                                     00009290
                WHENEVER SQLERROR CONTINUE                              00009300
           END-EXEC.                                                    00009310
           EXEC SQL                                                     00009320
                ROLLBACK WORK                                           00009330
           END-EXEC.                                                    00009340
           MOVE    8                   TO   RETURN-CODE.                00009350
           STOP RUN.                                                    00009360
       9999-9999-EXIT. EXIT.                                            00009370