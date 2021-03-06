SELECT SYSTEMID                                                         00190007
      ,SUBSYSTEM                                                        00200007
      ,PLANNAME                                                         00210007
      ,AUTHID                                                           00220007
      ,CONNECTION                                                       00230007
      ,CORRID                                                           00240007
      ,ORIGPRIMID                                                       00250007
      ,LUWIDNID                                                         00260007
      ,LUWIDLUNM                                                        00270007
      ,LUWIDINST                                                        00280007
      ,CHAR(LUWIDCOMIT)                                                 00290007
      ,CONNTYPE                                                         00300007
      ,DATETIME                                                         00310007
      ,DATE                                                             00320007
      ,YEAR                                                             00330007
      ,MONTH                                                            00340007
      ,DAY                                                              00350007
      ,TIME                                                             00360007
      ,HOUR                                                             00370007
      ,CHAR(DAYOFWEEK#)                                                 00380007
      ,DAYOFWEEK                                                        00390007
      ,CHAR(WEEK#)                                                      00400007
      ,LOCATION                                                         00410007
      ,GROUPNAME                                                        00420007
      ,MEMBERNAME                                                       00430007
      ,FIRSTPKG                                                         00440007
      ,ACCTTOKN                                                         00450007
      ,ENDUSERID                                                        00460007
      ,ENDUSERTX                                                        00470007
      ,ENDUSERWN                                                        00480007
      ,CHAR(TRACEMASK)                                                  00490007
      ,PSTNUMBER                                                        00500007
      ,PSBNAME                                                          00510007
      ,CICSTRAN                                                         00520007
      ,CORRNAME                                                         00530007
      ,REQLOCATION                                                      00540007
      ,REQPROD                                                          00550007
      ,REQPRODREL                                                       00560007
      ,NETWORKID                                                        00570007
      ,CHAR(INTERVAL)                                                   00580007
      ,CHAR(TRANSCNT)                                                   00590007
      ,CHAR(IFCIDSEQ#)                                                  00600007
      ,CHAR(CPUSUCONV)                                                  00630007
      ,CHAR(OCCURRENCES)                                                00640007
      ,PKGFLAG                                                          00650007
      ,EXECLOCATION                                                     00660007
      ,COLLECTIONID                                                     00670007
      ,PROGRAMNAME                                                      00680007
      ,CONSISTOKEN                                                      00690007
      ,CHAR(SQLCOUNT)                                                   00700007
      ,CHAR(ELAPSEPKG,6)                                                00710007
      ,CHAR(CPUTCBPKG,6)                                                00720007
      ,CHAR(ENTEXEVENT)                                                 00730007
      ,CHAR(EVTSYNCIO)                                                  00740007
      ,CHAR(ELAPSYNCIO,6)                                               00750007
      ,CHAR(ELPLOCK,6)                                                  00760007
      ,CHAR(ELPOTHREAD,6)                                               00770007
      ,CHAR(ELPOTHWRIT,6)                                               00780007
      ,CHAR(ELPUNITSW,6)                                                00790007
      ,CHAR(ELPARCQIS,6)                                                00800007
      ,CHAR(EVTLOCK)                                                    00810007
      ,CHAR(EVTOTHREAD)                                                 00820007
      ,CHAR(EVTOTHWRIT)                                                 00830007
      ,CHAR(EVTUNITSW)                                                  00840007
      ,CHAR(EVTARCQIS)                                                  00850007
      ,CHAR(EVTDRAIN)                                                   00860007
      ,CHAR(ELPDRAIN,6)                                                 00870007
      ,CHAR(ELPCLAIM,6)                                                 00880007
      ,CHAR(EVTCLAIM)                                                   00890007
      ,CHAR(ELPARCREAD,6)                                               00900007
      ,CHAR(EVTARCREAD)                                                 00910007
      ,CHAR(ELPPGLAT,6)                                                 00920007
      ,CHAR(EVTPGLAT)                                                   00930007
      ,CHAR(GBLMSGELAP,6)                                               00940007
      ,CHAR(GBLMSGEVNT)                                                 00950007
      ,CHAR(GBLLOKELAP,6)                                               00960007
      ,CHAR(GBLLOKEVNT)                                                 00970007
      ,CHAR(SPWAITELAP,6)                                               00971007
      ,CHAR(SPWAITCNT)                                                  00972007
      ,CHAR(SPROCCNT)                                                   00973007
      ,CHAR(FUNCWAIT,6)                                                 00974007
      ,CHAR(FUNCCNT)                                                    00975007
      ,NESTSCHEMA                                                       00976007
      ,NESTNAME                                                         00977007
      ,NESTTYPE                                                         00978007
      ,CHAR(WTELAWTK,6)                                                 00979007
      ,CHAR(WTELAWTM,6)                                                 00979107
      ,CHAR(WTELAWTN,6)                                                 00979207
      ,CHAR(WTELAWTO,6)                                                 00979307
      ,CHAR(WTELAWTQ,6)                                                 00979407
      ,CHAR(WTEVARNK)                                                   00979507
      ,CHAR(WTEVARNM)                                                   00979607
      ,CHAR(WTEVARNN)                                                   00979707
      ,CHAR(WTEVARNO)                                                   00979807
      ,CHAR(WTEVARNQ)                                                   00979907
      ,CHAR(DMRACSHARE)                                                 00980007
      ,CHAR(DMRAUTOCUST)                                                00980107
  FROM DMRPR.DMRAPDTL                                                   00982006
  WITH UR;                                                              00990006
