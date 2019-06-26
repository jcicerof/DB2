//DB@DSNTE JOB MSGCLASS=P,CLASS=A,NOTIFY=&SYSUID                                
//*                                                                             
//DSNTEP2  EXEC PGM=IKJEFT01,DYNAMNBR=20                                        
//STEPLIB  DD DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                                    
//         DD DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                                    
//SYSTSPRT DD SYSOUT=*                                                          
//SYSTSIN  DD *                                                                 
  DSN SYSTEM(DB2P)                                                              
  RUN PROGRAM(DSNTEP2) PLAN(DSNTEP71) PARMS('/ALIGN(LHS) MIXED') -              
      LIB('DB2.DB2P.RUNLIB.LOAD')                                               
  -STOP DB(DBEEAE) SPACENAM(CTLIBDOC)                                           
  -STOP DB(DBEEAE) SPACENAM(CTLIBRTI)                                           
  -STOP DB(DBEEAE) SPACENAM(DOCDANEL)                                           
  -STOP DB(DBEEAE) SPACENAM(DOCDAEAN)                                           
  -STOP DB(DBEEAE) SPACENAM(DOCANAEL)                                           
  -STOP DB(DBEEAE) SPACENAM(INFORDOC)                                           
  -STOP DB(DBEEAE) SPACENAM(MOVANELA)                                           
  -STOP DB(DBEEAE) SPACENAM(MVAELTRD)                                           
  -STOP DB(DBMO01) SPACENAM(ORCAMENT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCAMETO)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCCTALT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCCTATD)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCCTPDC)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCAMEND)                                           
  -STOP DB(DBEEOR) SPACENAM(ORFORPGT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITACE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITBNF)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITCOB)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITEND)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCAITEM)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITEOBS)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITPFL)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITPRO)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITREF)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITRNV)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITSEG)                                           
  -STOP DB(DBMO01) SPACENAM(ORCAMLOG)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCLOGEE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCAMPPS)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCPRTOT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCCPCOR)                                           
  -STOP DB(DBEEOR) SPACENAM(ORFOPGRM)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITCVED)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIACVE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITCLA)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITCBCA)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCICDIF)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCICOBE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCICTEN)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITCGVE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORICPEBN)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIFPGT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORIFPGRM)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCGCRSS)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITVEI)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCISQCA)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITMTGE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIOPVE)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIPCDT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIPQST)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIPNIV)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITPRAN)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITPROB)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCIPTOT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITQSUT)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCISSGU)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITXEN)                                           
  -STOP DB(DBEEOR) SPACENAM(ORITVLED)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPANEL)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPANEX)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPOAMS)                                           
  -STOP DB(DBEEPR) SPACENAM(PPSCBCPM)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPCLAU)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPCOBR)                                           
  -STOP DB(DBEEPR) SPACENAM(PRCOCBRM)                                           
  -STOP DB(DBEEPR) SPACENAM(PRCORADI)                                           
  -STOP DB(DBEEPR) SPACENAM(PRCORRET)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPCOSS)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPCRED)                                           
  -STOP DB(DBEEPR) SPACENAM(PRCTPCVS)                                           
  -STOP DB(DBEEPR) SPACENAM(PRFPGCRM)                                           
  -STOP DB(DBEEPR) SPACENAM(PRFOPGRM)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITANEL)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITANEX)                                           
  -STOP DB(DBEEPR) SPACENAM(PRIAPANT)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITAUEL)                                           
  -STOP DB(DBEEPR) SPACENAM(PRIAAVAN)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITAVAR)                                           
  -STOP DB(DBEEPR) SPACENAM(PPSITCBC)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITCLAU)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITCVEI)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITCAPA)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITCOBR)                                           
  -STOP DB(DBEEPR) SPACENAM(PRICCBRM)                                           
  -STOP DB(DBEEPR) SPACENAM(PROITCRE)                                           
  -STOP DB(DBEEPR) SPACENAM(PRICPEBN)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPITDU)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPITEM)                                           
  -STOP DB(DBEEPR) SPACENAM(PRIFPCRM)                                           
  -STOP DB(DBEEPR) SPACENAM(PRIFOPRM)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITLEVE)                                           
  -STOP DB(DBEEPR) SPACENAM(PROITOBS)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITOBAN)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITPAUT)                                           
  -STOP DB(DBEEPR) SPACENAM(PPSIPRCD)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITPVEI)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITSEQA)                                           
  -STOP DB(DBEEPR) SPACENAM(PROITSIT)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITSTMT)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITSITU)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITTXCP)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITTXEM)                                           
  -STOP DB(DBEEPR) SPACENAM(PPSITVLI)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITVERS)                                           
  -STOP DB(DBEEPR) SPACENAM(PRITVRMX)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPLEVE)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPNEGO)                                           
  -STOP DB(DBNOVA) SPACENAM(PROPOSTA)                                           
  -STOP DB(DBEEPR) SPACENAM(EEPROPOS)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPOOBS)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPSATU)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPVERS)                                           
  -STOP DB(DBEEPR) SPACENAM(PPSPRECD)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPRENV)                                           
  -STOP DB(DBEEPR) SPACENAM(PROSTMOT)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPSITU)                                           
  -STOP DB(DBEEPR) SPACENAM(PRTXTCPM)                                           
  -STOP DB(DBEEPR) SPACENAM(PROTXTEM)                                           
  -STOP DB(DBEEPR) SPACENAM(PPSVLINF)                                           
  -STOP DB(DBEEPR) SPACENAM(PROPVRMX)                                           
  -STOP DB(DBEEOR) SPACENAM(ORCITAVA)                                           
  -START DB(DBEEAE) SPACENAM(CTLIBDOC) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(CTLIBRTI) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(DOCDANEL) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(DOCDAEAN) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(DOCANAEL) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(INFORDOC) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(MOVANELA) ACC(RW)                                  
  -START DB(DBEEAE) SPACENAM(MVAELTRD) ACC(RW)                                  
  -START DB(DBMO01) SPACENAM(ORCAMENT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCAMETO) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCCTALT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCCTATD) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCCTPDC) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCAMEND) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORFORPGT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITACE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITBNF) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITCOB) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITEND) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCAITEM) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITEOBS) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITPFL) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITPRO) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITREF) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITRNV) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITSEG) ACC(RW)                                  
  -START DB(DBMO01) SPACENAM(ORCAMLOG) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCLOGEE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCAMPPS) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCPRTOT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCCPCOR) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORFOPGRM) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITCVED) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIACVE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITCLA) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITCBCA) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCICDIF) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCICOBE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCICTEN) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITCGVE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORICPEBN) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIFPGT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORIFPGRM) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCGCRSS) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITVEI) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCISQCA) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITMTGE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIOPVE) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIPCDT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIPQST) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIPNIV) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITPRAN) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITPROB) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCIPTOT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITQSUT) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCISSGU) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITXEN) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORITVLED) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPANEL) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPANEX) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPOAMS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PPSCBCPM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPCLAU) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPCOBR) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRCOCBRM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRCORADI) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRCORRET) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPCOSS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPCRED) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRCTPCVS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRFPGCRM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRFOPGRM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITANEL) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITANEX) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRIAPANT) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITAUEL) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRIAAVAN) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITAVAR) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PPSITCBC) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITCLAU) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITCVEI) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITCAPA) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITCOBR) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRICCBRM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROITCRE) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRICPEBN) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPITDU) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPITEM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRIFPCRM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRIFOPRM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITLEVE) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROITOBS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITOBAN) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITPAUT) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PPSIPRCD) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITPVEI) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITSEQA) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROITSIT) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITSTMT) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITSITU) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITTXCP) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITTXEM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PPSITVLI) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITVERS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRITVRMX) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPLEVE) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPNEGO) ACC(RW)                                  
  -START DB(DBNOVA) SPACENAM(PROPOSTA) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(EEPROPOS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPOOBS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPSATU) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPVERS) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PPSPRECD) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPRENV) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROSTMOT) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPSITU) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PRTXTCPM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROTXTEM) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PPSVLINF) ACC(RW)                                  
  -START DB(DBEEPR) SPACENAM(PROPVRMX) ACC(RW)                                  
  -START DB(DBEEOR) SPACENAM(ORCITAVA) ACC(RW)                                  
  END                                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN    DD *                                                                 
