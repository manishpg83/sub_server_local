    MEMBER
 INCLUDE('ABTblSyn.INC'),ONCE
 INCLUDE('ABERROR.INC'),ONCE
    MAP
    FileSynchronizationClassAsynchronicLoad(STRING S),PRIVATE
    END

FileSynchronizationClass.Destruct                      PROCEDURE()
 CODE
    IF NOT SELF.Filter &= NULL
       DISPOSE(SELF.Filter)
    END

    SELF.RecordPositionField &= NULL
    SELF.FreeElement &= NULL
    SELF.LowLimit    &= NULL
    SELF.HighLimit   &= NULL


FileSynchronizationClass.Init                          PROCEDURE(FILE pTargetFile,FILE pOriginalFile)
lIndex      SHORT
lAuxKey     &KEY
 CODE
    SELF.UseLogout        = True
    SELF.StartTransaction = True
    IF pOriginalFile{PROP:SupportsOp,DriverOp:LOGOUT}=0
       SELF.UseLogout        = False
       SELF.StartTransaction = False
    END
    SELF.RecordsToRead    = 0 !ALL
    SELF.SaveOnKill       = False
    SELF.Target           &=pTargetFile
    SELF.Original         &=pOriginalFile
    SELF.LimitType        = 0 !Default to no Range Limit
    SELF.Silent           = True
    SELF.OptimizeSave     = False
    SELF.BackupOnSave     = True
    SELF.LoadSuccess      = False
    SELF.UseSQL           = False
    SELF.UseBuffer        = True
    IF NOT SELF.Filter &= NULL
       DISPOSE(SELF.Filter)
    END
    LOOP lIndex = 1 TO SELF.Original{PROP:Keys}
         lAuxKey &= SELF.Original{PROP:Key,lIndex}
         IF lAuxKey{PROP:PRIMARY}
            SELF.PrimaryKey &= lAuxKey
            BREAK
         ELSE
            IF NOT lAuxKey{PROP:DUP}
               SELF.PrimaryKey &= lAuxKey
            END
         END
    END
    SELF.Killed = False


FileSynchronizationClass.SetFilter                     PROCEDURE(STRING pRecordFilter)
 CODE
    IF CLIP(pRecordFilter)
       IF NOT SELF.Filter &= NULL
          DISPOSE(SELF.Filter)
       END
       SELF.Filter &= NEW(STRING(LEN(CLIP(pRecordFilter))))
       SELF.Filter = pRecordFilter
    ELSE
       IF NOT SELF.Filter &= NULL
          DISPOSE(SELF.Filter)
       END
    END


!IF pRecordsToRead = 0 all the records will be read
FileSynchronizationClass.SetRecordsToRead              PROCEDURE(LONG pRecordsToRead)
 CODE
    SELF.RecordsToRead    = pRecordsToRead


FileSynchronizationClass.SetRecordPositionField        PROCEDURE(*? FieldFromTargetFile)
 CODE
    SELF.RecordPositionField &= FieldFromTargetFile
    SELF.OptimizeSave         = True


! Will clear the target file
FileSynchronizationClass.Reset                         PROCEDURE(BYTE Force=0)
OldStatus   BYTE
RetVal      BYTE
lMode       BYTE
 CODE
    OldStatus = STATUS(SELF.Target)
    IF OldStatus
       IF RECORDS(SELF.Target)=0
          RETURN Level:Benign
       END
       CLOSE(SELF.Target)
    END
    lMode = 12h
    LOOP
       OPEN(SELF.Target,lMode)
       CASE ERRORCODE()
       OF 0 !No Error
          EMPTY(SELF.Target)
          CLOSE(SELF.Target)
          RetVal = Level:Benign
       OF 5 !Access Denied
          IF lMode=12h
             lMode=22h
             CYCLE
          END
          RetVal = Level:Fatal
       OF 2 !File Not Found
          IF SELF.Target{PROP:Driver}='MEMORY'
             CREATE(SELF.Target)
             IF ERRORCODE()
                SELF.SHOWERROR('FileSync - Reset','Error Creating the Memory File.'&'|FileName:'&SELF.Target{PROP:Name}&'|Driver:'&SELF.Target{PROP:Driver})
                RetVal = Level:Fatal
                BREAK
             END
          END
          RetVal = Level:Benign
          CYCLE
       ELSE
          SELF.SHOWERROR('FileSync - Reset','Error Opening the Memory File.'&'|FileName:'&SELF.Target{PROP:Name}&'|Driver:'&SELF.Target{PROP:Driver})
          RetVal = Level:Fatal
       END
       BREAK
    END
    IF OldStatus
       OPEN(SELF.Target,OldStatus)
       IF ERRORCODE() THEN RETURN Level:Fatal.
    END
    RETURN RetVal

