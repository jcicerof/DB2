RENAME CSPPUSER.DSN_FUNCTION_TABLE TO DSN_FUNCTION_TABLE_OLD;           00040004
RENAME MVSPUSER.DSN_FUNCTION_TABLE TO DSN_FUNCTION_TABLE_OLD;           00050004
RENAME CSPPUSER.DSN_STATEMNT_TABLE TO DSN_STATEMNT_TABLE_OLD;           00060004
RENAME MVSPUSER.DSN_STATEMNT_TABLE TO DSN_STATEMNT_TABLE_OLD;           00070004
RENAME CSPPUSER.PLAN_TABLE         TO PLAN_TABLE_OLD;                   00080004
RENAME MVSPUSER.PLAN_TABLE         TO PLAN_TABLE_OLD;                   00090004
COMMIT;                                                                 00100002
CREATE TABLE CSPPUSER.DSN_FUNCTION_TABLE LIKE                           00110002
             CSPPUSER.DSN_FUNCTION_TABLE_OLD;                           00111002
COMMIT;                                                                 00112002
CREATE TABLE MVSPUSER.DSN_FUNCTION_TABLE LIKE                           00120002
             MVSPUSER.DSN_FUNCTION_TABLE_OLD;                           00121002
COMMIT;                                                                 00122002
CREATE TABLE CSPPUSER.DSN_STATEMNT_TABLE LIKE                           00130002
             CSPPUSER.DSN_STATEMNT_TABLE_OLD;                           00131002
COMMIT;                                                                 00132002
CREATE TABLE MVSPUSER.DSN_STATEMNT_TABLE LIKE                           00140002
             MVSPUSER.DSN_STATEMNT_TABLE_OLD;                           00141002
COMMIT;                                                                 00142002
CREATE TABLE CSPPUSER.PLAN_TABLE         LIKE                           00150002
             CSPPUSER.PLAN_TABLE_OLD;                                   00151002
COMMIT;                                                                 00152002
CREATE TABLE MVSPUSER.PLAN_TABLE         LIKE                           00160002
             MVSPUSER.PLAN_TABLE_OLD;                                   00170002
COMMIT;                                                                 00180002
