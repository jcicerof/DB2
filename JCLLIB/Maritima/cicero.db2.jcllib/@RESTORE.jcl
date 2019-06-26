//DBBCICER JOB 'CICERO',MSGCLASS=T,CLASS=T,NOTIFY=&SYSUID               00001000
//*                                                                     00002000
//******************                                                    00040000
//ST10         EXEC PGM=ADRDSSU,PARM='TYPRUN=NORUN,TRACE=YES'           00061007
//SYSPRINT     DD   SYSOUT=*                                            00070000
//SYSIN        DD   *                                                   00200000
 RESTORE INDD(ENTRADA) -                                                00220001
 ODY((DB2G01,3390),(DB2G02,3390),(DB2G03,3390),(DB2G04,3390), -         00222001
     (DB2G05,3390),(DB2G06,3390),(DB2G07,3390),(DB2G08,3390), -         00223002
     (DB2G09,3390),(DB2G10,3390),(DB2G11,3390),(DB2G12,3390), -         00224002
     (DB2G13,3390),(DB2G14,3390),(DB2G15,3390),(DB2G16,3390), -         00225002
     (DB2G17,3390),(DB2G18,3390),(DB2G19,3390),(DB2G20,3390), -         00226002
     (DB2G21,3390),(DB2G22,3390),(DB2G23,3390),(DB2G24,3390), -         00227002
     (DB2G25,3390),(DB2G26,3390),(DB2G27,3390)) -                       00228002
 WAIT(15,10) TOL(ENQF) SHARE CAN -                                      00230002
  DATASET(INCLUDE( -                                                    00240003
          DB2PCAT.DSNDBC.DSNATPDB.**, -                                 00240103
          DB2PCAT.DSNDBC.DSNDB01.**,  -                                 00240203
          DB2PCAT.DSNDBC.DSNDDF.**,   -                                 00240303
          DB2PCAT.DSNDBC.DSNRGFDB.**, -                                 00240403
          DB2PCAT.DSNDBD.DSNRLST.**,  -                                 00240503
          DB2PCAT.DSNDBD.DSNRTSDB.**  -                                 00240604
          DB2PCAT.DSNDBC.DSNDB04.**,  -                                 00240704
          DB2PCAT.DSNDBC.DSNDB06.**,-                                   00240807
          DB2PCAT.DSNDBC.DBSS01.**, -                                   00240905
          DB2PCAT.DSNDBC.DBSS02.**, -                                   00241005
          DB2PCAT.DSNDBC.DBSS03.**, -                                   00241105
          DB2PCAT.DSNDBC.DBSS04.**, -                                   00241205
          DB2PCAT.DSNDBC.DBSS05.**,-                                    00241307
          DB2PCAT.DSNDBC.DBEELO.LOGR1K87.**, -                          00241406
          DB2PCAT.DSNDBC.DBEELO.LOGR1UMB.**, -                          00241506
          DB2PCAT.DSNDBC.DBEELO.LOGR1N15.**, -                          00241606
          DB2PCAT.DSNDBC.DBEELO.LOCALIDA.**, -                          00241706
          DB2PCAT.DSNDBC.DBEELO.LOCA1T9J.**, -                          00241806
          DB2PCAT.DSNDBC.DBEELO.LOCA1X#L.**, -                          00241906
          DB2PCAT.DSNDBC.DBEELO.LOGR1H85.**, -                          00242006
          DB2PCAT.DSNDBC.DBEELO.LOGR1IUP.**, -                          00242106
          DB2PCAT.DSNDBC.DBEELO.UFRIPK.**, -                            00242206
          DB2PCAT.DSNDBC.DBEEPE.TIPOESTA.**, -                          00242306
          DB2PCAT.DSNDBC.DBEEPR.PROP1TMS.**, -                          00242406
          DB2PCAT.DSNDBC.DBEEPR.PROP1C6Z.**, -                          00242506
          DB2PCAT.DSNDBC.DBEEPR.PROP1ZWQ.**, -                          00242606
          DB2PCAT.DSNDBC.DBEEPR.PROP1MU7.**, -                          00242706
          DB2PCAT.DSNDBC.DBEEPR.PROP1Y5B.**, -                          00242806
          DB2PCAT.DSNDBC.DBEEPR.PROP1QRN.**, -                          00242906
          DB2PCAT.DSNDBC.DBEEPR.PROP1IGQ.**, -                          00243006
          DB2PCAT.DSNDBC.DBEEPR.PROPOSTA.**, -                          00243106
          DB2PCAT.DSNDBC.DBEETA.CUST1WJ9.**, -                          00243206
          DB2PCAT.DSNDBC.DBMA02.CORR1XXY.**, -                          00243306
          DB2PCAT.DSNDBC.DBMA02.CORR13K$.**, -                          00243406
          DB2PCAT.DSNDBC.DBMA02.DATASRIX.**, -                          00243506
          DB2PCAT.DSNDBC.DBMA02.ENDE19LP.**, -                          00243606
          DB2PCAT.DSNDBC.DBMA02.INTERFCO.**, -                          00243706
          DB2PCAT.DSNDBC.DBMA02.PREMIOEM.**, -                          00243806
          DB2PCAT.DSNDBC.DBMA02.RESS1W85.**, -                          00243906
          DB2PCAT.DSNDBC.DBMA02.SEGU1X@F.**, -                          00244006
          DB2PCAT.DSNDBC.DBMA02.SEGU1140.**, -                          00244106
          DB2PCAT.DSNDBC.DBMA02.SEGU1OMK.**, -                          00244206
          DB2PCAT.DSNDBC.DBMA02.SEGU1WJ5.**, -                          00244306
          DB2PCAT.DSNDBC.DBMA02.SENHARIX.**, -                          00244406
          DB2PCAT.DSNDBC.DBMA02.SENH1O#S.**, -                          00244506
          DB2PCAT.DSNDBC.DBMA02.SENH1#VZ.**, -                          00244606
          DB2PCAT.DSNDBC.DBMA02.SENH16$$.**, -                          00244706
          DB2PCAT.DSNDBC.DBMA02.SSLOGCAN.**, -                          00244806
          DB2PCAT.DSNDBC.DBMA02.SSPARCON.**, -                          00244906
          DB2PCAT.DSNDBC.DBMA02.SSPARDIF.**, -                          00245006
          DB2PCAT.DSNDBC.DBMA02.SSTR1FZJ.**, -                          00245106
          DB2PCAT.DSNDBC.DBMA02.SUCU1UX3.**, -                          00245206
          DB2PCAT.DSNDBC.DBMA02.URAC1PA2.**, -                          00245306
          DB2PCAT.DSNDBC.DBMA02.URAC1$F2.**, -                          00245406
          DB2PCAT.DSNDBC.DBMA02.UFRIX1.**, -                            00245506
          DB2PCAT.DSNDBC.DBMA03.BAIRROSR.**, -                          00245606
          DB2PCAT.DSNDBC.DBMA03.CTLCNXSI.**, -                          00245706
          DB2PCAT.DSNDBC.DBMA03.CONTROLI.**, -                          00245806
          DB2PCAT.DSNDBC.DBMA03.CRCMONRS.**, -                          00245906
          DB2PCAT.DSNDBC.DBMA03.CXPO1ZMP.**, -                          00246006
          DB2PCAT.DSNDBC.DBMA03.LGRC10BK.**, -                          00246106
          DB2PCAT.DSNDBC.DBMA03.LOCA1BMC.**, -                          00246206
          DB2PCAT.DSNDBC.DBMA03.LOCA1A7O.**, -                          00246306
          DB2PCAT.DSNDBC.DBMA03.LOCA1AKQ.**, -                          00246406
          DB2PCAT.DSNDBC.DBMA03.LOCA1KPF.**, -                          00246506
          DB2PCAT.DSNDBC.DBMA03.LOGR1NGW.**, -                          00246606
          DB2PCAT.DSNDBC.DBMA03.LOGR1FP3.**, -                          00246706
          DB2PCAT.DSNDBC.DBMA03.LOGR1UVR.**, -                          00246806
          DB2PCAT.DSNDBC.DBMA03.LOGR1R7$.**, -                          00246906
          DB2PCAT.DSNDBC.DBMA03.LOGR1SN0.**, -                          00247006
          DB2PCAT.DSNDBC.DBMA03.LOGR1XI1.**, -                          00247106
          DB2PCAT.DSNDBC.DBMA03.LOGR1NVR.**, -                          00247206
          DB2PCAT.DSNDBC.DBMA03.LOGR1CC$.**, -                          00247306
          DB2PCAT.DSNDBC.DBMA03.PARA17E8.**, -                          00247406
          DB2PCAT.DSNDBC.DBMA03.SSMOVRSV.**, -                          00247506
          DB2PCAT.DSNDBC.DBMA03.TBSU1#6R.**, -                          00247606
          DB2PCAT.DSNDBC.DBMA03.TBFX14L2.**, -                          00247706
          DB2PCAT.DSNDBC.DBMA03.TBRE145J.**, -                          00247806
          DB2PCAT.DSNDBC.DBMA03.TBRE1JUK.**, -                          00247906
          DB2PCAT.DSNDBC.DBMA03.TBRE1NWI.**, -                          00248006
          DB2PCAT.DSNDBC.DBMA03.TBSU1@IF.**, -                          00248106
          DB2PCAT.DSNDBC.DBMA03.TBTA12DQ.**, -                          00248206
          DB2PCAT.DSNDBC.DBMT01.EMPR11OV.**, -                          00248306
          DB2PCAT.DSNDBC.DBNOVA.BANCOSRI.**, -                          00248406
          DB2PCAT.DSNDBC.DBNOVA.CADA1@1R.**, -                          00248506
          DB2PCAT.DSNDBC.DBNOVA.CADAPOLR.**, -                          00248606
          DB2PCAT.DSNDBC.DBNOVA.CADA103F.**, -                          00248706
          DB2PCAT.DSNDBC.DBNOVA.CADA1J#H.**, -                          00248806
          DB2PCAT.DSNDBC.DBNOVA.CADA1QPN.**, -                          00248906
          DB2PCAT.DSNDBC.DBNOVA.CADA13KA.**, -                          00249006
          DB2PCAT.DSNDBC.DBNOVA.CADA1PYP.**, -                          00249106
          DB2PCAT.DSNDBC.DBNOVA.CADC1AUZ.**, -                          00249206
          DB2PCAT.DSNDBC.DBNOVA.CADC1S#1.**, -                          00249306
          DB2PCAT.DSNDBC.DBNOVA.CADC14E2.**, -                          00249406
          DB2PCAT.DSNDBC.DBNOVA.CADP1IRG.**, -                          00249506
          DB2PCAT.DSNDBC.DBNOVA.CADP1Z8A.**, -                          00249606
          DB2PCAT.DSNDBC.DBNOVA.CADP17SF.**, -                          00249706
          DB2PCAT.DSNDBC.DBNOVA.CADP1Z@3.**, -                          00249806
          DB2PCAT.DSNDBC.DBNOVA.CORR1Q@7.**, -                          00249906
          DB2PCAT.DSNDBC.DBNOVA.CORR1VY$.**, -                          00250006
          DB2PCAT.DSNDBC.DBNOVA.CORR1YPS.**, -                          00250106
          DB2PCAT.DSNDBC.DBNOVA.CORR1E8T.**, -                          00250206
          DB2PCAT.DSNDBC.DBNOVA.CORR18WT.**, -                          00250306
          DB2PCAT.DSNDBC.DBNOVA.CORR1T9U.**, -                          00250406
          DB2PCAT.DSNDBC.DBNOVA.INSP19NV.**, -                          00250506
          DB2PCAT.DSNDBC.DBNOVA.MOVAPOLR.**, -                          00250606
          DB2PCAT.DSNDBC.DBNOVA.MOVA1YPW.**, -                          00250706
          DB2PCAT.DSNDBC.DBNOVA.MOVD12EV.**, -                          00250806
          DB2PCAT.DSNDBC.DBNOVA.MOVP1UK7.**, -                          00250906
          DB2PCAT.DSNDBC.DBNOVA.PROP1ZNZ.**, -                          00251006
          DB2PCAT.DSNDBC.DBNOVA.PROP1DH0.**, -                          00251106
          DB2PCAT.DSNDBC.DBNOVA.PROP1N40.**, -                          00251206
          DB2PCAT.DSNDBC.DBNOVA.PROP1$D0.**, -                          00251306
          DB2PCAT.DSNDBC.DBNOVA.PROP18X0.**, -                          00251406
          DB2PCAT.DSNDBC.DBNOVA.PROP1#6H.**, -                          00251506
          DB2PCAT.DSNDBC.DBNOVA.PROP1WPK.**, -                          00251606
          DB2PCAT.DSNDBC.DBNOVA.PROP1LQO.**, -                          00251706
          DB2PCAT.DSNDBC.DBNOVA.RAMOSRIX.**, -                          00251806
          DB2PCAT.DSNDBC.DBNOVA.TBCT1NWG.**, -                          00251906
          DB2PCAT.DSNDBC.DBNOVA.TBCT1W7N.**, -                          00252006
          DB2PCAT.DSNDBC.DBNOVA.TBCT1YL3.**, -                          00252106
          DB2PCAT.DSNDBC.DBNOVA.TBCT1MEQ.**, -                          00252206
          DB2PCAT.DSNDBC.DBNOVA.TBCT1E82.**, -                          00252306
          DB2PCAT.DSNDBC.DBNOVA.TBFE124T.**, -                          00252406
          DB2PCAT.DSNDBC.DBNOVA.TBINSSRI.**, -                          00252506
          DB2PCAT.DSNDBC.DBNOVA.TBMO1GW3.**, -                          00252606
          DB2PCAT.DSNDBC.DBRE01.MOVA1XLF.**, -                          00252706
          DB2PCAT.DSNDBC.DBRE01.MOVD1BVS.**, -                          00252806
          DB2PCAT.DSNDBC.DBRE01.MOVD14$S.**, -                          00252906
          DB2PCAT.DSNDBC.DBRE01.MOVD1YU2.**, -                          00253006
          DB2PCAT.DSNDBC.DBRE01.MOVT1K$0.**, -                          00253106
          DB2PCAT.DSNDBC.DBRE01.MOVT1WV1.**, -                          00253206
          DB2PCAT.DSNDBC.DBRE01.MOVT13U2.**, -                          00253306
          DB2PCAT.DSNDBC.DBRE01.MOVVIDAR.**, -                          00253406
          DB2PCAT.DSNDBC.DBRE02.TBCO19NH.**, -                          00253506
          DB2PCAT.DSNDBC.DBRE02.TBMO1RAK.**, -                          00253606
          DB2PCAT.DSNDBC.DBRE02.TBMO1PYV.**, -                          00253706
          DB2PCAT.DSNDBC.DBRE02.TBMO1WNW.**, -                          00253806
          DB2PCAT.DSNDBC.DBRE02.TBMV1M10.**, -                          00253906
          DB2PCAT.DSNDBC.DBRE02.TBMV1FAI.**, -                          00254006
          DB2PCAT.DSNDBC.DBRE02.TBSE1QE#.**, -                          00254106
          DB2PCAT.DSNDBC.DBRE02.TBSO1@YC.**, -                          00254206
          DB2PCAT.DSNDBC.DBRE02.TBSO1PE$.**, -                          00254306
          DB2PCAT.DSNDBC.DBRE02.TBSO11JO.**, -                          00254406
          DB2PCAT.DSNDBC.DBRE02.TBSO1IT5.**, -                          00254506
          DB2PCAT.DSNDBC.DBRE02.TBSO17R6.**, -                          00254606
          DB2PCAT.DSNDBC.DBRE02.TBSO1YCL.**, -                          00254706
          DB2PCAT.DSNDBC.DBRE02.TBSO17UR.**, -                          00254806
          DB2PCAT.DSNDBC.DBRE02.TBSO1B05.**, -                          00254906
          DB2PCAT.DSNDBC.DBRE02.TBSO1GER.**, -                          00255006
          DB2PCAT.DSNDBC.DBRE02.TBSO1AMK.**, -                          00255106
          DB2PCAT.DSNDBC.DBRE02.TBSO1O6J.**, -                          00255206
          DB2PCAT.DSNDBC.DBRE02.TBTX1LRK.**, -                          00255306
          DB2PCAT.DSNDBC.DBRE02.TBTX12PO.**, -                          00255406
          DB2PCAT.DSNDBC.DBRE03.MOVC1D76.**, -                          00255506
          DB2PCAT.DSNDBC.DBRE03.MOVC1V9E.**, -                          00255606
          DB2PCAT.DSNDBC.DBRE03.PRODORCR.**, -                          00255706
          DB2PCAT.DSNDBC.DBRE03.RECE1N0D.**, -                          00255806
          DB2PCAT.DSNDBC.DBRE03.RECE1#VD.**, -                          00255906
          DB2PCAT.DSNDBC.DBRE03.RECE1BQE.**, -                          00256006
          DB2PCAT.DSNDBC.DBRE03.RECEBMTO.**, -                          00256106
          DB2PCAT.DSNDBC.DBRE04.CADA1KBT.**, -                          00256206
          DB2PCAT.DSNDBC.DBRE04.CADA1T7W.**, -                          00256306
          DB2PCAT.DSNDBC.DBRE04.CADA1NKH.**, -                          00256406
          DB2PCAT.DSNDBC.DBRE04.CADVIDAR.**, -                          00256506
          DB2PCAT.DSNDBC.DBRE04.CADV1JJN.**, -                          00256606
          DB2PCAT.DSNDBC.DBVD01.AGEN1@XS.**, -                          00256706
          DB2PCAT.DSNDBC.DBVD01.AGEN1MFU.**, -                          00256806
          DB2PCAT.DSNDBC.DBVD01.AGEN1M3V.**)) -                         00256906
  RENUNC(DB2GCAT)  -                                                    00257007
  RECATALOG(*)                                                          00258002