FileSynchronizationClass.Open                          PROCEDURE()
RetVal            BYTE
lOriginalOpenMode BYTE
 CODE
    SELF.SyncError = 0
    SELF.SyncErrorCode = ''
    lOriginalOpenMode = 42h
    SELF.OldStatusTarget = STATUS(SELF.Target)
    IF NOT SELF.OldStatusTarget
       LOOP
          OPEN(SELF.Target,42h)
          CASE ERRORCODE()
          OF 0! No Error
             SELF.OldStatusTarget = False
             RetVal = Level:Benign
             BREAK
          OF 2! FileNotFound
             CREATE(SELF.Target)
             IF ERRORCODE() THEN RETURN Level:Fatal.
             CYCLE
          OF 52! File Already Open
             SELF.OldStatusTarget = STATUS(SELF.Target)
             BREAK
          ELSE
             SELF.SyncError = ERROR()
             SELF.SyncErrorCode = ERRORCODE()
             SELF.SHOWERROR('FileSync - Open','Error Opening the Memory File.')
             RETURN Level:Fatal
          END
       END
    END
    IF RetVal = Level:Benign
       SELF.OldStatusOrigin = STATUS(SELF.Original)
       IF NOT SELF.OldStatusOrigin
          LOOP
             OPEN(SELF.Original,lOriginalOpenMode)
             CASE ERRORCODE()
             OF 0! No Error
                SELF.OldStatusOrigin = False
                BREAK
             OF 2! FileNotFound
                CREATE(SELF.Original)
                IF ERRORCODE() THEN RETURN Level:Fatal.
                CYCLE
             OF 5!Access Denied
                IF lOriginalOpenMode=42h
                   lOriginalOpenMode = 40h
                   IF SELF.Silent=False AND SELF.SaveOnKill
                      SELF.SHOWERROR('FileSync - Open','Error Opening the Physical file.|The File will be open as Read Only and|will not be saved back to the original file|when the program finish.'&'|File:'&SELF.Original{PROP:Name})
                   END
                   SELF.SaveOnKill = False
                   CYCLE
                ELSE
                   SELF.SyncError = ERROR()
                   SELF.SyncErrorCode = ERRORCODE()
                   SELF.SHOWERROR('FileSync - Open','Error Opening the Physical file.'&'|File:'&SELF.Original{PROP:Name})
                   RetVal = Level:Fatal
                   BREAK
                END
             OF 52! File Already Open
                SELF.OldStatusOrigin = STATUS(SELF.Original)
                BREAK
             ELSE
                SELF.SyncError = ERROR()
                SELF.SyncErrorCode = ERRORCODE()
                SELF.SHOWERROR('FileSync - Open','Error Opening the Physical file.'&'|File:'&SELF.Original{PROP:Name})
                RetVal = Level:Fatal
                BREAK
             END
          END
       END
    ELSE
    END
 RETURN RetVal

FileSynchronizationClass.Close                         PROCEDURE()
RetVal            BYTE
 CODE
    IF NOT SELF.OldStatusOrigin
       CLOSE(SELF.Original)
    END
    IF NOT SELF.OldStatusTarget
       CLOSE(SELF.Target)
    END
    SELF.OldStatusOrigin = True
    SELF.OldStatusTarget = True


