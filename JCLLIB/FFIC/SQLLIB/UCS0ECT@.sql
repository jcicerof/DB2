      ******************************************************************
      * DCLGEN TABLE(DB2TEST.UCST_EC_TABLE)                            *
      *        LIBRARY(DB2D.FFIT.DCLLIB(UCS0ECT0))                     *
      *        ACTION(REPLACE)                                         *
      *        LANGUAGE(COBOL)                                         *
      *        STRUCTURE(UCST-EC-TABLE)                                *
      *        QUOTE                                                   *
      * ... IS THE DCLGEN COMMAND THAT MADE THE FOLLOWING STATEMENTS   *
      ******************************************************************
           EXEC SQL DECLARE UCST_EC_TABLE TABLE
           ( EC_CLM_NO                      CHAR(11) NOT NULL,
             EC_SFX_NO                      CHAR(3) NOT NULL,
             EC_PARTY_TYPE_CD               CHAR(2) NOT NULL,
             EC_PARTY_NAME                  VARCHAR(30) NOT NULL,
             EC_CONTACT                     VARCHAR(30) NOT NULL,
             EC_EMAIL_ADDRESS               VARCHAR(30) NOT NULL,
             EC_FAX_AREA_CD                 CHAR(3) NOT NULL,
             EC_FAX_PHONE_NO                CHAR(7) NOT NULL,
             EC_WORK_AREA_CD                CHAR(3) NOT NULL,
             EC_WORK_PHONE_NO               CHAR(7) NOT NULL,
             EC_HOME_AREA_CD                CHAR(3) NOT NULL,
             EC_HOME_PHONE_NO               CHAR(7) NOT NULL,
             EC_PROC_ID                     CHAR(7) NOT NULL,
             EC_PROC_FUNC                   CHAR(6) NOT NULL,
             EC_PROC_TIMESTAMP              TIMESTAMP NOT NULL,
             EC_ATTORNEY_FIRM               VARCHAR(25) NOT NULL,
             EC_ATTORNEY_ADDR               VARCHAR(30) NOT NULL,
             EC_ATTORNEY_CITY               VARCHAR(20) NOT NULL,
             EC_ATTORNEY_STATE              CHAR(2) NOT NULL,
             EC_ATTORNEY_ZIP                CHAR(9) NOT NULL,
             EC_ATTORNEY_EXT                CHAR(8) NOT NULL
           ) END-EXEC.
      ******************************************************************
      * COBOL DECLARATION FOR TABLE DB2TEST.UCST_EC_TABLE              *
      ******************************************************************
       01  UCST-EC-TABLE.
           10 EC-CLM-NO            PIC X(11).
           10 EC-SFX-NO            PIC X(3).
           10 EC-PARTY-TYPE-CD     PIC X(2).
           10 EC-PARTY-NAME.
              49 EC-PARTY-NAME-LEN
                 PIC S9(4) USAGE COMP.
              49 EC-PARTY-NAME-TEXT
                 PIC X(30).
           10 EC-CONTACT.
              49 EC-CONTACT-LEN    PIC S9(4) USAGE COMP.
              49 EC-CONTACT-TEXT   PIC X(30).
           10 EC-EMAIL-ADDRESS.
              49 EC-EMAIL-ADDRESS-LEN
                 PIC S9(4) USAGE COMP.
              49 EC-EMAIL-ADDRESS-TEXT
                 PIC X(30).
           10 EC-FAX-AREA-CD       PIC X(3).
           10 EC-FAX-PHONE-NO      PIC X(7).
           10 EC-WORK-AREA-CD      PIC X(3).
           10 EC-WORK-PHONE-NO     PIC X(7).
           10 EC-HOME-AREA-CD      PIC X(3).
           10 EC-HOME-PHONE-NO     PIC X(7).
           10 EC-PROC-ID           PIC X(7).
           10 EC-PROC-FUNC         PIC X(6).
           10 EC-PROC-TIMESTAMP    PIC X(26).
           10 EC-ATTORNEY-FIRM.
              49 EC-ATTORNEY-FIRM-LEN
                 PIC S9(4) USAGE COMP.
              49 EC-ATTORNEY-FIRM-TEXT
                 PIC X(25).
           10 EC-ATTORNEY-ADDR.
              49 EC-ATTORNEY-ADDR-LEN
                 PIC S9(4) USAGE COMP.
              49 EC-ATTORNEY-ADDR-TEXT
                 PIC X(30).
           10 EC-ATTORNEY-CITY.
              49 EC-ATTORNEY-CITY-LEN
                 PIC S9(4) USAGE COMP.
              49 EC-ATTORNEY-CITY-TEXT
                 PIC X(20).
           10 EC-ATTORNEY-STATE    PIC X(2).
           10 EC-ATTORNEY-ZIP      PIC X(9).
           10 EC-ATTORNEY-EXT      PIC X(8).
      ******************************************************************
      * THE NUMBER OF COLUMNS DESCRIBED BY THIS DECLARATION IS 21      *
      ******************************************************************
