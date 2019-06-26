CREATE PROCEDURE TISS.SPTISS003_Y (                                             
IN IN_NRGUITISS     CHAR(20),                                                   
IN IN_NRCNPJ        DECIMAL(14),                                                
IN IN_NRCPF         DECIMAL(11),                                                
IN IN_CDURA      INTEGER,                                                       
IN IN_CDTIPGUI     SMALLINT,                                                    
OUT OUT_VALIDO     CHAR(01),                                                    
OUT OUT_CODERRO     SMALLINT,                                                   
OUT OUT_CODSQL     INTEGER,                                                     
OUT OUT_MSGERRO     CHAR(60))                                                   
                                                                                
   FENCED                                                                       
   RESULT SET 1                                                                 
   LANGUAGE SQL                                                                 
   NOT DETERMINISTIC                                                            
   MODIFIES SQL DATA                                                            
   WLM ENVIRONMENT DB2PWLM                                                      
   ASUTIME NO LIMIT                                                             
   STAY RESIDENT YES                                                            
   PROGRAM TYPE MAIN                                                            
 --   fenced                                                                    
 --   RESULT SETS 1                                                             
 --   LANGUAGE SQL                                                              
 --   SPECIFIC REFC012A                                                         
 --   not deterministic                                                         
 --   COLLID fecha                                                              
  --  WLM ENVIRONMENT db2twlm                                                   
 --   asutime no limit                                                          
  --  stay resident no                                                          
--    program type main prog                                                    
                                                                                
--    commit on return no                                                       
--    RUN OPTIONS 'NOTEST(ALL,*,,VADTCPIP&10.2.14.33:*)'                        
------------------------------------------------------------------------        
    -- SQL Procedimento Armazenado                                              
    -- PROJETO TISS - SPTISS003                                                 
    -- data: 13/04/2007                                                         
    -- autor: Robson Braga Batista                                              
    -- Objetivos do programa: Validar Numero de guia TISS para prestador        
------------------------------------------------------------------------        
    -- 24/04/2008 - Eduardo PWI                                                 
    -- O APLICATIVO SA375A (DISTRIBUICAO DE GUIAS PARA O CANAL GRAFICA)         
    -- PERMITE, NO MAXIMO, FAIXAS COM 100 GUIAS. PARA OTIMIZAR O ACESSO         
    -- DA QUERY NA SSCTLDISGUIPTR E PREVENDO O CRESCIMENTO DO LIMITE DE         
    -- FAIXAS DISTRIBUIDAS, O RANGE DE PESQUISA DA GUIA TISS SERA' LIMITADO     
    -- A ATE' 500 GUIAS ANTERIORES AO NUMERO PESQUISADO.                        