FileSynchronizationClass.Load                          PROCEDURE()
OldStatusTarget   BYTE
OldStatusOrigin   BYTE
RetVal            BYTE
lIndex            LONG
lRecordsToRead    LONG
TargetRecord      &GROUP, AUTO
OriginalRecord    &GROUP, AUTO
OldFetchSize      BYTE, AUTO
 CODE
    SELF.LoadSuccess = False
    SELF.OnLoad = True
    RetVal = SELF.Reset()
    IF RetVal <> Level:Benign THEN
       SELF.OnLoad = False
       RETURN RetVal
    END
    !
    RetVal = SELF.Open()
    IF RetVal <> Level:Benign THEN
       SELF.OnLoad = False
       RETURN RetVal
    END
    !
    IF SELF.RecordsToRead=0
       lRecordsToRead = RECORDS(SELF.Original)
    ELSE
       lRecordsToRead = SELF.RecordsToRead
    END
    RetVal = Level:Benign
    IF lRecordsToRead OR SELF.UseSQL
       TargetRecord   &= SELF.Target{PROP:Record}
       OriginalRecord &= SELF.Original{PROP:Record}
       SELF.BindOnLoad()
       BIND(TargetRecord)
       BIND(OriginalRecord)
       CLEAR(OriginalRecord)
       SELF.ResetRange()
       lIndex = 0
       IF SELF.Original{PROP:Driver}='IPDRV'
          IF lRecordsToRead>60
             SELF.Original{PROP:IPRequestCount} = 60
          ELSE
             SELF.Original{PROP:IPRequestCount} = lRecordsToRead
          END
       END
       IF SELF.UseBuffer
          IF SELF.Original{PROP:SQLDriver}='1'
             OldFetchSize = SELF.Original{PROP:FetchSize}
             SELF.Original{PROP:FetchSize} = 20
          END
       END
       LOOP
            IF lIndex>lRecordsToRead THEN BREAK.
            IF SELF.Original{PROP:Driver}='IPDRV'
               IF SELF.Original{PROP:IPRequestCount} = 0
                  IF lRecordsToRead>60
                     SELF.Original{PROP:IPRequestCount} = 60
                  ELSE
                     SELF.Original{PROP:IPRequestCount} = lRecordsToRead
                  END
               END
            END
            NEXT(SELF.Original)
            IF ERRORCODE() THEN
               !MESSAGE('Error Reading the Physical file. Error('&ERRORCODE()&') '&ERROR()&'|'&SELF.Original{PROP:Name})
               BREAK
            END
            CASE SELF.ValidateRecord()
            OF Level:Notify
               CYCLE
            OF Level:Fatal
               BREAK
            END
            !ASSIGN VALUES
            CLEAR(TargetRecord)
            TargetRecord = OriginalRecord
            SELF.PrimeRecord()
            IF NOT SELF.RecordPositionField &= NULL
               IF NOT SELF.PrimaryKey &= NULL
                  SELF.RecordPositionField = POSITION(SELF.PrimaryKey)
               ELSE
                  SELF.RecordPositionField = POSITION(SELF.Original)
               END
            END
            ADD(SELF.Target)
            IF ERRORCODE()
               SELF.SHOWERROR('FileSync - Load','Error Writing the Memory file.'&'|FileName:'&SELF.Original{PROP:Name})
               RetVal = Level:Fatal
               BREAK
            END
            IF lRecordsToRead>0
               lIndex += 1
            END
       END
       IF SELF.UseBuffer
          IF SELF.Original{PROP:SQLDriver}='1'
             SELF.Original{PROP:FetchSize} = OldFetchSize
          END
       END
       IF SELF.Original{PROP:Driver}='IPDRV'
          SELF.Original{PROP:IPRequestCount} = 0
       END
    END
    !
    IF RetVal = Level:Benign THEN
       SELF.LoadSuccess = True
    END
    SELF.Close()
    SELF.OnLoad = False
    RETURN RetVal


FileSynchronizationClass.PrimeRecord                   PROCEDURE()
 CODE


FileSynchronizationClass.PrimeSaveRecord               PROCEDURE()
 CODE


