       IDENTIFICATION DIVISION.                                         00000010
       PROGRAM-ID.    DB2CRDDL.                                         00000020
      *----------------------------------------------------------------*00000030
      * DATA:  JAN/1998                                                *00000040
      * AUTOR: JOSE CICERO                                             *00000050
      * OBJETIVOS: CRIAR SCRIPT DE TABELAS A PARTIR DO CATALOGO DB2    *00000060
      * AREA RESPONSAVEL: ADMINISTRACAO DE BANCO DE DADOS              *00000070
      * ATUALIZACOES                                                   *00000080
      * ABR/98 - ESPECIFICACAO DE COLUNAS WITH DEFAULT, E TRATAMENTO   *00000090
      *          DE INTEGRIDADE REFERENCIAL                            *00000100
      * JUN/98 - TRATAMENTO DE DEFAULTS E TABELAS PARTICIONADAS        *00000110
      * JAN/02 - TRATAMENTO GRANT TABELA PARA DETERMINADOS USUARIOS.   *00000120
      *----------------------------------------------------------------*00000130
       ENVIRONMENT    DIVISION.                                         00000140
      *                                                                 00000150
       INPUT-OUTPUT       SECTION.                                      00000160
       FILE-CONTROL.                                                    00000170
           SELECT  SYSIN   ASSIGN      TO  SYSIN.                       00000180
           SELECT  SCRIPT  ASSIGN      TO  SCRIPT.                      00000190
           SELECT  FKEYS   ASSIGN      TO  FKEYS.                       00000200
      *                                                                 00000210
       DATA DIVISION.                                                   00000220
      *                                                                 00000230
       FILE            SECTION.                                         00000240
       FD  SYSIN                                                        00000250
           LABEL  RECORD  IS  OMITTED                                   00000260
           RECORDING MODE IS F.                                         00000270
                                                                        00000280
       01  REG-SYSIN                   PIC  X(080).                     00000290
                                                                        00000300
       FD  SCRIPT                                                       00000310
           LABEL  RECORD  IS  OMITTED                                   00000320
           RECORDING MODE IS F.                                         00000330
                                                                        00000340
       01  REG-SCRIPT                  PIC  X(080).                     00000350
                                                                        00000360
       FD  FKEYS                                                        00000370
           LABEL  RECORD  IS  OMITTED                                   00000380
           RECORDING MODE IS F.                                         00000390
                                                                        00000400
       01  REG-FKEYS                   PIC  X(080).                     00000410
                                                                        00000420
       WORKING-STORAGE SECTION.                                         00000430
      *----------------------------------------------------------------*00000440
      * AREAS AUXILIARES                                               *00000450
      *----------------------------------------------------------------*00000460
       01  FILLER.                                                      00000470
           02   AC-FKEYS                    PIC S9(04) COMP VALUE +0.   00000480
           02   COLCOUNT-PK                 PIC S9(04) COMP VALUE +0.   00000490
           02   CH-ALIAS                    PIC  X(01)      VALUE 'N'.  00000500
           02   CH-PRIMARY                  PIC  X(01)      VALUE 'N'.  00000510
           02   WS-SQLCODE                  PIC -----9.                 00000520
           02   WS-INDEX                    PIC  9(05).                 00000530
      *----------------------------------------------------------------*00000540
      * HOSTS SYSIBM.SYSTABLES                                         *00000550
      *----------------------------------------------------------------*00000560
       01  SYSTABLES.                                                   00000570
           02  SYSTABLES-NAME.                                          00000580
               49  SYSTABLES-NAME-L         PIC S9(04) COMP.            00000590
               49  SYSTABLES-NAME-T         PIC  X(18).                 00000600
           02  SYSTABLES-CREATOR            PIC  X(08).                 00000610
           02  SYSTABLES-TYPE               PIC  X(01).                 00000620
           02  SYSTABLES-DBNAME             PIC  X(08).                 00000630
           02  SYSTABLES-TSNAME             PIC  X(08).                 00000640
           02  SYSTABLES-REMARKS.                                       00000650
               49  SYSTABLES-REMARKS-L      PIC S9(04) COMP.            00000660
               49  SYSTABLES-REMARKS-T      PIC  X(254).                00000670
           02  SYSTABLES-TBCREATOR          PIC  X(08).                 00000680
           02  SYSTABLES-TBNAME.                                        00000690
               49  SYSTABLES-TBNAME-L       PIC S9(04) COMP.            00000700
               49  SYSTABLES-TBNAME-T       PIC  X(18).                 00000710
           02  SYSTABLES-CLUSTERTYPE        PIC  X(01).                 00000720
           02  SYSTABLES-CHECKS             PIC S9(04) COMP.            00000730
      *----------------------------------------------------------------*00000740
      * HOSTS SYSIBM.SYSTABLESPACE                                     *00000750
      *----------------------------------------------------------------*00000760
       01  SYSTABLESPACE.                                               00000770
           02  SYSTABLESPACE-NAME           PIC  X(08).                 00000780
           02  SYSTABLESPACE-DBNAME         PIC  X(08).                 00000790
           02  SYSTABLESPACE-ERASERULE      PIC  X(01).                 00000800
           02  SYSTABLESPACE-SEGSIZE        PIC  S9(04) COMP.           00000810
           02  SYSTABLESPACE-BPOOL          PIC  X(08).                 00000820
           02  SYSTABLESPACE-LOCKRULE       PIC  X(01).                 00000830
           02  SYSTABLESPACE-PARTITIONS     PIC S9(04) COMP.            00000840
      *----------------------------------------------------------------*00000850
      * HOSTS SYSIBM.SYSTABLEPART                                      *00000860
      *----------------------------------------------------------------*00000870
       01  SYSTABLEPART.                                                00000880
           02  SYSTABLEPART-TSNAME          PIC  X(08).                 00000890
           02  SYSTABLEPART-DBNAME          PIC  X(08).                 00000900
           02  SYSTABLEPART-PCTFREE         PIC  S9(04) COMP.           00000910
           02  SYSTABLEPART-STORNAME        PIC  X(08).                 00000920
           02  SYSTABLEPART-PQTY            PIC  S9(09) COMP.           00000930
           02  SYSTABLEPART-SQTY            PIC  S9(04) COMP.           00000940
           02  SYSTABLEPART-COMPRESS        PIC  X(01).                 00000950
           02  SYSTABLEPART-PARTITION       PIC S9(04) COMP.            00000960
           02  SYSTABLEPART-LIMITKEY.                                   00000970
               49  SYSTABLEPART-LIMITKEY-L  PIC S9(04) COMP.            00000980
               49  SYSTABLEPART-LIMITKEY-T  PIC  X(512).                00000990
      *----------------------------------------------------------------*00001000
      * HOSTS SYSIBM.SYSCOLUMNS                                        *00001010
      *----------------------------------------------------------------*00001020
       01  SYSCOLUMNS.                                                  00001030
           02  SYSCOLUMNS-NAME.                                         00001040
               49  SYSCOLUMNS-NAME-L        PIC S9(04) COMP.            00001050
               49  SYSCOLUMNS-NAME-T        PIC  X(18).                 00001060
           02  SYSCOLUMNS-COLTYPE           PIC  X(08).                 00001070
           02  SYSCOLUMNS-LENGTH            PIC  S9(04) COMP.           00001080
           02  SYSCOLUMNS-NULLS             PIC  X(01).                 00001090
           02  SYSCOLUMNS-SCALE             PIC  S9(04) COMP.           00001100
           02  SYSCOLUMNS-REMARKS.                                      00001110
               49  SYSCOLUMNS-REMARKS-L     PIC S9(04) COMP.            00001120
               49  SYSCOLUMNS-REMARKS-T     PIC  X(254).                00001130
           02  SYSCOLUMNS-COLNO             PIC  S9(04) COMP.           00001140
           02  SYSCOLUMNS-TBNAME.                                       00001150
               49  SYSCOLUMNS-TBNAME-L      PIC S9(04) COMP.            00001160
               49  SYSCOLUMNS-TBNAME-T      PIC  X(18).                 00001170
           02  SYSCOLUMNS-TBCREATOR         PIC  X(08).                 00001180
           02  SYSCOLUMNS-DEFAULT           PIC  X(01).                 00001190
           02  SYSCOLUMNS-DEFAULTVALUE.                                 00001200
               49  SYSCOLUMNS-DEFAULTVALUE-L PIC S9(04) COMP.           00001210
               49  SYSCOLUMNS-DEFAULTVALUE-T PIC  X(254).               00001220
      *----------------------------------------------------------------*00001230
      * HOSTS SYSIBM.SYSINDEXES                                       * 00001240
      *----------------------------------------------------------------*00001250
       01  SYSINDEXES.                                                  00001260
           02  SYSINDEXES-CREATOR           PIC  X(08).                 00001270
           02  SYSINDEXES-NAME.                                         00001280
               49  SYSINDEXES-NAME-L        PIC S9(04) COMP.            00001290
               49  SYSINDEXES-NAME-T        PIC  X(18).                 00001300
           02  SYSINDEXES-TBCREATOR         PIC  X(08).                 00001310
           02  SYSINDEXES-TBNAME.                                       00001320
               49  SYSINDEXES-TBNAME-L      PIC S9(04) COMP.            00001330
               49  SYSINDEXES-TBNAME-T      PIC  X(18).                 00001340
           02  SYSINDEXES-UNIQUERULE        PIC  X(01).                 00001350
           02  SYSINDEXES-CLUSTERING        PIC  X(01).                 00001360
           02  SYSINDEXES-BPOOL             PIC  X(08).                 00001370
           02  SYSINDEXES-ERASERULE         PIC  X(01).                 00001380
           02  SYSINDEXES-INDEXTYPE         PIC  X(01).                 00001390
           02  SYSINDEXES-COLCOUNT          PIC S9(04) COMP.            00001400
      *----------------------------------------------------------------*00001410
      * HOSTS SYSIBM.SYSKEYS                                           *00001420
      *----------------------------------------------------------------*00001430
       01  SYSKEYS.                                                     00001440
           02  SYSKEYS-IXCREATOR            PIC  X(08).                 00001450
           02  SYSKEYS-IXNAME.                                          00001460
               49  SYSKEYS-IXNAME-L         PIC S9(04) COMP.            00001470
               49  SYSKEYS-IXNAME-T         PIC  X(18).                 00001480
           02  SYSKEYS-COLNAME.                                         00001490
               49  SYSKEYS-COLNAME-L        PIC S9(04) COMP.            00001500
               49  SYSKEYS-COLNAME-T        PIC  X(18).                 00001510
           02  SYSKEYS-ORDERING             PIC  X(01).                 00001520
           02  SYSKEYS-COLSEQ               PIC S9(04) COMP.            00001530
      *----------------------------------------------------------------*00001540
      * HOSTS SYSIBM.SYSINDEXPART                                      *00001550
      *----------------------------------------------------------------*00001560
       01  SYSINDEXPART.                                                00001570
           02  SYSINDEXPART-IXCREATOR       PIC  X(08).                 00001580
           02  SYSINDEXPART-IXNAME.                                     00001590
               49  SYSINDEXPART-IXNAME-L    PIC S9(04) COMP.            00001600
               49  SYSINDEXPART-IXNAME-T    PIC  X(18).                 00001610
           02  SYSINDEXPART-STORNAME        PIC  X(08).                 00001620
           02  SYSINDEXPART-PQTY            PIC  S9(09) COMP.           00001630
           02  SYSINDEXPART-SQTY            PIC  S9(04) COMP.           00001640
           02  SYSINDEXPART-PCTFREE         PIC  S9(04) COMP.           00001650
           02  SYSINDEXPART-PARTITION       PIC  S9(04) COMP.           00001660
      ***  02  SYSINDEXPART-LIMITKEY.                                   00001670
      ***      49  SYSINDEXPART-LIMITKEY-L  PIC S9(04) COMP.            00001680
      ***      49  SYSINDEXPART-LIMITKEY-T  PIC  X(512).                00001690
      *----------------------------------------------------------------*00001700
      * HOSTS SYSIBM.SYSRELS                                           *00001710
      *----------------------------------------------------------------*00001720
       01  SYSRELS.                                                     00001730
           02  SYSRELS-CREATOR              PIC  X(08).                 00001740
           02  SYSRELS-TBNAME.                                          00001750
               49  SYSRELS-TBNAME-L         PIC S9(04) COMP.            00001760
               49  SYSRELS-TBNAME-T         PIC  X(18).                 00001770
           02  SYSRELS-REFTBCREATOR         PIC  X(08).                 00001780
           02  SYSRELS-REFTBNAME.                                       00001790
               49  SYSRELS-REFTBNAME-L      PIC S9(04) COMP.            00001800
               49  SYSRELS-REFTBNAME-T      PIC  X(18).                 00001810
           02  SYSRELS-RELNAME              PIC  X(08).                 00001820
           02  SYSRELS-DELETERULE           PIC  X(01).                 00001830
      *----------------------------------------------------------------*00001840
      * HOSTS SYSIBM.SYSFOREIGNKEYS                                    *00001850
      *----------------------------------------------------------------*00001860
       01  SYSFOREIGNKEYS.                                              00001870
           02  SYSFOREIGNKEYS-CREATOR       PIC  X(08).                 00001880
           02  SYSFOREIGNKEYS-TBNAME.                                   00001890
               49  SYSFOREIGNKEYS-TBNAME-L  PIC S9(04) COMP.            00001900
               49  SYSFOREIGNKEYS-TBNAME-T  PIC  X(18).                 00001910
           02  SYSFOREIGNKEYS-RELNAME       PIC  X(08).                 00001920
           02  SYSFOREIGNKEYS-COLNAME.                                  00001930
               49  SYSFOREIGNKEYS-COLNAME-L PIC S9(04) COMP.            00001940
               49  SYSFOREIGNKEYS-COLNAME-T PIC  X(18).                 00001950
           02  SYSFOREIGNKEYS-COLSEQ        PIC S9(04) COMP.            00001960
      *----------------------------------------------------------------*00001970
      * HOSTS SYSIBM.SYSCHECKS                                         *00001980
      *----------------------------------------------------------------*00001990
       01  SYSCHECKS.                                                   00002000
           02  SYSCHECKS-TBOWNER            PIC  X(08).                 00002010
           02  SYSCHECKS-TBNAME.                                        00002020
               49  SYSCHECKS-TBNAME-L       PIC S9(04) COMP.            00002030
               49  SYSCHECKS-TBNAME-T       PIC  X(18).                 00002040
           02  SYSCHECKS-CHECKNAME.                                     00002050
               49  SYSCHECKS-CHECKNAME-L    PIC S9(04) COMP.            00002060
               49  SYSCHECKS-CHECKNAME-T    PIC  X(128).                00002070
           02  SYSCHECKS-CHECKCONDITION.                                00002080
               49  SYSCHECKS-CHECKCONDITION-L PIC S9(04) COMP.          00002090
               49  SYSCHECKS-CHECKCONDITION-T PIC  X(3800).             00002100
      *----------------------------------------------------------------*00002110
      * HOSTS SYSIBM.SYSTABAUTH                                        *00002120
      *----------------------------------------------------------------*00002130
       01  SYSTABAUTH.                                                  00002140
           02  SYSTABAUTH-GRANTOR        PIC  X(008).                   00002150
           02  SYSTABAUTH-GRANTEE        PIC  X(008).                   00002160
           02  SYSTABAUTH-GRANTEETYPE    PIC  X(001).                   00002170
           02  SYSTABAUTH-DBNAME         PIC  X(008).                   00002180
           02  SYSTABAUTH-SCREATOR       PIC  X(008).                   00002190
           02  SYSTABAUTH-STNAME.                                       00002200
               49 SYSTABAUTH-STNAME-L    PIC S9(004)      COMP.         00002210
               49 SYSTABAUTH-STNAME-T    PIC  X(018).                   00002220
           02  SYSTABAUTH-TCREATOR       PIC  X(008).                   00002230
           02  SYSTABAUTH-TTNAME.                                       00002240
               49 SYSTABAUTH-TTNAME-L    PIC S9(004)      COMP.         00002250
               49 SYSTABAUTH-TTNAME-T    PIC  X(018).                   00002260
           02  SYSTABAUTH-AUTHHOWGOT     PIC  X(001).                   00002270
           02  SYSTABAUTH-TIMESTAMP      PIC  X(012).                   00002280
           02  SYSTABAUTH-DATEGRANTED    PIC  X(006).                   00002290
           02  SYSTABAUTH-TIMEGRANTED    PIC  X(008).                   00002300
           02  SYSTABAUTH-UPDATECOLS     PIC  X(001).                   00002310
           02  SYSTABAUTH-ALTERAUTH      PIC  X(001).                   00002320
           02  SYSTABAUTH-DELETEAUTH     PIC  X(001).                   00002330
           02  SYSTABAUTH-INDEXAUTH      PIC  X(001).                   00002340
           02  SYSTABAUTH-INSERTAUTH     PIC  X(001).                   00002350
           02  SYSTABAUTH-SELECTAUTH     PIC  X(001).                   00002360
           02  SYSTABAUTH-UPDATEAUTH     PIC  X(001).                   00002370
           02  SYSTABAUTH-IBMREQD        PIC  X(001).                   00002380
           02  SYSTABAUTH-GRANTEELOCATIO PIC  X(016).                   00002390
           02  SYSTABAUTH-LOCATION       PIC  X(016).                   00002400
           02  SYSTABAUTH-COLLID         PIC  X(018).                   00002410
           02  SYSTABAUTH-CONTOKEN       PIC  X(008).                   00002420
           02  SYSTABAUTH-CAPTUREAUTH    PIC  X(001).                   00002430
           02  SYSTABAUTH-REFERENCESAUTH PIC  X(001).                   00002440
           02  SYSTABAUTH-REFCOLS        PIC  X(001).                   00002450
           02  SYSTABAUTH-GRANTEDTS      PIC  X(026).                   00002460
      *----------------------------------------------------------------*00002470
      *                                                                *00002480
      *----------------------------------------------------------------*00002490
      *--- ESTA TABELA E INDEXADA PELA SYSIBM.SYSCOLUMNS.COLNO          00002500
       01  TAB-COLUNAS.                                                 00002510
           02  IND-TAB                PIC S9(04) COMP  VALUE +0.        00002520
           02  FILLER             OCCURS    800  TIMES.                 00002530
               04  TB-CNAME           PIC  X(18)       VALUE SPACES.    00002540
               04  TB-COLTYPE         PIC  X(08)       VALUE SPACES.    00002550
               04  TB-LENGTH          PIC  ZZZZ9.                       00002560
               04  TB-SCALE           PIC  ZZZ9.                        00002570
               04  TB-NULLS           PIC  X(01)       VALUE SPACES.    00002580
               04  TB-REMARKS         PIC  X(70)       VALUE SPACES.    00002590
               04  TB-DEFAULT         PIC  X(01)       VALUE SPACES.    00002600
               04  TB-DEFAULTVALUE    PIC  X(256)      VALUE SPACES.    00002610
      *----------------------------------------------------------------*00002620
      *                                                                *00002630
      *----------------------------------------------------------------*00002640
      *--- TABELA AUXILIAR, PARA TRATAR PRIMARY KEYS                    00002650
       01  TAB-PRIMARYKEYS.                                             00002660
           02  IND-PK                 PIC S9(04) COMP  VALUE +0.        00002670
           02  FILLER             OCCURS    64   TIMES.                 00002680
               04  TB-CNAME-PK        PIC  X(18)       VALUE SPACES.    00002690
      *----------------------------------------------------------------*00002700
      *                                                                *00002710
      *----------------------------------------------------------------*00002720
      *--- TABELA PARA ARMAZENAR LIMITKEY DE TABELAS PARTICIONADAS      00002730
       01  TAB-LIMITKEYS.                                               00002740
           02  IND-LK                 PIC S9(04) COMP  VALUE +0.        00002750
           02  FILLER             OCCURS    64   TIMES.                 00002760
               04  TB-LIMITKEY-LEN    PIC S9(04) COMP  VALUE +0.        00002770
               04  TB-LIMITKEY        PIC  X(60)       VALUE SPACES.    00002780
      *----------------------------------------------------------------*00002790
      *                                                                *00002800
      *----------------------------------------------------------------*00002810
       01  PARAMETRO                   PIC X(40).                       00002820
       01  FILLER.                                                      00002830
           02  PARM-CREATOR            PIC X(18).                       00002840
           02  PARM-TABELA             PIC X(18).                       00002850
      *----------------------------------------------------------------*00002860
      *                                                                *00002870
      *----------------------------------------------------------------*00002880
       01  TABLESPACE-L.                                                00002890
           02  FILLER         PIC X(18)          VALUE                  00002900
               'CREATE TABLESPACE'.                                     00002910
           02  TSNAME         PIC X(08).                                00002920
           02  FILLER         PIC X(04)          VALUE ' IN'.           00002930
           02  DBNAME         PIC X(08).                                00002940
                                                                        00002950
       01  CREATE-AUX-L.                                                00002960
           02  FILLER         PIC X(01)          VALUE SPACES.          00002970
           02  CREATE-ARG     PIC X(65)          VALUE SPACES.          00002980
                                                                        00002990
       01  SEGSIZE-L.                                                   00003000
           02  FILLER         PIC X(01)          VALUE SPACES.          00003010
           02  FILLER         PIC X(18)          VALUE 'SEGSIZE'.       00003020
           02  SEGSIZE        PIC ZZ9.                                  00003030
                                                                        00003040
       01  PCTFREE-L.                                                   00003050
      ***  02  FILLER         PIC X(06)          VALUE SPACES.          00003060
           02  FILLER         PIC X(07)          VALUE SPACES.          00003070
           02  FILLER         PIC X(15)          VALUE 'PCTFREE'.       00003080
           02  PCTFREE        PIC ZZ9.                                  00003090
                                                                        00003100
       01  BPOOL-L.                                                     00003110
           02  FILLER         PIC X(01)          VALUE SPACES.          00003120
           02  FILLER         PIC X(18)          VALUE 'BUFFERPOOL'.    00003130
           02  BUFFERPOOL     PIC X(05).                                00003140
                                                                        00003150
       01  LOCKSIZE-L.                                                  00003160
           02  FILLER         PIC X(01)          VALUE SPACES.          00003170
           02  FILLER         PIC X(18)          VALUE 'LOCKSIZE'.      00003180
           02  LOCKSIZE       PIC X(12).                                00003190
                                                                        00003200
       01  COMPRESS-L.                                                  00003210
      ***  02  FILLER         PIC X(06)          VALUE SPACES.          00003220
           02  FILLER         PIC X(07)          VALUE SPACES.          00003230
           02  FILLER         PIC X(12)          VALUE 'COMPRESS'.      00003240
           02  COMPRESS       PIC X(03).                                00003250
                                                                        00003260
       01  STOGROUP-L.                                                  00003270
      ***  02  FILLER         PIC X(07)          VALUE SPACES.          00003280
           02  FILLER         PIC X(18)          VALUE                  00003290
               'USING  STOGROUP'.                                       00003300
           02  STOGROUP       PIC X(08).                                00003310
                                                                        00003320
       01  PRIQTY-L.                                                    00003330
      ***  02  FILLER         PIC X(06)          VALUE SPACES.          00003340
           02  FILLER         PIC X(07)          VALUE SPACES.          00003350
           02  FILLER         PIC X(11)          VALUE 'PRIQTY'.        00003360
           02  PRIQTY         PIC ZZZZZZ9.                              00003370
                                                                        00003380
       01  SECQTY-L.                                                    00003390
      ***  02  FILLER         PIC X(06)          VALUE SPACES.          00003400
           02  FILLER         PIC X(07)          VALUE SPACES.          00003410
           02  FILLER         PIC X(11)          VALUE 'SECQTY'.        00003420
           02  SECQTY         PIC ZZZZZZ9.                              00003430
                                                                        00003440
       01  ERASE-L.                                                     00003450
      ***  02  FILLER         PIC X(06)          VALUE SPACES.          00003460
           02  FILLER         PIC X(07)          VALUE SPACES.          00003470
           02  FILLER         PIC X(12)          VALUE 'ERASE'.         00003480
           02  ERASE-RULE     PIC X(03).                                00003490
                                                                        00003500
       01  NUMPARTS-L.                                                  00003510
           02  FILLER                  PIC X(07)      VALUE SPACES.     00003520
           02  NUMPARTS-STRING         PIC X(10)      VALUE 'NUMPARTS'. 00003530
           02  NUMPARTS                PIC ZZ.                          00003540
           02  FILLER                  PIC X(03)      VALUE ' '.        00003550
           02  PARTITION-L.                                             00003560
               04  PAR-BR              PIC X(01).                       00003570
               04  FILLER.                                              00003580
                   06  PART-STRING     PIC X(05)      VALUE 'PART'.     00003590
                   06  NUMPART-ID      PIC ZZ.                          00003600
                   06  FILLER          PIC X(01)      VALUE ' '.        00003610
               04  NUMPART-DEF         PIC X(25).                       00003620
               04  BR-PAR              PIC X(01).                       00003630
                                                                        00003640
       01  COMMIT-L.                                                    00003650
           02  FILLER         PIC X(13)          VALUE 'COMMIT WORK'.   00003660
                                                                        00003670
       01  DELIMITADOR.                                                 00003680
           02  FILLER         PIC X(01)          VALUE ';'.             00003690
                                                                        00003700
       01  TABLE-L.                                                     00003710
           02  FILLER         PIC X(13)          VALUE 'CREATE TABLE'.  00003720
           02  TNAME          PIC X(40).                                00003730
                                                                        00003740
       01  CREATECOL-L.                                                 00003750
           02  PAR-BR             PIC X(01).                            00003760
           02  CNAME              PIC X(18).                            00003770
           02  CTYPE              PIC X(15).                            00003780
           02  INULL              PIC X(09).                            00003790
           02  DEFAULT-CONST      PIC X(08).                            00003800
           02  DEFAULTVALUE       PIC X(20).                            00003810
           02  VIRG-PAR-CREATE    PIC X(01).                            00003820
                                                                        00003830
       01  IN-L.                                                        00003840
      ***  02  FILLER         PIC X(07)          VALUE SPACES.          00003850
           02  FILLER         PIC X(06)          VALUE 'IN'.            00003860
           02  DBNAME2        PIC X(40).                                00003870
                                                                        00003880
       01  RESTRICT-L.                                                  00003890
      ***  02  FILLER         PIC X(07)          VALUE SPACES.          00003900
           02  FILLER         PIC X(21)          VALUE                  00003910
               'WITH RESTRICT ON DROP'.                                 00003920
                                                                        00003930
       01  GRANT-L.                                                     00003940
           02  GRANT0-L.                                                00003950
               04  FILLER         PIC X(43)          VALUE              00003960
                   'GRANT SELECT,INSERT,UPDATE,DELETE ON TABLE'.        00003970
           02  GRANT1-L.                                                00003980
               04  FILLER         PIC X(07)          VALUE SPACES.      00003990
               04  TNAME-GRANT1   PIC X(30).                            00004000
               04  FILLER         PIC X(03)          VALUE              00004010
