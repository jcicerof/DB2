                                                                                
--==============================================================================
--  r11.5 SP0   CA-DB2   RC/MIGRATOR   ANALYSIS REPORT      07/04/16 23:10      
--==============================================================================
--STRATEGY INFORMATION:                                                         
--STRATEGY ==> TESTE     DESCRIPTION  ===> TESTE                                
--CREATOR  ==> CICERO    SHARE OPTION ===> N (U,Y,N,X,L)  SRC SSID ===> DB2P    
--                                                                              
--IMPLODE/EXPLODE OPTIONS:                                                      
--                                                                              
-- +--- PRIMARY OBJECT --------------------------------------------------------+
--                                                                              
--   +-- IMPLODE OPTIONS ---+ +- EXPLODE OPTIONS --+                            
--S  STOGRP DATABASE TBLSPACE INDEX VIEW SYN/AL TRIG                            
--_     _      _        A       A     A     _     _                             
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      EXCPARCL                         DB2ADM                                 
-- +---------------------------------------------------------------------------+
--                                                                              
--                                                                              
--OTHER MIGRATION OPTIONS:                                                      
--  AUX RTN             ALL  NUMBER                                             
--S IMP IMP RI SECURITY ROWS OF ROWS  WHERE                                     
--_  _   _  _     _      _   ________ _ ________                                
--                                                                              
-- EDIT TABLE NAME                       CREATOR                                
--      EXCPARCL                         DB2ADM                                 
-- +---------------------------------------------------------------------------+
--                                                                              
--ANALYSIS OPTIONS:                                                             
--  EXECUTION MODE    ===> O (O - ONLINE, B - BATCH)                            
--  ANALYSIS OVERRIDE ===> N                                                    
--  ACCESS MODE       ===> CATALOG                                              
--  MODEL ID          ===> @DEFAULT                                             
--  MODEL CREATOR     ===> AXW0311                                              
--  TARGET SSID       ===> DB2P                                                 
--  GLOBAL CHANGES    ===> N                                                    
--                                                                              
--  AUX IMPLODE       ===> N             STATISTICS    ===> N                   
--  RI(LOCAL/GLOBAL)  ===> L             CHECK DATA    ===> N                   
--  SECURITY          ===> Y             IMAGE COPY    ===> Y                   
--  DROP OBJECTS      ===> N             BIND/REBIND   ===> R                   
--  LOB OBJECTS       ===> N             RECOVER IX    ===> Y                   
--  DEFAULT SQLID     ===>                                                      
--  ALIAS SQLID       ===>                                                      
--  TABLE OBID        ===> N                                                    
--  RTN IMPLODE       ===>                                                      
--  RTN INTERACTION   ===> N                                                    
--                                                                              
--  ALL ROWS          ===> Y             VSAM DEFINES  ===> N                   
--  NUMBER ROWS       ===>               VSAM DELETES  ===> N                   
--  DATA STATISTICS   ===> N                                                    
--  TRUNCATE          ===> N                                                    
--                                                                              
--  NO .AUTHS               ===> N                                              
--  NO SET SQLID STMTS      ===> N                                              
--  BND/DAT/SQL/STAT/GRNT/RI===> S  (B nd, D at, R -Stat, S QL, G rnt, R I or N)
--  COMMIT ASAP             ===> Y                                              
--                                                                              
--  DELETE UNLOAD DATASETS    ===> N                                            
--  DELETE TEMPORARY DATASETS ===> N                                            
--                                                                              
--********************** END OF ANALYSIS HEADER ********************************
                                                                                
--  RMA234W AN IN-PLACE MIGRATION HAS BEEN GENERATED WITH THE DROP OBJECTS      
--        OPTION SET TO "N". SQL ERRORS MAY OCCUR.                              
                                                                                
--  RMA448W THIS ANALYSIS WAS PERFORMED WITHOUT THE LOB OBJECTS OPTION.         
--        TABLES CREATED CONTAINING LOB COLUMNS MAY BE MARKED INCOMPLETE.       
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * TABLESPACE CREATE AND ALTER STATEMENTS                     *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- DB2ADM.EXCPARCL WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.               
                                                                                
                                                                                
    SET CURRENT SQLID = 'SYSADM';                                               
                                                                                
                                                                                
