--                                                                              
-- CREATE  TABLESPACE SSCOREPE                                                  
-- IN      DB2ADM                                                               
-- USING   STOGROUP DB2DATA                                                     
--                                     PRIQTY 71280                             
--                                     SECQTY 7128                              
--                                     ERASE NO                                 
--                      FREEPAGE 0                                              
--                      PCTFREE 0                                               
--                      COMPRESS YES                                            
--            BUFFERPOOL BP1                                                    
--            LOCKSIZE ANY                                                      
--            CLOSE YES                                                         
--            SEGSIZE 4                                                         
--            LOCKMAX SYSTEM                                                    
--            CCSID EBCDIC                                                      
--     ;                                                                        
--                                                                              
--                                                                              
--                                                                              
--                                                                              
--    COMMIT WORK;                                                              
--                                                                              
--                                                                              
-- CREATE  TABLESPACE SSSEGTIT                                                  
-- IN      DB2ADM                                                               
-- USING   STOGROUP DB2DATA                                                     
--                                     PRIQTY 103680                            
--                                     SECQTY 10320                             
--                                     ERASE NO                                 
--                      FREEPAGE 0                                              
--                      PCTFREE  0                                              
--            BUFFERPOOL BP1                                                    
--            LOCKSIZE ANY                                                      
--            CLOSE YES                                                         
--            SEGSIZE 4                                                         
--            LOCKMAX SYSTEM                                                    
--            CCSID EBCDIC                                                      
--     ;                                                                        
--                                                                              
--                                                                              
--                                                                              
--                                                                              
--    COMMIT WORK;                                                              
                                                                                
-- MARITIMA.SSCOREPE0408 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.         
                                                                                
                                                                                
CREATE  TABLE MARITIMA.SSCOREPE0408                                             
(       NRESTIPU SMALLINT NOT NULL                                              
,       NRSUBEST SMALLINT NOT NULL                                              
,       NRSEGURA INTEGER NOT NULL                                               
,       NRCARNE SMALLINT NOT NULL                                               
,       NRPARCEL SMALLINT NOT NULL                                              
,       NRNOSNUM INTEGER NOT NULL                                               
,       CDBANCO SMALLINT NOT NULL                                               
,       QTUSM DECIMAL ( 9 , 2 ) NOT NULL                                        
,       VRPAGAME DECIMAL ( 11 , 2 ) NOT NULL                                    
,       DTINIVIG DATE NOT NULL                                                  
,       DTTERVIG DATE NOT NULL                                                  
,       VREMITID DECIMAL ( 11 , 2 ) NOT NULL                                    
,       VRJUROS DECIMAL ( 9 , 2 ) NOT NULL                                      
,       VRMULTA DECIMAL ( 9 , 2 ) NOT NULL                                      
,       NMDEPTO CHAR ( 10 ) NOT NULL                                            
,       CDUSUAR CHAR ( 10 ) NOT NULL                                            
,       CDSUCURS SMALLINT NOT NULL                                              
,       CDINTCOB CHAR ( 1 ) NOT NULL                                            
,       FKESTIPU SMALLINT                                                       
,       FKSUBEST SMALLINT                                                       
,       FKSEGURA INTEGER                                                        
,       DTEMISSA DATE                                                           
,       DTPAGAME DATE                                                           
,       DTDOCOV2 DATE                                                           
,       DTPROPAG DATE                                                           
,       DTDEVOLU DATE                                                           
,       DTVENCIM DATE                                                           
,       DTCANCEL DATE                                                           
,       NRLOTE INTEGER                                                          
,       DTPAAGCO DATE                                                           
,       QTVIDAS SMALLINT                                                        
,       NMDESOAL CHAR ( 10 )                                                    
,       CDUSSOAL CHAR ( 10 )                                                    
,       NRPROPO DECIMAL ( 11 , 0 )                                              
,       DTCHQPRE DATE                                                           
,       VRCHQPRE DECIMAL ( 11 , 2 )                                             
,       VRAGEPAG DECIMAL ( 11 , 2 )                                             
,       VRCOMPAG DECIMAL ( 11 , 2 )                                             
,       DTREFEMI DATE NOT NULL                                                  
          WITH DEFAULT                                                          
,       PCIOF DECIMAL ( 7 , 4 )                                                 
   )                                                                            
