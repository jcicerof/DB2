CREATE TABLE ANO2000.CADAURSM                                                   
    ( CDSUCUR            SMALLINT NOT NULL ,                                    
      CDRMBAS            SMALLINT NOT NULL ,                                    
      NRAPOLI            INTEGER  NOT NULL ,                                    
      NRITEM             SMALLINT NOT NULL ,                                    
      NRENDOS            INTEGER  NOT NULL ,                                    
      NMDIGIT            CHAR     (6) NOT NULL ,                                
      CDSEGUR            INTEGER  NOT NULL ,                                    
      CDENDSEG           SMALLINT NOT NULL ,                                    
      CDRMCJ31           SMALLINT NOT NULL ,                                    
      CDRMCJ53           SMALLINT NOT NULL ,                                    
      CDRMCJ81           SMALLINT NOT NULL ,                                    
      CDRMCJ93           SMALLINT NOT NULL ,                                    
      NRCANCE            INTEGER  NOT NULL ,                                    
      TPCANCE            SMALLINT NOT NULL ,                                    
      CDUSCAN            SMALLINT NOT NULL ,                                    
      CDMTCAN            CHAR     (2) NOT NULL ,                                
      FLAGCAN            CHAR     (1) NOT NULL ,                                
      CDAUMES            SMALLINT NOT NULL ,                                    
      NRREATI            INTEGER  NOT NULL ,                                    
      CDUSREA            SMALLINT NOT NULL ,                                    
      DIASDEC            SMALLINT NOT NULL ,                                    
      DIASVIG            SMALLINT NOT NULL ,                                    
      NREDSOR            INTEGER  NOT NULL ,                                    
      NRVRSAM            INTEGER  NOT NULL ,                                    
      CDREGAM            SMALLINT NOT NULL ,                                    
      CDMRCAUT           SMALLINT NOT NULL ,                                    
      CDTIPAUT           SMALLINT NOT NULL ,                                    
      CAPACAUT           SMALLINT NOT NULL ,                                    
      CHASSAUT           CHAR     (18) NOT NULL ,                               
      CDCATAUT           SMALLINT NOT NULL ,                                    
      PLACAALF           CHAR     (3) NOT NULL ,                                
      PLACANUM           SMALLINT NOT NULL ,                                    
      CDVRMERC           SMALLINT NOT NULL ,                                    
      QTPARCL            SMALLINT NOT NULL ,                                    
      CDDSCATM           SMALLINT NOT NULL ,                                    
      CDANOUSO           SMALLINT NOT NULL ,                                    
      CDSTRENI           SMALLINT NOT NULL ,                                    
      NRITEATU           SMALLINT NOT NULL ,                                    
      FLAGEMIS           CHAR     (1) NOT NULL ,                                
      CDPLNASS           SMALLINT ,                                             
      IDADEVEI           SMALLINT ,                                             
      FLAGTRAV           CHAR     (1) ,                                         
      CDTRCIA            INTEGER  ,                                             
      NRAPOTRF           DECIMAL  (15,0) ,                                      
      NRITETRF           SMALLINT ,                                             
      CDPLNRES           SMALLINT ,                                             
      CDPLNFAT           SMALLINT ,                                             
      FLAGLBTR           CHAR     (1) ,                                         
      CDOPCION           SMALLINT ,                                             
      NRVISTO            DECIMAL  (11,0) ,                                      
      DTINIVG_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTTERVG_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTCANCE_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTMVCAN_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTREATI_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTMVREA_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTINIAM_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTTERAM_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      ANOAUTO_CNV        SMALLINT NOT NULL WITH DEFAULT ,                       
      DTMVEMI_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTEMINF_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTSUSAM_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      DTLIBAM_CNV        INTEGER  NOT NULL WITH DEFAULT ,                       
      FLAGLEAS           CHAR     (1) NOT NULL WITH DEFAULT ,                   
      CEPTRAF            INTEGER  NOT NULL WITH DEFAULT ,                       
      CDGARREP           SMALLINT NOT NULL WITH DEFAULT ,                       
      FLAGDESC           CHAR     (1) NOT NULL WITH DEFAULT ,                   
      TPDSCTRA           SMALLINT NOT NULL WITH DEFAULT ,                       
      NRCARFID           INTEGER  NOT NULL WITH DEFAULT ,                       
      NRSEQPER           SMALLINT NOT NULL WITH DEFAULT ,                       
      CDRASTVS           SMALLINT NOT NULL WITH DEFAULT ,                       
      CAPCARGA           DECIMAL  (5,2) NOT NULL WITH DEFAULT ,                 
      CEPLOCPE           INTEGER  NOT NULL WITH DEFAULT ,                       
      CDREGTF            SMALLINT NOT NULL WITH DEFAULT ,                       
      CDCOMBUS           SMALLINT NOT NULL WITH DEFAULT ,                       
      FLAGCOP            CHAR     (1) NOT NULL WITH DEFAULT ,                   
      NRAPOATU           INTEGER  NOT NULL WITH DEFAULT ,                       
      CDTRAVA            SMALLINT NOT NULL WITH DEFAULT ,                       
      IDCHSREM           CHAR     (1) NOT NULL WITH DEFAULT ,                   
      IDGARAG            CHAR     (1) NOT NULL WITH DEFAULT ,                   
      PCAGRAV            DECIMAL  (5,2) NOT NULL WITH DEFAULT ,                 
      IDMARANOANT        CHAR     (1) NOT NULL WITH DEFAULT ,                   
      IDCOBASTRED        CHAR     (1) NOT NULL WITH DEFAULT ,                   
      CDPES              INTEGER  NOT NULL WITH DEFAULT ,                       
      TPLOCEND           SMALLINT NOT NULL WITH DEFAULT ,                       
      CDEND              INTEGER  NOT NULL WITH DEFAULT ,                       
      CDBEM              INTEGER  NOT NULL WITH DEFAULT ,                       
      NRVRSBEM           SMALLINT NOT NULL WITH DEFAULT ,                       
      IDORC              CHAR     (1) NOT NULL WITH DEFAULT ,                   
      PCAGVBON           DECIMAL  (5,2) NOT NULL WITH DEFAULT ,                 
      IDBLQCMB           CHAR     (1) NOT NULL WITH DEFAULT ,                   
      IDSLOSGU           CHAR     (1) NOT NULL WITH DEFAULT ,                   
      IDATZSLOSGU        CHAR     (1) NOT NULL WITH DEFAULT ,                   
      CFRDUTAXCSC        DECIMAL  (11,8) NOT NULL WITH DEFAULT ,                
      PCBONFRQRDZ        DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCFDDFRQRDZ        DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCDESPFLFRQRDZ     DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCAGVIDDFRQRDZ     DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      PCAGVCDTEVTPFL     DECIMAL  (7,4) NOT NULL WITH DEFAULT ,                 
      IDSLOCTR           CHAR     (1) NOT NULL WITH DEFAULT 'N' ,               
      CDDDDTELCOA        SMALLINT NOT NULL WITH DEFAULT 0 ,                     
      NRTELCOA           INTEGER  NOT NULL WITH DEFAULT 0 ,                     
      NMCOA              CHAR     (30) NOT NULL WITH DEFAULT ' ' ,              
      IDRTDCMD           CHAR     (1) NOT NULL WITH DEFAULT 'N' ,               
      PCAGVAMSMAS        DECIMAL  (7,4) NOT NULL WITH DEFAULT 0 ,               
      CDIDFAPO           CHAR     (14) NOT NULL WITH DEFAULT '0' ,              
      PCAGVANOANT        DECIMAL  (7,4) NOT NULL WITH DEFAULT 0 ,               
      IDRNVCTACOR        CHAR     (1) NOT NULL WITH DEFAULT 'N' ,               
      IDREPPBR           CHAR     (1) NOT NULL WITH DEFAULT 'N' ,               
     PRIMARY KEY (CDSUCUR ,CDRMBAS ,NRAPOLI ,NRITEM , NRENDOS ) )               
    IN DBNOVA  .CADAURSM                                                        
    DATA CAPTURE CHANGES                                                        
    WITH RESTRICT ON DROP                                                       
    CCSID EBCDIC                                                                
  AUDIT NONE;                                                                   