FileSynchronizationClass.Save                          PROCEDURE()
OldStatusTarget   BYTE
OldStatusOrigin   BYTE
RetVal            BYTE
lIndex            LONG
lRecordsToRead    LONG
TargetRecord      &GROUP, AUTO
OriginalRecord    &GROUP, AUTO
TransactionOk   BYTE
 CODE
    IF SELF.LoadSuccess = False
       RETURN Level:Fatal
    END
    SELF.OnSave=True
    IF SELF.BackupOnSave
       SELF.GenerateBackUp()
    END
    RetVal = SELF.Open()
    IF RetVal<>Level:Benign THEN
       SELF.OnSave=False
       RETURN RetVal
    END
    IF STATUS(SELF.Original)=40h
       SELF.Close()
       SELF.SHOWERROR('FileSync - Save','Error Opening the Physical file.|The File is Read Only.'&'|FileName:'&SELF.Original{PROP:Name})
       SELF.OnSave=False
       RETURN Level:Fatal
    END
    TransactionOk = True
    IF SELF.UseLogout
       IF SELF.TransactionStart()<>Level:Benign
          TransactionOk = False
       END
    END
    IF TransactionOk = True
       IF SELF.OptimizeSave OR SELF.UseSQL
          ! will delete first the DeletedRecord from the Original
          ! will then delete the Records that have a RecordPosition in the Original
          TransactionOk = SELF.OptimizedSave()
       ELSE
          ! will delete all the records on the Original file that match the filter and range limit
          TargetRecord   &= SELF.Target{PROP:Record}
          OriginalRecord &= SELF.Original{PROP:Record}
          BIND(TargetRecord)
          BIND(OriginalRecord)
          CLEAR(OriginalRecord)
          SELF.ResetRange()
          LOOP
            NEXT(SELF.Original)
            CASE ERRORCODE()
            OF 0
            OF 33
               BREAK
            ELSE
               SELF.SHOWERROR('FileSync - Save','Error Reading the Physical file.'&'|FileName:'&SELF.Original{PROP:Name})
               BREAK
            END
            CASE SELF.ValidateRecord()
            OF Level:Notify
               CYCLE
            OF Level:Fatal
               BREAK
            END
            !ASSIGN VALUES
            DELETE(SELF.Original)
            IF ERRORCODE()
               TransactionOk = False
               BREAK
            END
          END
          lRecordsToRead = RECORDS(SELF.Target)
          lIndex=1
          CLEAR(SELF.Target)
          SET(SELF.Target)
          LOOP
             IF lIndex>lRecordsToRead THEN BREAK.
             NEXT(SELF.Target)
             IF ERRORCODE()
                BREAK
             END
             CLEAR(OriginalRecord)
             OriginalRecord = TargetRecord
             SELF.PrimeSaveRecord()
             ADD(SELF.Original)
             IF ERRORCODE()
                TransactionOk = False
                BREAK
             END
             lIndex+=1
          END
       END
       !After that it will loop thru the Target file in record order
       !and add the records to the Original file
       !if any error happens then TransactionOk will be set to False
    END
    IF SELF.UseLogout
       IF SELF.StartTransaction
          IF TransactionOk
             RetVal=SELF.TransactionCommit()
             IF RetVal=Level:Fatal
                TransactionOk = False
             END
          ELSE
             SELF.TransactionRollback()
          END
       END
    END
    SELF.Close()
    SELF.OnSave=False
    IF TransactionOk = True
       RETURN Level:Benign
    ELSE
       RETURN Level:Fatal
    END


FileSynchronizationClass.OptimizedSave                 PROCEDURE()
 CODE
 !Developer should override this method
? ASSERT(0,'Developer should override the method OptimizedSave!')
 RETURN False


FileSynchronizationClass.GenerateBackUp                PROCEDURE()
FileName  CSTRING(FILE:MaxFilePath)
lIndex    SHORT
 CODE
    !The backup does not work with Superfile tps files
    !To succeed PROP:Name must return a valid file name.
    FileName = SELF.Original{PROP:Name}
    IF NOT INSTRING('.',FileName,1,1)
       FileName=FileName&'.TPS'
    END
    lIndex=0
    LOOP
       lIndex+=1
       IF EXISTS(FileName&'tmp'&LEFT(lIndex)) THEN CYCLE.
       !Copy Original File to a .tmp file
       COPY(FileName,FileName&'tmp'&LEFT(lIndex))
       !IF ERRORCODE()
       !   MESSAGE(ERROR())
       !END
       BREAK
    END
    !Change bak file to baktmp
    RENAME(FileName&'bak',FileName&'baktmp')
    !Rename Original tmp to bak
    RENAME(FileName&'tmp'&LEFT(lIndex),FileName&'bak')
    !Remove baktmp
    REMOVE(FileName&'baktmp')