CREATE  TABLESPACE EXCPARCL                                                     
IN      DB2ADM                                                                  
USING   STOGROUP STGP88D                                                        
                                    PRIQTY 2100000                              
                                    SECQTY 200000                               
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
                     COMPRESS YES                                               
           BUFFERPOOL BP1                                                       
           LOCKSIZE ANY                                                         
           CLOSE YES                                                            
           SEGSIZE 4                                                            
           LOCKMAX SYSTEM                                                       
           CCSID EBCDIC                                                         
    ;                                                                           
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * TABLE CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
-- DB2ADM.EXCPARCL WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.               
                                                                                
                                                                                
CREATE  TABLE DB2ADM.EXCPARCL                                                   
(       CDSUCUR SMALLINT NOT NULL                                               
,       CDRMBAS SMALLINT NOT NULL                                               
,       NRAPOLI INTEGER NOT NULL                                                
,       NRENDOS INTEGER NOT NULL                                                
,       CDRMRMO SMALLINT NOT NULL                                               
,       NRPARCL SMALLINT NOT NULL                                               
,       TPINDXPR SMALLINT NOT NULL                                              
,       NRINSPA SMALLINT NOT NULL                                               
,       NRINSPR SMALLINT NOT NULL                                               
,       NRCORRT INTEGER NOT NULL                                                
,       NRCOLAB INTEGER NOT NULL                                                
,       CDSTATU CHAR ( 1 ) NOT NULL                                             
,       CDSTPCL SMALLINT NOT NULL                                               
,       CDBANCO SMALLINT NOT NULL                                               
,       CDAGBCO SMALLINT NOT NULL                                               
,       NRCEDEN DECIMAL ( 11 , 0 ) NOT NULL                                     
,       NRCONTA DECIMAL ( 11 , 0 ) NOT NULL                                     
,       NSNUMER DECIMAL ( 11 , 0 ) NOT NULL                                     
,       PRLQEMIL DECIMAL ( 13 , 2 ) NOT NULL                                    
,       PRLQEMIC DECIMAL ( 13 , 2 ) NOT NULL                                    
,       VRADIEMI DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRIOFEMI DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRCOMEMI DECIMAL ( 11 , 2 ) NOT NULL                                    
,       CDMOEEMI SMALLINT NOT NULL                                              
,       VRSALDAM DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRALTEAM DECIMAL ( 11 , 2 ) NOT NULL                                    
,       PRLQCOBL DECIMAL ( 13 , 2 ) NOT NULL                                    
,       PRLQCOBC DECIMAL ( 13 , 2 ) NOT NULL                                    
,       VRADICOB DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRIOFCOB DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRCOMCOB DECIMAL ( 11 , 2 ) NOT NULL                                    
,       CDMOECOB SMALLINT NOT NULL                                              
,       FLAGDEFL CHAR ( 1 ) NOT NULL                                            
,       CDBCOPGT SMALLINT NOT NULL                                              
,       CDFATAM SMALLINT NOT NULL                                               
,       CDSITBCO CHAR ( 1 ) NOT NULL                                            
,       PCPASSIS DECIMAL ( 5 , 2 ) NOT NULL                                     
          WITH DEFAULT                                                          
,       VRCUSEMI DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRCUSCOB DECIMAL ( 11 , 2 ) NOT NULL                                    
,       NREDSOR INTEGER NOT NULL                                                
,       VRCUSDSL DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRCUSDSC DECIMAL ( 11 , 2 ) NOT NULL                                    
,       PCPRESER DECIMAL ( 5 , 2 )                                              
,       PCPPRFAT DECIMAL ( 5 , 2 )                                              
,       PCPCOBEX DECIMAL ( 5 , 2 ) NOT NULL                                     
          WITH DEFAULT                                                          
,       CDDSCATM SMALLINT NOT NULL                                              
          WITH DEFAULT                                                          
,       DTMVEMI_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTMVCAN_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTMVREA_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTFATUR_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTVECTO_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTPAGTO_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTMVPGT_CNV INTEGER NOT NULL                                            
          WITH DEFAULT                                                          
,       DTLANCTO_CNV INTEGER NOT NULL                                           
          WITH DEFAULT                                                          
,       PCASSIS DECIMAL ( 9 , 6 ) NOT NULL                                      
          WITH DEFAULT                                                          
,       PCRESER DECIMAL ( 9 , 6 ) NOT NULL                                      
          WITH DEFAULT                                                          
,       PCPRFAT DECIMAL ( 9 , 6 ) NOT NULL                                      
          WITH DEFAULT                                                          
,       NRCAIXA SMALLINT NOT NULL                                               
          WITH DEFAULT                                                          
,       DTCOBERT DATE NOT NULL                                                  
          WITH DEFAULT                                                          
'1111-11-11'                                                                    
,       PCDESEXT DECIMAL ( 9 , 6 ) NOT NULL                                     
          WITH DEFAULT                                                          
,       DTATUPAR DATE                                                           
,       VLJMO DECIMAL ( 11 , 2 )                                                
   )                                                                            
   WITH RESTRICT ON DROP                                                        
