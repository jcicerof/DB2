//*-------------------------------------------------------------------+ 
//* First file will select all records with no duplicates,             
//* second file will select all records with duplicates,               
//* third file will select only first entry of duplicate records.       
//*-------------------------------------------------------------------+ 
//STEP001 EXEC PGM=ICETOOL                                             
//SORTIN   DD  *                                                       
 Schulze       Projekt 678     
 Müller        Projekt 123     
 Meier         Projekt 123     
 Kunze         Projekt 123     
 Müller        Projekt 345     
 Kunze         Projekt 345     
 Aladin        Projekt 678     
//TOOLIN DD *                                                           
  SELECT FROM(SORTIN) TO(NODUPS)   ON(1,15,CH) NODUPS                   
  SELECT FROM(SORTIN) TO(ALLDUPS)  ON(1,15,CH) ALLDUPS                 
  SELECT FROM(SORTIN) TO(FIRSTDUP) ON(1,15,CH) FIRSTDUP                 
/*                                                                     
//TOOLMSG  DD  SYSOUT=*                                                 
//DFSMSG   DD  SYSOUT=*                                                 
//SYSOUT   DD  SYSOUT=*                                                 
//NODUPS   DD  SYSOUT=*                                                 
//ALLDUPS  DD  SYSOUT=*                                                 
//FIRSTDUP DD  SYSOUT=*    
