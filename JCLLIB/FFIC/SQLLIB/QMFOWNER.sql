SELECT *                                                                00010000
  FROM Q.OBJECT_DIRECTORY                                               00020001
 WHERE OWNER = 'IBM1S2N';                                               00021001
                                                                        00022001
SELECT *                                                                00030000
  FROM Q.OBJECT_REMARKS                                                 00040001
 WHERE OWNER = 'IBM1S2N';                                               00041001
                                                                        00042001
SELECT *                                                                00050000
  FROM Q.OBJECT_DATA                                                    00060001
 WHERE OWNER = 'IBM1S2N';                                               00070001
--                                                                      00080002
--UPDATE Q.OBJECT_DIRECTORY                                             00090002
--   SET OWNER = 'NEW_OWNER'                                            00091002
-- WHERE OWNER = 'IBM1S2N';                                             00100002
--                                                                      00110002
--UPDATE Q.OBJECT_REMARKS                                               00130002
--   SET OWNER = 'NEW_OWNER'                                            00131002
-- WHERE OWNER = 'IBM1S2N';                                             00140002
--                                                                      00150002
--UPDATE Q.OBJECT_DATA                                                  00170002
--   SET OWNER = 'NEW_OWNER'                                            00171002
-- WHERE OWNER = 'IBM1S2N';                                             00180002
