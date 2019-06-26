//DB@DEFCL JOB ,CICERO,CLASS=A,MSGCLASS=X,REGION=0M,NOTIFY=&SYSUID              
//*                                                                             
//*-----------------------------------------------------------------*           
//* DELETE CLUSTER - VSAM LINEAR - DB2                                          
//*-----------------------------------------------------------------*           
//*DELCLUS  EXEC PGM=IDCAMS                                                     
//*SYSPRINT DD  SYSOUT=*                                                        
//*SYSIN    DD  *                                                               
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A001                               
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A002                               
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A003                               
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A004                               
//* DELETE DB2P.DSNDBC.AISERIES.EQ003T.I0001.A005                               
//*-----------------------------------------------------------------*           
//* DEFINE CLUSTER - VSAM LINEAR - DB2                                          
//*-----------------------------------------------------------------*           
//DEFCLUS EXEC PGM=IDCAMS                                                       
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=*                                                          
//SYSIN DD *                                                                    
  DEFINE CLUSTER -                                                              
     ( NAME(DB2PCAT.DSNDBC.DB2ADM.EXCPARCL.I0001.A002) -                        
            LINEAR     -                                                        
            REUSE -                                                             
            VOLUMES (DB2P89) -                                                  
            CYLINDERS(695 695) -                                                
            SHAREOPTIONS(3 3) ) -                                               
     DATA -                                                                     
   ( NAME(DB2PCAT.DSNDBD.DB2ADM.EXCPARCL.I0001.A002) -                          
       ) -                                                                      
    CATALOG(CATALOG.DB2PROD.MARITIMA)                                           