FileSynchronizationClass.Kill                          PROCEDURE()
RetVal      BYTE
 CODE
    IF SELF.Killed = False
       IF SELF.SaveOnKill AND SELF.RecordsToRead=0
          RetVal = SELF.Save()
       END
       SELF.LimitType        = 0
       IF NOT SELF.Filter &= NULL
          DISPOSE(SELF.Filter)
       END
       SELF.Killed = True
    END


!If return value different from Level:Benign the save will fail
FileSynchronizationClass.TransactionStart              PROCEDURE()
 CODE
    IF SELF.StartTransaction
       LOGOUT(12,SELF.Original)
       IF NOT ERRORCODE()
          RETURN Level:Benign
       ELSE
          SELF.SHOWERROR('FileSync - TransactionStart','Error Reading the Physical file.'&'|FileName:'&SELF.Original{PROP:Name})
          RETURN Level:Fatal
       END
    ELSE
       SELF.Original{PROP:Logout}=True
    END
    RETURN Level:Benign


FileSynchronizationClass.TransactionCommit             PROCEDURE()
 CODE
    COMMIT()
    IF ERRORCODE()
       RETURN Level:Fatal
    ELSE
       RETURN Level:Benign
    END


FileSynchronizationClass.TransactionRollback           PROCEDURE()
 CODE
    ROLLBACK()


FileSynchronizationClass.ValidateRecord                PROCEDURE()
FilterOk    BYTE
RetVal      BYTE
 CODE
    RetVal = Level:Benign
    IF NOT SELF.Filter &= NULL
       FilterOk = EVALUATE(CLIP(SELF.Filter))
       IF ERRORCODE()
          SELF.SHOWERROR('FileSync - ValidateRecord','Error on Evaluate.')
          RetVal = Level:Fatal
       ELSE
          IF FilterOk
             RetVal = Level:Benign
          ELSE
             RetVal = Level:Notify
          END
       END
    END
    IF RetVal = Level:Benign
       IF SELF.UseSQL = False
          IF NOT SELF.RangeKey &= NULL
             CASE SELF.LimitType
             OF 2 !Single Limit Type
                  IF SELF.FreeElement <> SELF.LowLimit THEN RetVal = Level:Fatal.
             OF 3 !Range Limit Type
                  IF NOT (SELF.FreeElement >= SELF.LowLimit AND SELF.FreeElement <= SELF.HighLimit) THEN RetVal = Level:Fatal.
             END
          END
       END
    END
    RETURN RetVal


FileSynchronizationClass.ResetRange                    PROCEDURE()
 CODE
    IF NOT SELF.RangeKey &= NULL
       CASE SELF.LimitType
       OF 1 !No range but using Key order
             SET(SELF.RangeKey)
       OF 2 !Single Limit Type
             SELF.PrimeKey()
             SET(SELF.RangeKey,SELF.RangeKey)
       OF 3 !Range Limit Type
             SELF.PrimeKey()
             SET(SELF.RangeKey,SELF.RangeKey)
       ELSE
           !When 0 or other value
           !No Key, using Record Order
          SET(SELF.Original)
       END
    ELSE
       !When 0 or other value
       !No Key, using Record Order
       SET(SELF.Original)
    END


FileSynchronizationClass.PrimeKey                    PROCEDURE()
 CODE
    CASE SELF.LimitType
    OF 1 !No range but using Key order
    OF 2 !Single Limit Type
        SELF.FreeElement = SELF.LowLimit
    OF 3 !Range Limit Type
        SELF.FreeElement = SELF.LowLimit
    ELSE
    END


FileSynchronizationClass.SetOrderKey                   PROCEDURE(KEY parKey)
 CODE
    SELF.RangeKey &= parKey
    SELF.LimitType = 1


FileSynchronizationClass.SetRange                      PROCEDURE()
 CODE
    SELF.LimitType = 0


FileSynchronizationClass.SetRange                      PROCEDURE(*? Field,*? Limit)
 CODE
    SELF.FreeElement &= Field
    SELF.LimitType = 2
    SELF.LowLimit &= Limit


