/* REXX */
/* READS A FILE (LISTCAT OUTPUT)                      */
/* WRITE A FILE (DATASET LIST WITH SPACE INFORMATION) */
/* TRACE A */
#TRKS_NEW_SMS = 0
#TRKS_NSMS = 0
#TRKS_SMS  = 0
#DS_TOT = 0
#DS_NSMS = 0
#DS_SMS = 0
#DS_MIG = 0
/*                                      */
"EXECIO * DISKR INPUT (FINIS STEM FILE1."
 DO X = 1 TO FILE1.0
 REC1 = FILE1.X
 IF  SUBSTR(REC1,2,7) = 'CLUSTER' | SUBSTR(REC1,2,7) = 'NONVSAM'
     THEN DO
     SMS = 'N';
     DB = ''
     DSN = TRANSLATE(SUBSTR(REC1,18,44), ' ', '.')
     DB = SUBWORD(DSN,3,1)
     DSN = SUBSTR(REC1,18,44)
     DB_ATU = DB
     IF DB_ATU ª= DB_ANT THEN SAY 'DATABASE =' DB_ATU
     DB_ANT = DB_ATU
     #DS_TOT = #DS_TOT + 1
     END
 IF  SUBSTR(REC1,7,7) = 'SMSDATA'
     THEN DO
          SMS = 'Y'
          SAY 'DATASET SMS=' || DSN
          END
 IF  SUBSTR(REC1,9,6) = 'VOLSER' & SUBSTR(REC1,27,6) = 'MIGRAT'
     THEN DO
          #DS_MIG = #DS_MIG + 1
          IF SMS = 'Y' THEN
             SAY 'DATASET MIGRATED, BUT ALREADY SMS=' || DSN
          ELSE
             SAY 'DATASET MIGRATED, BUT NON SMS =' || DSN
          END
 IF SUBSTR(REC1,96,6) = 'CISIZE' THEN
    CISZ = TRANSLATE(SUBSTR(REC1,115,5), '0', '-')
 IF SUBSTR(REC1,38,8) = 'HI-A-RBA' THEN
    DO
    IF CISZ = '32768' THEN
       ALLOC_TRKS = TRANSLATE(SUBSTR(REC1,50,12), '0', '-') % 48060
    ELSE
       ALLOC_TRKS = TRANSLATE(SUBSTR(REC1,50,12), '0', '-') % 49152
    IF ALLOC_TRKS < 15 THEN ALLOC_TRKS = 15
    END
 IF SUBSTR(REC1,38,8) = 'HI-U-RBA' THEN DO
    IF CISZ = '32768' THEN
       USED_TRKS = TRANSLATE(SUBSTR(REC1,50,12), '0', '-') % 48060
    ELSE
       USED_TRKS = TRANSLATE(SUBSTR(REC1,50,12), '0', '-') % 49152
    IF USED_TRKS < 15 THEN USED_TRKS = 15
    IF SMS = 'N' THEN DO
    SPACE_PRI = USED_TRKS + (USED_TRKS % 100 * 5)
    SPACE_SEC = SPACE_PRI % 100 * 5
    IF SPACE_SEC = 0 | SPACE_SEC < 15 THEN SPACE_SEC = 15
    LEN = LENGTH(SPACE_PRI)
    DO I=LEN TO 5
       IF I = 5 THEN LEAVE
       SPACE_PRI = '0' || SPACE_PRI
    END
    LEN = LENGTH(SPACE_SEC)
    DO I=LEN TO 4
       IF I = 4 THEN LEAVE
       SPACE_SEC = '0' || SPACE_SEC
    END
    #DS_NSMS  = #DS_NSMS  + 1
    #TRKS_NSMS = #TRKS_NSMS + ALLOC_TRKS
    #TRKS_NEW_SMS = #TRKS_NEW_SMS + SPACE_PRI
    RECOUT = DSN || CISZ || ' TRK(' || SPACE_PRI || ' ' || SPACE_SEC || ')'
    QUEUE RECOUT
    END
    ELSE DO
    IF SMS = 'Y' THEN DO
         #DS_SMS = #DS_SMS + 1
         #TRKS_SMS = #TRKS_SMS + ALLOC_TRKS
         END
    END
 END
 END
   "EXECIO "QUEUED()" DISKW OUTPUT (FINIS "
   #TOTAL_TRKS = #TRKS_SMS + #TRKS_NEW_SMS
   IF #TRKS_SMS ª= 0 THEN
      SMS_PERC = #TRKS_SMS / #TOTAL_TRKS * 100
  ELSE
      SMS_PERC = 0
   IF #TRKS_NEW_SMS ª= 0 THEN
       NSMS_PERC = #TRKS_NEW_SMS / #TOTAL_TRKS * 100
  ELSE
      NSMS_PERC = 0
   SAY '# OF TRKS ALREADY IN SMS      = ' #TRKS_SMS ,
        || ' ==> ' || SMS_PERC || '%'
   SAY '# OF TRKS NON SMS             = ' #TRKS_NSMS ,
        || ' ==> ' || NSMS_PERC || '%'
   SAY '# OF TRKS TO BE ALLOC IN SMS  = ' #TRKS_NEW_SMS
   #VOLS = #TRKS_NEW_SMS / 39924
   SAY '# OF VOLUMES 3390-3 (80%)     = ' #VOLS
   #DIF_TRKS = #TRKS_NSMS - #TRKS_NEW_SMS
   IF #DIF_TRKS > 0 THEN
      SAY '# OF TRKS REDUCED             = ' #DIF_TRKS
   ELSE DO
      #DIF_TRKS = #TRKS_NEW_SMS - #TRKS_NSMS
      SAY '# OF TRKS ADDED               = ' #DIF_TRKS
        END
   SAY '# OF DS IN LISTCAT            = ' #DS_TOT
   SAY '# OF DS MIGRATED (NO ACTION)  = ' #DS_MIG
   SAY '# OF DS ALREADY IN SMS        = ' #DS_SMS
   SAY '# OF DS TO BE CONVERTED       = ' #DS_NSMS
