SELECT COUNT(DISTINCT JOBNAME)                                          00010002
  FROM SYSIBM.SYSCOPY                                                   00011001
 WHERE ICDATE >= '110701' ;                                             00012003
 SELECT COUNT(*) FROM SYSIBM.SYSTABLESPACE WHERE CREATOR <> 'SYSIBM';   00013005
                                                                        00014005
SELECT DISTINCT DBNAME                                                  00015005
  FROM SYSIBM.SYSTABLES                                                 00016005
WHERE TYPE = 'T'                                                        00017006
  AND NAME IN ('SRET_BUILD_OR_LOC'                                      00017105
              ,'SRET_BUS_PURSUIT'                                       00018005
              ,'SRET_COMMON'                                            00019005
              ,'SRET_COMPANY'                                           00020005
              ,'SRET_COMPUTER_COV'                                      00030005
              ,'SRET_COUNTSGN'                                          00040005
              ,'SRET_COVERAGE'                                          00050005
              ,'SRET_ENDORSEMENT'                                       00060005
              ,'SRET_ERQK'                                              00070005
              ,'SRET_FORM'                                              00080005
              ,'SRET_LOSS_DESC'                                         00090005
              ,'SRET_MANUSCRIPT'                                        00100005
              ,'SRET_MINES'                                             00110005
              ,'SRET_POL_INT_PARTY'                                     00120005
              ,'SRET_POL_PROD_INDX'                                     00130005
              ,'SRET_PRODSELN'                                          00140005
              ,'SRET_PRODUCTS'                                          00150005
              ,'SRET_RECP'                                              00160005
              ,'SRET_SPEC_PROP_CLS'                                     00170005
              ,'SRET_SPP'                                               00180005
              ,'SRET_UFORMS'                                            00190005
              ,'SRET_UNDERLY_INS'                                       00200005
              ,'SRET_VESSEL_INFO'                                       00210005
              ,'SRET_WATERCRAFT'                                        00220005
              ,'SRET_WATERCRAFT_PD'                                     00230005
              ,'SRET_WEX'                                               00240005
              ,'SRET_WHDED'                                             00250005
              ,'SRUR_SEG_RATING'                                        00260005
              ,'SRUR_SEG_RATING_F'                                      00270005
              ,'SRUT_AGENCY_INFO'                                       00280005
              ,'SRUT_CSU_PROD_HIST'                                     00290005
              ,'SRUT_POLICY_INFO'                                       00300005
              ,'SRUT_POL_INT_PARTY'                                     00310005
              ,'SRUT_SCHEDULE_FCTR'                                     00320005
              ,'SRUT_SEG_RATING'                                        00330005
              ,'SRUT_SEG_RATING_F')                                     00340005
