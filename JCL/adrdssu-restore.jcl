//STEP1   EXEC PGM=ADRDSSU
//SYSPRINT DD  SYSOUT=*
//EIN1     DD  DSN=MY.SPECIAL.COPY.D2001315,
//             DISP=SHR
//SYSIN    DD  *
 RESTORE INDDNAME(EINl)              -
 DATASET(                            -
         INCLUDE(                    -
                 MY.FILE.*.MASK1     -
                 MY.FILE.MASK2.*     -
                 MY.OTHER.FILES      -
         ))                          -
 SHR REPLACE
/*
//
