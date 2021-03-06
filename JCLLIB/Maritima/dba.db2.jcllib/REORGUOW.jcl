//DBRDSUOW JOB 'CICERO',MSGCLASS=T,CLASS=A,NOTIFY=CICERO                        
//*-------------------------------------------------------------------          
//* REORGANIZACAO DA TABELA DB2 ASN.IBMSNAP_UOW                                 
//*                                                                             
//* ESTE REORG ONLINE DEVERA SER EXECUTADO DIARIAMENTE ANTES DA                 
//* ROTINA DO PRUNE (ENVIADO PELO MAINVIEW) DA MARITIMA, SEM                    
//* NECESSIDADE DE PARALISAO DO TABLESPACE                                      
//*                                                                             
//* EM CASO DE ABEND NAO HAVERA NECESSIDADE DE RETOMAR O JOB, APENAS            
//* INFORMAR O GRUPO DBA VIA GENIS                                              
//*                                                                             
//* DATA     AUTOR        DESCRICAO                                             
//* 23-11-07 CICERO/JONAS IMPLANTACAO                                           
//* 02-01-08 CICERO       SUBSTITUICAO DA UNIT=VSM POR SYSDA NOS                
//*                       DDNAMES SYSUT1 E SORTOUT                              
//* 15-01-08 CICERO       INCLUSAO DO MODIFY AGE 10                             
//*------------------------------------------------------------------           
//         SET DSN=DB2P                                                         
//*------------------------------------------------------------------           
//* REORG + MODIFY AGE                                                          
//*------------------------------------------------------------------           
//REORG    EXEC PGM=DSNUTILB,PARM='&DSN'                                        
//STEPLIB  DD   DSN=DB2.&DSN..SDSNEXIT,DISP=SHR                                 
//         DD   DSN=DB2.&DSN..SDSNLOAD,DISP=SHR                                 
//SYSPRINT DD   SYSOUT=*                                                        
//UTPRINT  DD   SYSOUT=*                                                        
//SYSUDUMP DD   SYSOUT=*                                                        
//SYSMAP   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSERR   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                           
//SYSUT1   DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   02-01-08
//SORTOUT  DD   UNIT=SYSDA,SPACE=(CYL,(700,500),RLSE)                   02-01-08
//SYSIN    DD   *                                                               
OPTIONS EVENT(ITEMERROR, SKIP)                                                  
LISTDEF DBLIST                                                                  
                INCLUDE TABLESPACE DPROPR.DTSTSUOW                              
TEMPLATE DDCOPY                                                                 
         DSN('DB2PCOPY.FD1.&DB..&TS..P0(+1)')                                   
         UNIT=VSM                                                               
         VOLCNT(255)                                                            
         DISP(NEW,CATLG,DELETE)                                                 
         STACK YES                                                              
         GDGLIMIT(5)                                                            
                                                                                
TEMPLATE DDDISC DSN(DB2PWRK.UNL.&DB..&TS..DISC.D&DT.)                           
   DISP (NEW,DELETE,CATLG)                                                      
   UNIT VSM  VOLCNT(255) RETPD 5                                                
                                                                                
TEMPLATE DDPUNCH DSN(DB2PWRK.UNL.&DB..&TS..PUNCH.D&DT.)                         
   UNIT SYSDA SPACE (1,0) TRK DISP (NEW,DELETE,CATLG)                           
                                                                                
TEMPLATE DDREC DSN(DB2PWRK.UNL.&DB..&TS..REC.D&DT.)                             
   DISP (NEW,DELETE,CATLG)                                                      
   UNIT VSM  VOLCNT(255) RETPD 5                                                
                                                                                
QUIESCE LIST DBLIST                                                             
REORG TABLESPACE LIST DBLIST LOG NO                                             
      SORTDATA SORTKEYS                                                         
      PUNCHDDN(DDPUNCH) COPYDDN(DDCOPY) UNLDDN(DDREC) DISCARDDN(DDDISC)         
      FASTSWITCH NO                                                             
      SHRLEVEL CHANGE MAPPINGTABLE SYSADM.MAPTABLE                              
      STATISTICS TABLE(ALL) INDEX(ALL) UPDATE ALL                               
                                                                                
MODIFY RECOVERY LIST DBLIST DELETE AGE 5                                        
//                                                                              
