      ******************************************************************
      * DCLGEN TABLE(DBA1ADM.HSTVSAM)                                  *
      *        LIBRARY(IBM1JCF.DB2.SQLLIB(ZZTESTEZ))                   *
      *        LANGUAGE(COBOL)                                         *
      *        STRUCTURE(NIVEL01)                                      *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE DBA1ADM.HSTVSAM TABLE
           ( DATA                           DATE NOT NULL,
             HORA                           TIME NOT NULL,
             DSNAME                         CHAR(44) NOT NULL,
             HI_A_RBA                       FLOAT NOT NULL,
             HI_U_RBA                       FLOAT NOT NULL,
             DBNAME                         CHAR(8) NOT NULL,
             SPACENAM                       CHAR(8) NOT NULL,
             EXTENTS                        INTEGER NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE DBA1ADM.HSTVSAM                    *
      ******************************************************************
       01  NIVEL01.
           10 DATA                 PIC X(10).
           10 HORA                 PIC X(8).
           10 DSNAME               PIC X(44).
           10 HI-A-RBA             USAGE COMP-2.
           10 HI-U-RBA             USAGE COMP-2.
           10 DBNAME               PIC X(8).
           10 SPACENAM             PIC X(8).
           10 EXTENTS              PIC S9(9) USAGE COMP.
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 8       *
      ******************************************************************
