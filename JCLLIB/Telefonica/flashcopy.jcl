//*-------------------------------------------------------------------*
//* EFETUA O FLASHCOPY DOS DADOS EM CASO DE PROBLEMAS ACIONAR O       *
//* SUPORTE DB2                                                       *
//*-------------------------------------------------------------------*
//FLASHCOP  EXEC PGM=ADRDSSU,REGION=5M                                 
//SYSPRINT  DD   SYSOUT=*                                              
//SYSOUT    DD   SYSOUT=*                                              
//SYSIN     DD   *                                                     
   COPY LOGINDYNAM(AE18A7) OUTDYNAM(AE1821) -                          
        DS(INCL(DS18AC.**))                          -                 
        RENAMEU(DS14AC)                           -                    
        ALLDATA(*) ALLEXCP PURG                     -                  
        TOL(ENQF)  NULLSTORCLAS ADMIN BYPASSACS(**) -                  
        RECATALOG(SYS3C.ICFCAT.FLASHCOP)                               
/*                                                                     