MUNIZ              'TO '.                                               00004020
MUNIZ      02  GRANT2-L.                                                00004030
MUNIZ          04  GRANTEE-GRANT2 OCCURS             8 TIMES.           00004040
MUNIZ              06  GRANTEE2-L PIC X(08).                            00004050
MUNIZ              06  VIRGULA    PIC X(01).                            00004060
                                                                        00004070
       01  ALIAS-L.                                                     00004080
           02  ALIAS1-L.                                                00004090
               04  FILLER         PIC X(13)          VALUE              00004100
                   'CREATE ALIAS'.                                      00004110
               04  ALIAS-NAME     PIC X(30).                            00004120
           02  ALIAS2-L.                                                00004130
               04  FILLER         PIC X(07)          VALUE SPACES.      00004140
               04  FILLER         PIC X(04)          VALUE 'FOR'.       00004150
               04  TABLE-NAME     PIC X(30).                            00004160
                                                                        00004170
       01  INDEX-L.                                                     00004180
           02  INDEX1-L.                                                00004190
               04  FILLER         PIC X(06)          VALUE              00004200
                   'INDEX'.                                             00004210
               04  TNAME          PIC X(30).                            00004220
           02  INDEX2-L.                                                00004230
               04  FILLER         PIC X(07)          VALUE SPACES.      00004240
               04  FILLER         PIC X(03)          VALUE 'ON'.        00004250
               04  TNAME          PIC X(30).                            00004260
                                                                        00004270
       01  INDEXCOL-L.                                                  00004280
      **** 02  FILLER              PIC X(06)          VALUE SPACES.     00004290
           02  PAR-BR              PIC X(01)          VALUE '('.        00004300
           02  COLINDEX            PIC X(19).                           00004310
           02  ORDEM               PIC X(04).                           00004320
           02  VIRG-PAR            PIC X(01).                           00004330
                                                                        00004340
       01  CLUSTER-L.                                                   00004350
           02  FILLER             PIC X(01)          VALUE SPACES.      00004360
           02  CLUSTER-STRING     PIC X(07)          VALUE 'CLUSTER'.   00004370
           02  PARTITION-INDEX    PIC X(55)          VALUE SPACES.      00004380
                                                                        00004390
       01  PART-INDEX-L.                                                00004400
           02  FILLER                  PIC X(01)      VALUE SPACES.     00004410
           02  PART-IDX-L.                                              00004420
               04  PAR-BR              PIC X(01).                       00004430
               04  FILLER.                                              00004440
                   06  PART-STRING     PIC X(05)      VALUE 'PART'.     00004450
                   06  IDXPART-ID      PIC ZZ.                          00004460
                   06  FILLER          PIC X(01)      VALUE ' '.        00004470
               04  IDXPART-DEF         PIC X(50).                       00004480
               04  BR-PAR              PIC X(01).                       00004490
                                                                        00004500
       01  PART-IDX-VALUE.                                              00004510
           02  FILLER                  PIC X(07)      VALUE 'VALUES'.   00004520
           02  LIMITKEY                PIC X(43).                       00004530
                                                                        00004540
       01  COMMENT-L.                                                   00004550
           02  COMMENT1-L.                                              00004560
               04  FILLER         PIC X(17)          VALUE              00004570
                   'COMMENT ON TABLE'.                                  00004580
               04  TNAME          PIC X(30).                            00004590
               04  FILLER         PIC X(02)          VALUE 'IS'.        00004600
           02  COMMENT2-L.                                              00004610
               04  FILLER         PIC X(01)          VALUE QUOTE.       00004620
               04  COMENTARIO     PIC X(70).                            00004630
               04  FILLER         PIC X(01)          VALUE QUOTE.       00004640
       01  COMMENTCOL-L.                                                00004650
           02  COMMENTCOL1-L.                                           00004660
               04  FILLER         PIC X(11)          VALUE              00004670
                   'COMMENT ON'.                                        00004680
               04  TNAME          PIC X(30).                            00004690
           02  COMMENTCOL2-L.                                           00004700
      ***      04  FILLER              PIC X(06)          VALUE SPACES. 00004710
               04  PAR-BR              PIC X(01)          VALUE '('.    00004720
               04  COLCOMMENT          PIC X(19).                       00004730
               04  FILLER              PIC X(03)          VALUE 'IS'.   00004740
               04  FILLER              PIC X(01)          VALUE QUOTE.  00004750
               04  COMENTARIO2         PIC X(45).                       00004760
               04  FILLER              PIC X(01)          VALUE QUOTE.  00004770
               04  VIRG-PAR-COMMENTCOL PIC X(01).                       00004780
                                                                        00004790
       01  ADD-PRIMARY-L.                                               00004800
           02  ADD-PRIMARY1-L.                                          00004810
               04  FILLER         PIC X(12)          VALUE              00004820
                   'ALTER TABLE'.                                       00004830
               04  TNAME          PIC X(30).                            00004840
           02  ADD-PRIMARY2-L.                                          00004850
               04  FILLER         PIC X(02)          VALUE SPACES.      00004860
               04  FILLER         PIC X(16)          VALUE              00004870
                   'ADD PRIMARY KEY'.                                   00004880
           02  ADD-PRIMARY3-L.                                          00004890
               04  FILLER         PIC X(06)          VALUE SPACES.      00004900
               04  PAR-BR         PIC X(01)          VALUE '('.         00004910
               04  COLPK          PIC X(19).                            00004920
               04  VIRG-PAR       PIC X(01).                            00004930
      *----------------------------------------------------------------*00004940
      * FOREIGN KEYS                                                   *00004950
      *----------------------------------------------------------------*00004960
       01  ADD-FKEYS-L.                                                 00004970
           02  ADD-FKEYS1-L.                                            00004980
               04  FILLER         PIC X(12)          VALUE              00004990
                   'ALTER TABLE'.                                       00005000
               04  TNAME          PIC X(30).                            00005010
           02  ADD-FKEYS2-L.                                            00005020
               04  FILLER         PIC X(02)          VALUE SPACES.      00005030
               04  FILLER         PIC X(16)          VALUE              00005040
                   'ADD FOREIGN KEY'.                                   00005050
               04  CONSTRAINT     PIC X(08).                            00005060
           02  ADD-FKEYS3-L.                                            00005070
               04  FILLER         PIC X(06)          VALUE SPACES.      00005080
               04  PAR-BR         PIC X(01)          VALUE '('.         00005090
               04  COLFK          PIC X(19).                            00005100
               04  VIRG-PAR       PIC X(01).                            00005110
           02  ADD-FKEYS4-L.                                            00005120
               04  FILLER         PIC X(02)          VALUE SPACES.      00005130
               04  FILLER         PIC X(11)          VALUE              00005140
                   'REFERENCES'.                                        00005150
               04  TNAME          PIC X(30).                            00005160
           02  ADD-FKEYS5-L.                                            00005170
               04  FILLER         PIC X(02)          VALUE SPACES.      00005180
               04  FILLER         PIC X(10)          VALUE              00005190
                   'ON DELETE'.                                         00005200
               04  DELETERULE     PIC X(08).                            00005210
      *----------------------------------------------------------------*00005220
      * CKECK CONSTRAINTS                                              *00005230
      *----------------------------------------------------------------*00005240
       01  ADD-CHECK-L.                                                 00005250
           02  ADD-CHECK1-L.                                            00005260
               04  FILLER         PIC X(12)          VALUE              00005270
                   'ALTER TABLE'.                                       00005280
               04  TNAME          PIC X(30).                            00005290
           02  ADD-CHECK2-L.                                            00005300
               04  FILLER         PIC X(02)          VALUE SPACES.      00005310
               04  FILLER         PIC X(16)          VALUE              00005320
                   'ADD CONSTRAINT '.                                   00005330
               04  CONSTRAINT     PIC X(20).                            00005340
           02  ADD-CHECK3-L.                                            00005350
               04  FILLER         PIC X(06)          VALUE SPACES.      00005360
               04  FILLER         PIC X(07)          VALUE 'CHECK ('.   00005370
               04  CHECKCONDITION PIC X(60).                            00005380
               04  FILLER         PIC X(01)          VALUE ')'.         00005390
      *----------------------------------------------------------------*00005400
      *                                                                *00005410
      *----------------------------------------------------------------*00005420
       01  ADD-IEBUPDTE.                                                00005430
           02  FILLER                  PIC X(12)          VALUE         00005440
               './ ADD NAME='.                                          00005450
           02  NAME-IEBUPDTE           PIC X(08).                       00005460
                                                                        00005470
       01  ENDUP-IEBUPDTE.                                              00005480
           02  FILLER                  PIC X(08)          VALUE         00005490
               './ ENDUP'.                                              00005500
      *----------------------------------------------------------------*00005510
      *                                                                *00005520
      *----------------------------------------------------------------*00005530
       01  CHAVES-FIM.                                                  00005540
           02  N88-FIM-SYSCOLUMNS                PIC  X(03) VALUE 'NAO'.00005550
               88  FIM-SYSCOLUMNS                           VALUE 'SIM'.00005560
           02  N88-FIM-SYSINDEXES                PIC  X(03) VALUE 'NAO'.00005570
               88  FIM-SYSINDEXES                           VALUE 'SIM'.00005580