-- ***** CARD= 809159 NPAGES= 42013                                             
-- **************************                                                   
-- ***** CREATE INDEXES *****                                                   
-- **************************                                                   
CREATE TYPE 2 UNIQUE INDEX ANO2000.CADAURSM_IX1 ON ANO2000.CADAURSM             
      ( CDSUCUR ASC ,                                                           
        CDRMBAS ASC ,                                                           
        NRAPOLI ASC ,                                                           
        NRITEM ASC ,                                                            
        NRENDOS ASC  )                                                          
    CLUSTER                                                                     
     (PART 1 VALUES(1,31,500000,32767,2147483647)                               
        USING STOGROUP STGP09I  PRIQTY 18144 SECQTY 1816 ERASE NO               
        FREEPAGE 0 PCTFREE 10 ,                                                 
      PART 2 VALUES(1,31,999999,32767,2147483647)                               
        USING STOGROUP STGP11I  PRIQTY 12240 SECQTY 1200 ERASE NO               
        FREEPAGE 0 PCTFREE 10 ,                                                 
      PART 3 VALUES(99,99,999999,32767,2147483647)                              
        USING STOGROUP STGP15I  PRIQTY 5280 SECQTY 528 ERASE NO                 
        FREEPAGE 0 PCTFREE 10  )                                                
    BUFFERPOOL BP2                                                              
    CLOSE YES ;                                                                 
