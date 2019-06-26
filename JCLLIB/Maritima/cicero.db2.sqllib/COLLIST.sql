 SELECT COLTYPE,CHAR(','||                                              01100008
  CASE                                                                  01110009
    WHEN COLTYPE = 'SMALLINT' THEN 'DIGITS('||STRIP(NAME)||')'          01120010
    WHEN COLTYPE = 'DECIMAL'                                            01130009
         THEN 'CHAR('||STRIP(NAME)||')'                                 01131011
    WHEN COLTYPE = 'INTEGER' THEN 'DIGITS('||STRIP(NAME)||')'           01140010
    WHEN COLTYPE = 'FLOAT' THEN 'INTEGER('||STRIP(NAME)||')'            01150021
--  WHEN COLTYPE = 'FLOAT' THEN 'CHAR('||''''||'0.0'||''''||')'         01151020
    ELSE STRIP(NAME)                                                    01160009
  END||', CHAR('''||','||''')'                                          01170019
  ,80),COLNO                                                            01171012
   FROM SYSIBM.SYSCOLUMNS                                               01180001
  WHERE TBCREATOR = 'MARITIMA'                                          01190022
    AND TBNAME  = 'SENHA'                                               01200022
--WHERE TBCREATOR = 'DMRPR'                                             01201022
--  AND TBNAME  = 'DMRAPSUM'                                            01202022
  ORDER BY COLNO                                                        01210001
    WITH UR;                                                            01220001