MUNIZ      02  N88-FIM-SYSTABAUTH                PIC  X(03) VALUE 'NAO'.00005590
MUNIZ          88  FIM-SYSTABAUTH                           VALUE 'SIM'.00005600
           02  N88-FIM-SYSKEYS                   PIC  X(03) VALUE 'NAO'.00005610
               88  FIM-SYSKEYS                              VALUE 'SIM'.00005620
           02  N88-FIM-SYSIN                     PIC  X(03) VALUE 'NAO'.00005630
               88  FIM-SYSIN                                VALUE 'SIM'.00005640
           02  N88-FIM-SYSRELS                   PIC  X(03) VALUE 'NAO'.00005650
               88  FIM-SYSRELS                              VALUE 'SIM'.00005660
           02  N88-FIM-SYSFOREIGNKEYS            PIC  X(03) VALUE 'NAO'.00005670
               88  FIM-SYSFOREIGNKEYS                       VALUE 'SIM'.00005680
           02  N88-FIM-SYSTABLEPART              PIC  X(03) VALUE 'NAO'.00005690
               88  FIM-SYSTABLEPART                         VALUE 'SIM'.00005700
           02  N88-FIM-SYSINDEXPART              PIC  X(03) VALUE 'NAO'.00005710
               88  FIM-SYSINDEXPART                         VALUE 'SIM'.00005720
           02  N88-EXISTE-FK                     PIC  X(03) VALUE 'NAO'.00005730
               88  EXISTE-FK                                VALUE 'SIM'.00005740
           02  N88-WARNING                       PIC  X(03) VALUE 'NAO'.00005750
               88  WARNING                                  VALUE 'SIM'.00005760
      *----------------------------------------------------------------*00005770
      *                                                                *00005780
      *----------------------------------------------------------------*00005790
           EXEC SQL INCLUDE SQLCA END-EXEC.                             00005800
       PROCEDURE   DIVISION.                                            00005810
      *----------------------------------------------------------------*00005820
      *                                                                *00005830
      *----------------------------------------------------------------*00005840
       0000-0000-PRINCIPAL.                                             00005850
           PERFORM  0005-0000-CREDITOS THRU 0005-0000-EXIT.             00005860
           OPEN INPUT  SYSIN                                            00005870
                OUTPUT SCRIPT, FKEYS.                                   00005880
                                                                        00005890
           PERFORM  0010-9999-LE-SYSIN THRU  0010-9999-EXIT.            00005900
           PERFORM  0020-0000-TRATA-SYSIN THRU  0020-0000-EXIT          00005910
             UNTIL  FIM-SYSIN.                                          00005920
                                                                        00005930
      *--  GERA CARTAO ./ ENDUP (IEBUPDTE)                              00005940
           WRITE  REG-SCRIPT           FROM ENDUP-IEBUPDTE.             00005950
                                                                        00005960
      *--  GERA CARTAO ./ ENDUP (IEBUPDTE)                              00005970
           IF  AC-FKEYS  GREATER  +0                                    00005980
               WRITE  REG-FKEYS        FROM ENDUP-IEBUPDTE              00005990
           END-IF.                                                      00006000
                                                                        00006010
           CLOSE   SYSIN, SCRIPT, FKEYS.                                00006020
           EXEC SQL COMMIT WORK END-EXEC.                               00006030
           IF  WARNING                                                  00006040
               MOVE   +4               TO  RETURN-CODE                  00006050
           ELSE                                                         00006060
               MOVE   +0               TO  RETURN-CODE                  00006070
           END-IF.                                                      00006080
           STOP RUN.                                                    00006090
       0000-0000-EXIT. EXIT.                                            00006100
      *----------------------------------------------------------------*00006110
      *                                                                *00006120
      *----------------------------------------------------------------*00006130
       0005-0000-CREDITOS.                                              00006140
           DISPLAY 'DB2CRDDL - Maritima Seguros'.                       00006150
           DISPLAY 'DB2CRDDL - Administracaco de Banco de Dados'.       00006160
           DISPLAY 'DB2CRDDL - Geracao de Script DB2'.                  00006170
           DISPLAY 'DB2CRDDL - Versao 1.2'.                             00006180
       0005-0000-EXIT. EXIT.                                            00006190
      *----------------------------------------------------------------*00006200
      *                                                                *00006210
      *----------------------------------------------------------------*00006220
       0010-9999-LE-SYSIN.                                              00006230
           READ SYSIN INTO PARAMETRO                                    00006240
             AT END   MOVE 'SIM'  TO          N88-FIM-SYSIN.            00006250
       0010-9999-EXIT. EXIT.                                            00006260
      *----------------------------------------------------------------*00006270
      *                                                                *00006280
      *----------------------------------------------------------------*00006290
       0020-0000-TRATA-SYSIN.                                           00006300
           INITIALIZE CHAVES-FIM REPLACING ALPHANUMERIC BY 'NAO'.       00006310
           INITIALIZE TAB-COLUNAS.                                      00006320
           INITIALIZE TAB-PRIMARYKEYS.                                  00006330
           MOVE   'N'                  TO   CH-ALIAS.                   00006340
           MOVE   'N'                  TO   CH-PRIMARY.                 00006350
           UNSTRING PARAMETRO DELIMITED BY '.' OR SPACES                00006360
               INTO PARM-CREATOR PARM-TABELA.                           00006370
           PERFORM 0200-0020-CREATE-TABLESPACE  THRU 0200-0020-EXIT.    00006380
           PERFORM 0600-0020-CREATE-TABLE       THRU 0600-0020-EXIT.    00006390
           PERFORM 1200-0020-GRANT              THRU 1200-0020-EXIT.    00006400
           IF  CH-ALIAS  EQUAL  'S'                                     00006410
               PERFORM 1400-0020-CREATE-ALIAS   THRU 1400-0020-EXIT     00006420
           END-IF.                                                      00006430
           PERFORM 1500-0020-COMMENT-TABLE  THRU 1500-0020-EXIT.        00006440
           PERFORM 1600-0020-COMMENT-COLUMN THRU 1600-0020-EXIT.        00006450
           PERFORM 1800-0020-CREATE-INDEX   THRU 1800-0020-EXIT.        00006460
           IF  CH-PRIMARY EQUAL  'S'                                    00006470
               PERFORM 2500-0020-CREATE-PRIMARY THRU 2500-0020-EXIT     00006480
           END-IF.                                                      00006490
           PERFORM 2700-0020-CREATE-FOREIGN THRU 2700-0020-EXIT.        00006500
           PERFORM 0010-9999-LE-SYSIN THRU  0010-9999-EXIT.             00006510
       0020-0000-EXIT. EXIT.                                            00006520
      *----------------------------------------------------------------*00006530
      *                                                                *00006540
      *----------------------------------------------------------------*00006550
       0200-0020-CREATE-TABLESPACE.                                     00006560
           MOVE   PARM-CREATOR         TO  SYSTABLES-CREATOR.           00006570
           MOVE   +18                  TO  SYSTABLES-NAME-L.            00006580
           MOVE   PARM-TABELA          TO  SYSTABLES-NAME-T.            00006590
           PERFORM  0300-0200-SYSTABLES THRU 0300-0200-EXIT.            00006600
                                                                        00006610
           MOVE   'N'                  TO  CH-ALIAS                     00006620
           IF  SYSTABLES-TYPE  EQUAL  'A'                               00006630
               MOVE   'S'              TO  CH-ALIAS                     00006640
               PERFORM  1300-0200-ALIAS     THRU 1300-0200-EXIT         00006650
               MOVE   SYSTABLES-TBCREATOR   TO  SYSTABLES-CREATOR       00006660
               MOVE   SYSTABLES-TBNAME      TO  SYSTABLES-NAME          00006670
               PERFORM  0300-0200-SYSTABLES THRU 0300-0200-EXIT.        00006680
                                                                        00006690
           MOVE   SYSTABLES-TSNAME     TO  TSNAME, NAME-IEBUPDTE.       00006700
           MOVE   SYSTABLES-DBNAME     TO  DBNAME.                      00006710
      *--  GERA CARTAO ./ ADD (IEBUPDTE)                                00006720
           WRITE  REG-SCRIPT           FROM ADD-IEBUPDTE.               00006730
           WRITE  REG-SCRIPT           FROM TABLESPACE-L.               00006740
                                                                        00006750
           PERFORM  0400-0200-SYSTABLESPACE THRU 0400-0200-EXIT.        00006760
           PERFORM  0500-0200-SYSTABLEPART  THRU 0500-0200-EXIT.        00006770
           MOVE   SYSTABLESPACE-BPOOL  TO  BUFFERPOOL.                  00006780
           WRITE  REG-SCRIPT           FROM BPOOL-L.                    00006790
                                                                        00006800
           IF  SYSTABLESPACE-LOCKRULE EQUAL 'A'                         00006810
               MOVE   'ANY'            TO  LOCKSIZE                     00006820
           ELSE                                                         00006830
             IF  SYSTABLESPACE-LOCKRULE EQUAL 'P'                       00006840
                 MOVE   'PAGE'         TO  LOCKSIZE                     00006850
             ELSE                                                       00006860
               IF  SYSTABLESPACE-LOCKRULE EQUAL 'R'                     00006870
                   MOVE   'ROW'        TO  LOCKSIZE                     00006880
               ELSE                                                     00006890
                   MOVE SYSTABLESPACE-LOCKRULE  TO  LOCKSIZE            00006900
               END-IF                                                   00006910
             END-IF                                                     00006920
           END-IF.                                                      00006930
           WRITE  REG-SCRIPT           FROM LOCKSIZE-L.                 00006940
                                                                        00006950
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00006960
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00006970
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00006980
       0200-0020-EXIT. EXIT.                                            00006990
      *----------------------------------------------------------------*00007000
      *                                                                *00007010
      *----------------------------------------------------------------*00007020
       0300-0200-SYSTABLES.                                             00007030
           EXEC SQL                                                     00007040
                SELECT NAME, CREATOR, TYPE, DBNAME, TSNAME,             00007050
                       REMARKS, TBCREATOR, TBNAME                       00007060
                  INTO :SYSTABLES-NAME, :SYSTABLES-CREATOR,             00007070
                       :SYSTABLES-TYPE, :SYSTABLES-DBNAME,              00007080
                       :SYSTABLES-TSNAME, :SYSTABLES-REMARKS,           00007090
                       :SYSTABLES-TBCREATOR, :SYSTABLES-TBNAME          00007100
                  FROM SYSIBM.SYSTABLES                                 00007110
                 WHERE NAME    = :SYSTABLES-NAME                        00007120
                   AND CREATOR = :SYSTABLES-CREATOR                     00007130
           END-EXEC.                                                    00007140
           IF  SQLCODE  EQUAL  +0                                       00007150
               NEXT  SENTENCE                                           00007160
           ELSE                                                         00007170
               DISPLAY '*** ERRO NO SELECT SYSIBM.SYSTABLES'            00007180
               DISPLAY '*** TABELA NAO ENCONTRADA: ' PARAMETRO          00007190
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00007200
           END-IF.                                                      00007210
       0300-0200-EXIT. EXIT.                                            00007220
      *----------------------------------------------------------------*00007230
      *                                                                *00007240
      *----------------------------------------------------------------*00007250
       0400-0200-SYSTABLESPACE.                                         00007260
           MOVE   SYSTABLES-TSNAME     TO  SYSTABLESPACE-NAME.          00007270
           MOVE   SYSTABLES-DBNAME     TO  SYSTABLESPACE-DBNAME.        00007280
           EXEC SQL                                                     00007290
                SELECT NAME, DBNAME, ERASERULE, SEGSIZE,                00007300
                       BPOOL, LOCKRULE, PARTITIONS                      00007310
                  INTO :SYSTABLESPACE-NAME, :SYSTABLESPACE-DBNAME,      00007320
                       :SYSTABLESPACE-ERASERULE,                        00007330
                       :SYSTABLESPACE-SEGSIZE, :SYSTABLESPACE-BPOOL,    00007340
                       :SYSTABLESPACE-LOCKRULE,                         00007350
                       :SYSTABLESPACE-PARTITIONS                        00007360
                  FROM SYSIBM.SYSTABLESPACE                             00007370
                 WHERE NAME    = :SYSTABLESPACE-NAME                    00007380
                   AND DBNAME  = :SYSTABLESPACE-DBNAME                  00007390
           END-EXEC.                                                    00007400
           IF  SQLCODE  EQUAL  +0                                       00007410
               NEXT  SENTENCE                                           00007420
           ELSE                                                         00007430
               DISPLAY '*** ERRO NO SELECT SYSIBM.SYSTABLESPACE'        00007440
               DISPLAY ' NAME '   SYSTABLESPACE-NAME                    00007450
                      ' DBNAME ' SYSTABLESPACE-DBNAME                   00007460
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00007470
           END-IF.                                                      00007480
       0400-0200-EXIT. EXIT.                                            00007490
      *----------------------------------------------------------------*00007500
      *                                                                *00007510
      *----------------------------------------------------------------*00007520
       0500-0200-SYSTABLEPART.                                          00007530
           MOVE   SYSTABLES-TSNAME     TO  SYSTABLEPART-TSNAME.         00007540
           MOVE   SYSTABLES-DBNAME     TO  SYSTABLEPART-DBNAME.         00007550
           EXEC SQL                                                     00007560
                DECLARE C_SYSTABLEPART CURSOR FOR                       00007570
                SELECT PCTFREE, STORNAME, PQTY, SQTY, COMPRESS,         00007580
                       PARTITION, LIMITKEY                              00007590
                  FROM SYSIBM.SYSTABLEPART                              00007600
                 WHERE TSNAME  = :SYSTABLEPART-TSNAME                   00007610
                   AND DBNAME  = :SYSTABLEPART-DBNAME                   00007620
                 ORDER BY PARTITION                                     00007630
           END-EXEC.                                                    00007640
                                                                        00007650
           EXEC SQL OPEN C_SYSTABLEPART END-EXEC.                       00007660
           IF  SQLCODE  EQUAL  +0                                       00007670
               NEXT  SENTENCE                                           00007680
           ELSE                                                         00007690
               DISPLAY '*** ERRO NO OPEN C_SYSTABLEPART'                00007700
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00007710
           END-IF.                                                      00007720
                                                                        00007730
           INITIALIZE TAB-LIMITKEYS.                                    00007740
           MOVE   'NAO'                TO  N88-FIM-SYSTABLEPART.        00007750
           PERFORM  0510-9999-FETCH-SYSTABLEPART THRU  0510-9999-EXIT.  00007760
           PERFORM  3200-0500-MONTA-PARTICAO     THRU  3200-0500-EXIT.  00007770
      ****** UNTIL  FIM-SYSTABLEPART.                                   00007780
                                                                        00007790
           EXEC SQL CLOSE C_SYSTABLEPART END-EXEC.                      00007800
           IF  SQLCODE  EQUAL  +0                                       00007810
               NEXT  SENTENCE                                           00007820
           ELSE                                                         00007830
               DISPLAY '*** ERRO NO CLOSE C_SYSTABLEPART'               00007840
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00007850
           END-IF.                                                      00007860
       0500-0200-EXIT. EXIT.                                            00007870
      *----------------------------------------------------------------*00007880
      *                                                                *00007890
      *----------------------------------------------------------------*00007900
       0510-9999-FETCH-SYSTABLEPART.                                    00007910
           EXEC SQL                                                     00007920
                FETCH  C_SYSTABLEPART                                   00007930
                  INTO :SYSTABLEPART-PCTFREE, :SYSTABLEPART-STORNAME,   00007940
                       :SYSTABLEPART-PQTY, :SYSTABLEPART-SQTY,          00007950
                       :SYSTABLEPART-COMPRESS, :SYSTABLEPART-PARTITION, 00007960
                       :SYSTABLEPART-LIMITKEY                           00007970
           END-EXEC.                                                    00007980
           IF  SQLCODE  EQUAL  +0                                       00007990
               NEXT  SENTENCE                                           00008000
           ELSE                                                         00008010
             IF  SQLCODE  EQUAL  +100                                   00008020
                 MOVE  'SIM'           TO  N88-FIM-SYSTABLEPART         00008030
             ELSE                                                       00008040
                 DISPLAY '*** ERRO NO FETCH C_SYSTABLEPART'             00008050
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00008060
             END-IF                                                     00008070
           END-IF.                                                      00008080
       0510-9999-EXIT. EXIT.                                            00008090
      *----------------------------------------------------------------*00008100
      *                                                                *00008110
      *----------------------------------------------------------------*00008120
       0600-0020-CREATE-TABLE.                                          00008130
           MOVE   SPACES TO TNAME OF TABLE-L.                           00008140
           STRING SYSTABLES-CREATOR DELIMITED BY SPACE '.'              00008150
                  SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) DELIMITED BY SIZE00008160
             INTO TNAME OF TABLE-L.                                     00008170
           WRITE  REG-SCRIPT           FROM TABLE-L.                    00008180
           PERFORM  0700-0600-CARREGA-COLUNAS THRU 0700-0600-EXIT.      00008190
                                                                        00008200
           MOVE   '('                  TO  PAR-BR OF CREATECOL-L.       00008210
           PERFORM  1000-0600-DEFINE-COLUNA   THRU 1000-0600-EXIT       00008220
           VARYING  IND-TAB  FROM  +1  BY  +1                           00008230
             UNTIL  IND-TAB > SYSCOLUMNS-COLNO.                         00008240
                                                                        00008250
           MOVE   SPACES   TO   DBNAME2.                                00008260
           STRING SYSTABLES-DBNAME DELIMITED BY SPACE '.'               00008270
                  SYSTABLES-TSNAME DELIMITED BY SPACE                   00008280
             INTO DBNAME2.                                              00008290
           WRITE  REG-SCRIPT           FROM IN-L.                       00008300
           WRITE  REG-SCRIPT           FROM RESTRICT-L.                 00008310
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00008320
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00008330
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00008340
       0600-0020-EXIT. EXIT.                                            00008350
      *----------------------------------------------------------------*00008360
      *                                                                *00008370
      *----------------------------------------------------------------*00008380
       0700-0600-CARREGA-COLUNAS.                                       00008390
           MOVE   SYSTABLES-NAME       TO  SYSCOLUMNS-TBNAME.           00008400
           MOVE   SYSTABLES-CREATOR    TO  SYSCOLUMNS-TBCREATOR.        00008410
           EXEC SQL                                                     00008420
                DECLARE C_SYSCOLUMNS CURSOR FOR                         00008430
                SELECT NAME, COLTYPE, LENGTH, SCALE, NULLS,             00008440
                       REMARKS, COLNO, DEFAULT, DEFAULTVALUE            00008450
                  FROM SYSIBM.SYSCOLUMNS                                00008460
                 WHERE TBCREATOR = :SYSCOLUMNS-TBCREATOR                00008470
                   AND TBNAME  = :SYSCOLUMNS-TBNAME                     00008480
                 ORDER BY COLNO                                         00008490
           END-EXEC.                                                    00008500
                                                                        00008510
           EXEC SQL OPEN C_SYSCOLUMNS END-EXEC.                         00008520
           IF  SQLCODE  EQUAL  +0                                       00008530
               NEXT  SENTENCE                                           00008540
           ELSE                                                         00008550
               DISPLAY '*** ERRO NO SELECT SYSIBM.SYSCOLUMNS'           00008560
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00008570
           END-IF.                                                      00008580
                                                                        00008590
           PERFORM  0800-9999-FETCH-SYSCOLUMNS THRU  0800-9999-EXIT.    00008600
           PERFORM  0900-0700-MONTA-SYSCOLUMNS THRU  0900-0700-EXIT     00008610
             UNTIL  FIM-SYSCOLUMNS.                                     00008620
                                                                        00008630
           EXEC SQL CLOSE C_SYSCOLUMNS END-EXEC.                        00008640
           IF  SQLCODE  EQUAL  +0                                       00008650
               NEXT  SENTENCE                                           00008660
           ELSE                                                         00008670
               DISPLAY '*** ERRO NO SELECT SYSIBM.SYSCOLUMNS'           00008680
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00008690
           END-IF.                                                      00008700
       0700-0600-EXIT. EXIT.                                            00008710
      *----------------------------------------------------------------*00008720
      *                                                                *00008730
      *----------------------------------------------------------------*00008740
       0800-9999-FETCH-SYSCOLUMNS.                                      00008750
           EXEC SQL                                                     00008760
                FETCH  C_SYSCOLUMNS                                     00008770
                INTO   :SYSCOLUMNS-NAME, :SYSCOLUMNS-COLTYPE,           00008780
                       :SYSCOLUMNS-LENGTH, :SYSCOLUMNS-SCALE,           00008790
                       :SYSCOLUMNS-NULLS, :SYSCOLUMNS-REMARKS,          00008800
                       :SYSCOLUMNS-COLNO, :SYSCOLUMNS-DEFAULT,          00008810
                       :SYSCOLUMNS-DEFAULTVALUE                         00008820
           END-EXEC.                                                    00008830
           IF  SQLCODE  EQUAL  +0                                       00008840
               NEXT  SENTENCE                                           00008850
           ELSE                                                         00008860
             IF  SQLCODE  EQUAL  +100                                   00008870
                 MOVE  'SIM'           TO  N88-FIM-SYSCOLUMNS           00008880
             ELSE                                                       00008890
                 DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSCOLUMNS'         00008900
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00008910
             END-IF                                                     00008920
           END-IF.                                                      00008930
       0800-9999-EXIT. EXIT.                                            00008940
      *----------------------------------------------------------------*00008950
      *                                                                *00008960
      *----------------------------------------------------------------*00008970
       0900-0700-MONTA-SYSCOLUMNS.                                      00008980
           IF  SYSCOLUMNS-COLNO  GREATER  +800                          00008990
                 DISPLAY '*** ESTOURO DE TABELA INTERNA'                00009000
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00009010
           END-IF.                                                      00009020
                                                                        00009030
           MOVE SYSCOLUMNS-NAME-T (1:SYSCOLUMNS-NAME-L)                 00009040
             TO TB-CNAME (SYSCOLUMNS-COLNO).                            00009050
           MOVE SYSCOLUMNS-COLTYPE TO TB-COLTYPE (SYSCOLUMNS-COLNO).    00009060
           MOVE SYSCOLUMNS-LENGTH  TO TB-LENGTH (SYSCOLUMNS-COLNO).     00009070
           MOVE SYSCOLUMNS-SCALE   TO TB-SCALE (SYSCOLUMNS-COLNO).      00009080
           MOVE SYSCOLUMNS-NULLS   TO TB-NULLS (SYSCOLUMNS-COLNO).      00009090
           MOVE SYSCOLUMNS-REMARKS-T (1:SYSCOLUMNS-REMARKS-L)           00009100
             TO TB-REMARKS (SYSCOLUMNS-COLNO).                          00009110
           MOVE SYSCOLUMNS-DEFAULT TO TB-DEFAULT(SYSCOLUMNS-COLNO).     00009120
      ***                                                               00009130
           IF  SYSCOLUMNS-DEFAULT = '1'                                 00009140
               MOVE QUOTE                                               00009150
                 TO TB-DEFAULTVALUE(SYSCOLUMNS-COLNO) (1:1)             00009160
               MOVE SYSCOLUMNS-DEFAULTVALUE-T                           00009170
                    (1:SYSCOLUMNS-DEFAULTVALUE-L)                       00009180
                 TO TB-DEFAULTVALUE(SYSCOLUMNS-COLNO)                   00009190
                    (2:SYSCOLUMNS-DEFAULTVALUE-L)                       00009200
               MOVE QUOTE                                               00009210
                 TO TB-DEFAULTVALUE(SYSCOLUMNS-COLNO)                   00009220
                    (SYSCOLUMNS-DEFAULTVALUE-L + 2:1)                   00009230
           ELSE                                                         00009240
               MOVE SYSCOLUMNS-DEFAULTVALUE-T                           00009250
                    (1:SYSCOLUMNS-DEFAULTVALUE-L)                       00009260
                 TO TB-DEFAULTVALUE (SYSCOLUMNS-COLNO)                  00009270
           END-IF.                                                      00009280
                                                                        00009290
           IF  SYSCOLUMNS-DEFAULTVALUE-L > 18                           00009300
               MOVE   'SIM'        TO  N88-WARNING                      00009310
               DISPLAY 'DB2CRDDL - STRING DE DEFAULT MAIOR QUE 18 CARACT00009320
      -                'ERES. TABELA ' TNAME OF TABLE-L                 00009330
           END-IF.                                                      00009340
           PERFORM  0800-9999-FETCH-SYSCOLUMNS THRU  0800-9999-EXIT.    00009350
       0900-0700-EXIT. EXIT.                                            00009360
      *----------------------------------------------------------------*00009370
      *                                                                *00009380
      *----------------------------------------------------------------*00009390
       1000-0600-DEFINE-COLUNA.                                         00009400
           MOVE   TB-CNAME (IND-TAB)   TO  CNAME.                       00009410
           PERFORM  1100-1000-DATATYPE    THRU   1100-1000-EXIT.        00009420
                                                                        00009430
           MOVE   TB-NULLS (IND-TAB)   TO  INULL.                       00009440
           IF  TB-NULLS (IND-TAB)  = 'Y'                                00009450
               MOVE  SPACES            TO  INULL                        00009460
           ELSE                                                         00009470
               MOVE  'NOT NULL'        TO  INULL                        00009480
           END-IF.                                                      00009490
                                                                        00009500
           IF  TB-DEFAULT (IND-TAB)  = 'N'                              00009510
               MOVE  SPACES            TO  DEFAULT-CONST, DEFAULTVALUE  00009520
           ELSE                                                         00009530
               MOVE  SPACES            TO  DEFAULTVALUE                 00009540
               MOVE  'DEFAULT'         TO  DEFAULT-CONST                00009550
               EVALUATE TRUE                                            00009560
                 WHEN TB-DEFAULT(IND-TAB) = '1' OR '2' OR '3' OR '4'    00009570
                   MOVE  TB-DEFAULTVALUE(IND-TAB) TO  DEFAULTVALUE      00009580
                 WHEN TB-DEFAULT(IND-TAB) = 'S'                         00009590
                   MOVE  'CURRENT SQLID'   TO  DEFAULTVALUE             00009600
                 WHEN TB-DEFAULT(IND-TAB) = 'U'                         00009610
                   MOVE  'USER'            TO  DEFAULTVALUE             00009620
                 WHEN TB-DEFAULT(IND-TAB) = 'Y'                         00009630
                   IF  TB-NULLS(IND-TAB) = 'Y'                          00009640
                       MOVE  'NULL'        TO  DEFAULTVALUE             00009650
                   ELSE                                                 00009660
                       MOVE  SPACES        TO  DEFAULTVALUE             00009670
                   END-IF                                               00009680
                 WHEN OTHER                                             00009690
                   MOVE  ALL '*'           TO  DEFAULTVALUE             00009700
               END-EVALUATE                                             00009710
           END-IF.                                                      00009720
                                                                        00009730
           IF  IND-TAB  EQUAL  SYSCOLUMNS-COLNO                         00009740
               MOVE   ')'              TO  VIRG-PAR-CREATE              00009750
           ELSE                                                         00009760
               MOVE   ','              TO  VIRG-PAR-CREATE              00009770
           END-IF.                                                      00009780
           WRITE  REG-SCRIPT           FROM CREATECOL-L.                00009790
           MOVE   SPACES               TO  PAR-BR OF CREATECOL-L.       00009800
       1000-0600-EXIT. EXIT.                                            00009810
      *----------------------------------------------------------------*00009820
      *                                                                *00009830
      *----------------------------------------------------------------*00009840
       1100-1000-DATATYPE.                                              00009850
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'INTEGER' OR 'SMALLINT'     00009860
                                        OR  'DATE'    OR 'TIME'         00009870
               MOVE  TB-COLTYPE(IND-TAB) TO  CTYPE                      00009880
               GO  TO 1100-1000-EXIT                                    00009890
           END-IF.                                                      00009900
                                                                        00009910
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'TIMESTMP'                  00009920
               MOVE  'TIMESTAMP'       TO  CTYPE                        00009930
               GO  TO 1100-1000-EXIT                                    00009940
           END-IF.                                                      00009950
                                                                        00009960
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'LONGVAR'                   00009970
               MOVE  'LONG VARCHAR'    TO  CTYPE                        00009980
               GO  TO 1100-1000-EXIT                                    00009990
           END-IF.                                                      00010000
                                                                        00010010
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'LONGVARG'                  00010020
               MOVE  'LONG VARGRAPHIC' TO  CTYPE                        00010030
               GO  TO 1100-1000-EXIT                                    00010040
           END-IF.                                                      00010050
                                                                        00010060
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'VARG'                      00010070
               MOVE SPACES TO CTYPE                                     00010080
               STRING 'VARGRAPHIC('         DELIMITED BY SIZE           00010090
                      TB-LENGTH(IND-TAB) DELIMITED BY SIZE              00010100
                      ')' DELIMITED BY SIZE                             00010110
                 INTO CTYPE                                             00010120
               GO  TO 1100-1000-EXIT                                    00010130
           END-IF.                                                      00010140
                                                                        00010150
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'FLOAT'                     00010160
               MOVE SPACES TO CTYPE                                     00010170
               STRING 'FLOAT('         DELIMITED BY SIZE                00010180
                      TB-LENGTH(IND-TAB) DELIMITED BY SIZE              00010190
                      ')' DELIMITED BY SIZE                             00010200
                 INTO CTYPE                                             00010210
               GO  TO 1100-1000-EXIT                                    00010220
           END-IF.                                                      00010230
                                                                        00010240
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'GRAPHIC'                   00010250
               MOVE SPACES TO CTYPE                                     00010260
               STRING 'GRAPHIC('         DELIMITED BY SIZE              00010270
                      TB-LENGTH(IND-TAB) DELIMITED BY SIZE              00010280
                      ')' DELIMITED BY SIZE                             00010290
                 INTO CTYPE                                             00010300
               GO  TO 1100-1000-EXIT                                    00010310
           END-IF.                                                      00010320
                                                                        00010330
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'DECIMAL'                   00010340
               MOVE SPACES TO CTYPE                                     00010350
               STRING 'DECIMAL('         DELIMITED BY SIZE              00010360
                      TB-LENGTH(IND-TAB)(4:2) DELIMITED BY SIZE         00010370
                      ',' DELIMITED BY SIZE                             00010380
                      TB-SCALE(IND-TAB)(3:2) DELIMITED BY SIZE          00010390
                      ')' DELIMITED BY SIZE                             00010400
                 INTO CTYPE                                             00010410
               GO  TO 1100-1000-EXIT                                    00010420
           END-IF.                                                      00010430
                                                                        00010440
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'VARCHAR'                   00010450
               MOVE SPACES TO CTYPE                                     00010460
               STRING 'VARCHAR('         DELIMITED BY SIZE              00010470
                      TB-LENGTH(IND-TAB) DELIMITED BY SIZE              00010480
                      ')' DELIMITED BY SIZE                             00010490
                 INTO CTYPE                                             00010500
               GO  TO 1100-1000-EXIT                                    00010510
           END-IF.                                                      00010520
                                                                        00010530
           IF  TB-COLTYPE (IND-TAB)  EQUAL  'CHAR'                      00010540
               MOVE SPACES TO CTYPE                                     00010550
               STRING 'CHAR(' DELIMITED BY SIZE                         00010560
                      TB-LENGTH(IND-TAB) DELIMITED BY SIZE              00010570
                      ')' DELIMITED BY SIZE                             00010580
                 INTO CTYPE                                             00010590
               GO  TO 1100-1000-EXIT                                    00010600
           END-IF.                                                      00010610
                                                                        00010620
           MOVE  TB-COLTYPE(IND-TAB)   TO  CTYPE.                       00010630
       1100-1000-EXIT. EXIT.                                            00010640
      *----------------------------------------------------------------*00010650
      *                                                                *00010660
      *----------------------------------------------------------------*00010670
       1200-0020-GRANT.                                                 00010680
           WRITE  REG-SCRIPT           FROM GRANT0-L.                   00010690
           MOVE SPACES TO TNAME-GRANT1.                                 00010700
           STRING SYSTABLES-CREATOR DELIMITED BY SPACE '.'              00010710
                  SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) DELIMITED BY SIZE00010720
             INTO TNAME-GRANT1.                                         00010730
           WRITE  REG-SCRIPT           FROM GRANT1-L.                   00010740
