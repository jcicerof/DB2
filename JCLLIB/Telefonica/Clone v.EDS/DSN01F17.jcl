//DSN01F17 JOB (%%ODAY.%%OMONTH,%%OYEAR%%.DP),00300.CONTROLM,
//         CLASS=O,MSGCLASS=V,REGION=0M
//*
/*ROUTE XEQ NJE1
/*JOBPARM S=MVSB
//*
//STEP01   EXEC PGM=IEFBR14
//
//*********************************************************************
//* ALTERACAO SOLICITADA EM 20/09/05 - ODIMIR                         *
//* PROCESSO EFETUADO VIA AUTOMACAO DE START DO DB2 D2C1              *
//* CASO ACONTECA PROBLEMAS NO START DO DB2 AACIONAR O SUPORTE DB2    *
//*********************************************************************
//*STEP19   EXEC PGM=PCP98360
//*SYSOUT   DD SYSOUT=*
//*IN       DD *
//*-D2C1 START DB2
