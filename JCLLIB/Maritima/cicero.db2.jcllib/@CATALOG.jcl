//DB@TESTE JOB MSGCLASS=P,CLASS=A,NOTIFY=JONAS                          JOB02322
//IEHP0206 EXEC PGM=IEHPROGM                                                    
//SYSPRINT DD  SYSOUT=*                                                         
//DD1      DD  DISP=OLD,UNIT=SYSDA,                                             
//         VOL=SER=(SHR005,SHR006,DSHR01,DSHR02,DSHR03,WRKSH2,WRKSH4, -         
//         WRKSH5)                                                              
//SYSIN DD *                                                                    
  CATLG DSNAME=CICERO.UNL.DBMA01.SSISNPTR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBMA01.SSISNPTR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBMA02.ENDERSEG.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBMA02.SEGURADO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBNOVA.CADAPOL.REC.D2008339,                 X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBNOVA.CADPARCL.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBNOVA.CADPARCL.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBNOVA.CORRETOR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBNOVA.CORRETOR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBRE02.TBCONBCO.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBRE02.TBCONBCO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBRE04.CADAPRMO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSAPOLIC.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSAPOLIC.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSAUPREM.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSAUPREM.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSCOBERT.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSCOBERT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSCONTAT.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSCONTAT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSCOREFA.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSCOREFA.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSDGNCLI.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSDGNCLI.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSDGNGUI.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSDGNGUI.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSENDPRE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSENDPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSESPPRE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSESPPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSESTIPU.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSESTIPU.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSESTPLN.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSESTPLN.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGICOMP.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGICOMP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIINST.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIINST.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIINS1.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIINS1.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIINS3.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIINS3.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIPRAB.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIPRAB.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIPROG.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSGIPROG.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSINFCOM.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSINFCOM.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSLIMCOB.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSLIMCOB.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSLIMVAN.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSLIMVAN.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSNEGEMP.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSNEGEMP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPAGPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPANEST.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPANEST.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPARVAR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPARVAR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPGMSEG.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPGMSEG.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPLACOB.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPLACOB.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPLANO2.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPLANO2.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPLAPRE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPLAPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPRESTA.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPRESTA.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPROAMB.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPROAMB.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSPROGLO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSREAUSM.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSREAUSM.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSRECUSA.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSRECUSA.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGCAR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGCPT.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGCPT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGINA.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGINA.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGPLA.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGPLA.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGPRE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGREA.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGREA.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGRES.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGRES.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGSNH.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGSNH.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGSRV.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEGSRV.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEHODG.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSEHODG.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSGEXEC.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSGEXEC.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSGINAD.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSGINAD.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSIEMPR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSIEMPR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSUBPRE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSSUBPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSTABCAR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSTABCAR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSTABCID.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSTABCID.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSUSMREE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSUSMREE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSUTGUPT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSVALUSM.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSVALUSM.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSVENPRE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSVRUSME.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS01.SSVRUSME.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSCAINHO.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSCAINHO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSCARERR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSCARERR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSDIVLHO.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSDIVLHO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSPLVDSG.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSPLVDSG.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSPTVAMB.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSPTVAMB.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSSEGDEP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSSEGEND.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSSEGEND.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSSEGTIT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSUNPROD.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS02.SSUNPROD.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSASHMPD.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSASHMPD.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSCNTBCO.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSCNTBCO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSCSSEXN.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSCSSEXN.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSCTRPRT.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSCTRPRT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDOCEND.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDOCEND.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDOCPES.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDOCPES.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDPAPTR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDPAPTR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDPDRTX.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDPDRTX.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDPHMPC.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDPHMPC.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDRTXPT.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDRTXPT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDVGESP.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDVGESP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDVGSER.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSDVGSER.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENDCRP.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENDCRP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENDELE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENDELE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENDERE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENDERE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENELEN.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSENELEN.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSFOPGPR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSFOPGPR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSHMDPTR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSHMDPTR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSHMPPTE.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSHMPPTE.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSIDFPES.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSIDFPES.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSOBSGER.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSOBSGER.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSOBSPTR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSOBSPTR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSPESFIS.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSPESFIS.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSPESJUR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSPESJUR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSPESREF.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSPESREF.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSRDCTPP.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSRDCTPP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTELEFO.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTELEFO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTELEND.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTELEND.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTIPDOC.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTIPDOC.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTIPOLO.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTIPOLO.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTLUNPR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTLUNPR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTPASSU.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSTPASSU.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSUNATPR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSUNATPR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSUNIPRT.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSUNIPRT.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVDRTXP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVGCRPR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVGCRPR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVGCRUN.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVGCRUN.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVLHMPP.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVLHMPP.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVLPCPR.PUNCH.D2008339,              X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
  CATLG DSNAME=CICERO.UNL.DBSS05.SSVLPCPR.REC.D2008339,                X        
               VOL=SYSDA=(SHR005,SHR006,DSHR01,DSHR02,                 X        
               DSHR03,WRKSH2,WRKSH4,WRKSH5)                                     
