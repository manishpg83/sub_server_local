!ABCIncludeFile(ABC)

OMIT('_EndOfInclude_',_FileSynchronizationClassPresente_)
_FileSynchronizationClassPresente_ EQUATE(1)

DeletedRecordsQueue QUEUE,TYPE
RecordPosition           STRING(1024)
                    END

FileSynchronizationClass    CLASS,MODULE('ABTblSyn.CLW'),TYPE,LINK('ABTblSyn.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
Target                        &FILE,PROTECTED
Original                      &FILE,PROTECTED
RecordPositionField           ANY,PROTECTED
UseLogout                     BYTE
StartTransaction              BYTE
RecordsToRead                 LONG
Killed                        BYTE,PROTECTED
SaveOnKill                    BYTE
PrimaryKey                    &KEY
RangeKey                      &KEY             ! The Origin File KEY
FreeElement                   ANY              ! The Free key element
LimitType                     BYTE             ! 0-None 2-Single 3-Pair
LowLimit                      ANY
HighLimit                     ANY
Filter                        &STRING
Silent                        BYTE
UseSQL                        BYTE,PROTECTED
UseBuffer                     BYTE,PROTECTED
BackupOnSave                  BYTE
OldStatusTarget               BYTE,PRIVATE
OldStatusOrigin               BYTE,PRIVATE
LoadSuccess                   BYTE,PROTECTED
OptimizeSave                  BYTE,PROTECTED !This will require the TargetFile to have an extra field to store the position of the Original Record
OnLoad                        BYTE,PROTECTED
OnSave                        BYTE,PROTECTED
OnRefresh                     BYTE,PROTECTED
SyncError                     CSTRING(256),PROTECTED
SyncErrorCode                 BYTE,PROTECTED
Init                          PROCEDURE(FILE pTargetFile,FILE pOriginalFile),VIRTUAL
SetOrderKey                   PROCEDURE(KEY parKey),VIRTUAL
SetRange                      PROCEDURE(),VIRTUAL
SetRange                      PROCEDURE(*? Field,*? Limit),VIRTUAL
SetRange                      PROCEDURE(*? Field,*? Low,*? High),VIRTUAL
SetFilter                     PROCEDURE(STRING pRecordFilter),VIRTUAL
SetRecordPositionField        PROCEDURE(*? FieldFromTargetFile)
SetRecordsToRead              PROCEDURE(LONG pRecordsToRead),VIRTUAL
Reset                         PROCEDURE(BYTE Force=0),BYTE,VIRTUAL  ! Will clear the target file, if Force = True it also will clear the pRecordsToRead and pRecordFilter
ResetRange                    PROCEDURE(),VIRTUAL
PrimeKey                      PROCEDURE(),VIRTUAL
PrimeRecord                   PROCEDURE(),VIRTUAL
PrimeSaveRecord               PROCEDURE(),VIRTUAL

Load                          PROCEDURE(),BYTE,PROC,VIRTUAL
AsynchronicLoad               PROCEDURE()
BindOnLoad                    PROCEDURE(),VIRTUAL
Save                          PROCEDURE(),BYTE,VIRTUAL
OptimizedSave                 PROCEDURE(),BYTE,VIRTUAL
Kill                          PROCEDURE(),VIRTUAL
Open                          PROCEDURE(),BYTE,VIRTUAL
Close                         PROCEDURE(),VIRTUAL
GenerateBackUp                PROCEDURE(),VIRTUAL
TransactionStart              PROCEDURE(),BYTE,VIRTUAL !If return value different from Level:Benign the save will fail
TransactionCommit             PROCEDURE(),BYTE,VIRTUAL
TransactionRollback           PROCEDURE(),VIRTUAL
ValidateRecord                PROCEDURE,BYTE,VIRTUAL
SetUseSQL                     PROCEDURE(BYTE pValue)
SetUseBuffer                  PROCEDURE(BYTE pValue)
Destruct                      PROCEDURE !,FINAL
SyncInsert                    PROCEDURE(),BYTE
SyncUpdate                    PROCEDURE(),BYTE
SyncDelete                    PROCEDURE(),BYTE
SyncRefresh                   PROCEDURE(),BYTE
SyncInsert                    PROCEDURE(FILE ThreadedTargetFile),BYTE
SyncUpdate                    PROCEDURE(FILE ThreadedTargetFile),BYTE
SyncDelete                    PROCEDURE(FILE ThreadedTargetFile),BYTE
SyncRefresh                   PROCEDURE(FILE ThreadedTargetFile),BYTE
GetLoadSuccess                PROCEDURE(),BYTE
GetSyncError                  PROCEDURE(),STRING
GetSyncErrorCode              PROCEDURE(),BYTE
SHOWERROR                     PROCEDURE(STRING pTile,STRING pText),PROTECTED,VIRTUAL
                            END

 _EndOfInclude_
