//STEP1   EXEC PGM=ADRDSSU
//SYSPRINT DD  SYSOUT=*
//AUS1     DD  DSN=MY.SPECIAL.COPY.D2001315,
//             DISP=(,CATLG,DELETE),
//             UNIT=CASS,VOL={,,,20),
//             LABEL=RETPD=30
//SYSIN    DD *
 DUMP DATASET(               -
 INCLUDE(                    -
         MY.FILE.*.MASK1     -
         MY.FILE.MASK2.*     -
         MY.OTHER.FILES      -
         ))                  -
 OUTDDNAME(AUS1)             -
 ALLDATA(*)                  -
 ALLEXCP                     -
 OPTIMIZE(4)
/*
//