------------------------------------------------------------------------        
    -- 07/01/2009 - Eduardo PWI - SSA0900080                                    
    -- Para as guias TISS pertencentes aos canais da grafica, o nzmero da       
    -- guia sera validado apenas em relagao ` faixa reservada e nco mais        
    -- quanto a distribuigao para o prestador ou tipo de guia                   
------------------------------------------------------------------------        
P1: BEGIN NOT ATOMIC                                                            
                                                                                
    DECLARE sqlcode integer;                                                    
--    DECLARE AT_END INTEGER DEFAULT 0;                                         
--    DECLARE NOT_FOUND CONDITION FOR SQLSTATE '02000';                         
--    DECLARE DUPLI_KEY CONDITION FOR SQLSTATE '23505';                         
                                                                                
    Declare W_STCNLDISGUI           CHAR(1);                                    
    Declare W_STTIPGUI              CHAR(1);                                    
    Declare W_CDPES             INTEGER;                                        
    Declare W_CDPES_DISTRIBUICAO    INTEGER;                                    
    Declare W_TPPES                 CHAR(01);                                   
    Declare W_TPDOC                 SMALLINT;                                   
    Declare W_NRDOC                 CHAR(30);                                   
    Declare W_CDTIPGUI              SMALLINT;                                   
    Declare W_NRGUITISS             DECIMAL(18);                                
    Declare W_FXGUITISS             CHAR(04);                                   
    Declare W_SQGUITISS             CHAR(14);                                   
    Declare W_NOVO_NUMERO           CHAR(18);                                   
    Declare W_CANAL                 CHAR(02);                                   
    Declare W_CDCNLDISGUI           SMALLINT;                                   
    Declare W_IDCNLGFC              CHAR(1);                                    
    Declare AUX_NRGUITISS     DECIMAL(18);                                      
    Declare AUX_SQGUITISS           DECIMAL(14);                                
    Declare W_NRINIITVRSV     DECIMAL(18);                                      
                                                                                
-----1. Os campos de entrada sco obrigatsrios                                   
------------Testa Guia TISS (I Obrigatsrio)------------------------             
IF  (IN_NRGUITISS is Null) OR  (IN_NRGUITISS = ' ') Then                        
    SET OUT_MSGERRO  = 'Guia TISS deve ser preenchida no parametro';            
    SET OUT_CODERRO  = 1;                                                       
    SET OUT_VALIDO   = NULL;                                                    
    SET OUT_CODSQL   = 0;                                                       
    GOTO FIM_PROG;                                                              
END IF;                                                                         
                                                                                
------------Testa NRCNPJ, NRCPF e CDURA (I Obrigatsrio)-------------------------
IF  (IN_NRCNPJ is Null OR  IN_NRCNPJ = 0)                                       
AND (IN_NRCPF is Null OR  IN_NRCPF = 0)                                         
AND (IN_CDURA is Null OR  IN_CDURA = 0) Then                                    
    SET OUT_MSGERRO = 'CNPJ, CPF ou Csdigo de URA deve ser preenchido no paramet
    SET OUT_CODERRO  = 1;                                                       
    SET OUT_VALIDO   = NULL;                                                    
    SET OUT_CODSQL   = 0;                                                       
    GOTO FIM_PROG;                                                              
END IF;                                                                         
                                                                                
------------Testa CDTIPQUI (I Obrigatsrio)--------                              
IF  (IN_CDTIPGUI is Null) OR  (IN_CDTIPGUI = 0) Then                            
    SET OUT_MSGERRO = 'Tipo de guia deve ser preenchido no parametro';          
    SET OUT_CODERRO  = 1;                                                       
    SET OUT_VALIDO   = NULL;                                                    
    SET OUT_CODSQL   = 0;                                                       
    GOTO FIM_PROG;                                                              
END IF;                                                                         
                                                                                
-----2. Transformar o nzmero da guia TISS informada (IN-NRGUITISS), de alfanumir
SET W_SQGUITISS     = substr(IN_NRGUITISS,1,14);                                
SET W_FXGUITISS     = substr(IN_NRGUITISS,16,4);                                
SET W_NOVO_NUMERO   = W_FXGUITISS || W_SQGUITISS;                               
SET W_NRGUITISS     = decimal(W_NOVO_NUMERO,18,0);                              
                                                                                
-----3. Verificar se canal de distribuigco da guia TISS pertence ` grafica      
SET W_CANAL         = substr(IN_NRGUITISS,16,2);                                
SET W_CDCNLDISGUI   = smallint(W_CANAL);                                        
                                                                                
SELECT IDCNLGFC                                                                 
INTO    W_IDCNLGFC                                                              
FROM SQLUSER.SSCNLDISGUI                                                        
WHERE   CDCNLDISGUI = W_CDCNLDISGUI                                             
WITH UR;                                                                        
                                                                                
SET OUT_CODSQL = SQLCODE ;                                                      
                                                                                
