--                                                                      00000100
-- CRIACAO DE EXCEPTION TABLE                                           00001000
--                                                                      00002000
CREATE TABLE EPROJACT                                                   00010000
 LIKE DSN8810.PROJACT                                                   00020000
 IN DATABASE DSN8D81A;                                                  00030000
COMMIT;                                                                 00040000
                                                                        00041000
ALTER TABLE EPROJACT                                                    00050000
  ADD RID CHAR(4);                                                      00060000
COMMIT;                                                                 00070000
                                                                        00071000
ALTER TABLE EPROJACT                                                    00080000
  ADD TIME TIMESTAMP NOT NULL WITH DEFAULT;                             00090000
COMMIT;                                                                 00100000
