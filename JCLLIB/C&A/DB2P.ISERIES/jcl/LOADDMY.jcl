//SDBDUMMY  JOB 'GATTI',CLASS=S,MSGCLASS=X
//*
//**********************************************************************
//*                           DSNUTILB                                 *
//*                                                                    *
//*                       LOAD DE TABELAS DB2                          *
//**********************************************************************
//*
//LOAD    EXEC DSNUPROC,
//            UID='',
//            UTPROC=''
//*
//SYSREC   DD DUMMY
//SYSIN    DD *
  LOAD DATA LOG NO NOCOPYPEND REPLACE INDDN SYSREC   INTO TABLE
      SUPPROD.EQ031T_HIS_VEN_MAO
