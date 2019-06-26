-- INCLUDE TABLESPACE (DB2ADM.CTRLTSQY)                                 00000126
SELECT DISTINCT '      INCLUDE TABLESPACE ('||                          00001126
       STRIP(BQUALIFIER)||'.'||STRIP(BNAME)||')'                        00002026
   FROM SYSIBM.SYSPACKDEP                                               00020016
   WHERE DNAME IN ('GD500D3'                                            00020125
                  ,'GR001R1'                                            00020225
                  ,'SB145A1'                                            00020325
                  ,'SS052A'                                             00020425
                  ,'SS548A'                                             00020525
                  ,'OR529D2'                                            00020625
                  ,'TA095D1'                                            00020725
                  ,'EN500D1'                                            00020825
                  ,'SNA9005R'                                           00020925
                  ,'CTSB777L'                                           00021025
                  ,'WPC0015A'                                           00021125
                  ,'CTSB778L'                                           00021325
                  ,'AP110R1'                                            00021425
                  ,'SNA9005R'                                           00021525
                  ,'SS543A'                                             00021625
                  ,'MK005R1'                                            00021725
                  ,'SNA9010R'                                           00021825
                  ,'SS790A'                                             00021925
                  ,'SS909A'                                             00022025
                  ,'SS052A'                                             00022125
                  ,'GR001R1')                                           00022225
     AND BTYPE = 'R'                                                    00022318
 FOR FETCH ONLY WITH UR                                                 00026009
;                                                                       00030009