FileSynchronizationClass.SetRange                      PROCEDURE(*? Field,*? Low,*? High)
 CODE
    SELF.FreeElement &= Field
    SELF.LimitType = 3
    SELF.LowLimit &= Low
    SELF.HighLimit &= High


FileSynchronizationClass.SetUseSQL                     PROCEDURE(BYTE pValue)
 CODE
 IF NOT SELF.Original&=NULL
    IF SELF.Original{PROP:SQLDriver} THEN
       SELF.UseSQL = pValue
    ELSE
       SELF.UseSQL = False
    END
 ELSE
    SELF.UseSQL = False
 END

FileSynchronizationClass.SetUseBuffer                  PROCEDURE(BYTE pValue)
 CODE
    SELF.UseBuffer = pValue

FileSynchronizationClass.SyncInsert                    PROCEDURE(FILE ThreadedTargetFile)
TargetRecord      &GROUP, AUTO
OriginalRecord    &GROUP, AUTO
RetVal            BYTE
 CODE
    IF SELF.OnLoad
       RETURN Level:Benign
    END
    RetVal = Level:Fatal
    IF SELF.PrimaryKey &= NULL
       SELF.SHOWERROR('FileSync - SyncInsert','Error Synchronizing Insert.|Physical File does not have a PK.'&'|FileName:'&SELF.Target{PROP:Name})
       RETURN RetVal
    END
    IF SELF.Open()=Level:Benign
       TargetRecord   &= ThreadedTargetFile{PROP:Record}
       OriginalRecord &= SELF.Original{PROP:Record}
       CLEAR(OriginalRecord)
       OriginalRecord = TargetRecord
       SELF.PrimeSaveRecord()
       ADD(SELF.Original)
       IF NOT ERRORCODE()
          RetVal = Level:Benign
       ELSE
          SELF.SyncError = ERROR()
          SELF.SyncErrorCode = ERRORCODE()
       END
       SELF.Close()
    END
    RETURN RetVal

FileSynchronizationClass.SyncInsert                    PROCEDURE()
 CODE
    RETURN SELF.SyncInsert(SELF.Target)

FileSynchronizationClass.SyncUpdate                    PROCEDURE()
 CODE
   RETURN SELF.SyncUpdate(SELF.Target)

FileSynchronizationClass.SyncUpdate                    PROCEDURE(FILE ThreadedTargetFile)
TargetRecord      &GROUP, AUTO
OriginalRecord    &GROUP, AUTO
RetVal            BYTE
 CODE
    IF SELF.OnRefresh
       RETURN Level:Benign
    END
    RetVal = Level:Fatal
    IF SELF.PrimaryKey &= NULL
       SELF.SHOWERROR('FileSync - SyncUpdate','Error Synchronizing Update.|Physical File does not have a PK.'&'|FileName:'&SELF.Target{PROP:Name})
       RETURN RetVal
    END
    IF SELF.Open()=Level:Benign
       TargetRecord   &= ThreadedTargetFile{PROP:Record}
       OriginalRecord &= SELF.Original{PROP:Record}
       CLEAR(OriginalRecord)
       OriginalRecord = TargetRecord
       SELF.PrimeSaveRecord()
       GET(SELF.Original,SELF.PrimaryKey)
       IF NOT ERRORCODE()
          OriginalRecord = TargetRecord
          SELF.PrimeSaveRecord()
          PUT(SELF.Original)
          IF NOT ERRORCODE()
             RetVal = Level:Benign
          ELSE
             SELF.SyncError = ERROR()
             SELF.SyncErrorCode = ERRORCODE()
          END
       ELSE
          SELF.SyncError = ERROR()
          SELF.SyncErrorCode = ERRORCODE()
       END
       SELF.Close()
    END
    RETURN RetVal

FileSynchronizationClass.SyncDelete                    PROCEDURE()
 CODE
  RETURN SELF.SyncDelete(SELF.Target)

