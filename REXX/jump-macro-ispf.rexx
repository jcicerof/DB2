 /*REXX****************************************************************/
 /* JUMP ......: ISPF EDIT file at cursor position                    */
 /*-------------------------------------------------------------------*/
 /* CALLED BY..: IKJEFT01   - TSO                                     */
 /* ARGUMENTS..: n/a      I -                                         */
 /* CALLS......: ISPEXEC  M - ISPF                                    */
 /* FILES......: n/a        - as selected at cursor position          */
 /*-------------------------------------------------------------------*/
 /* FUNCTION...: This edit macro allows the user to EDIT the dataset  */
 /*              located on the line that the cursor is on. Cursor    */
 /*              must be anywhere on the dataset name.                */
 /*              Use VIEW or BROWSE if EDIT not allowed.              */
 /*-------------------------------------------------------------------*/
 /* HISTORY....: 23.06.2009/Ruban V1R0                                */
 /*********************************************************************/
 x = MSG("OFF")

 /* TRACE ?R */

 Address ISREDIT
 "MACRO"
 "(MODE,SCLM) = SESSION"

 Address ISPEXEC "CONTROL ERRORS RETURN"
 Address ISPEXEC "VGET ZENVIR"
 ZIVER  = Substr(ZENVIR,6,1)                   /* get ISPF version    */
 If ZIVER >= 4                                 /* check ISPF version  */
 then do
      Address ISPEXEC "VGET ZPCFMCN PROFILE"   /* get confirm setting */
      If ZPCFMCN == '/'
      then CONF = 'YES'
      Else CONF = 'NO'
 End  /* if ZIVER */

 /*********************************************************************/
 /* get line where cursor placed on                                   */
 /*********************************************************************/
 "(row,col) = CURSOR"
 "(data1) = LINE " row              /* data1 = cursor line          */

 /*********************************************************************/
 /* Determine Dataset Name, first remove unwanted characters          */
 /*********************************************************************/
 srchdata = translate(data1,' ','=,"/\')      /* remove =."/\  */
 srchdata = translate(srchdata,' ',"'")       /* remove '      */
 /*say data1"->"srchdata*/

 dsword = 0
 do i=1 to words(srchdata)
    if wordindex(srchdata,i) <= col
    then dsword=i
 end
 if dsword > 0
 then do
      srchword = word(srchdata,dsword)
      if pos('(',srchword) = 1                     /* remove (....) */
      then do
           srchword = substr(srchword,2)
           if lastpos(')',srchword) = length(srchword)
           then srchword = left(srchword,length(srchword)-1)
      end
      dsn = srchword
      /*say dsn*/
 end
 else do
      ZEDLMSG = "Please, locate cursor on valid dataset name."
      address ISPEXEC "SETMSG MSG("ISRZ000")"
      "CURSOR = " row col /* put cursor back to last position     */
      Exit 0
 end
 /*******************************************************************/
 /* EDIT Recovery if necessary                                      */
 /*******************************************************************/
 editok = 'NOTOK'
 Do while editok = 'NOTOK'
   Address ISPEXEC "EDREC QUERY"
   If RC = 4 then do
     Address ISPEXEC "DISPLAY PANEL(ISREDM02)"
     DISPRC = RC
     Address ISPEXEC "VGET ZVERB"
       If DISPRC = 0 then do
         If ZEDCMD = '' then ,
           Address ISPEXEC "EDREC PROCESS PASSWORD("PSWD")"
         If ZEDCMD = 'C' then address ISPEXEC "EDREC CANCEL"
         If ZEDCMD = 'D' then address ISPEXEC "EDREC DEFER"
       End /* if RC = 0 */
       Else if DISPRC = 8 & ZVERB = 'CANCEL' then ,
           Address ISPEXEC "EDREC CANCEL"
       Else do
        "CURSOR = " row col /* put cursor back to last position     */
         Exit 0
       End
   End /* if RC = 4 */
   Else editok = 'OK'
 End  /* do while editok */
 If editok <> 'OK'
 then do
      If RC <> 0 then Address ISPEXEC "SETMSG MSG("ZERRMSG")"
     "CURSOR = " row col /* put cursor back to last position        */
 end
 /*******************************************************************/
 /* Check vor JES of TWS variables                                  */
 /*******************************************************************/
 if pos('&',dsn) > 0
 then do
      ZEDLMSG = "Dataset name contains (JES) variable starting ",
                "with ampersand (&). Cannot replace variables.",
                "(Check-out dataset name at cursor position.)"
      address ISPEXEC "SETMSG MSG("ISRZ000")"
 end
 /*******************************************************************/
 /* EDIT Dataset, or VIEW or BROWSE for fall-back reasons           */
 /*******************************************************************/
 rc = 0
 If ZIVER >= 4
 then s_confirm = "CONFIRM("conf")"
 else s_confirm = ""

 Address ISPEXEC mode" DATASET('"dsn"') "s_confirm
 if rc > 4
 then do
      Address ISPEXEC "VIEW DATASET('"dsn"')"
      if rc > 4
      then Address ISPEXEC "BROWSE DATASET('"dsn"')"
 end
 If RC <> 0 then Address ISPEXEC "SETMSG MSG("ZERRMSG")"
 "CURSOR = " row col /* put cursor back to last position        */
Exit 0
