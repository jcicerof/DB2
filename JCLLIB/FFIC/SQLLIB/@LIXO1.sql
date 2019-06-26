SELECT                                                                  00333016
TBCREATOR,TBNAME,NAME,COLTYPE,LENGTH,COLNO                              00334016
  FROM SYSIBM.SYSCOLUMNS                                                00335016
 WHERE STRIP(TBCREATOR)||'.'||STRIP(TBNAME) IN (                        00336016
      'ERSPROD.MACT_A1_AMOUNT'                                          00340018
     ,'ERSPROD.MACT_CD_CLM_DESC'                                        00350013
     ,'ERSPROD.MACT_CT_CLM_TRAUMA'                                      00360013
     ,'ERSPROD.MACT_CV_CLM_VEH'                                         00370013
     ,'ERSPROD.MACT_S1_COMM_EMPL'                                       00380013
     ,'ERSPROD.MACT_S2_OCEAN'                                           00390013
     ,'ERSPROD.MACT_S3_COMM_LIAB'                                       00400013
     ,'ERSPROD.MACT_S4_GLASS'                                           00410013
     ,'ERSPROD.MACT_S5_BOIL_MACH'                                       00420013
     ,'ERSPROD.MACT_S6_BUS_ASSET'                                       00430013
     ,'ERSPROD.MACT_S7_PERS_AUTO'                                       00440013
     ,'ERSPROD.MACT_S8_COMM_AUTO'                                       00450013
     ,'ERSPROD.MACT_S9_RES_EMPLOY'                                      00460013
     ,'ERSPROD.MACT_SA_WEST_GENRL'                                      00470013
     ,'ERSPROD.MACT_SB_ENTERTAIN'                                       00480013
     ,'ERSPROD.MACT_SC_UNSPEC_SAR'                                      00490013
     ,'ERSPROD.MACT_SD_OBLIGATION'                                      00500013
     ,'ERSPROD.MACT_SE_COMM_FARM'                                       00510013
     ,'ERSPROD.MACT_SF_RES_RISK'                                        00520013
     ,'ERSPROD.MACT_SG_RES_BUS'                                         00530013
     ,'ERSPROD.MACT_SH_WATERCRAFT'                                      00540013
     ,'ERSPROD.MACT_SI_SCHED_PERS'                                      00550013
     ,'ERSPROD.MACT_SJ_COMP_SAR'                                        00560013
     ,'ERSPROD.MACT_SK_PERS_BUS'                                        00570013
     ,'ERSPROD.MACT_SL_ANIMAL_RSK'                                      00580013
     ,'ERSPROD.MACT_SM_EVENT'                                           00590013
     ,'ERSPROD.MACT_SN_COV_PERSON')                                     00600013
ORDER BY TBCREATOR,TBNAME,COLNO                                         00610013
