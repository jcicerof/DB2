//DSN01F15 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*--------------------------------------------------------------------*
//* DEFINE ALIAS DAS BIBLIOTECAS DB2  D2C1                             *
//* EM CASO DE ABEND ACIONAR O SUPORTE DB2                             *
//*--------------------------------------------------------------------*
//ALTALIAS EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
      DEFINE ALIAS( -
      NAME(D2C1.SDSNLOAD            ) -
      REL(D2C1.V7R1M0.SDSNLOAD        ))
      DEFINE ALIAS( -
      NAME(D2C1.SDSNEXIT            ) -
      REL(D2C1.V7R1M0.SDSNEXIT        ))
      DEFINE ALIAS( -
      NAME(D2C1.RUNLIB.LOAD         ) -
      REL(D2C1.V7R1M0.RUNLIB.LOAD     ))
