   SET CURRENT SQLID = 'DB2PROD' ;                                      00010035
   COMMIT ;                                                             00020035
--#SET TERMINATOR @                                                     00030035
-- DISPLAY PACKAGES USING REMOTE ALIAS AND DBPROTOCOL PRIVATE           00040035
-- AND LOCATION(S) WHERE THEY MUST BY REMOTELY BOUND                    00050035
   SELECT DISTINCT STRIP(DCOLLID, B) CONCAT '.' CONCAT STRIP(BNAME, B)  00060035
          CONCAT ' -- NEED BIND IN -- ' CONCAT STRIP(T.LOCATION, B)     00070035
     FROM SYSIBM.SYSTABLES T, SYSIBM.SYSPACKDEP PD, SYSIBM.SYSPACKAGE P 00080035
    WHERE T.TYPE = 'A'                                                  00090035
      AND T.CREATOR  = PD.BQUALIFIER                                    00100035
      AND T.NAME     = PD.BNAME                                         00110035
      AND PD.DCOLLID = P.COLLID                                         00120035
      AND PD.DNAME   = P.NAME                                           00130035
      AND PD.BTYPE   = 'A'                                              00140035
      AND P.DBPROTOCOL = 'P'                                            00150035
      AND T.LOCATION NOT IN ( ' ') -- EXCLUDE LOCAL ALIAS               00160035
   @                                                                    00170035
-- DISPLAY PLANS USING REMOTE ALIAS AND DBPROTOCOL PRIVATE              00670035
   SELECT DISTINCT STRIP(DNAME, B) AS PLANNAME                          00680035
     FROM SYSIBM.SYSTABLES T , SYSIBM.SYSPLANDEP PD, SYSIBM.SYSPLAN P   00690035
    WHERE T.TYPE       = 'A'                                            00700035
      AND T.CREATOR    = BCREATOR                                       00710035
      AND T.NAME       = BNAME                                          00720035
      AND PD.BTYPE     = 'A'                                            00730035
      AND PD.DNAME     = P.NAME                                         00740035
      AND P.DBPROTOCOL = 'P'                                            00750035
      AND LOCATION NOT IN ( ' ' ) -- EXCLUDE LOCAL ALIAS                00760035
   @                                                                    00770035
-- PLANS BELOW ARE DISTRIBUTED AND WERE BOUND USING DBPROTOCOL          00780035
-- PRIVATE; THEY ACCESS REMOTE ALIAS AND/OR 3 PART NAME OBJECT(S)       00790035
-- THEY MUST BE CHECKED AND MUST BE BOUND LOCAL USING DBPROTOCOL DRDA   00800035
-- ALL MEMBERS CONTAINED IN MEMBER LIST FOR EACH PLAN LISTED BELOW      00810035
-- MUST BE BOUND AS A PACKAGE IN LOCAL DB2 USING DBPROTOCOL DRDA;       00820035
-- MEMBER(S) LISTED HERE MUST BE BOUND IN THE REMOTE LOCATION ALSO.     00830035
-- PLAN(S) LISTED HERE AND WERE NOT LISTED IN THE PREVIOUS              00840035
-- SELECT MUST BE CHECKED INSIDE THEIR CODE BECAUSE THEY ARE USING      00850035
-- (ACCESSING) 3 PART NAME OBJECT(S)                                    00860035
-- YOU MUST LIST QUERIES INSIDE THEM TO KNOW WHERE THESE PACKAGES       00870035
-- MUST BE BOUND (THE FIRST PART OF EACH 3 PART NAME WILL LET YOU KNOW  00880035
-- THE LOCATION WHERE THIS PACKAGE MUST BE BOUND).                      00890035
-- THERE IS A REDUNDANCY IN PLAN NAME HERE AND IN PREVIOUS QUERY; THAT  00900035
-- WAS DONE TO LET YOU KNOW WHICH MEMBER MUST BE BOUND REMOTELY.        00910035
   SELECT DISTINCT ST.PLNAME, ST.NAME,                                  00920035
          CASE WHEN PL.DBPROTOCOL = 'P'                                 00930035
                 THEN 'DBPROTOCOL(DRDA)'                                00940035
                 ELSE ''                                                00950035
          END                                                           00960035
     FROM SYSIBM.SYSSTMT ST, SYSIBM.SYSPLAN PL                          00970035
    WHERE ST.STATUS IN ('A' , 'B' , 'D')                                00980035
      AND ST.PLNAME = PL.NAME                                           00990035
      AND PL.DBPROTOCOL = 'P'                                           01000035
     ORDER BY 1, 2                                                      01010035
   @                                                                    01020035