IN      DB2ADM.SSCOREPE                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
COMMENT ON MARITIMA.SSCOREPE0408                                                
(       NRESTIPU IS 'NUMERO DO ESTIPULANTE'                                     
,       NRSUBEST IS 'NUMERO DO SUB-ESTIPULANTE'                                 
,       NRSEGURA IS 'NUMERO DO SEGURADO'                                        
,       NRCARNE IS 'NUMERO DO CARNE'                                            
,       NRPARCEL IS 'NUMERO DA PARCELA'                                         
,       NRNOSNUM IS 'NUMERO DO NOSSO NUMERO'                                    
,       CDBANCO IS 'CODIGO DO BANCO'                                            
,       QTUSM IS 'QUANTIDADE DE U.S.M.'                                         
,       VRPAGAME IS 'VALOR DO PAGAMENTO'                                        
,       DTINIVIG IS 'DATA DE INICIO DE VIGENCIA'                                
,       DTTERVIG IS 'DATA DE TERMINO DE VIGENCIA'                               
,       VREMITID IS 'VALOR EMITIDO'                                             
,       VRJUROS IS 'VALOR DOS JUROS'                                            
,       VRMULTA IS 'VALOR DA MULTA'                                             
,       NMDEPTO IS 'NOME DO DEPARTAMENTO'                                       
,       CDUSUAR IS 'CODIGO DO USUARIO'                                          
,       CDSUCURS IS 'CODIGO DA SUCURSAL'                                        
,       CDINTCOB IS 'CODIGO DE INTERFACE DE COBRANCA BANCARIA'                  
,       FKESTIPU IS 'NUMERO DO ESTIPULANTE'                                     
,       FKSUBEST IS 'NUMERO DO SUB-ESTIPULANTE'                                 
,       FKSEGURA IS 'NUMERO DO SEGURADO'                                        
,       DTEMISSA IS 'DATA DA EMISSAO'                                           
,       DTPAGAME IS 'DATA DO PAGAMENTO'                                         
,       DTDOCOV2 IS 'DATA DO DOCUMENTO DE COBRANCA VIA 2'                       
,       DTPROPAG IS 'DATA DO PROCESSAMENTO DO PAGAMENTO'                        
,       DTDEVOLU IS 'DATA DE DEVOLUCAO'                                         
,       DTVENCIM IS 'DATA DO VENCIMENTO'                                        
,       DTCANCEL IS 'DATA DE CANCELAMENTO'                                      
,       NRLOTE IS 'NUMERO DO LOTE'                                              
,       DTPAAGCO IS 'DATA DE PAGAMENTO DE AGENCIAMENTO OU COMISSAO'             
,       QTVIDAS IS 'QUANTIDADE DE VIDAS'                                        
,       NMDESOAL IS 'NOME DO DEPARTAMENTO SOLICITANTE DA ALTERACAO'             
,       CDUSSOAL IS 'CODIGO DO USUARIO SOLICITANTE DA ALTERACAO PARC.'          
,       NRPROPO IS 'NUMERO DA PROPOSTA'                                         
,       DTCHQPRE IS 'DATA DO CHEQUE PRE-DATADO'                                 
,       VRCHQPRE IS 'VALOR DO CHEQUE PRE-DATADO'                                
,       VRAGEPAG IS 'VALOR DE AGENCMTO PAGO'                                    
,       VRCOMPAG IS 'VALOR DE COMISSAO PAGO'                                    
,       DTREFEMI IS 'DATA DE REFERENCIA DA        EMISSAO'                      
,       PCIOF IS 'PERCENTUAL DE IOF.'                                           
                ) ;                                                             