ALTER TABLESPACE DBEEAE.CTLIBDOC  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.CTLIBRTI  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.DOCDANEL  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.DOCDAEAN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.DOCANAEL  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.INFORDOC  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.MOVANELA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEAE.MVAELTRD  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBMO01.ORCAMENT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCAMETO  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCCTALT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCCTATD  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCCTPDC  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCAMEND  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORFORPGT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITACE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITBNF  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITCOB  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITEND  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCAITEM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITEOBS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITPFL  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITPRO  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITREF  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITRNV  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITSEG  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBMO01.ORCAMLOG  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCLOGEE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCAMPPS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCPRTOT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCCPCOR  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORFOPGRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITCVED  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIACVE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITCLA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITCBCA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCICDIF  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCICOBE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCICTEN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITCGVE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORICPEBN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIFPGT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORIFPGRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCGCRSS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITVEI  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCISQCA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITMTGE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIOPVE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIPCDT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIPQST  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIPNIV  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITPRAN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITPROB  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCIPTOT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITQSUT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCISSGU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITXEN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORITVLED  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPANEL  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPANEX  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPOAMS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PPSCBCPM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPCLAU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPCOBR  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRCOCBRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRCORADI  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRCORRET  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPCOSS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPCRED  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRCTPCVS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRFPGCRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRFOPGRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITANEL  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITANEX  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRIAPANT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITAUEL  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRIAAVAN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITAVAR  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PPSITCBC  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITCLAU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITCVEI  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITCAPA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITCOBR  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRICCBRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROITCRE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRICPEBN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPITDU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPITEM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRIFPCRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRIFOPRM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITLEVE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROITOBS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITOBAN  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITPAUT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PPSIPRCD  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITPVEI  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITSEQA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROITSIT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITSTMT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITSITU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITTXCP  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITTXEM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PPSITVLI  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITVERS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRITVRMX  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPLEVE  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPNEGO  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBNOVA.PROPOSTA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.EEPROPOS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPOOBS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPSATU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPVERS  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PPSPRECD  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPRENV  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROSTMOT  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPSITU  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PRTXTCPM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROTXTEM  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PPSVLINF  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEPR.PROPVRMX  LOCKSIZE ANY LOCKMAX SYSTEM;                  
ALTER TABLESPACE DBEEOR.ORCITAVA  LOCKSIZE ANY LOCKMAX SYSTEM;                  