-- DISPLAY REMOTE ALIAS BEING USED BY PACKAGES AND/OR PLANS             01030035
-- THESE ALIAS MUST BE CREATED ON REMOTE SITE (THEY MUST BE ALIAS)      01040035
-- DISPLAY REMOTE ALIAS BEING USED BY PACKAGES                          01050035
-- OBS: IF THERE IS ANY 3 PART NAME OBJECT BEING USED BY ANY PLAN       01060035
--      OR PACKAGE (CHECKED IN PREVIOUS QUERIES) A CREATE ALIAS         01070035
--      COMMAND MUST BE CREATED FOR THEM ... TALK TO YOUR DBA BECAUSE   01080035
--      CREATE ALIAS FOR THESE OBJECTS WERE NOT INCLUDED HERE.          01090035
   SELECT DISTINCT ' CREATE ALIAS ' CONCAT                              01100035
          STRIP(CREATOR, B) CONCAT '.' CONCAT STRIP(NAME, B) CONCAT     01110035
          ' FOR ' CONCAT STRIP(LOCATION, B) CONCAT '.' CONCAT           01120035
          STRIP(TBCREATOR, B) CONCAT '.' CONCAT STRIP(TBNAME, B)        01130035
          CONCAT '; -- ' , LOCATION                                     01140035
     FROM SYSIBM.SYSTABLES , SYSIBM.SYSPACKDEP                          01150035
    WHERE TYPE = 'A'                                                    01160035
      AND CREATOR = BQUALIFIER                                          01170035
      AND NAME    = BNAME                                               01180035
      AND BTYPE   = 'A'                                                 01190035
      AND LOCATION NOT IN ( ' ' ) -- EXCLUDE LOCAL ALIAS                01200035
   UNION                                                                01210035
-- DISPLAY REMOTE ALIAS BEING USED BY PLANS                             01220035
   SELECT DISTINCT ' CREATE ALIAS ' CONCAT                              01230035
          STRIP(CREATOR, B) CONCAT '.' CONCAT STRIP(NAME, B) CONCAT     01240035
          ' FOR ' CONCAT STRIP(LOCATION, B) CONCAT '.' CONCAT           01250035
          STRIP(TBCREATOR, B) CONCAT '.' CONCAT STRIP(TBNAME, B)        01260035
          CONCAT '; -- ' , LOCATION                                     01270035
     FROM SYSIBM.SYSTABLES , SYSIBM.SYSPLANDEP                          01280035
    WHERE TYPE = 'A'                                                    01290035
      AND CREATOR = BCREATOR                                            01300035
      AND NAME    = BNAME                                               01310035
      AND BTYPE   = 'A'                                                 01320035
      AND LOCATION NOT IN ( ' ' ) -- EXCLUDE LOCAL ALIAS                01330035
    ORDER BY LOCATION                                                   01340035
   @                                                                    01350035
-- CREATE ALL EXISTING REMOTE ALIAS                                     01360035
   SELECT DISTINCT  'CREATE ALIAS ' CONCAT                              01370035
          STRIP(CREATOR, B) CONCAT '.' CONCAT STRIP(NAME, B) CONCAT     01380035
          ' FOR ' CONCAT STRIP(LOCATION, B) CONCAT '.' CONCAT           01390035
          STRIP(TBCREATOR, B) CONCAT '.' CONCAT STRIP(TBNAME, B)        01400035
          CONCAT '; -- ' , LOCATION                                     01410035
     FROM SYSIBM.SYSTABLES                                              01420035
    WHERE TYPE = 'A'                                                    01430035
      AND LOCATION NOT IN ( ' ' ) -- EXCLUDE LOCAL ALIAS                01440035
    ORDER BY LOCATION                                                   01450035
   @                                                                    01460035