IF OUT_CODSQL <> 0 Then                                                         
   IF OUT_CODSQL = 100 THEN                                                     
      SET OUT_CODERRO = 0;                                                      
      SET OUT_VALIDO   = 'N';                                                   
      SET OUT_MSGERRO = 'Canal de distribuigao nao cadastrado';                 
      GOTO FIM_PROG  ;                                                          
   Else                                                                         
       SET OUT_CODERRO = 2;                                                     
       SET OUT_VALIDO   = NULL;                                                 
       SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSCNLDISGUI SQLCODE = ' || CHA
       GOTO FIM_PROG  ;                                                         
   END IF;                                                                      
END IF;                                                                         
                                                                                
IF W_IDCNLGFC = 'S' THEN                                                        
-- SSA0900080 - a partir daqui, as linhas abaixo foram inibidas para a validagco
                                                                                
-----3.1 Monta primeiro nzmero da faixa da guia TISS informada                  
--    SET AUX_SQGUITISS = decimal(W_SQGUITISS,14,0);                            
--    SET AUX_SQGUITISS = AUX_SQGUITISS - 500;                                  
                                                                                
--    IF AUX_SQGUITISS < 1 THEN                                                 
--        SET W_SQGUITISS   = '00000000000001';                                 
--    ELSE                                                                      
--        SET W_SQGUITISS   = char(digits(AUX_SQGUITISS));                      
--    END IF;                                                                   
                                                                                
--    SET W_FXGUITISS   = substr(IN_NRGUITISS,16,4);                            
--    SET W_NOVO_NUMERO = W_FXGUITISS || W_SQGUITISS;                           
--    SET AUX_NRGUITISS = decimal(W_NOVO_NUMERO,18,0);                          
                                                                                
-----3.2 Verifica se nzmero de guia TISS esta cadastrado em algum intervalo dist
--    SELECT  CDPES,                                                            
--            CDTIPGUI                                                          
--    INTO    W_CDPES_DISTRIBUICAO,                                             
--            W_CDTIPGUI                                                        
--    FROM    SQLUSER.SSCTLDISGUIPTR                                            
--    WHERE   NRINIITVDIS BETWEEN AUX_NRGUITISS AND W_NRGUITISS                 
--    AND     NRFNLITVDIS >= W_NRGUITISS                                        
--    AND     STITVDIS = 'A'                                                    
--    WITH UR;                                                                  
                                                                                
--    SET OUT_CODSQL = SQLCODE ;                                                
                                                                                
--    IF OUT_CODSQL <> 0 Then                                                   
--       IF OUT_CODSQL = 100 THEN                                               
--          SET OUT_CODERRO = 0;                                                
--          SET OUT_VALIDO   = 'N';                                             
--          SET OUT_MSGERRO = 'Guia TISS nao cadastrada';                       
--          GOTO FIM_PROG  ;                                                    
--       Else                                                                   
--           SET OUT_CODERRO = 2;                                               
--           SET OUT_VALIDO   = NULL;                                           
--           SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSCTLDISGUIPTR(1) SQLCOD
--           GOTO FIM_PROG  ;                                                   
--       END IF;                                                                
--    END IF;                                                                   
                                                                                
-- SSA0900080 - ati aqui, as linhas acima foram inibidas para a validagco de gui
                                                                                
-----3.1 Verifica se nzmero de guia TISS esta cadastrado na faixa reservada para
    SELECT  NRINIITVRSV                                                         
    INTO    W_NRINIITVRSV                                                       
    FROM    SQLUSER.SSCTLRSVGUI                                                 
    WHERE   W_NRGUITISS BETWEEN NRINIITVRSV AND NRFNLITVRSV                     
    AND     STITVRSV = 'A'                                                      
    WITH UR;                                                                    
                                                                                
    SET OUT_CODSQL = SQLCODE ;                                                  
                                                                                
    IF OUT_CODSQL <> 0 Then                                                     
       IF OUT_CODSQL = 100 THEN                                                 
          SET OUT_CODERRO = 0;                                                  
          SET OUT_VALIDO   = 'N';                                               
          SET OUT_MSGERRO = 'Guia TISS nao cadastrada';                         
          GOTO FIM_PROG  ;                                                      
       Else                                                                     
           SET OUT_CODERRO = 2;                                                 
           SET OUT_VALIDO   = NULL;                                             
           SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSCTLRSVGUI(1) SQLCODE = '
           GOTO FIM_PROG  ;                                                     
       END IF;                                                                  
    END IF;                                                                     
                                                                                
