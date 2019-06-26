//DB@1SMFP JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=&SYSUID               00010001
//*-------------------------------------------------------------------  00020000
//*                                                                     00021000
//*-------------------------------------------------------------------  00022000
//DSN1SMFP EXEC PGM=DSN1SMFP                                            00030001
//STEPLIB  DD   DSN=DB2.DB2P.SDSNEXIT,DISP=SHR                          00040000
//         DD   DSN=DB2.DB2P.SDSNLOAD,DISP=SHR                          00050000
//SMFIN    DD   DISP=SHR,DSN=SMF RECORDS WITH DB2 TRACE DATA            00060001
//SYSPRINT DD   SYSOUT=* <- MESSAGES AND EOJ SUMMARY                    00070001
//IFCID003 DD ...                                                       00080001
//IFCID004 DD ...                                                       00090001
//IFCID005 DD ...                                                       00100001
//IFCID023 DD ...                                                       00110001
//IFCID024 DD ...                                                       00120001
//IFCID025 DD ...                                                       00130001
//IFCID106 DD ...                                                       00140001
//IFCID140 DD ...                                                       00150001
//IFCID141 DD ...                                                       00160001
//IFCID142 DD ...                                                       00170001
//IFCID143 DD ...                                                       00180001
//IFCID144 DD ...                                                       00190001
//IFCID145 DD ...                                                       00200001
//IFCID314 DD ...                                                       00210001
//IFCID350 DD ...                                                       00220001