COMMENT ON TABLE MARITIMA.SSCOREPE0408 IS 'COMPROVANTE DE RECEBIMENTO' ;        
                                                                                
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
-- SQLUSER.SSCOREPE0408 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.          
                                                                                
                                                                                
CREATE  TABLE MARITIMA.SSSEGTIT0408                                             
(       NRESTIPU SMALLINT NOT NULL                                              
,       NRSUBEST SMALLINT NOT NULL                                              
,       NRSEGURA INTEGER NOT NULL                                               
,       CDGRAPAR SMALLINT NOT NULL                                              
,       DGCHASEG SMALLINT NOT NULL                                              
,       NMSEGURA CHAR ( 30 ) NOT NULL                                           
,       CDFONETI CHAR ( 8 ) NOT NULL                                            
,       CDSITSEG CHAR ( 1 ) NOT NULL                                            
,       CDMOTCAN SMALLINT NOT NULL                                              
,       CDSITAPO CHAR ( 1 ) NOT NULL                                            
,       CDCONANT SMALLINT NOT NULL                                              
,       CDMOTSAI SMALLINT NOT NULL                                              
,       CDSEXO CHAR ( 1 ) NOT NULL                                              
,       NRRG DECIMAL ( 12 , 0 ) NOT NULL                                        
,       NRCPFSEG DECIMAL ( 11 , 0 ) NOT NULL                                    
,       CDLOENCO CHAR ( 1 ) NOT NULL                                            
,       CDBANREE SMALLINT NOT NULL                                              
,       CDAGEREE CHAR ( 6 ) NOT NULL                                            
,       NRCCOREE CHAR ( 13 ) NOT NULL                                           
,       DGCCOREE CHAR ( 2 ) NOT NULL                                            
,       CDBANCOB SMALLINT NOT NULL                                              
,       CDIDSEES DECIMAL ( 15 , 0 ) NOT NULL                                    
,       DSCARSEG CHAR ( 15 ) NOT NULL                                           
,       NRCARPRO INTEGER NOT NULL                                               
,       NRSECAPR CHAR ( 4 ) NOT NULL                                            
,       CDTABCAR SMALLINT NOT NULL                                              
,       DDESCVEN SMALLINT NOT NULL                                              
,       CDCONVIN CHAR ( 1 ) NOT NULL                                            
,       DTNASCIM DATE NOT NULL                                                  
,       DTADMISS DATE NOT NULL                                                  
,       DTRECPRO DATE NOT NULL                                                  
,       DTINCSIS DATE NOT NULL                                                  
,       DTPREMCV DATE NOT NULL                                                  
,       CDLOENCR CHAR ( 1 ) NOT NULL                                            
,       FKESTIPU SMALLINT                                                       
,       FKSUBEST SMALLINT                                                       
,       DTDEMISS DATE                                                           
,       DTINSESA DATE                                                           
,       DTTECOPR DATE                                                           
,       DTTESESA DATE                                                           
,       DTRESESA DATE                                                           
,       DTALTSIS DATE                                                           
,       DTEXCSIS DATE                                                           
,       DTEMCAID DATE                                                           
,       DTEM2VCI DATE                                                           
,       DTASSPRO DATE                                                           
,       DTOBITO DATE                                                            
,       DTMOVIME DATE                                                           
,       CDTABPAR SMALLINT                                                       
,       CDEMICAR SMALLINT                                                       
,       NRPROPO DECIMAL ( 11 , 0 )                                              
,       DTEMCAGE DATE                                                           
,       NMDEPTO CHAR ( 10 )                                                     
,       CDUSUAR CHAR ( 10 )                                                     
,       CDSUCUR SMALLINT                                                        
,       NRCORRET INTEGER NOT NULL                                               
,       NRINSPIA SMALLINT                                                       
,       NRINSPTR SMALLINT                                                       
,       DDESCREA SMALLINT                                                       
,       DGAGEREE CHAR ( 2 ) NOT NULL                                            
          WITH DEFAULT                                                          
,       DTEMICAR DATE                                                           
,       CDIDCCUS CHAR ( 15 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       NMMAESGR CHAR ( 30 ) NOT NULL                                           
          WITH DEFAULT                                                          
,       NRPISSGR DECIMAL ( 12 , 0 ) NOT NULL                                    
          WITH DEFAULT                                                          
,       TPVINSGR SMALLINT NOT NULL                                              
          WITH DEFAULT                                                          
1                                                                               
,       CDPAIORI SMALLINT                                                       
,       TPESTCIV SMALLINT                                                       
,       CDESTADO CHAR ( 2 )                                                     
,       CDCIDADE SMALLINT                                                       
,       CDORGEMR SMALLINT                                                       
,       DTEPDRG DATE                                                            
,       NRCRONALSAU DECIMAL ( 15 , 0 )                                          
,       NRDOC CHAR ( 30 )                                                       
,       TPDOC SMALLINT                                                          
,       SGUFEMIDOC CHAR ( 2 )                                                   
,       DTVLDDOC DATE                                                           
,       CDCBO CHAR ( 5 )                                                        
,       IDRPNLEG CHAR ( 1 ) NOT NULL                                            
          WITH DEFAULT                                                          
'N'                                                                             
,       IDCFMENRDOC CHAR ( 1 )                                                  
,       CDIDFSGRRDE CHAR ( 30 )                                                 
,       NRSEQRDECPM INTEGER                                                     
,       DTENVRDECPM DATE                                                        
   )                                                                            
IN      DB2ADM.SSSEGTIT                                                         
   CCSID         EBCDIC                                                         
   ;                                                                            
                                                                                
COMMENT ON MARITIMA.SSSEGTIT0408                                                
(       NRESTIPU IS 'NUMERO DO ESTIPULANTE'                                     
,       NRSUBEST IS 'NUMERO DO SUB-ESTIPULANTE'                                 
,       NRSEGURA IS 'NUMERO DO SEGURADO'                                        
,       CDGRAPAR IS 'CODIGO DO GRAU DE PARENTESCO'                              
,       DGCHASEG IS 'DIGITO DA CHAVE DO SEGURADO'                               
,       NMSEGURA IS 'NOME DO SEGURADO'                                          
,       CDFONETI IS 'CODIGO FONETICO'                                           
,       CDSITSEG IS 'CODIGO DA SITUACAO DO SEGURADO'                            
,       CDMOTCAN IS 'CODIGO DO MOTIVO DO CANCELAMENTO'                          
,       CDSITAPO IS 'CODIGO DA SITUACAO DE APOSENTADORIA'                       
,       CDCONANT IS 'CODIGO DO CONCORRENTE ANTERIOR'                            
,       CDMOTSAI IS 'CODIGO DO MOTIVO DA SAIDA'                                 
,       CDSEXO IS 'CODIGO DO SEXO'                                              
,       NRRG IS 'NUMERO DO R.G. (REGISTRO GERAL)'                               
,       NRCPFSEG IS 'NUMERO DO CPF DO SEGURADO'                                 
,       CDLOENCO IS 'CODIGO DO LOCAL P/ ENTREGA DE CORRESPONDENCIA'             
,       CDBANREE IS 'CODIGO DO BANCO P/ REEMBOLSO'                              
,       CDAGEREE IS 'CODIGO DE AGENCIA P/ REEMBOLSO'                            
,       NRCCOREE IS 'NUMERO DA C.CORRENTE P/ REEMBOLSO'                         
,       DGCCOREE IS 'DIGITO DA C.CORRENTE P/ REEMBOLSO'                         
,       CDBANCOB IS 'CODIGO DO BANCO P/ COBRANCA DE PREMIO'                     
,       CDIDSEES IS 'CODIGO DA IDENTIFICACAO DO SEGURADO NO ESTIPULANTE'        
,       DSCARSEG IS 'DESCRICAO DO CARGO DO SEGURADO'                            
,       NRCARPRO IS 'NUMERO DA CARTEIRA PROFISSIONAL'                           
,       NRSECAPR IS 'NUMERO DA SERIE DA CARTEIRA PROFISSIONAL'                  
,       CDTABCAR IS 'CODIGO DA TABELA DE CARENCIAS'                             
,       DDESCVEN IS 'DIA ESCOLHIDO PARA VENCIMENTO'                             
,       CDCONVIN IS 'CONDICAO DE VINCULO "D", "R", "C", "N"'                    
,       DTNASCIM IS 'DATA DO NASCIMENTO'                                        
,       DTADMISS IS 'DATA DA ADMISSAO'                                          
,       DTRECPRO IS 'DATA DO RECEBIMENTO DA PRODUCAO'                           
,       DTINCSIS IS 'DATA DA INCLUSAO NO SISTEMA'                               
,       DTPREMCV IS 'DATA DA PROXIMA EMISSAO DO COMPROVANTE DE VALIDADE'        
,       CDLOENCR IS 'CODIGO DO LOCAL P/ ENTREGA DE COBRANCA'                    
,       FKESTIPU IS 'NUMERO DO ESTIPULANTE'                                     
,       FKSUBEST IS 'NUMERO DO SUB-ESTIPULANTE'                                 
,       DTEM2VCI IS 'DATA EMISSAO DA 2A.VIA CARTAO IDENTIFICACAO'               
,       DTASSPRO IS 'DATA DE ASSINATURA DA PROPOSTA'                            
,       DTOBITO IS 'DATA DE OBITO'                                              
,       DTMOVIME IS 'DATA DO MOVIMENTO'                                         
,       CDTABPAR IS 'CODIGO TABELA PARAMETRO COMISSAO/AGENCIAM.'                
,       CDEMICAR IS 'CODIGO EMISSAO CARTA DE PARCELA EM ATRASO'                 
,       NRPROPO IS 'NUMERO DA PROPOSTA DO SEGURADO'                             
,       DTEMCAGE IS 'DATA EMISSAO CARTEIRINHA GESA'                             
,       NMDEPTO IS 'NOME DO DEPARTAMENTO'                                       
,       CDUSUAR IS 'CODIGO DO USUARIO'                                          
,       CDSUCUR IS 'CODIGO DA SUCURSAL'                                         
,       NRCORRET IS 'NUMERO DO CORRETOR'                                        
,       NRINSPIA IS 'NUMERO DA INSPETORIA'                                      
,       NRINSPTR IS 'NUMERO DO INSPETOR'                                        
,       DDESCREA IS 'DATA DE ESCOLHA DO VENCTO'                                 
,       DGAGEREE IS 'DIGITO DA AGENCIA'                                         
,       DTEMICAR IS 'DATA DE EMISSAO CARTA DE PARCELA EM ATRASO'                
,       CDIDCCUS IS 'CODIGO CENTRO DE CUSTO DA EMPRESA'                         
,       NMMAESGR IS 'NOME MAE SEGURADO'                                         
,       NRPISSGR IS 'NUMERO PIS SEGURADO'                                       
,       TPVINSGR IS 'TIPO VINCULO EMPREGATICIO'                                 
,       CDPAIORI IS 'CODIGO DO PAIS DE ORIGEM'                                  
,       TPESTCIV IS 'TIPO ESTADO CIVIL'                                         
,       CDESTADO IS 'CODIGO DO ESTADO'                                          
,       CDCIDADE IS 'CODIGO DA CIDADE'                                          
,       CDORGEMR IS 'CODIGO ORGAO EMISSOR'                                      
,       DTEPDRG IS 'DATA EXPEDICAO RG'                                          
,       NRCRONALSAU IS 'NUM.CARTAO NACIONAL SAUDE'                              
,       NRDOC IS 'NUMERO DOCUMENTO'                                             
,       TPDOC IS 'TIPO DOCUMENTO'                                               
,       SGUFEMIDOC IS 'SIGLA UF EMISSAO DOCUMENTO'                              
,       DTVLDDOC IS 'DATA VALIDADE DOCUMENTO'                                   
,       CDCBO IS 'COD CLASSIF BRAS OCUPACAO'                                    
,       IDRPNLEG IS 'INDIC REPRESENTANTE LEGAL'                                 
,       IDCFMENRDOC IS 'INDIC CONFIRMA ENTREGA DOC'                             
,       CDIDFSGRRDE IS                                                          
        'CODIGO IDENTIFICACAO SEGURADO REDE COMPLEMENTAR.'                      
,       NRSEQRDECPM IS 'NUM. SEQ. REDE COMPLEMENTAR SEGURADO TITULAR.'          
,       DTENVRDECPM IS 'DATA DE ENVIO A REDE COMPLEMENTAR.'                     
                ) ;                                                             
COMMENT ON TABLE MARITIMA.SSSEGTIT0408                                          
IS 'CADASTRO DE SEGURADO TITULAR' ;                                             
                                                                                
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
-- SQLUSER.SSSEGTIT0408 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.          
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- **************************************************************               
-- *                                                            *               
-- * INDEX CREATE AND ALTER STATEMENTS                          *               
-- *                                                            *               
-- **************************************************************               
                                                                                
                                                                                
-- MARITIMA.SSCOREPE0408_IX2 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSCOREPE0408_IX2 ON MARITIMA.SSCOREPE0408                
(       NRNOSNUM ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 17280                                
                                    SECQTY 1728                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE  0                                                 
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSCOREPE0408_IX3 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSCOREPE0408_IX3 ON MARITIMA.SSCOREPE0408                
(       DTPAGAME ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 4800                                 
                                    SECQTY 480                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX2 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX2 ON MARITIMA.SSSEGTIT0408                
(       CDFONETI ASC                                                            
,       NMSEGURA ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 10944                                
                                    SECQTY 1056                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           CLUSTER                                                              
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX3 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX3 ON MARITIMA.SSSEGTIT0408                
(       NRCPFSEG ASC                                                            
,       DTNASCIM ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 3888                                 
                                    SECQTY 384                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX4 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX4 ON MARITIMA.SSSEGTIT0408                
(       NRPROPO ASC                                                             
,       CDSITSEG ASC                                                            
,       DTTESESA ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 2448                                 
                                    SECQTY 240                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX5 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX5 ON MARITIMA.SSSEGTIT0408                
(       DTINCSIS ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 1200                                 
                                    SECQTY 96                                   
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX6 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX6 ON MARITIMA.SSSEGTIT0408                
(       NMSEGURA ASC                                                            
,       CDSITSEG ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 8880                                 
                                    SECQTY 864                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX7 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX7 ON MARITIMA.SSSEGTIT0408                
(       CDIDFSGRRDE ASC                                                         
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 2448                                 
                                    SECQTY 240                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX8 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  INDEX MARITIMA.SSSEGTIT0408_IX8 ON MARITIMA.SSSEGTIT0408                
(       NRSEQRDECPM ASC                                                         
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 2448                                 
                                    SECQTY 240                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSCOREPE0408_IX1 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX MARITIMA.SSCOREPE0408_IX1                                  
ON MARITIMA.SSCOREPE0408                                                        
(       NRESTIPU ASC                                                            
,       NRSUBEST ASC                                                            
,       NRSEGURA ASC                                                            
,       NRCARNE ASC                                                             
,       NRPARCEL ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 19440                                
                                    SECQTY 1920                                 
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           CLUSTER                                                              
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
    ;                                                                           
                                                                                
                                                                                
                                                                                
   COMMIT WORK;                                                                 
                                                                                
-- MARITIMA.SSSEGTIT0408_IX1 WILL BE CREATED VIA THESE NATIVE DB2 COMMANDS.     
                                                                                
                                                                                
                                                                                
CREATE  UNIQUE INDEX MARITIMA.SSSEGTIT0408_IX1                                  
ON MARITIMA.SSSEGTIT0408                                                        
(       NRESTIPU ASC                                                            
,       NRSUBEST ASC                                                            
,       NRSEGURA ASC                                                            
,       CDGRAPAR ASC                                                            
          )                                                                     
USING   STOGROUP DB2DATA                                                        
                                    PRIQTY 4272                                 
                                    SECQTY 384                                  
                                    ERASE NO                                    
                     FREEPAGE 0                                                 
                     PCTFREE 0                                                  
           BUFFERPOOL BP2                                                       
           CLOSE YES                                                            
           PIECESIZE 2G                                                         
    ;                                                                           
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.SSCOREPE0408 TO PUBLIC;                   
                                                                                
   COMMIT WORK;                                                                 
                                                                                
    GRANT SELECT                                                                
                    ON TABLE MARITIMA.SSSEGTIT0408 TO PUBLIC;                   
                                                                                
   COMMIT WORK;                                                                 