ELSE                                                                            
-----3.3 Verifica se nzmero de guia TISS esta cadastrado (neste caso, i gerado 1
    SELECT  CDPES,                                                              
            CDTIPGUI                                                            
    INTO    W_CDPES_DISTRIBUICAO,                                               
            W_CDTIPGUI                                                          
    FROM    SQLUSER.SSCTLDISGUIPTR                                              
    WHERE   NRINIITVDIS =  W_NRGUITISS                                          
    AND     STITVDIS = 'A'                                                      
    WITH UR;                                                                    
                                                                                
    SET OUT_CODSQL = SQLCODE ;                                                  
                                                                                
    IF OUT_CODSQL <> 0 Then                                                     
       IF OUT_CODSQL = 100 THEN                                                 
          SET OUT_CODERRO = 0;                                                  
          SET OUT_VALIDO   = 'N';                                               
          SET OUT_MSGERRO = 'Guia TISS nao cadastrada';                         
          GOTO FIM_PROG  ;                                                      
       Else                                                                     
           SET OUT_CODERRO = 2;                                                 
           SET OUT_VALIDO   = NULL;                                             
           SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSCTLDISGUIPTR(2) SQLCODE 
           GOTO FIM_PROG  ;                                                     
       END IF;                                                                  
    END IF;                                                                     
END IF;                                                                         
                                                                                
----4. Verifica se prestador de servigo esta cadastrado para o CNPJ ou CPF infor
IF (IN_NRCNPJ > 0 AND IN_NRCNPJ IS NOT NULL)                                    
  OR (IN_NRCPF > 0 AND IN_NRCPF IS NOT NULL) Then                               
                                                                                
  IF IN_NRCNPJ > 0 Then                                                         
     SET W_NRDOC = digits(IN_NRCNPJ);                                           
  ELSE                                                                          
     SET W_NRDOC = digits(IN_NRCPF);                                            
  END IF;                                                                       
                                                                                
   SELECT A.CDPES,                                                              
          A.TPPES                                                               
   INTO   W_CDPES,                                                              
          W_TPPES                                                               
   FROM   SQLUSER.SSPESREF A,                                                   
          SQLUSER.SSIDFPES B,                                                   
          SQLUSER.SSDOCPES C                                                    
   WHERE C.NRDOC    =   W_NRDOC                                                 
   AND   C.TPDOC    IN  (1, 2)                                                  
   AND   B.CDIDFPES =   2                                                       
   AND   A.CDPES    =   B.CDPES                                                 
   AND   A.CDPES    =   C.CDPES                                                 
   WITH UR;                                                                     
                                                                                
   SET OUT_CODSQL = SQLCODE;                                                    
                                                                                
   IF OUT_CODSQL = 100 Then                                                     
     SET OUT_CODERRO = 1;                                                       
     SET OUT_VALIDO   = NULL;                                                   
     SET OUT_MSGERRO = 'Prestador nao cadastrado para o CNPJ/CPF informado';    
     GOTO FIM_PROG;                                                             
   Else                                                                         
      IF OUT_CODSQL <> 0 Then                                                   
         SET OUT_CODERRO = 2;                                                   
         SET OUT_VALIDO   = NULL;                                               
         SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSPESREF/SSIDFPES/SSDOCPES S
         GOTO FIM_PROG;                                                         
      END IF;                                                                   
   END IF;                                                                      
Else                                                                            
----5. Verifica se prestador de servigo esta cadastrado para o csdigo de URA inf
  IF (IN_CDURA <> 0 AND IN_CDURA IS NOT NULL) Then                              
                                                                                
     SELECT CDPTR                                                               
     INTO   W_CDPES                                                             
     FROM   SQLUSER.SSUNIPRT                                                    
     WHERE  CDURA       =   IN_CDURA                                            
     FETCH FIRST 1 ROWS ONLY                                                    
     WITH UR;                                                                   
                                                                                
     SET OUT_CODSQL = SQLCODE;                                                  
                                                                                
     IF OUT_CODSQL = 100 Then                                                   
       SET OUT_CODERRO = 1;                                                     
       SET OUT_VALIDO   = NULL;                                                 
       SET OUT_MSGERRO = 'Prestador nao cadastrado para o codigo de URA informad
       GOTO FIM_PROG;                                                           
     Else                                                                       
        IF OUT_CODSQL <> 0 Then                                                 
          SET OUT_CODERRO = 2;                                                  
          SET OUT_VALIDO   = NULL;                                              
          SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSUNIPRT SQLCODE = ' || CHA
          GOTO FIM_PROG;                                                        
        END IF;                                                                 
     END IF;                                                                    
                                                                                
     SELECT A.TPPES                                                             
     INTO   W_TPPES                                                             
     FROM   SQLUSER.SSPESREF A,                                                 
            SQLUSER.SSIDFPES B                                                  
     WHERE  A.CDPES     =   W_CDPES                                             
     AND    B.CDIDFPES  =   2                                                   
     AND    A.CDPES     =   B.CDPES                                             
     WITH UR;                                                                   
                                                                                
     SET OUT_CODSQL = SQLCODE;                                                  
                                                                                
     IF OUT_CODSQL = 100 Then                                                   
       SET OUT_CODERRO = 1;                                                     
       SET OUT_VALIDO   = NULL;                                                 
       SET OUT_MSGERRO = 'Pessoa nao cadastrada para o codigo de prestador selec
       GOTO FIM_PROG;                                                           
     Else                                                                       
        IF OUT_CODSQL <> 0 Then                                                 
          SET OUT_CODERRO = 2;                                                  
          SET OUT_VALIDO   = NULL;                                              
          SET OUT_MSGERRO = 'ERRO NO ACESSO A TABELA SSPESREF/SSIDFPES SQLCODE =
          GOTO FIM_PROG;                                                        
        END IF;                                                                 
     END IF;                                                                    
  END IF;                                                                       
END IF;                                                                         
                                                                                
-- SSA0900080 - Nco valida prestador e tipo de guia, quando a guia TISS informad
                                                                                
IF W_IDCNLGFC <> 'S' THEN                                                       
-----6. Verificar se a guia TISS pertence ao prestador informado----------------
        IF W_CDPES_DISTRIBUICAO <> W_CDPES Then                                 
           SET OUT_CODERRO = 0;                                                 
           SET OUT_VALIDO   = 'N';                                              
           SET OUT_CODSQL = 0;                                                  
           SET OUT_MSGERRO = 'Guia TISS nao pertence ao prestador informado';   
           GOTO FIM_PROG  ;                                                     
        END IF;                                                                 
                                                                                
-----7. Verificar se o tipo da guia TISS informado esta correto-----------------
        IF IN_CDTIPGUI <> W_CDTIPGUI Then                                       
                   SET OUT_CODERRO = 0;                                         
           SET OUT_VALIDO   = 'N';                                              
           SET OUT_CODSQL = 0;                                                  
           SET OUT_MSGERRO = 'Tipo de guia TISS cadastrado diverge do informado'
           GOTO FIM_PROG  ;                                                     
        END IF;                                                                 
END IF;                                                                         
                                                                                
-----8. Encerra o programa -----------------------------------------------------
SET OUT_CODSQL    = 0 ;                                                         
SET OUT_VALIDO   = 'S';                                                         
SET OUT_CODERRO   = 0;                                                          
SET OUT_MSGERRO   = ' ';                                                        
                                                                                
FIM_PROG:                                                                       
SET OUT_MSGERRO = OUT_MSGERRO ;                                                 
END P1                                                                          
