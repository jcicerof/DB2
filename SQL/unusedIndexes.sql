-- https://ruban.de/db2zos/db2-zos-sql-check-for-unused-indexes/
--
--------------------------------------------------------------------------------
-- Check for unused indexes
-- Before dropping indexes, verify that following PTF's are installed.
-- RA10 PSY UK76968   UP12/03/27 P F203
-- R910 PSY UK76969   UP12/03/27 P F203
-- If not, LASTUSED is not being updated when an index is used to enforce a 
-- referential integrity constraint.
--------------------------------------------------------------------------------
-- 29.05.2012/G.Ruban: first version
--------------------------------------------------------------------------------
--
WITH DROPABLE AS (
    -- object selection via common table expression
	SELECT *
	FROM   SYSIBM.SYSINDEXSPACESTATS IS
	-- System Databases
	WHERE  DBNAME NOT LIKE 'DSN%'
	AND    DBNAME NOT LIKE 'BMC%'
	AND    DBNAME NOT IN ('CC390','DB2OSC')
	AND    CREATOR NOT IN ('Q')                     -- QMF
	-- these user objects should not be checked
	AND    CREATOR NOT IN ('MYPRODX','MYPRODT','MYPRODY')
	-- never used
	AND    LASTUSED IS NULL
	-- not part of static sql
	AND    NOT EXISTS (
		SELECT 1 
		FROM   SYSIBM.SYSPACKDEP
		WHERE  BQUALIFIER = IS.CREATOR
		AND    BNAME      = IS.NAME
		AND    BTYPE      = 'I'
		)
	-- not used in referential constraint	   
	AND    NOT EXISTS (
		SELECT 1 
		FROM   SYSIBM.SYSINDEXES
		WHERE  CREATOR    = IS.CREATOR
		AND    NAME       = IS.NAME
		AND    UNIQUERULE = 'P'
		) 
	)
SELECT 'DROP INDEX '!!LTRIM(CREATOR)!!'.'!!LTRIM(NAME)!!
       '; -- Index unused, '!!STRIP(CHAR(SPACE))!!' KB wasted space'       
--     *
FROM   DROPABLE
UNION ALL
SELECT '-- Total wasted space: '!!
       STRIP(CHAR(SUM(SPACE/1024))) !! ' MB' 
FROM   DROPABLE     
;