FileSynchronizationClass.SyncDelete                    PROCEDURE(FILE ThreadedTargetFile)
TargetRecord      &GROUP, AUTO
OriginalRecord    &GROUP, AUTO
RetVal            BYTE
 CODE
    IF SELF.OnSave
       RETURN Level:Benign
    END
    IF SELF.PrimaryKey &= NULL
       SELF.SHOWERROR('FileSync - SyncDelete','Error Synchronizing Delete.|Physical File does not have a PK.'&'|FileName:'&SELF.Target{PROP:Name})
       RETURN Level:Fatal
    END
    IF SELF.Open()=Level:Benign
       TargetRecord   &= ThreadedTargetFile{PROP:Record}
       OriginalRecord &= SELF.Original{PROP:Record}
       CLEAR(OriginalRecord)
       OriginalRecord = TargetRecord
       SELF.PrimeSaveRecord()
       GET(SELF.Original,SELF.PrimaryKey)
       IF NOT ERRORCODE()
          DELETE(SELF.Original)
          IF NOT ERRORCODE()
             RetVal = Level:Benign
          ELSE
             SELF.SyncError = ERROR()
             SELF.SyncErrorCode = ERRORCODE()
          END
       ELSE
          SELF.SyncError = ERROR()
          SELF.SyncErrorCode = ERRORCODE()
       END
       SELF.Close()
    END
    RETURN RetVal


FileSynchronizationClass.SyncRefresh                   PROCEDURE()
 CODE
  RETURN SELF.SyncRefresh(SELF.Target)

FileSynchronizationClass.SyncRefresh                   PROCEDURE(FILE ThreadedTargetFile)
TargetRecord      &GROUP, AUTO
OriginalRecord    &GROUP, AUTO
RetVal            BYTE
 CODE
    IF SELF.PrimaryKey &= NULL
       SELF.SHOWERROR('FileSync - SyncRefresh','Error Synchronizing Refresh.|Physical File does not have a PK.'&'|FileName:'&SELF.Target{PROP:Name})
       RETURN Level:Fatal
    END
    SELF.OnRefresh = True
    IF SELF.Open()=Level:Benign
       TargetRecord   &= ThreadedTargetFile{PROP:Record}
       OriginalRecord &= SELF.Original{PROP:Record}
       CLEAR(OriginalRecord)
       OriginalRecord = TargetRecord
       SELF.PrimeSaveRecord()
       GET(SELF.Original,SELF.PrimaryKey)
       IF NOT ERRORCODE()
          CLEAR(TargetRecord)
          TargetRecord = OriginalRecord
          SELF.PrimeRecord()
          SELF.RecordPositionField = POSITION(SELF.PrimaryKey)
          PUT(SELF.Target)
          IF NOT ERRORCODE()
             RetVal = Level:Benign
          ELSE
             SELF.SyncError = ERROR()
             SELF.SyncErrorCode = ERRORCODE()
          END
       ELSE
          SELF.SyncError = ERROR()
          SELF.SyncErrorCode = ERRORCODE()
       END
       SELF.Close()
    END
    SELF.OnRefresh = False
    RETURN RetVal

FileSynchronizationClass.GetLoadSuccess                PROCEDURE()
 CODE
    RETURN SELF.LoadSuccess

FileSynchronizationClass.GetSyncError                  PROCEDURE()
 CODE
    RETURN SELF.SyncError

FileSynchronizationClass.GetSyncErrorCode              PROCEDURE()
 CODE
    RETURN SELF.SyncErrorCode

FileSynchronizationClass.SHOWERROR   PROCEDURE(STRING pTile,STRING pText)
 CODE
 IF ERRORCODE()=90
    MESSAGE(pText&'|Error('&ERRORCODE()&') '&ERROR()&'|File Error('&FILEERRORCODE()&') '&FILEERROR(),pTile)
 ELSE
    MESSAGE(pText&'|Error('&ERRORCODE()&') '&ERROR(),pTile)
 END

FileSynchronizationClass.AsynchronicLoad    PROCEDURE()
 CODE
    START(FileSynchronizationClassAsynchronicLoad,,ADDRESS(SELF))

FileSynchronizationClass.BindOnLoad         PROCEDURE()
 CODE

FileSynchronizationClassAsynchronicLoad PROCEDURE(STRING S)
P   &FileSynchronizationClass,AUTO
 CODE
    P &= S+0
    P.Load()