MUNIZ      PERFORM 4100-1200-CARREGA-GRANTEE.                           00010750
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00010760
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00010770
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00010780
       1200-0020-EXIT. EXIT.                                            00010790
      *----------------------------------------------------------------*00010800
      *                                                                *00010810
      *----------------------------------------------------------------*00010820
       1300-0200-ALIAS.                                                 00010830
           MOVE SPACES TO ALIAS-NAME.                                   00010840
           STRING SYSTABLES-CREATOR DELIMITED BY SPACE '.'              00010850
                  SYSTABLES-NAME-T(1:SYSTABLES-NAME-L) DELIMITED BY SIZE00010860
             INTO ALIAS-NAME.                                           00010870
                                                                        00010880
           MOVE SPACES TO TABLE-NAME.                                   00010890
           STRING SYSTABLES-TBCREATOR DELIMITED BY SPACE '.'            00010900
             SYSTABLES-TBNAME-T(1:SYSTABLES-TBNAME-L) DELIMITED BY SIZE 00010910
             INTO TABLE-NAME.                                           00010920
       1300-0200-EXIT. EXIT.                                            00010930
      *----------------------------------------------------------------*00010940
      *                                                                *00010950
      *----------------------------------------------------------------*00010960
       1400-0020-CREATE-ALIAS.                                          00010970
           WRITE  REG-SCRIPT           FROM ALIAS1-L.                   00010980
           WRITE  REG-SCRIPT           FROM ALIAS2-L.                   00010990
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00011000
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00011010
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00011020
       1400-0020-EXIT. EXIT.                                            00011030
      *----------------------------------------------------------------*00011040
      *                                                                *00011050
      *----------------------------------------------------------------*00011060
       1500-0020-COMMENT-TABLE.                                         00011070
           MOVE   TNAME OF TABLE-L     TO  TNAME OF COMMENT1-L.         00011080
           MOVE   SYSTABLES-REMARKS-T(1:SYSTABLES-REMARKS-L)            00011090
             TO   COMENTARIO OF COMMENT2-L.                             00011100
           WRITE  REG-SCRIPT           FROM COMMENT1-L.                 00011110
           WRITE  REG-SCRIPT           FROM COMMENT2-L.                 00011120
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00011130
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00011140
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00011150
       1500-0020-EXIT. EXIT.                                            00011160
      *----------------------------------------------------------------*00011170
      *                                                                *00011180
      *----------------------------------------------------------------*00011190
       1600-0020-COMMENT-COLUMN.                                        00011200
           MOVE   TNAME OF TABLE-L     TO  TNAME OF COMMENTCOL1-L.      00011210
           WRITE  REG-SCRIPT           FROM COMMENTCOL1-L.              00011220
           MOVE   '('                  TO  PAR-BR OF COMMENTCOL2-L.     00011230
           PERFORM  1700-1600-DEFINE-COMMENT  THRU 1700-1600-EXIT       00011240
           VARYING  IND-TAB  FROM  +1  BY  +1                           00011250
             UNTIL  IND-TAB > SYSCOLUMNS-COLNO.                         00011260
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00011270
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00011280
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00011290
       1600-0020-EXIT. EXIT.                                            00011300
      *----------------------------------------------------------------*00011310
      *                                                                *00011320
      *----------------------------------------------------------------*00011330
       1700-1600-DEFINE-COMMENT.                                        00011340
           MOVE   TB-CNAME  (IND-TAB)  TO  COLCOMMENT.                  00011350
           MOVE   TB-REMARKS(IND-TAB)  TO  COMENTARIO2.                 00011360
           IF  IND-TAB  EQUAL  SYSCOLUMNS-COLNO                         00011370
               MOVE   ')'              TO  VIRG-PAR-COMMENTCOL          00011380
           ELSE                                                         00011390
               MOVE   ','              TO  VIRG-PAR-COMMENTCOL          00011400
           END-IF.                                                      00011410
           WRITE  REG-SCRIPT           FROM COMMENTCOL2-L.              00011420
           MOVE   SPACES               TO  PAR-BR OF COMMENTCOL2-L.     00011430
       1700-1600-EXIT. EXIT.                                            00011440
      *----------------------------------------------------------------*00011450
      *                                                                *00011460
      *----------------------------------------------------------------*00011470
       1800-0020-CREATE-INDEX.                                          00011480
           MOVE   SYSTABLES-NAME       TO  SYSINDEXES-TBNAME.           00011490
           MOVE   SYSTABLES-CREATOR    TO  SYSINDEXES-TBCREATOR.        00011500
           EXEC SQL                                                     00011510
                DECLARE C_SYSINDEXES CURSOR FOR                         00011520
                SELECT NAME, CREATOR,                                   00011530
                       TBNAME, TBCREATOR, UNIQUERULE, BPOOL,            00011540
                       CLUSTERING, ERASERULE, INDEXTYPE, COLCOUNT       00011550
                  FROM SYSIBM.SYSINDEXES                                00011560
                 WHERE TBNAME    = :SYSINDEXES-TBNAME                   00011570
                   AND TBCREATOR = :SYSINDEXES-TBCREATOR                00011580