IN      DB2ADM.EXCPARCL                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
COMMENT ON DB2ADM.EXCPARCL                                                      
(       CDSUCUR IS 'CD.SUCURSAL          .(002)'                                
,       CDRMBAS IS 'CD.RAMO BASE         .(002)'                                
,       NRAPOLI IS 'NR.APOLICE           .(006)'                                
,       NRENDOS IS 'NR.ENDOSSO           .(006)'                                
,       CDRMRMO IS 'CD.RAMO RAMO         .(002)'                                
,       NRPARCL IS 'NR.PARCELA           .(002)'                                
,       TPINDXPR IS 'TP.INDEXACAO PREMIO  .(002)'                               
,       NRINSPA IS 'NR.INSPETORIA        .(003)'                                
,       NRINSPR IS 'NR.INSPETOR          .(003)'                                
,       NRCORRT IS 'NR.CORRETOR          .(005)'                                
,       NRCOLAB IS 'NR.COLABOLADOR       .(005)'                                
,       CDSTATU IS 'CD.STATUS            .(001)'                                
,       CDSTPCL IS 'CD.SIT.DA PARCELA    .(001)'                                
,       CDBANCO IS 'CD.BANCO             .(003)'                                
,       CDAGBCO IS 'CD.AGENCIA BANCARIA  .(004)'                                
,       NRCEDEN IS 'NR.CEDENTE           .(011,0)'                              
,       NRCONTA IS 'NR.CONTA CORRENTE    .(011,0)'                              
,       NSNUMER IS 'NOSSO NUMERO         .(011,0)'                              
,       PRLQEMIL IS 'PRM.LIQ.EMITIDO LIDER.(011,2)'                             
,       PRLQEMIC IS 'PRM.LIQ.EMITIDO COSSG.(011,2)'                             
,       VRADIEMI IS 'VR.ADICIONAL EMITIDO .(009,2)'                             
,       VRIOFEMI IS 'VR. I.O.F. EMITIDO   .(009,2)'                             
,       VRCOMEMI IS 'VR.COMISSAO EMITIDO  .(009,2)'                             
,       CDMOEEMI IS 'CD.MOEDA EMISSAO     .(001)'                               
,       VRSALDAM IS 'VR. SALDO AUTO MENSAL (011,2)'                             
,       VRALTEAM IS 'VR. ALTERACAO AUTO MENSAL (011,2)'                         
,       PRLQCOBL IS 'PRM.LIQ.COBRADO LIDER.(011,2)'                             
,       PRLQCOBC IS 'PRM.LIQ.COBRADO COSSG.(011,2)'                             
,       VRADICOB IS 'VR.ADICIONAL COBRADO .(009,2)'                             
,       VRIOFCOB IS 'VR. I.O.F. COBRADO   .(009,2)'                             
,       VRCOMCOB IS 'VR.COMISSAO COBRADO  .(009,2)'                             
,       CDMOECOB IS 'CD.MOEDA COBRANCA    .(001)'                               
,       FLAGDEFL IS 'FLAG DEFLACAO (B/*)  .(001)'                               
,       CDBCOPGT IS 'CD.BANCO PAGAMENTO   .(003)'                               
,       CDFATAM IS 'CD.FATURA AU.MENSAL  .(001)'                                
,       CDSITBCO IS 'CODIGO SITUACAO DO BANCO (BANESPA)'                        
,       PCPASSIS IS 'PERCENTUAL PARTICIPACAO DE ASSISTENCIA'                    
,       VRCUSEMI IS 'VALOR DO CUSTO EMITIDO'                                    
,       VRCUSCOB IS 'VALOR DO CUSTO COBRADO'                                    
,       NREDSOR IS 'NR.ENDOSSO ORIGINARIO'                                      
,       VRCUSDSL IS 'VALOR DO CUSTO DISP. LIDER'                                
,       VRCUSDSC IS 'VALOR DO CUSTO DISP. COSSEG'                               
,       PCPRESER IS 'PC.DE PARTICIPACAO DE CARRO RESERVA'                       
,       PCPPRFAT IS 'PC. PARTIC. PERDA FATURAM.'                                
,       PCPCOBEX IS 'PERCENTUAL DE PARTICIPACAO   DE COBERTURA EXT'             
,       CDDSCATM IS 'CODIGO DE DESCONTO'                                        
,       DTMVEMI_CNV IS 'DT.MOVTO.EMISSAO'                                       
,       DTMVCAN_CNV IS 'DT.MOVTO.CANCEL.'                                       
,       DTMVREA_CNV IS 'DT.MOVTO.REATIVACAO'                                    
,       DTFATUR_CNV IS 'DT.FATURA'                                              
,       DTVECTO_CNV IS 'DT.VENCIMENTO'                                          
,       DTPAGTO_CNV IS 'DT.PAGAMENTO'                                           
,       DTMVPGT_CNV IS 'DT.MOVTO.PAGAMENTO'                                     
,       DTLANCTO_CNV IS 'DT LANCTO (BANESPA)'                                   
,       PCASSIS IS 'PC.PARTIC. ASSISTENCIA'                                     
,       PCRESER IS 'PC.PART. CARRO RESERVA'                                     
,       PCPRFAT IS 'PC.PART. PERDA FATUR'                                       
,       NRCAIXA IS 'NUMERO DO CAIXA'                                            
,       DTCOBERT IS 'DATA DE COBERTURA'                                         
,       PCDESEXT IS '% DESPESA EXTRAORDINARIA'                                  
,       DTATUPAR IS 'DATA DE ATUALIZACAO DA PARCELA.'                           
,       VLJMO IS 'VALOR DE JUROS DE MORA.'                                      
                ) ;                                                             