FIM@                                                                    01461036
-- PACKAGES BELOW ARE DISTRIBUTED AND WERE BOUND USING DBPROTOCOL       01470036
-- PRIVATE; THEY ACCESS REMOTE ALIAS AND/OR 3 PART NAME OBJECT(S)       01480036
-- THEY MUST BE CHECKED AND MUST BE BOUND LOCAL AND REMOTELY            01490036
-- PACKAGES WHICH ARE LISTED HERE AND WERE NOT LISTED IN THE PREVIOUS   01500036
-- SELECT MUST BE CHECKED INSIDE THEIR CODE BECAUSE THEY ARE USING      01510036
-- (ACCESSING) 3 PART NAME OBJECT(S)                                    01520036
-- YOU MUST LIST QUERIES INSIDE THEM TO KNOW WHERE THESE PACKAGES       01530036
-- MUST BE BOUND (THE FIRST PART OF EACH 3 PART NAME WILL LET YOU KNOW  01540036
-- THE LOCATION WHERE THIS PACKAGE MUST BE BOUND).                      01550036
  SELECT DISTINCT                                                       01560036
          CASE WHEN PK.TYPE = 'T'                                       01570036
                 THEN 'REBIND TRIGGER PACKAGE('                         01580036
                 ELSE 'REBIND PACKAGE('                                 01590036
          END                                                           01600036
          CONCAT STRIP(PK.COLLID, B) CONCAT '.'                         01610036
          CONCAT STRIP(PK.NAME, B) CONCAT                               01620036
          CASE WHEN PK.VERSION <> ' '                                   01630036
                 THEN '.(' CONCAT STRIP(PS.VERSION, B) CONCAT ')'       01640036
                 ELSE ''                                                01650036
          END                                                           01660036
          CONCAT ') ' CONCAT                                            01670036
          CASE WHEN PK.DBPROTOCOL = 'P'                                 01680036
                 THEN 'DBPROTOCOL(DRDA)'                                01690036
                 ELSE ''                                                01700036
          END                                                           01710036
     FROM SYSIBM.SYSPACKSTMT PS, SYSIBM.SYSPACKAGE PK                   01720036
    WHERE STATUS IN ('A' , 'B' , 'D')                                   01730036
      AND PK.NAME = PS.NAME                                             01740036
      AND PK.COLLID = PS.COLLID                                         01750036
      AND PK.VERSION= PS.VERSION                                        01760036
      AND PK.DBPROTOCOL = 'P'                                           01770036
      AND NOT EXISTS (                                                  01780036
                       SELECT DISTINCT 'X'                              01790036
                         FROM SYSIBM.SYSTABLES T,                       01800036
                              SYSIBM.SYSPACKDEP PD,                     01810036
                              SYSIBM.SYSPACKAGE P                       01820036
                        WHERE T.TYPE = 'A'                              01830036
                          AND T.CREATOR  = PD.BQUALIFIER                01840036
                          AND T.NAME     = PD.BNAME                     01850036
                          AND PD.DCOLLID = P.COLLID                     01860036
                          AND PD.DCOLLID = PK.COLLID                    01870036
                          AND PD.DNAME   = PK.NAME                      01880036
                          AND PD.BTYPE   = 'A'                          01890036
                          AND P.DBPROTOCOL = 'P'                        01900036
                       -- EXCLUDE LOCAL ALIAS                           01910036
                          AND T.LOCATION NOT IN ( ' ' )                 01920036
                     )                                                  01930036
     ORDER BY 1                                                         01940036
   @                                                                    01950036