MUNIZ            ORDER BY CLUSTERING DESC, NAME ASC                     00011590
           END-EXEC.                                                    00011600
                                                                        00011610
           EXEC SQL OPEN C_SYSINDEXES END-EXEC.                         00011620
           IF  SQLCODE  EQUAL  +0                                       00011630
               NEXT  SENTENCE                                           00011640
           ELSE                                                         00011650
               DISPLAY '*** ERRO NO OPEN SYSIBM.SYSINDEXES'             00011660
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00011670
           END-IF.                                                      00011680
                                                                        00011690
           PERFORM  2000-9999-FETCH-SYSINDEXES THRU 2000-9999-EXIT.     00011700
           PERFORM  2100-1800-PROCESSA-SYSINDEXES THRU 2100-1800-EXIT   00011710
             UNTIL  FIM-SYSINDEXES.                                     00011720
                                                                        00011730
           EXEC SQL CLOSE C_SYSINDEXES END-EXEC.                        00011740
           IF  SQLCODE  EQUAL  +0                                       00011750
               NEXT  SENTENCE                                           00011760
           ELSE                                                         00011770
               DISPLAY '*** ERRO NO OPEN SYSIBM.SYSINDEXES'             00011780
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00011790
           END-IF.                                                      00011800
       1800-0020-EXIT. EXIT.                                            00011810
      *----------------------------------------------------------------*00011820
      *                                                                *00011830
      *----------------------------------------------------------------*00011840
       2000-9999-FETCH-SYSINDEXES.                                      00011850
           EXEC SQL                                                     00011860
                FETCH  C_SYSINDEXES                                     00011870
                INTO   :SYSINDEXES-NAME, :SYSINDEXES-CREATOR,           00011880
                       :SYSINDEXES-TBNAME, :SYSINDEXES-TBCREATOR,       00011890
                       :SYSINDEXES-UNIQUERULE,                          00011900
                       :SYSINDEXES-BPOOL, :SYSINDEXES-CLUSTERING,       00011910
                       :SYSINDEXES-ERASERULE, :SYSINDEXES-INDEXTYPE,    00011920
                       :SYSINDEXES-COLCOUNT                             00011930
           END-EXEC.                                                    00011940
           IF  SQLCODE  EQUAL  +0                                       00011950
               NEXT  SENTENCE                                           00011960
           ELSE                                                         00011970
             IF  SQLCODE  EQUAL  +100                                   00011980
                 MOVE  'SIM'           TO  N88-FIM-SYSINDEXES           00011990
             ELSE                                                       00012000
                 DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSINDEXES'         00012010
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00012020
             END-IF                                                     00012030
           END-IF.                                                      00012040
       2000-9999-EXIT. EXIT.                                            00012050
      *----------------------------------------------------------------*00012060
      *                                                                *00012070
      *----------------------------------------------------------------*00012080
       2100-1800-PROCESSA-SYSINDEXES.                                   00012090
      *--- MONTA O COMANDO CREATE INDEX                                 00012100
           MOVE   SPACES               TO  TNAME OF INDEX1-L.           00012110
           MOVE   SPACES               TO  REG-SCRIPT.                  00012120
           STRING SYSINDEXES-CREATOR DELIMITED BY SPACE '.'             00012130
                  SYSINDEXES-NAME-T(1:SYSINDEXES-NAME-L)                00012140
             DELIMITED BY SIZE                                          00012150
             INTO TNAME OF INDEX1-L.                                    00012160
           IF  SYSINDEXES-UNIQUERULE  EQUAL  'P' OR 'U'                 00012170
               IF  SYSINDEXES-UNIQUERULE  EQUAL  'P'                    00012180
                   MOVE   'S'                    TO  CH-PRIMARY         00012190
                   MOVE   SYSINDEXES-COLCOUNT    TO  COLCOUNT-PK        00012200
               END-IF                                                   00012210
               STRING 'CREATE UNIQUE '                                  00012220
                      INDEX1-L DELIMITED BY SIZE                        00012230
                 INTO REG-SCRIPT                                        00012240
           ELSE                                                         00012250
               STRING 'CREATE '                                         00012260
                      INDEX1-L DELIMITED BY SIZE                        00012270
                 INTO REG-SCRIPT                                        00012280
           END-IF.                                                      00012290
           WRITE  REG-SCRIPT.                                           00012300
           MOVE   TNAME OF TABLE-L     TO  TNAME OF INDEX2-L.           00012310
           WRITE  REG-SCRIPT           FROM INDEX2-L.                   00012320
                                                                        00012330
      *--- MONTA O NOME DAS COLUNAS QUE COMPOEM O INDICE                00012340
           MOVE   SYSINDEXES-CREATOR   TO  SYSKEYS-IXCREATOR.           00012350
           MOVE   SYSINDEXES-NAME      TO  SYSKEYS-IXNAME.              00012360
           EXEC SQL                                                     00012370
                DECLARE C_SYSKEYS CURSOR FOR                            00012380
                SELECT COLNAME, ORDERING, COLSEQ                        00012390
                  FROM SYSIBM.SYSKEYS                                   00012400
                 WHERE IXNAME    = :SYSKEYS-IXNAME                      00012410
                   AND IXCREATOR = :SYSKEYS-IXCREATOR                   00012420
                 ORDER BY COLSEQ                                        00012430
           END-EXEC.                                                    00012440
                                                                        00012450
           EXEC SQL OPEN C_SYSKEYS END-EXEC.                            00012460
           IF  SQLCODE  EQUAL  +0                                       00012470
               NEXT  SENTENCE                                           00012480
           ELSE                                                         00012490
               DISPLAY '*** ERRO NO OPEN SYSIBM.SYSKEYS'                00012500
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00012510
           END-IF.                                                      00012520
                                                                        00012530
      *---                                                              00012540
           PERFORM  2300-9999-FETCH-SYSKEYS THRU 2300-9999-EXIT.        00012550
           MOVE   'NAO'                TO  N88-FIM-SYSKEYS.             00012560
           MOVE   '('                  TO  PAR-BR OF INDEXCOL-L.        00012570
           PERFORM  2400-1800-PROCESSA-SYSKEYS THRU 2400-1800-EXIT      00012580
             UNTIL  FIM-SYSKEYS.                                        00012590
                                                                        00012600
           EXEC SQL CLOSE C_SYSKEYS END-EXEC.                           00012610
           IF  SQLCODE  EQUAL  +0                                       00012620
               NEXT  SENTENCE                                           00012630
           ELSE                                                         00012640
               DISPLAY '*** ERRO NO OPEN SYSIBM.SYSKEYS'                00012650
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00012660
           END-IF.                                                      00012670
                                                                        00012680
      *--- MONTA OS DEMAIS PARAMETROS DO INDICE                         00012690
           MOVE   SYSINDEXES-CREATOR   TO   SYSINDEXPART-IXCREATOR.     00012700
           MOVE   SYSINDEXES-NAME      TO   SYSINDEXPART-IXNAME.        00012710
           EXEC SQL                                                     00012720
                DECLARE C_SYSINDEXPART CURSOR FOR                       00012730
                SELECT PCTFREE, STORNAME, PQTY, SQTY, PARTITION         00012740
                  FROM SYSIBM.SYSINDEXPART                              00012750
                 WHERE IXNAME    = :SYSINDEXPART-IXNAME                 00012760
                   AND IXCREATOR = :SYSINDEXPART-IXCREATOR              00012770
                 ORDER BY PARTITION                                     00012780
           END-EXEC.                                                    00012790
                                                                        00012800
           EXEC SQL OPEN C_SYSINDEXPART END-EXEC.                       00012810
           IF  SQLCODE  EQUAL  +0                                       00012820
               NEXT  SENTENCE                                           00012830
           ELSE                                                         00012840
               DISPLAY '*** ERRO NO OPEN C_SYSINDEXPART'                00012850
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00012860
           END-IF.                                                      00012870
                                                                        00012880
           MOVE   SYSINDEXES-BPOOL     TO   BUFFERPOOL OF BPOOL-L.      00012890
           WRITE  REG-SCRIPT           FROM BPOOL-L.                    00012900
                                                                        00012910
           MOVE   'NAO'                TO   N88-FIM-SYSINDEXPART.       00012920
           PERFORM  2200-9999-FETCH-SYSINDEXPART THRU 2200-9999-EXIT.   00012930
           PERFORM  3700-2100-MONTA-INDEX-PART   THRU 3700-2100-EXIT.   00012940
                                                                        00012950
           EXEC SQL CLOSE C_SYSINDEXPART END-EXEC.                      00012960
           IF  SQLCODE  EQUAL  +0                                       00012970
               NEXT  SENTENCE                                           00012980
           ELSE                                                         00012990
               DISPLAY '*** ERRO NO CLOSE C_SYSINDEXPART'               00013000
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00013010
           END-IF.                                                      00013020
                                                                        00013030
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00013040
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00013050
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00013060
                                                                        00013070
      *--- LE O PROXIMO INDICE                                          00013080
           PERFORM  2000-9999-FETCH-SYSINDEXES THRU 2000-9999-EXIT.     00013090
       2100-1800-EXIT. EXIT.                                            00013100
      *----------------------------------------------------------------*00013110
      *                                                                *00013120
      *----------------------------------------------------------------*00013130
       2200-9999-FETCH-SYSINDEXPART.                                    00013140
           EXEC SQL                                                     00013150
                FETCH  C_SYSINDEXPART                                   00013160
                  INTO :SYSINDEXPART-PCTFREE, :SYSINDEXPART-STORNAME,   00013170
                       :SYSINDEXPART-PQTY,    :SYSINDEXPART-SQTY,       00013180
                       :SYSINDEXPART-PARTITION                          00013190
           END-EXEC.                                                    00013200
           IF  SQLCODE  EQUAL  +0                                       00013210
               NEXT  SENTENCE                                           00013220
           ELSE                                                         00013230
             IF  SQLCODE  EQUAL  +100                                   00013240
                 MOVE  'SIM'           TO  N88-FIM-SYSINDEXPART         00013250
             ELSE                                                       00013260
                 DISPLAY '*** ERRO NO FETCH C_SYSINDEXPART'             00013270
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00013280
             END-IF                                                     00013290
           END-IF.                                                      00013300
       2200-9999-EXIT. EXIT.                                            00013310
      *----------------------------------------------------------------*00013320
      *                                                                *00013330
      *----------------------------------------------------------------*00013340
       2300-9999-FETCH-SYSKEYS.                                         00013350
           EXEC SQL                                                     00013360
                FETCH  C_SYSKEYS                                        00013370
                INTO   :SYSKEYS-COLNAME, :SYSKEYS-ORDERING,             00013380
                       :SYSKEYS-COLSEQ                                  00013390
           END-EXEC.                                                    00013400
           IF  SQLCODE  EQUAL  +0                                       00013410
               NEXT  SENTENCE                                           00013420
           ELSE                                                         00013430
             IF  SQLCODE  EQUAL  +100                                   00013440
                 MOVE  'SIM'           TO  N88-FIM-SYSKEYS              00013450
             ELSE                                                       00013460
                 DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSKEYS'            00013470
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00013480
             END-IF                                                     00013490
           END-IF.                                                      00013500
       2300-9999-EXIT. EXIT.                                            00013510
      *----------------------------------------------------------------*00013520
      *                                                                *00013530
      *----------------------------------------------------------------*00013540
       2400-1800-PROCESSA-SYSKEYS.                                      00013550
           MOVE   SYSKEYS-COLNAME-T(1:SYSKEYS-COLNAME-L) TO  COLINDEX.  00013560
      *---ARMAZENA NOME DAS COLUNAS QUE COMPOEM A PRIMARY KEY           00013570
           ADD    +1                   TO  IND-PK.                      00013580
           IF  IND-PK  GREATER  +64                                     00013590
               DISPLAY '*** ESTOURO DE TABELA INTERNA - PRIMARY KEY'    00013600
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00013610
           END-IF.                                                      00013620
                                                                        00013630
           MOVE  COLINDEX              TO  TB-CNAME-PK(IND-PK).         00013640
      *---                                                              00013650
           IF  SYSKEYS-ORDERING = 'A'                                   00013660
               MOVE   'ASC'            TO  ORDEM OF INDEXCOL-L          00013670
           ELSE                                                         00013680
               MOVE   'DESC'           TO  ORDEM OF INDEXCOL-L          00013690
           END-IF.                                                      00013700
           PERFORM  2300-9999-FETCH-SYSKEYS THRU 2300-9999-EXIT.        00013710
           IF  FIM-SYSKEYS                                              00013720
               MOVE  ')'               TO  VIRG-PAR OF INDEXCOL-L       00013730
           ELSE                                                         00013740
               MOVE  ','               TO  VIRG-PAR OF INDEXCOL-L       00013750
           END-IF.                                                      00013760
           WRITE  REG-SCRIPT           FROM INDEXCOL-L.                 00013770
           MOVE   SPACES               TO  PAR-BR OF INDEXCOL-L.        00013780
       2400-1800-EXIT. EXIT.                                            00013790
      *----------------------------------------------------------------*00013800
      *                                                                *00013810
      *----------------------------------------------------------------*00013820
       2500-0020-CREATE-PRIMARY.                                        00013830
           MOVE   TNAME OF TABLE-L     TO  TNAME OF ADD-PRIMARY1-L.     00013840
           WRITE  REG-SCRIPT           FROM ADD-PRIMARY1-L.             00013850
           WRITE  REG-SCRIPT           FROM ADD-PRIMARY2-L.             00013860
           MOVE   '('                  TO  PAR-BR OF ADD-PRIMARY3-L.    00013870
           PERFORM  2600-2500-DEFINE-PK    THRU 2600-2500-EXIT          00013880
           VARYING  IND-PK   FROM  +1  BY  +1                           00013890
             UNTIL  IND-PK  > COLCOUNT-PK.                              00013900
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00013910
           WRITE  REG-SCRIPT           FROM COMMIT-L.                   00013920
           WRITE  REG-SCRIPT           FROM DELIMITADOR.                00013930
       2500-0020-EXIT. EXIT.                                            00013940
      *----------------------------------------------------------------*00013950
      *                                                                *00013960
      *----------------------------------------------------------------*00013970
       2600-2500-DEFINE-PK.                                             00013980
           MOVE   TB-CNAME-PK  (IND-PK)  TO  COLPK.                     00013990
           IF  IND-PK  EQUAL  COLCOUNT-PK                               00014000
               MOVE   ')'              TO  VIRG-PAR OF ADD-PRIMARY3-L   00014010
           ELSE                                                         00014020
               MOVE   ','              TO  VIRG-PAR OF ADD-PRIMARY3-L   00014030
           END-IF.                                                      00014040
           WRITE  REG-SCRIPT           FROM ADD-PRIMARY3-L.             00014050
           MOVE   SPACES               TO  PAR-BR OF ADD-PRIMARY3-L.    00014060
       2600-2500-EXIT. EXIT.                                            00014070
      *----------------------------------------------------------------*00014080
      *                                                                *00014090
      *----------------------------------------------------------------*00014100
       2700-0020-CREATE-FOREIGN.                                        00014110
           MOVE   SYSTABLES-CREATOR    TO  SYSRELS-CREATOR.             00014120
           MOVE   SYSTABLES-NAME       TO  SYSRELS-TBNAME.              00014130
           EXEC SQL                                                     00014140
                DECLARE C_SYSRELS CURSOR FOR                            00014150
                SELECT REFTBCREATOR, REFTBNAME, RELNAME, DELETERULE     00014160
                  FROM SYSIBM.SYSRELS                                   00014170
                 WHERE CREATOR = :SYSRELS-CREATOR                       00014180
                   AND TBNAME  = :SYSRELS-TBNAME                        00014190
                 ORDER BY RELNAME                                       00014200
           END-EXEC.                                                    00014210
                                                                        00014220
           EXEC SQL OPEN C_SYSRELS END-EXEC.                            00014230
           IF  SQLCODE  EQUAL  +0                                       00014240
               NEXT  SENTENCE                                           00014250
           ELSE                                                         00014260
               DISPLAY '*** ERRO NO OPEN SYSIBM.SYSRELS'                00014270
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00014280
           END-IF.                                                      00014290
                                                                        00014300
           PERFORM  2800-9999-FETCH-SYSRELS THRU 2800-9999-EXIT.        00014310
      *--  GERA CARTAO ./ ADD (IEBUPDTE)                                00014320
           IF  NOT  FIM-SYSRELS                                         00014330
               MOVE   SYSTABLES-DBNAME TO  DBNAME                       00014340
               WRITE  REG-FKEYS        FROM ADD-IEBUPDTE                00014350
               ADD    +1               TO  AC-FKEYS                     00014360
           END-IF.                                                      00014370
                                                                        00014380
           PERFORM  2900-2700-PROCESSA-SYSRELS THRU 2900-2700-EXIT      00014390
             UNTIL  FIM-SYSRELS.                                        00014400
                                                                        00014410
           IF  EXISTE-FK                                                00014420
               WRITE  REG-FKEYS        FROM COMMIT-L                    00014430
               WRITE  REG-FKEYS        FROM DELIMITADOR                 00014440
           END-IF.                                                      00014450
                                                                        00014460
           EXEC SQL CLOSE C_SYSRELS END-EXEC.                           00014470
           IF  SQLCODE  EQUAL  +0                                       00014480
               NEXT  SENTENCE                                           00014490
           ELSE                                                         00014500
               DISPLAY '*** ERRO NO CLOSE SYSIBM.SYSRELS'               00014510
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00014520
           END-IF.                                                      00014530
       2700-0020-EXIT. EXIT.                                            00014540
      *----------------------------------------------------------------*00014550
      *                                                                *00014560
      *----------------------------------------------------------------*00014570
       2800-9999-FETCH-SYSRELS.                                         00014580
           EXEC SQL                                                     00014590
                FETCH  C_SYSRELS                                        00014600
                INTO   :SYSRELS-REFTBCREATOR, :SYSRELS-REFTBNAME,       00014610
                       :SYSRELS-RELNAME, :SYSRELS-DELETERULE            00014620
           END-EXEC.                                                    00014630
           IF  SQLCODE  EQUAL  +0                                       00014640
               NEXT  SENTENCE                                           00014650
           ELSE                                                         00014660
             IF  SQLCODE  EQUAL  +100                                   00014670
                 MOVE  'SIM'           TO  N88-FIM-SYSRELS              00014680
             ELSE                                                       00014690
                 DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSRELS'            00014700
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00014710
             END-IF                                                     00014720
           END-IF.                                                      00014730
       2800-9999-EXIT. EXIT.                                            00014740
      *----------------------------------------------------------------*00014750
      *                                                                *00014760
      *----------------------------------------------------------------*00014770
       2900-2700-PROCESSA-SYSRELS.                                      00014780
           MOVE   TNAME OF TABLE-L     TO  TNAME OF ADD-FKEYS1-L.       00014790
           WRITE  REG-FKEYS            FROM ADD-FKEYS1-L.               00014800
      *---                                                              00014810
           MOVE   SYSRELS-RELNAME      TO  CONSTRAINT OF ADD-FKEYS2-L.  00014820
           WRITE  REG-FKEYS            FROM ADD-FKEYS2-L.               00014830
      *---                                                              00014840
           MOVE   SYSRELS-CREATOR      TO  SYSFOREIGNKEYS-CREATOR.      00014850
           MOVE   SYSRELS-TBNAME       TO  SYSFOREIGNKEYS-TBNAME.       00014860
           MOVE   SYSRELS-RELNAME      TO  SYSFOREIGNKEYS-RELNAME.      00014870
           EXEC SQL                                                     00014880
                DECLARE C_SYSFOREIGNKEYS CURSOR FOR                     00014890
                SELECT COLNAME, COLSEQ                                  00014900
                  FROM SYSIBM.SYSFOREIGNKEYS                            00014910
                 WHERE CREATOR = :SYSFOREIGNKEYS-CREATOR                00014920
                   AND TBNAME  = :SYSFOREIGNKEYS-TBNAME                 00014930
                   AND RELNAME = :SYSFOREIGNKEYS-RELNAME                00014940
                 ORDER BY COLSEQ                                        00014950
           END-EXEC.                                                    00014960
                                                                        00014970
           EXEC SQL OPEN C_SYSFOREIGNKEYS END-EXEC.                     00014980
           IF  SQLCODE  EQUAL  +0                                       00014990
               NEXT  SENTENCE                                           00015000
           ELSE                                                         00015010
               DISPLAY '*** ERRO NO OPEN SYSIBM.SYSFOREIGNKEYS'         00015020
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00015030
           END-IF.                                                      00015040
                                                                        00015050
           MOVE   'NAO'                TO   N88-FIM-SYSFOREIGNKEYS.     00015060
           PERFORM  3000-9999-FETCH-SYSFOREIGNKEYS THRU 3000-9999-EXIT. 00015070
           MOVE   '('                  TO  PAR-BR OF ADD-FKEYS3-L.      00015080
           PERFORM  3100-2900-PROCESSA-SYSFKEYS THRU 3100-2900-EXIT     00015090
             UNTIL  FIM-SYSFOREIGNKEYS.                                 00015100
                                                                        00015110
           EXEC SQL CLOSE C_SYSFOREIGNKEYS END-EXEC.                    00015120
           IF  SQLCODE  EQUAL  +0                                       00015130
               NEXT  SENTENCE                                           00015140
           ELSE                                                         00015150
               DISPLAY '*** ERRO NO CLOSE SYSIBM.SYSFOREIGNKEYS'        00015160
               PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00015170
           END-IF.                                                      00015180
      *---                                                              00015190
           MOVE   SPACES               TO  TNAME OF ADD-FKEYS4-L.       00015200
           STRING SYSRELS-REFTBCREATOR DELIMITED BY SPACE '.'           00015210
                  SYSRELS-REFTBNAME-T(1:SYSRELS-REFTBNAME-L)            00015220
             DELIMITED BY SIZE                                          00015230
             INTO TNAME OF ADD-FKEYS4-L.                                00015240
           WRITE  REG-FKEYS            FROM ADD-FKEYS4-L.               00015250
      *---                                                              00015260
           IF  SYSRELS-DELETERULE  EQUAL 'C'                            00015270
               MOVE   'CASCADE'        TO  DELETERULE OF ADD-FKEYS5-L   00015280
           ELSE                                                         00015290
               IF  SYSRELS-DELETERULE  EQUAL 'N'                        00015300
                   MOVE   'SET NULL'   TO  DELETERULE OF ADD-FKEYS5-L   00015310
               ELSE                                                     00015320
                   MOVE   'RESTRICT'   TO  DELETERULE OF ADD-FKEYS5-L   00015330
               END-IF                                                   00015340
           END-IF.                                                      00015350
           WRITE  REG-FKEYS            FROM ADD-FKEYS5-L.               00015360
      *---                                                              00015370
           WRITE  REG-FKEYS            FROM DELIMITADOR.                00015380
           MOVE  'SIM'                 TO  N88-EXISTE-FK.               00015390
           PERFORM  2800-9999-FETCH-SYSRELS THRU 2800-9999-EXIT.        00015400
       2900-2700-EXIT. EXIT.                                            00015410
      *----------------------------------------------------------------*00015420
      *                                                                *00015430
      *----------------------------------------------------------------*00015440
       3000-9999-FETCH-SYSFOREIGNKEYS.                                  00015450
           EXEC SQL                                                     00015460
                FETCH  C_SYSFOREIGNKEYS                                 00015470
                INTO   :SYSFOREIGNKEYS-COLNAME,                         00015480
                       :SYSFOREIGNKEYS-COLSEQ                           00015490
           END-EXEC.                                                    00015500
           IF  SQLCODE  EQUAL  +0                                       00015510
               NEXT  SENTENCE                                           00015520
           ELSE                                                         00015530
             IF  SQLCODE  EQUAL  +100                                   00015540
                 MOVE  'SIM'           TO  N88-FIM-SYSFOREIGNKEYS       00015550
             ELSE                                                       00015560
                 DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSFOREIGNKEYS'     00015570
                 PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00015580
             END-IF                                                     00015590
           END-IF.                                                      00015600
       3000-9999-EXIT. EXIT.                                            00015610
      *----------------------------------------------------------------*00015620
      *                                                                *00015630
      *----------------------------------------------------------------*00015640
       3100-2900-PROCESSA-SYSFKEYS.                                     00015650
           MOVE   SYSFOREIGNKEYS-COLNAME-T(1:SYSFOREIGNKEYS-COLNAME-L)  00015660
                                       TO  COLFK OF ADD-FKEYS3-L.       00015670
           PERFORM  3000-9999-FETCH-SYSFOREIGNKEYS THRU 3000-9999-EXIT. 00015680
           IF  FIM-SYSFOREIGNKEYS                                       00015690
               MOVE  ')'               TO  VIRG-PAR OF ADD-FKEYS3-L     00015700
           ELSE                                                         00015710
               MOVE  ','               TO  VIRG-PAR OF ADD-FKEYS3-L     00015720
           END-IF.                                                      00015730
           WRITE  REG-FKEYS            FROM ADD-FKEYS3-L.               00015740
           MOVE   SPACES               TO  PAR-BR OF ADD-FKEYS3-L.      00015750
       3100-2900-EXIT. EXIT.                                            00015760
      *----------------------------------------------------------------*00015770
      *                                                                *00015780
      *----------------------------------------------------------------*00015790
       3200-0500-MONTA-PARTICAO.                                        00015800
           IF  SYSTABLESPACE-PARTITIONS  EQUAL  +0                      00015810
      *--      TABELA SEGMENTADA                                        00015820
               MOVE   SYSTABLESPACE-SEGSIZE  TO SEGSIZE                 00015830
               WRITE  REG-SCRIPT           FROM SEGSIZE-L               00015840
               PERFORM 3300-3200-USING-BLOCK   THRU 3300-3200-EXIT      00015850
               PERFORM 3400-3200-FREE-BLOCK    THRU 3400-3200-EXIT      00015860
           ELSE                                                         00015870
      *--      TABELA PARTICIONADA                                      00015880
               PERFORM  3500-3200-PARTICIONADA  THRU 3500-3200-EXIT     00015890
           END-IF.                                                      00015900
       3200-0500-EXIT. EXIT.                                            00015910
      *----------------------------------------------------------------*00015920
      *                                                                *00015930
      *----------------------------------------------------------------*00015940
       3300-3200-USING-BLOCK.                                           00015950
           MOVE   SYSTABLEPART-STORNAME TO  STOGROUP.                   00015960
           MOVE   STOGROUP-L            TO  CREATE-ARG.                 00015970
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00015980
                                                                        00015990
           COMPUTE PRIQTY = SYSTABLEPART-PQTY * 4.                      00016000
           MOVE   PRIQTY-L              TO  CREATE-ARG.                 00016010
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00016020
                                                                        00016030
           COMPUTE SECQTY = SYSTABLEPART-SQTY * 4.                      00016040
           MOVE   SECQTY-L              TO  CREATE-ARG.                 00016050
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00016060
                                                                        00016070
           IF  SYSTABLESPACE-ERASERULE EQUAL 'N'                        00016080
               MOVE     'NO'           TO  ERASE-RULE                   00016090
           ELSE                                                         00016100
               MOVE     'YES'          TO  ERASE-RULE                   00016110
           END-IF.                                                      00016120
           MOVE   ERASE-L               TO  CREATE-ARG.                 00016130
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00016140
                                                                        00016150
           IF  SYSTABLEPART-COMPRESS EQUAL 'Y'                          00016160
               MOVE     'YES'          TO  COMPRESS OF COMPRESS-L       00016170
           ELSE                                                         00016180
               MOVE     'NO'           TO  COMPRESS OF COMPRESS-L       00016190
           END-IF.                                                      00016200
           MOVE   COMPRESS-L            TO  CREATE-ARG.                 00016210
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00016220
                                                                        00016230
      *--- PREVINE QUE PQTY E SQTY FIQUEM ZERADOS SE A TABELA           00016240
      *--- FOR NAO SEGMENTADA                                           00016250
      ***  IF  SYSTABLESPACE-SEGSIZE  EQUAL  +0                         00016260
      ***      MOVE   +1               TO  SYSTABLESPACE-SEGSIZE        00016270
      ***  END-IF.                                                      00016280
       3300-3200-EXIT. EXIT.                                            00016290
      *----------------------------------------------------------------*00016300
      *                                                                *00016310
      *----------------------------------------------------------------*00016320
       3400-3200-FREE-BLOCK.                                            00016330
           MOVE   SYSTABLEPART-PCTFREE TO  PCTFREE.                     00016340
           MOVE   PCTFREE-L             TO  CREATE-ARG.                 00016350
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00016360
       3400-3200-EXIT. EXIT.                                            00016370
      *----------------------------------------------------------------*00016380
      *                                                                *00016390
      *----------------------------------------------------------------*00016400
       3500-3200-PARTICIONADA.                                          00016410
           MOVE  'NUMPARTS'                TO   NUMPARTS-STRING.        00016420
           MOVE  SYSTABLESPACE-PARTITIONS  TO   NUMPARTS.               00016430
           MOVE  '('                   TO   PAR-BR OF PARTITION-L.      00016440
           PERFORM  3600-3500-MONTA-PARTICOES                           00016450
              THRU  3600-3500-EXIT                                      00016460
             UNTIL  FIM-SYSTABLEPART.                                   00016470
       3500-3200-EXIT. EXIT.                                            00016480
      *----------------------------------------------------------------*00016490
      *                                                                *00016500
      *----------------------------------------------------------------*00016510
       3600-3500-MONTA-PARTICOES.                                       00016520
      *--- VERIFICA LIMITE MAXIMO DE PARTICOES                          00016530
           IF  SYSTABLEPART-PARTITION  GREATER  +64                     00016540
               DISPLAY 'DB2CRDDL - TABELA COM MAIS DE 64 PARTICOES. PROG00016550
      -                'RAMA CANCELADO. ' TNAME OF TABLE-L              00016560
               PERFORM 9999-9999-ERRO-DB2 THRU 9999-9999-EXIT           00016570
           END-IF.                                                      00016580
                                                                        00016590
      *--- VERIFICA TAMANHO MAXIMO DA STRING LIMITKEY                   00016600
           IF  SYSTABLEPART-LIMITKEY-L  GREATER  +43                    00016610
               MOVE   'SIM'        TO  N88-WARNING                      00016620
               DISPLAY 'DB2CRDDL - LIMITKEY MAIOR QUE 43 CARACTERES. TAB00016630
      -                'ELA ' TNAME OF TABLE-L                          00016640
           END-IF.                                                      00016650
                                                                        00016660
      *--- SALVA LIMITKEY PARA MONTAR OS INDICES PARTICIONADOS          00016670
           MOVE   SYSTABLEPART-LIMITKEY-T(1:SYSTABLEPART-LIMITKEY-L)    00016680
             TO   TB-LIMITKEY(SYSTABLEPART-PARTITION).                  00016690
           MOVE   SYSTABLEPART-LIMITKEY-L                               00016700
             TO   TB-LIMITKEY-LEN(SYSTABLEPART-PARTITION).              00016710
                                                                        00016720
           MOVE   'PART'                 TO PART-STRING OF NUMPARTS-L.  00016730
           MOVE   SYSTABLEPART-PARTITION    TO   NUMPART-ID.            00016740
           MOVE   SYSTABLEPART-STORNAME     TO   STOGROUP OF STOGROUP-L.00016750
           MOVE   STOGROUP-L                TO   NUMPART-DEF.           00016760
           MOVE   SPACES                    TO   BR-PAR OF PARTITION-L. 00016770
           WRITE  REG-SCRIPT                FROM NUMPARTS-L.            00016780
           MOVE   SPACES                    TO   NUMPARTS-STRING.       00016790
           MOVE   SPACES                    TO   PAR-BR OF PARTITION-L. 00016800
           MOVE   ZEROS                     TO   NUMPARTS.              00016810
           MOVE   ZEROS                     TO   NUMPART-ID.            00016820
                                                                        00016830
           MOVE   SPACES                 TO PART-STRING OF NUMPARTS-L.  00016840
           COMPUTE PRIQTY = SYSTABLEPART-PQTY * 4.                      00016850
           MOVE   PRIQTY-L             TO   NUMPART-DEF.                00016860
           WRITE  REG-SCRIPT           FROM NUMPARTS-L.                 00016870
                                                                        00016880
           COMPUTE SECQTY = SYSTABLEPART-SQTY * 4.                      00016890
           MOVE   SECQTY-L             TO   NUMPART-DEF.                00016900
           WRITE  REG-SCRIPT           FROM NUMPARTS-L.                 00016910
                                                                        00016920
           IF  SYSTABLESPACE-ERASERULE EQUAL 'N'                        00016930
               MOVE     'NO'           TO  ERASE-RULE                   00016940
           ELSE                                                         00016950
               MOVE     'YES'          TO  ERASE-RULE                   00016960
           END-IF.                                                      00016970
           MOVE   ERASE-L              TO   NUMPART-DEF.                00016980
           WRITE  REG-SCRIPT           FROM NUMPARTS-L.                 00016990
                                                                        00017000
           MOVE   SYSTABLEPART-PCTFREE TO   PCTFREE OF PCTFREE-L.       00017010
           MOVE   PCTFREE-L            TO   NUMPART-DEF.                00017020
           WRITE  REG-SCRIPT           FROM NUMPARTS-L.                 00017030
                                                                        00017040
           IF  SYSTABLEPART-COMPRESS EQUAL 'Y'                          00017050
               MOVE     'YES'          TO  COMPRESS OF COMPRESS-L       00017060
           ELSE                                                         00017070
               MOVE     'NO'           TO  COMPRESS OF COMPRESS-L       00017080
           END-IF.                                                      00017090
           MOVE   COMPRESS-L           TO   NUMPART-DEF.                00017100
           IF  SYSTABLESPACE-PARTITIONS EQUAL  SYSTABLEPART-PARTITION   00017110
               MOVE  ')'               TO   BR-PAR OF PARTITION-L       00017120
           ELSE                                                         00017130
               MOVE  ','               TO   BR-PAR OF PARTITION-L       00017140
           END-IF.                                                      00017150
           WRITE  REG-SCRIPT           FROM NUMPARTS-L.                 00017160
           PERFORM 0510-9999-FETCH-SYSTABLEPART THRU 0510-9999-EXIT.    00017170
       3600-3500-EXIT. EXIT.                                            00017180
      *----------------------------------------------------------------*00017190
      *                                                                *00017200
      *----------------------------------------------------------------*00017210
       3700-2100-MONTA-INDEX-PART.                                      00017220
           IF  SYSINDEXPART-PARTITION  EQUAL  +0                        00017230
      *--      TABELA SEGMENTADA                                        00017240
               PERFORM 3800-3700-INDEX-SEGMENTADO THRU 3800-3700-EXIT   00017250
           ELSE                                                         00017260
      *--      TABELA PARTICIONADA                                      00017270
               PERFORM 3900-3700-INDEX-PARTICIONADO THRU 3900-3700-EXIT 00017280
           END-IF.                                                      00017290
                                                                        00017300
       3700-2100-EXIT. EXIT.                                            00017310
      *----------------------------------------------------------------*00017320
      *                                                                *00017330
      *----------------------------------------------------------------*00017340
       3800-3700-INDEX-SEGMENTADO.                                      00017350
           IF  SYSINDEXES-CLUSTERING EQUAL 'Y'                          00017360
               MOVE   'CLUSTER'        TO   CLUSTER-STRING              00017370
               MOVE   SPACES           TO   PARTITION-INDEX             00017380
               WRITE  REG-SCRIPT       FROM CLUSTER-L                   00017390
           END-IF.                                                      00017400
                                                                        00017410
           MOVE   SYSINDEXPART-STORNAME TO  STOGROUP OF STOGROUP-L.     00017420
           MOVE   STOGROUP-L           TO   CREATE-ARG.                 00017430
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00017440
                                                                        00017450
           COMPUTE PRIQTY = SYSINDEXPART-PQTY * 4.                      00017460
           MOVE   PRIQTY-L              TO  CREATE-ARG.                 00017470
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00017480
                                                                        00017490
           COMPUTE SECQTY = SYSINDEXPART-SQTY * 4.                      00017500
           MOVE   SECQTY-L              TO  CREATE-ARG.                 00017510
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00017520
                                                                        00017530
           MOVE   SYSINDEXPART-PCTFREE TO   PCTFREE OF PCTFREE-L.       00017540
           MOVE   PCTFREE-L            TO   CREATE-ARG.                 00017550
           WRITE  REG-SCRIPT           FROM CREATE-AUX-L.               00017560
       3800-3700-EXIT. EXIT.                                            00017570
      *----------------------------------------------------------------*00017580
      *                                                                *00017590
      *----------------------------------------------------------------*00017600
       3900-3700-INDEX-PARTICIONADO.                                    00017610
           MOVE  'CLUSTER'             TO   CLUSTER-STRING OF CLUSTER-L.00017620
           MOVE  '('                   TO   PAR-BR OF PART-IDX-L.       00017630
           PERFORM  4000-3900-MONTA-PARTICOES                           00017640
              THRU  4000-3900-EXIT                                      00017650
             UNTIL  FIM-SYSINDEXPART.                                   00017660
       3900-3700-EXIT. EXIT.                                            00017670
      *----------------------------------------------------------------*00017680
      *                                                                *00017690
      *----------------------------------------------------------------*00017700
       4000-3900-MONTA-PARTICOES.                                       00017710
           MOVE   'PART'               TO  PART-STRING OF PART-INDEX-L. 00017720
                                                                        00017730
           MOVE   SYSINDEXPART-PARTITION   TO   IDXPART-ID.             00017740
           MOVE   SPACES               TO  LIMITKEY OF PART-IDX-VALUE.  00017750
           MOVE   '('                      TO                           00017760
                  LIMITKEY OF PART-IDX-VALUE(1:1).                      00017770
           MOVE   TB-LIMITKEY-LEN(SYSINDEXPART-PARTITION) TO IND-LK.    00017780
           MOVE   TB-LIMITKEY(SYSINDEXPART-PARTITION) (1:IND-LK)    TO  00017790
                  LIMITKEY OF PART-IDX-VALUE(2:IND-LK).                 00017800
           MOVE   ')'                      TO                           00017810
                  LIMITKEY OF PART-IDX-VALUE(IND-LK + 2:1).             00017820
           MOVE   PART-IDX-VALUE       TO  IDXPART-DEF.                 00017830
           MOVE   SPACES               TO  BR-PAR OF PART-INDEX-L.      00017840
           MOVE   PART-INDEX-L         TO  PARTITION-INDEX.             00017850
           WRITE  REG-SCRIPT         FROM  CLUSTER-L.                   00017860
                                                                        00017870
           MOVE   SPACES               TO  CLUSTER-L.                   00017880
           MOVE   SPACES               TO  PAR-BR OF PART-IDX-L.        00017890
           MOVE   ZEROS                TO  IDXPART-ID.                  00017900
           MOVE   SPACES               TO  PART-STRING OF PART-INDEX-L. 00017910
                                                                        00017920
           MOVE   SYSINDEXPART-STORNAME TO STOGROUP OF STOGROUP-L.      00017930
           MOVE   STOGROUP-L           TO  IDXPART-DEF.                 00017940
           MOVE   PART-INDEX-L         TO  PARTITION-INDEX.             00017950
           WRITE  REG-SCRIPT         FROM  CLUSTER-L.                   00017960
                                                                        00017970
           COMPUTE PRIQTY = SYSINDEXPART-PQTY * 4.                      00017980
           MOVE   PRIQTY-L             TO  IDXPART-DEF.                 00017990
           MOVE   PART-INDEX-L         TO  PARTITION-INDEX.             00018000
           WRITE  REG-SCRIPT         FROM  CLUSTER-L.                   00018010
                                                                        00018020
           COMPUTE SECQTY = SYSINDEXPART-SQTY * 4.                      00018030
           MOVE   SECQTY-L             TO  IDXPART-DEF.                 00018040
           MOVE   PART-INDEX-L         TO  PARTITION-INDEX.             00018050
           WRITE  REG-SCRIPT         FROM  CLUSTER-L.                   00018060
                                                                        00018070
           IF  SYSINDEXES-ERASERULE  EQUAL 'Y'                          00018080
               MOVE   'YES'            TO   ERASE-RULE                  00018090
           ELSE                                                         00018100
               MOVE   'NO'             TO   ERASE-RULE                  00018110
           END-IF.                                                      00018120
           MOVE   ERASE-L              TO  IDXPART-DEF.                 00018130
           MOVE   PART-INDEX-L         TO  PARTITION-INDEX.             00018140
           WRITE  REG-SCRIPT         FROM  CLUSTER-L.                   00018150
                                                                        00018160
           MOVE   SYSINDEXPART-PCTFREE TO  PCTFREE OF PCTFREE-L.        00018170
           MOVE   PCTFREE-L            TO  IDXPART-DEF.                 00018180
                                                                        00018190
           IF  SYSTABLESPACE-PARTITIONS EQUAL  SYSINDEXPART-PARTITION   00018200
               MOVE  ')'               TO   BR-PAR OF PART-INDEX-L      00018210
           ELSE                                                         00018220
               MOVE  ','               TO   BR-PAR OF PART-INDEX-L      00018230
           END-IF.                                                      00018240
           MOVE   PART-INDEX-L         TO  PARTITION-INDEX.             00018250
           WRITE  REG-SCRIPT         FROM  CLUSTER-L.                   00018260
                                                                        00018270
           PERFORM  2200-9999-FETCH-SYSINDEXPART THRU  2200-9999-EXIT.  00018280
       4000-3900-EXIT. EXIT.                                            00018290