COMMENT ON TABLE DB2ADM.EXCPARCL IS 'CADASTRO DE APOLICES PARCELAS' ;           
                                                                                
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    SET CURRENT SQLID = 'SYSADM';                                               
                                                                                
    GRANT DELETE                                                                
         ,INSERT                                                                
         ,SELECT                                                                
         ,UPDATE                                                                
                    ON TABLE DB2ADM.EXCPARCL TO PUBLIC;                         
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    SET CURRENT SQLID = USER;                                                   
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * INDEX CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- DB2ADM.EXCPARCL_IX1 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.           
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX DB2ADM.EXCPARCL_IX1 ON DB2ADM.EXCPARCL                     
(       CDSUCUR ASC                                                             
,       CDRMBAS ASC                                                             
,       NRAPOLI ASC                                                             
,       NRENDOS ASC                                                             
,       CDRMRMO ASC                                                             
,       NRPARCL ASC                                                             
          )                                                                     
USING   STOGROUP STGPREC                                                        
                                    PRIQTY 150000                               
                                    SECQTY 15000                                
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           CLUSTER                                                              
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
--==============================================================================
--  r11.5 SP0     CA-DB2 RC/MIGRATOR IMPACT ANALYSIS      07/04/16 23:10        
--==============================================================================
--                                                                              
--  OBJECT TYPE: TABLESPACE                 TOTAL:                1             
--                                                                              
--   OBJECT NAME/DBNAME          EDITED NEW NAME/DBNAME                         
--                                                                              
--   EXCPARCL                                                                   
--    DB2ADM                                                                    
--                                                                              
--  OBJECT TYPE: TABLE                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   EXCPARCL                                                                   
--    DB2ADM                                                                    
--                                                                              
--  OBJECT TYPE: INDEX                      TOTAL:                1             
--                                                                              
--   OBJECT NAME/CREATOR         EDITED NEW NAME/CREATOR                        
--                                                                              
--   EXCPARCL_IX1                                                               
--    DB2ADM                                                                    
