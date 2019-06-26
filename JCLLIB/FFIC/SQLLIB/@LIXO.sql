SELECT *                                                                00000199
  FROM SYSIBM.SYSTABLEPART_HIST;                                        00000299
FIM;                                                                    00000399
                                                                        00000499
SELECT UPDATESTATSTIME,                                                 00001099
       NACTIVE,                                                         00001199
       NPAGES,                                                          00001299
       EXTENTS,                                                         00001399
       LOADRLASTTIME,                                                   00001499
       REORGLASTTIME,                                                   00001599
       REORGINSERTS,                                                    00001699
       REORGDELETES,                                                    00001799
       REORGUPDATES,                                                    00001899
       REORGUNCLUSTINS,                                                 00001999
       REORGDISORGLOB,                                                  00002099
       REORGMASSDELETE,                                                 00002199
       REORGNEARINDREF,                                                 00002299
       REORGFARINDREF,                                                  00002399
       STATSLASTTIME,                                                   00002499
       STATSINSERTS,                                                    00002599
       STATSDELETES,                                                    00002699
       STATSUPDATES,                                                    00002799
       STATSMASSDELETE,                                                 00002899
       COPYLASTTIME,                                                    00002999
       COPYUPDATEDPAGES,                                                00003099
       COPYCHANGES,                                                     00003199
       COPYUPDATETIME,                                                  00003299
       IBMREQD,                                                         00003399
       DBID,                                                            00003499
       PSID,                                                            00003599
       PARTITION,                                                       00003699
       INSTANCE,                                                        00003799
       SPACE,                                                           00003899
       TOTALROWS,                                                       00003999
       DATASIZE,                                                        00004099
       UNCOMPRESSEDDATASIZE,                                            00004199
       DBNAME,                                                          00004299
       NAME,                                                            00004399
       REORGCLUSTERSENS,                                                00004499
       REORGSCANACCESS,                                                 00004599
       REORGHASHACCESS,                                                 00004699
       HASHLASTUSED,                                                    00004799
       DRIVETYPE,                                                       00004899
       LPFACILITY,                                                      00004999
       STATS01                                                          00005099
  FROM SYSIBM.SYSTABLESPACESTATS                                        00005199
-- WHERE NAME = 'HSTVSAM'           ;                                   00005299
 WHERE DATE(UPDATESTATSTIME) = CURRENT DATE                             00005399
   AND SUBSTR(DBNAME,1,3) NOT IN ('DSN');                               00005499
FIM;                                                                    00005599
SELECT * FROM SYSIBM.SYSPACKLIST                                        00005699
 WHERE LOCATION NOT IN ('*', ' ') ;                                     00005799
FIM;                                                                    00005899
-----------------                                                       00006099
SELECT DBNAME, TSNAME, CREATOR, NAME                                    00010099
  FROM SYSIBM.SYSTABLES                                                 00011099
 WHERE TYPE = 'T'                                                       00020099
   AND STRIP(DBNAME)||'.'||STRIP(TSNAME) IN ('DQSTBA00.SELS0A00',       00021099
                                             'DQSTBA00.SPAS0A00',       00030099
                                             'DQSTBA00.SPBS0A00',       00040099
                                             'DQSTBA00.SPCS0A00',       00050099
                                             'DQSTBA00.SPDS0A00',       00060099
                                             'DQSTBA00.SPES0A00',       00070099
                                             'DQSTBA00.SPFS0A00',       00080099
                                             'DQSTBA00.SPGS0A00',       00090099
                                             'DQSTBA00.SPHS0A00',       00100099
                                             'DQSTBA00.SPIS0A00',       00110099
                                             'DQSTBA00.SPJS0A00',       00120099
                                             'DQSTBA00.SPKS0A00',       00130099
                                             'DQSTBA00.SPLS0A00',       00140099
                                             'DQSTBA00.SPMS0A00',       00150099
                                             'DQSTBA00.SPNS0A00',       00160099
                                             'DQSTBA00.SPOS0A00',       00170099
                                             'DQSTBA00.SPPS0A00',       00180099
                                             'DQSTBA00.SPQS0A00',       00190099
                                             'DQSTBA00.SPRS0A00',       00200099
                                             'DQSTBA00.SPSS0A00');      00210099
                                                                        00211099
SELECT DBNAME, TSNAME, CREATOR, NAME                                    00220099
  FROM SYSIBM.SYSTABLES                                                 00221099
 WHERE TYPE = 'T'                                                       00222099
   AND STRIP(DBNAME)||'.'||STRIP(TSNAME) IN ('DQSTBT00.SELS0T00',       00230099
                                             'DQSTBT00.SPAS0T00',       00240099
                                             'DQSTBT00.SPBS0T00',       00250099
                                             'DQSTBT00.SPCS0T00',       00260099
                                             'DQSTBT00.SPDS0T00',       00270099
                                             'DQSTBT00.SPES0T00',       00280099
                                             'DQSTBT00.SPFS0T00',       00290099
                                             'DQSTBT00.SPGS0T00',       00300099
                                             'DQSTBT00.SPHS0T00',       00310099
                                             'DQSTBT00.SPIS0T00',       00320099
                                             'DQSTBT00.SPJS0T00',       00330099
                                             'DQSTBT00.SPKS0T00',       00340099
                                             'DQSTBT00.SPLS0T00',       00350099
                                             'DQSTBT00.SPMS0T00',       00360099
                                             'DQSTBT00.SPNS0T00',       00370099
                                             'DQSTBT00.SPOS0T00',       00380099
                                             'DQSTBT00.SPPS0T00',       00390099
                                             'DQSTBT00.SPQS0T00',       00400099
                                             'DQSTBT00.SPRS0T00',       00410099
                                             'DQSTBT00.SPSS0T00');      00420099