MUNIZ *----------------------------------------------------------------*00018300
MUNIZ *                                                                *00018310
MUNIZ *----------------------------------------------------------------*00018320
MUNIZ  4100-1200-CARREGA-GRANTEE.                                       00018330
MUNIZ                                                                   00018340
MUNIZ      INITIALIZE        GRANT2-L                                   00018350
MUNIZ                        SYSTABAUTH.                                00018360
MUNIZ      MOVE   'SYSADM'             TO  SYSTABAUTH-GRANTOR.          00018370
MUNIZ      MOVE   SYSTABLES-NAME       TO  SYSTABAUTH-STNAME            00018380
MUNIZ                                      SYSTABAUTH-TTNAME.           00018390
MUNIZ      MOVE   SYSTABLES-CREATOR    TO  SYSTABAUTH-SCREATOR          00018400
MUNIZ                                      SYSTABAUTH-TCREATOR.         00018410
MUNIZ      EXEC SQL                                                     00018420
MUNIZ           DECLARE C_SYSTABAUTH   CURSOR FOR                       00018430
MUNIZ           SELECT GRANTEE                                          00018440
MUNIZ             FROM SYSIBM.SYSTABAUTH                                00018450
MUNIZ            WHERE GRANTOR   = :SYSTABAUTH-GRANTOR                  00018460
MUNIZ              AND STNAME    = :SYSTABAUTH-STNAME                   00018470
MUNIZ              AND TTNAME    = :SYSTABAUTH-TTNAME                   00018480
MUNIZ              AND SCREATOR  = :SYSTABAUTH-SCREATOR                 00018490
MUNIZ              AND TCREATOR  = :SYSTABAUTH-TCREATOR                 00018500
MUNIZ            ORDER BY GRANTEE                                       00018510
MUNIZ      END-EXEC.                                                    00018520
MUNIZ                                                                   00018530
MUNIZ      EXEC SQL OPEN C_SYSTABAUTH END-EXEC.                         00018540
MUNIZ      IF  SQLCODE  EQUAL  +0                                       00018550
MUNIZ          NEXT  SENTENCE                                           00018560
MUNIZ      ELSE                                                         00018570
MUNIZ          DISPLAY '*** ERRO NO OPEN SYSIBM.SYSTABAUTH'             00018580
MUNIZ          PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00018590
MUNIZ      END-IF.                                                      00018600
MUNIZ                                                                   00018610
MUNIZ      MOVE     ZEROS         TO    WS-INDEX.                       00018620
MUNIZ      PERFORM  4200-1200-FETCH-SYSTABAUTH THRU 4200-1200-EXIT.     00018630
MUNIZ      IF       FIM-SYSTABAUTH                                      00018640
MUNIZ          MOVE 'PUBLIC'      TO    GRANTEE2-L(1)                   00018650
MUNIZ          WRITE REG-SCRIPT   FROM  GRANT2-L                        00018660
MUNIZ      END-IF.                                                      00018670
MUNIZ      PERFORM  4300-1200-PROCESSA-SYSTABAUTH THRU 4300-1200-EXIT   00018680
MUNIZ        UNTIL  FIM-SYSTABAUTH.                                     00018690
MUNIZ                                                                   00018700
MUNIZ      EXEC SQL CLOSE C_SYSTABAUTH END-EXEC.                        00018710
MUNIZ      IF  SQLCODE  EQUAL  +0                                       00018720
MUNIZ          NEXT  SENTENCE                                           00018730
MUNIZ      ELSE                                                         00018740
MUNIZ          DISPLAY '*** ERRO NO CLOSE SYSIBM.SYSTABAUTH'            00018750
MUNIZ          PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT         00018760
MUNIZ      END-IF.                                                      00018770
MUNIZ  4100-1200-EXIT. EXIT.                                            00018780
MUNIZ *----------------------------------------------------------------*00018790
MUNIZ *                                                                *00018800
MUNIZ *----------------------------------------------------------------*00018810
MUNIZ  4200-1200-FETCH-SYSTABAUTH.                                      00018820
MUNIZ      EXEC SQL                                                     00018830
MUNIZ           FETCH  C_SYSTABAUTH                                     00018840
MUNIZ           INTO   :SYSTABAUTH-GRANTEE                              00018850
MUNIZ      END-EXEC.                                                    00018860
MUNIZ      IF  SQLCODE  EQUAL  +0                                       00018870
MUNIZ          NEXT  SENTENCE                                           00018880
MUNIZ      ELSE                                                         00018890
MUNIZ        IF  SQLCODE  EQUAL  +100                                   00018900
MUNIZ            MOVE  'SIM'           TO  N88-FIM-SYSTABAUTH           00018910
MUNIZ        ELSE                                                       00018920
MUNIZ            DISPLAY '*** ERRO NO FETCH  SYSIBM.SYSTABAUTH'         00018930
MUNIZ            PERFORM  9999-9999-ERRO-DB2  THRU 9999-9999-EXIT       00018940
MUNIZ        END-IF                                                     00018950
MUNIZ      END-IF.                                                      00018960
MUNIZ  4200-1200-EXIT. EXIT.                                            00018970
MUNIZ *----------------------------------------------------------------*00018980
MUNIZ *                                                               * 00018990
MUNIZ *----------------------------------------------------------------*00019000
MUNIZ  4300-1200-PROCESSA-SYSTABAUTH.                                   00019010
MUNIZ *--- MONTA O COMANDO GRANT                                        00019020
MUNIZ      ADD    1                    TO  WS-INDEX                     00019030
MUNIZ      MOVE   SYSTABAUTH-GRANTEE   TO  GRANTEE2-L(WS-INDEX)         00019040
MUNIZ      MOVE   ','                  TO  VIRGULA(WS-INDEX)            00019050
MUNIZ                                                                   00019060
MUNIZ *--- LE O PROXIMO INDICE                                          00019070
MUNIZ      PERFORM  4200-1200-FETCH-SYSTABAUTH THRU 4200-1200-EXIT.     00019080
MUNIZ                                                                   00019090
MUNIZ      IF  WS-INDEX      EQUAL  8  OR  FIM-SYSTABAUTH               00019100
MUNIZ          IF FIM-SYSTABAUTH                                        00019110
MUNIZ             MOVE  ' '  TO  VIRGULA(WS-INDEX)                      00019120
MUNIZ          END-IF                                                   00019130
MUNIZ          WRITE REG-SCRIPT   FROM  GRANT2-L                        00019140
MUNIZ          MOVE  ZEROS        TO    WS-INDEX                        00019150
MUNIZ      END-IF.                                                      00019160
MUNIZ  4300-1200-EXIT. EXIT.                                            00019170
      *----------------------------------------------------------------*00019180
      *                                                                *00019190
      *----------------------------------------------------------------*00019200
       9999-9999-ERRO-DB2.                                              00019210
           MOVE   SQLCODE              TO  WS-SQLCODE.                  00019220
           DISPLAY '*** SQLCODE  ' WS-SQLCODE.                          00019230
           DISPLAY '    SQLERRMC ' SQLERRMC.                            00019240
           DISPLAY '    SQLSTATE ' SQLSTATE.                            00019250
           MOVE   +16                  TO  RETURN-CODE.                 00019260
           STOP RUN.                                                    00019270
       9999-9999-EXIT. EXIT.                                            00019280
                                                                       00019290