//ENTRADA      DD DISP=OLD,P.GES.SSDB2P01.G0279V00                      00260002
//             DD DISP=OLD,P.GES.SSDB2P02.G0247V00                      00270002
//             DD DISP=OLD,P.GES.SSDB2P03.G0279V00                      00280002
//             DD DISP=OLD,P.GES.SSDB2P04.G0278V00                      00290002
//             DD DISP=OLD,P.GES.SSDB2P05.G0456V00                      00300002
//             DD DISP=OLD,P.GES.SSDB2P06.G0246V00                      00310002
//             DD DISP=OLD,P.GES.SSDB2P07.G0275V00                      00320002
//             DD DISP=OLD,P.GES.SSDB2P08.G0275V00                      00330002
//             DD DISP=OLD,P.GES.SSDB2P09.G0274V00                      00340002
//             DD DISP=OLD,P.GES.SSDB2P10.G0274V00                      00350002
//             DD DISP=OLD,P.GES.SSDB2P11.G0275V00                      00360002
//             DD DISP=OLD,P.GES.SSDB2P12.G0275V00                      00370002
//             DD DISP=OLD,P.GES.SSDB2P13.G0460V00                      00380002
//             DD DISP=OLD,P.GES.SSDB2P14.G0456V00                      00390002
//             DD DISP=OLD,P.GES.SSDB2P15.G0456V00                      00400002
//             DD DISP=OLD,P.GES.SSDB2P16.G0275V00                      00410002
//             DD DISP=OLD,P.GES.SSDB2P17.G0274V00                      00420002
//             DD DISP=OLD,P.GES.SSDB2P18.G0274V00                      00430002
//             DD DISP=OLD,P.GES.SSDB2P19.G0275V00                      00440002
//             DD DISP=OLD,P.GES.SSDB2P20.G0305V00                      00450002
//             DD DISP=OLD,P.GES.SSDB2P21.G0305V00                      00460002
//             DD DISP=OLD,P.GES.SSDB2P22.G0306V00                      00470002
//             DD DISP=OLD,P.GES.SSDB2P23.G0289V00                      00480002
//             DD DISP=OLD,P.GES.SSDB2P24.G0289V00                      00490002
//             DD DISP=OLD,P.GES.SSDB2P25.G0288V00                      00500002
//             DD DISP=OLD,P.GES.SSDB2P26.G0268V00                      00510002
//             DD DISP=OLD,P.GES.SSDB2P27.G0261V00                      00520002
//             DD DISP=OLD,P.GES.SSDB2P28.G0215V00                      00530002
//             DD DISP=OLD,P.GES.SSDB2P29.G0196V00                      00540002
//             DD DISP=OLD,P.GES.SSDB2P30.G0187V00                      00550002
//             DD DISP=OLD,P.GES.SSDB2P31.G0183V00                      00560002
//             DD DISP=OLD,P.GES.SSDB2P32.G0180V00                      00570002
//             DD DISP=OLD,P.GES.SSDB2P33.G0169V00                      00580002
//             DD DISP=OLD,P.GES.SSDB2P34.G0169V00                      00590002
//             DD DISP=OLD,P.GES.SSDB2P35.G0161V00                      00600002
//             DD DISP=OLD,P.GES.SSDB2P36.G0155V00                      00610002
//             DD DISP=OLD,P.GES.SSDB2P37.G0149V00                      00620002
//             DD DISP=OLD,P.GES.SSDB2P38.G0146V00                      00630002
//             DD DISP=OLD,P.GES.SSDB2P39.G0146V00                      00640002
//             DD DISP=OLD,P.GES.SSDB2P40.G0146V00                      00650002
//             DD DISP=OLD,P.GES.SSDB2P41.G0140V00                      00660002
//             DD DISP=OLD,P.GES.SSDB2P42.G0140V00                      00670002
//             DD DISP=OLD,P.GES.SSDB2P43.G0140V00                      00680002
//             DD DISP=OLD,P.GES.SSDB2P44.G0128V00                      00690002
//             DD DISP=OLD,P.GES.SSDB2P45.G0114V00                      00700002
//             DD DISP=OLD,P.GES.SSDB2P46.G0111V00                      00710002
//             DD DISP=OLD,P.GES.SSDB2P47.G0104V00                      00720002
//             DD DISP=OLD,P.GES.SSDB2P48.G0104V00                      00730002
//             DD DISP=OLD,P.GES.SSDB2P49.G0102V00                      00740002
//             DD DISP=OLD,P.GES.SSDB2P50.G0280V00                      00750002
//             DD DISP=OLD,P.GES.SSDB2P51.G0278V00                      00760002
//             DD DISP=OLD,P.GES.SSDB2P52.G0100V00                      00770002
//             DD DISP=OLD,P.GES.SSDB2P53.G0095V00                      00780002
//             DD DISP=OLD,P.GES.SSDB2P54.G0095V00                      00790002
//             DD DISP=OLD,P.GES.SSDB2P55.G0095V00                      00800002
//             DD DISP=OLD,P.GES.SSDB2P56.G0095V00                      00810002
//             DD DISP=OLD,P.GES.SSDB2P57.G0090V00                      00820002
//             DD DISP=OLD,P.GES.SSDB2P58.G0087V00                      00830002
//             DD DISP=OLD,P.GES.SSDB2P59.G0085V00                      00840002
//             DD DISP=OLD,P.GES.SSDB2P60.G0083V00                      00850002
//             DD DISP=OLD,P.GES.SSDB2P61.G0083V00                      00860002
//             DD DISP=OLD,P.GES.SSDB2P62.G0083V00                      00870002
//             DD DISP=OLD,P.GES.SSDB2P63.G0082V00                      00880002
//             DD DISP=OLD,P.GES.SSDB2P64.G0079V00                      00890002
//             DD DISP=OLD,P.GES.SSDB2P65.G0079V00                      00900002
//             DD DISP=OLD,P.GES.SSDB2P66.G0079V00                      00910002
//             DD DISP=OLD,P.GES.SSDB2P67.G0068V00                      00920002
//             DD DISP=OLD,P.GES.SSDB2P68.G0064V00                      00930002
//             DD DISP=OLD,P.GES.SSDB2P69.G0064V00                      00940002
//             DD DISP=OLD,P.GES.SSDB2P70.G0064V00                      00950002
//             DD DISP=OLD,P.GES.SSDB2P71.G0057V00                      00960002
//             DD DISP=OLD,P.GES.SSDB2P72.G0053V00                      00970002
//             DD DISP=OLD,P.GES.SSDB2P73.G0053V00                      00980002
//             DD DISP=OLD,P.GES.SSDB2P74.G0050V00                      00990002
//             DD DISP=OLD,P.GES.SSDB2P75.G0049V00                      01000002
//             DD DISP=OLD,P.GES.SSDB2P76.G0045V00                      01010002
//             DD DISP=OLD,P.GES.SSDB2P77.G0045V00                      01020002
//             DD DISP=OLD,P.GES.SSDB2P78.G0045V00                      01030002
//             DD DISP=OLD,P.GES.SSDB2P79.G0045V00                      01040002
//             DD DISP=OLD,P.GES.SSDB2P80.G0045V00                      01050002
//             DD DISP=OLD,P.GES.SSDB2P81.G0045V00                      01060002
//             DD DISP=OLD,P.GES.SSDB2P82.G0045V00                      01070002
//             DD DISP=OLD,P.GES.SSDB2P83.G0037V00                      01080002
//             DD DISP=OLD,P.GES.SSDB2P84.G0030V00                      01090002
//             DD DISP=OLD,P.GES.SSDB2P85.G0021V00                      01100002
//             DD DISP=OLD,P.GES.SSDB2P86.G0021V00                      01110002
//             DD DISP=OLD,P.GES.SSDB2P87.G0021V00                      01120002
//             DD DISP=OLD,P.GES.SSDB2P88.G0037V00                      01130002
//             DD DISP=OLD,P.GES.SSDB2P89.G0034V00                      01140002
//             DD DISP=OLD,P.GES.SSDB2P90.G0020V00                      01150002
//             DD DISP=OLD,P.GES.SSDB2P91.G0020V00                      01160002
//             DD DISP=OLD,P.GES.SSDB2P92.G0020V00                      01170002
//             DD DISP=OLD,P.GES.SSDB2P93.G0016V00                      01180002
//             DD DISP=OLD,P.GES.SSDB2P94.G0014V00                      01190002
//             DD DISP=OLD,P.GES.SSDB2P95.G0011V00                      01200002
//             DD DISP=OLD,P.GES.SSDB2P96.G0008V00                      01210002
//             DD DISP=OLD,P.GES.SSDB2P97.G0007V00                      01220002
//             DD DISP=OLD,P.GES.SSDB2P98.G0006V00                      01230002
//             DD DISP=OLD,P.GES.SSDB2P99.G0006V00                      01240002
//             DD DISP=OLD,P.GES.SSDB2PAA.G0001V00                      01250002