-- ***** NLEAF= 4678 NLEVELS= 3                                                 
-- ***** FIRSTKEYCARD= 10 FULLKEYCARD= 809159                                   
CREATE TYPE 2  INDEX ANO2000.CADAURSM_IX2 ON ANO2000.CADAURSM                   
      ( CHASSAUT ASC  )                                                         
    USING STOGROUP STGP28I  PRIQTY 23760 SECQTY 2376 ERASE NO                   
    FREEPAGE 0 PCTFREE 10                                                       
    BUFFERPOOL BP2                                                              
    CLOSE YES ;                                                                 
-- ***** NLEAF= 4500 NLEVELS= 3                                                 
-- ***** FIRSTKEYCARD= 556696 FULLKEYCARD= 556696                               
CREATE TYPE 2  INDEX ANO2000.CADAURSM_IX3 ON ANO2000.CADAURSM                   
      ( PLACAALF ASC ,                                                          
        PLACANUM ASC  )                                                         
    USING STOGROUP STGP21I  PRIQTY 11520 SECQTY 1152 ERASE NO                   
    FREEPAGE 0 PCTFREE 10                                                       
    BUFFERPOOL BP2                                                              
    CLOSE YES ;                                                                 
-- ***** NLEAF= 2350 NLEVELS= 3                                                 
-- ***** FIRSTKEYCARD= 9227 FULLKEYCARD= 497389                                 
CREATE TYPE 2 UNIQUE INDEX ANO2000.CADAURSM_IX4 ON ANO2000.CADAURSM             
      ( CDSEGUR ASC ,                                                           
        CDSUCUR ASC ,                                                           
        CDRMBAS ASC ,                                                           
        NRAPOLI ASC ,                                                           
        NRITEM ASC ,                                                            
        NRENDOS ASC  )                                                          
    USING STOGROUP STGP09I  PRIQTY 29520 SECQTY 2952 ERASE NO                   
    FREEPAGE 0 PCTFREE 10                                                       
    BUFFERPOOL BP2                                                              
    PIECESIZE 2097152 K                                                         
    CLOSE YES ;                                                                 
-- ***** NLEAF= 5581 NLEVELS= 3                                                 
-- ***** FIRSTKEYCARD= 465274 FULLKEYCARD= 809159                               
-- **************************                                                   
-- ***** ALTER TABLE - FOREIGN KEYS*****                                        
-- **************************                                                   
-- **************************                                                   
-- ***** CREATE VIEWS   *****                                                   
-- **************************                                                   
CREATE VIEW DB2PDPRC.V_CADAURSM AS Select TAB.* from                            
        ANO2000.CADAURSM TAB INNER JOIN ANO2000.CADAPOL CAD ON (                
        TAB.CDSUCUR = CAD.CDSUCUR AND TAB.CDRMBAS = CAD.CDRMBAS AND             
        TAB.NRAPOLI = CAD.NRAPOLI AND TAB.NRENDOS = CAD. NRENDOS )              
        WHERE ( CAD.CDSUCUR = 03 OR (CAD.cdsucur = 04 and                       
        CAD.cdrmbas in (35,40,75,87,96)) OR (CAD.cdsucur = 01 and               
        CAD.cdrmbas = 31 and CAD.nrcorrt = 137 and CAD.nrcolab in (1,           
        207,7376)) OR (CAD.cdsucur = 01 and CAD.cdrmbas = 31 and                
        CAD.nrcorrt = 140 and CAD.nrcolab in (14,50,7376)) OR                   
        (CAD.cdsucur = 01 and CAD.cdrmbas = 31 and CAD.nrcorrt = 148            
        and CAD.nrcolab in (1,189,7376)) ) ;                                    
-- **************************                                                   
-- *****     DDL END    *****                                                   
-- **************************                                                   
