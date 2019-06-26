CREATE TABLE MARITIMA.EXCAURSM                                                  
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
      IDREPPBR           CHAR     (1) NOT NULL WITH DEFAULT 'N'  )              
    IN DBRE06  .EXCAURSM                                                        
    WITH RESTRICT ON DROP                                                       
    CCSID EBCDIC                                                                
  AUDIT NONE;                                                                   
-- ***** CARD= 81926 NPAGES= 7448                                               
-- **************************                                                   
-- ***** CREATE INDEXES *****                                                   
-- **************************                                                   
CREATE TYPE 2 UNIQUE INDEX MARITIMA.EXCAURSM_IX1 ON MARITIMA.EXCAURSM           
      ( CDSUCUR ASC ,                                                           
        CDRMBAS ASC ,                                                           
        NRAPOLI ASC ,                                                           
        NRITEM ASC ,                                                            
        NRENDOS ASC  )                                                          
     CLUSTER                                                                    
    USING STOGROUP STGP22I  PRIQTY 1872 SECQTY 480 ERASE NO                     
    FREEPAGE 0 PCTFREE 0                                                        
    BUFFERPOOL BP2                                                              
    CLOSE YES ;                                                                 
-- ***** NLEAF= 427 NLEVELS= 3                                                  
-- ***** FIRSTKEYCARD= 9 FULLKEYCARD= 81926                                     
-- **************************                                                   
-- ***** ALTER TABLE - FOREIGN KEYS*****                                        
-- **************************                                                   
-- **************************                                                   
-- ***** CREATE VIEWS   *****                                                   
-- **************************                                                   
-- *****   NO RELATED VIEWS                                                     
-- **************************                                                   
-- *****     DDL END    *****                                                   
-- **************************                                                   
