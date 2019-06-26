*---------------------------------------------------------------------
*
*                FIND STRING DE CARACTERES
*
*---------------------------------------------------------------------
FIND     CSECT
         STM   14,12,12(13)
         LR    12,15
         USING FIND,12
         ST    13,SAVEAREA+4
         LA    10,SAVEAREA
         ST    10,8(13)
         LR    13,10
         OPEN  (IN1,INPUT)
         GET   IN1,REC
         CLC   DSNU100I,CAMPO1
         GET   IN1,REC
         CLC   LOAD,CAMPO4
         BE    PARAR1
         CLC   REORG,CAMPO4
         BE    PARAR1
         CLC   RECOVERY,CAMPO4
         BE    PARAR1
LOOPLE1  GET   IN1,REC
         CLC   DSNU105I,CAMPO1
         CLC   LOAD,CAMPO4
         BE    PARAR
         CLC   REORG,CAMPO4
         BE    PARAR
         CLC   RECOVERY,CAMPO4
         BE    PARAR
         B     LOOPLE1
PARAR    CLOSE IN1
         WTO  '*************************************************'
         WTO  '        UTILITY ID STOPPED  NO DB2 D2P1 (ATIS)  *'
         WTO  '        AVISE O DBA ATIS ( BSC ) URGENTE        *'
         WTO  '        PROCESSO DE CLONE PARALISADO            *'
         WTO  '*************************************************'
         L     13,4(13)
         L     14,12(13)
         LM    2,12,28(13)
         LA    15,2000
         BR    14
PARAR1   CLOSE IN1
         WTO  '*************************************************'
         WTO  '        UTILITY ID PENDENTE NO DB2 D2P1 (ATIS)  *'
         WTO  '        AVISE O DBA ATIS ( BSC ) URGENTE        *'
         WTO  '        PROCESSO DE CLONE PARALISADO            *'
         WTO  '*************************************************'
         L     13,4(13)
         L     14,12(13)
         LM    2,12,28(13)
         LA    15,1000
         BR    14
CONTINUA CLOSE IN1
         L     13,4(13)
         L     14,12(13)
         LM    2,12,28(13)
         LA    15,0
         BR    14
IN1      DCB   DDNAME=INPUT1,EODAD=CONTINUA,MACRF=GM,DSORG=PS
SAVEAREA DS    18F
REC      DS    0CL137
CAMPO0   DC    CL01' '
CAMPO1   DC    CL08' '
CAMPO2   DC    CL08' '
CAMPO3   DC    CL10' '
CAMPO4   DC    CL08' '
CAMPO5   DC    CL102' '
DSNU100I DC    C'DSNU100I'
DSNU105I DC    C'DSNU105I'
LOAD     DC    C'LOAD'
REORG    DC    C'REORG'
RECOVERY DC    C'RECOVERY'
         END   FIND
