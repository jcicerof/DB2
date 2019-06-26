SELECT DISTINCT ' INCLUDE TABLESPACE '||                                00010023
     STRIP(A.DBNAME)||'.'||STRIP(A.TSNAME)||                            00020013
     CASE WHEN B.PARTITIONS > 0 THEN ' PARTLEVEL '                      00021024
          ELSE ''                                                       00022011
     END                                                                00023011
  FROM SYSIBM.SYSTABLES A,                                              00030006
       SYSIBM.SYSTABLESPACE B                                           00031006
 WHERE A.TYPE = 'T'                                                     00040006
   AND A.DBNAME = B.DBNAME                                              00040106
   AND A.TSNAME = B.NAME                                                00040206
   AND A.CREATOR = 'FINPROD'                                            00041035
-- AND A.DBNAME  = 'DCDI0P07'                                           00042032
   AND A.NAME   IN ('CLT_ADD_ADR_TEXT'                                  00050035
                   ,'CLT_ADD_NAME_TEXT'                                 00060035
                   ,'CLT_ADR_RELATION'                                  00070035
                   ,'BUSINESS_CLIENT'                                   00080035
                   ,'CLT_OTHER_OBJECTS'                                 00081035
                   ,'CLT_OBJ_RELATION'                                  00082035
                   ,'CLIENT_ADDRESS'                                    00083035
                   ,'CLIENT_BILLING'                                    00084035
                   ,'CLIENT_CLAIM'                                      00085035
                   ,'CLIENT_HELP'                                       00086035
                   ,'CLIENT_KEYS'                                       00087035
                   ,'CLIENT_MENU'                                       00088035
                   ,'CLIENT_POLICY'                                     00089035
                   ,'CLIENT_CROSS_REF'                                  00090035
                   ,'CLIENT_SUMMARY'                                    00100035
                   ,'CLIENT_UCT'                                        00110035
                   ,'CLT_CLT_RELATION'                                  00120035
                   ,'CLT_FORMAT_CLIENTS'                                00130035
                   ,'CLT_FORMAT_NAME'                                   00140035
                   ,'HOUSEHOLD_CLIENT'                                  00150035
                   ,'INDIVIDUAL_CLIENT'                                 00160035
                   ,'CLT_CONTACT_INFO'                                  00170035
                   ,'CLIENT_LICENSE'                                    00180035
                   ,'CLUB_MEM_INFO'                                     00190035
                   ,'CLT_OWNING_SYSTEM'                                 00200035
                   ,'CLIENT_PHONE'                                      00210035
                   ,'CLT_REF_RELATION'                                  00220035
                   ,'CLT_TEMPLATE'                                      00230035
                   ,'CLIENT_TAX'                                        00240035
                   ,'CLT_CLT_VLD_REL'                                   00241035
                   ,'CDIT_CLT_RELATIONS'                                00242035
                   ,'CLT_TABLE_ID_GEN'                                  00243035
                   ,'CDIT_MRG_STATUS'                                   00244035
                   ,'CLIENT_TAB'                                        00245035
                   ,'CDIT_NAME_ADDRESS'                                 00246035
                   ,'CDIT_AGREEMENT'                                    00247035
                   ,'CDIT_NA_ADDRESS'                                   00248035
                   ,'CDIT_NA_BUS_ENTITY'                                00249035
                   ,'CDIT_NA_NAME'                                      00249135
                   ,'CDIT_NA_PRDCR_REF'                                 00249235
                   ,'CDIT_POL_NA_INVL'                                  00249335
                   ,'CDIT_POL_SECTION'                                  00249435
                   ,'CDIT_PL_DEPT_REF'                                  00249535
                   ,'CDIT_REF_PRODUCT'                                  00249635
                   ,'CLT_TABLE_EPIC_GEN'                                00249735
                   ,'CLT_ADR_SEARCH')                                   00249835
