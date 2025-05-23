!ABCIncludeFile


  OMIT('_EndOfInclude_',_FileClassPresent_)  ! Omit this if already compiled
_FileClassPresent_         EQUATE(1)

  INCLUDE('FILECB.INC'),ONCE
  INCLUDE('ABFILE.EQU'),ONCE
  INCLUDE('CWSYNCHM.INC'),ONCE


AS:AddrFileManager      EQUATE(1000)           ! Address of file manager (TIED to ASTRING)

  MAP
    MODULE('ABFILE.CLW')
GetFieldValue   PROCEDURE(ASTRING FileManagerTag, ASTRING FldTag),STRING,DLL(_ABCDllMode_)    ! get field value, formatted if numeric and picture available
GetFileField    PROCEDURE(ASTRING FileManagerTag, ASTRING FldTag),*?,DLL(_ABCDllMode_)        ! gets 'pointer to field'
GetFileManager  PROCEDURE(ASTRING Tag),*FileManager,DLL(_ABCDllMode_)
SetFileManager  PROCEDURE(FileManager FM, ASTRING Tag),DLL(_ABCDllMode_)
    END
  END

!---------------------------------------------------------
! The FileManager class

BufferQueue                   QUEUE,TYPE         ! QUEUE of 'saved' record buffers
Id                              LONG             ! Handle to recognise saved instance
Buffer                          &STRING          ! Reference to the record buffer
                              END

UseType ITEMIZE(1),PRE
Corrupts    EQUATE                               ! Changes but doesn't rely on value
Uses        EQUATE                               ! Changes and relies on value
Returns     EQUATE                               ! Holds a value to be returned to parent
Benign      EQUATE                               ! Outside of tracking mechanism
Initialize  EQUATE                               ! FileManager needs to be completely initialized
        END



IFileOpenServer               INTERFACE
OpenFile                        PROCEDURE(UNSIGNED OpenMode),UNSIGNED
CloseFile                       PROCEDURE,UNSIGNED,PROC
Link                            PROCEDURE        ! Increment usage count
Release                         PROCEDURE        ! Decrement usage count and destroy when count is 0
                              END


FileManager                   CLASS,IMPLEMENTS(FileCallBackInterface),TYPE,MODULE('ABFILE.CLW'),LINK('ABFILE.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
AliasedFile                     &FileManager               ! If this manager is handling a File Alias this should point to underlying FileManager
Buffer                          &GROUP,PROTECTED           ! The record buffer
Buffers                         &BufferQueue,PROTECTED     ! QUEUE of all 'saved' buffers for this file
Create                          BYTE                       ! Create/NoCreate flag
Errors                          &ErrorClass,PROTECTED      ! The Error object for this file
Fields                          &FieldsList,PROTECTED      ! List of fields/field tags for this file
File                            &File                      ! Reference to the object FILE
FileName                        ANY,PROTECTED              ! String in NAME attribute
FileNameValue                   STRING(FILE:MaxFileName),PROTECTED ! The NAME attribute of the file
HasAutoInc                      BYTE,PROTECTED             ! Auto-increment or not flag
InUseFile                       BYTE,PROTECTED             ! Stops asserts when setting up to use the file
InCallBack                      BYTE,PRIVATE               ! Stops infinite loop in callback code
InClose                         BYTE,PRIVATE               ! Flags that FileManager.close is being executed
InRestore                       BYTE,PRIVATE               ! Used by File Callback code
InView                          BYTE,PRIVATE               ! Used by File Callback code

Used                            BYTE,PRIVATE               ! Set True when file is -actually- opened
Opened                          UNSIGNED,PROTECTED         ! File opened counter
AtEOF                           BYTE,PRIVATE               ! End of File flag
AutoIncDone                     BYTE,PROTECTED             ! Auto-increment done or not flag
LastError                       UNSIGNED,PRIVATE           ! Last error identifier

LazyOpen                        BYTE                       ! Set True to enable Lazy opening for this file
LockRecover                     SHORT                      ! Wait time parameter for LOCKing this FILE
OpenMode                        BYTE,PROTECTED             ! File sharing flag
OpenModeOverridden               BYTE,PROTECTED             ! When TRUE indicates that the SeOpenMode method was called
PrimaryKey                      BYTE,PROTECTED             ! Primary key or not flag
Saved                           &SaveQueue,PRIVATE
SkipHeldRecords                 BYTE                       ! Should a Locked record abort reading or 'skip'
CleanedUp                       BYTE,PRIVATE
Keys                            &FileKeyQueue,PROTECTED    ! QUEUE of all keys for this file
BlobChanged                     BYTE,PROTECTED             ! Set true when a blob has data set, reset when written to disk
PreviousBuffer                  &STRING,PROTECTED          ! Store the saved buffer to be used in the Post trigger methods, the buffer is stored on every read action
SavePreviousBuffer              BYTE                       ! Tell to the FileManager to store a copy of the buffer
Initialized                     BYTE,PROTECTED             ! set true when file manager has been initialized by UseFile()
Killed                          BYTE,PRIVATE
Opener                          &IFileOpenServer           ! Inteface to object used to open and close the undelying file
UseMRP                          BYTE,PROTECTED
MRPSize                         BYTE,PROTECTED

Destruct                        PROCEDURE,VIRTUAL

AddField                        PROCEDURE(ASTRING Tag, *? Field, ASTRING FieldType, <ASTRING FieldPicture>),BYTE,PROC
AddKey                          PROCEDURE(KEY K,STRING Description,BYTE AutoInc = 0)
BindFields                      PROCEDURE,VIRTUAL
CancelAutoInc                   PROCEDURE(<RelationManager RM>),VIRTUAL,BYTE,PROC
ClearKey                        PROCEDURE(KEY K,BYTE LowComp=1,BYTE HighComp=22,BYTE High=0)
Close                           PROCEDURE,BYTE,PROC,VIRTUAL
EqualBuffer                     PROCEDURE(*USHORT Handle),BYTE,VIRTUAL
Fetch                           PROCEDURE(KEY K),BYTE,PROC,VIRTUAL
FindField                       PROCEDURE(ASTRING Tag),BYTE,PRIVATE
GetComponents                   PROCEDURE(KEY K),BYTE
GetEOF                          PROCEDURE,BYTE
GetError                        PROCEDURE,SIGNED
GetField                        PROCEDURE(ASTRING Tag),*?
GetField                        PROCEDURE(KEY K,BYTE Component),*?
GetField                        PROCEDURE(LONG Idx, *ASTRING Tag, *? Field),BYTE
GetFieldType                    PROCEDURE(ASTRING Tag),ASTRING
GetFields                       PROCEDURE(),LONG
GetFieldAscending               PROCEDURE(KEY K,BYTE Component),BYTE
GetFieldName                    PROCEDURE(KEY K,BYTE Component),STRING
GetFieldName                    PROCEDURE(*? Fld),ASTRING
GetFieldPicture                 PROCEDURE(ASTRING Tag),ASTRING
GetName                         PROCEDURE,STRING
GetOpened                       PROCEDURE(),UNSIGNED
GetOpenMode                     PROCEDURE(),BYTE
Init                            PROCEDURE,VIRTUAL
Init                            PROCEDURE(File File,ErrorClass EC),VIRTUAL
Insert                          PROCEDURE,BYTE,PROC,VIRTUAL
InsertServer                    PROCEDURE(BYTE HandleError),BYTE,PRIVATE
IsOpened                        PROCEDURE,BYTE
KeyToOrder                      PROCEDURE(KEY K,BYTE MajorComp),STRING
Kill                            PROCEDURE,VIRTUAL
Next                            PROCEDURE,BYTE,PROC,VIRTUAL
NextServer                      PROCEDURE(BYTE HandleError,BYTE Previous=0),BYTE,PRIVATE
Open                            PROCEDURE(),BYTE,PROC,VIRTUAL
OpenFile                        PROCEDURE(BYTE HandleError),BYTE,PRIVATE
OpenServer                      PROCEDURE(BYTE HandleError,BYTE ForceOpen=False),BYTE,PROC,PRIVATE
Position                        PROCEDURE(),STRING
Previous                        PROCEDURE,BYTE,PROC,VIRTUAL
PrimeAutoInc                    PROCEDURE,BYTE,PROC,VIRTUAL
PrimeAutoIncServer              PROCEDURE(BYTE HandleErrors),BYTE,PROC,PRIVATE
PrimeFields                     PROCEDURE,PROC,VIRTUAL
PrimeRecord                     PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,VIRTUAL
RestoreBuffer                   PROCEDURE(*USHORT Handle,BYTE DoRestore=1),VIRTUAL
RestoreBuffer                   PROCEDURE(*USHORT Handle,FileManager FM,BYTE DoRestore = 1),PRIVATE
RestoreFile                     PROCEDURE(*USHORT Handle,BYTE DoRestore=1)
RestoreFile                     PROCEDURE(*USHORT Handle,FileManager FM,BYTE DoRestore = 1),PRIVATE
SaveBuffer                      PROCEDURE,USHORT,VIRTUAL
SaveFile                        PROCEDURE,USHORT
SetError                        PROCEDURE(USHORT Number)
SetErrors                       PROCEDURE(ErrorClass EC)
SetKey                          PROCEDURE(KEY K),PROTECTED
SetName                         PROCEDURE(STRING Text)
SetOpenMode                     PROCEDURE(BYTE OpenMode)
Throw                           PROCEDURE(USHORT ErrorNumber),BYTE,PROC,VIRTUAL
Throw                           PROCEDURE,BYTE,PROC,VIRTUAL
ThrowMessage                    PROCEDURE(USHORT ErrorNumber,STRING Text),BYTE,PROC,VIRTUAL
TryFetch                        PROCEDURE(KEY K),BYTE,PROC,VIRTUAL
TryInsert                       PROCEDURE,BYTE,PROC,VIRTUAL
TryNext                         PROCEDURE,BYTE,PROC,VIRTUAL
TryOpen                         PROCEDURE(),BYTE,PROC,VIRTUAL
TryPrevious                     PROCEDURE,BYTE,PROC,VIRTUAL
TryPrimeAutoInc                 PROCEDURE,BYTE,PROC,VIRTUAL
TryReget                        PROCEDURE(STRING Position),BYTE,PROC
TryUpdate                       PROCEDURE,BYTE,PROC,VIRTUAL
Update                          PROCEDURE,BYTE,PROC,VIRTUAL
UpdateServer                    PROCEDURE(BYTE HandleError),BYTE,PROC,PRIVATE
UseFile                         PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,VIRTUAL
ValidateField                   PROCEDURE(UNSIGNED Id),BYTE,PROC,VIRTUAL
TryValidateField                PROCEDURE(UNSIGNED Id),BYTE,PROC,VIRTUAL
ValidateFieldServer             PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,VIRTUAL,PROTECTED
ValidateFields                  PROCEDURE(UNSIGNED Low,UNSIGNED High,<*UNSIGNED Failed>),BYTE,PROTECTED,PROC,VIRTUAL
ValidateRecord                  PROCEDURE(<*UNSIGNED Failed>),BYTE,VIRTUAL
DeleteRecord                    PROCEDURE(BYTE Query=1),BYTE,PROC,VIRTUAL
Deleted                         PROCEDURE,BYTE,VIRTUAL
SetUseMRP                       PROCEDURE(BYTE UseMRP=True),VIRTUAL
GetUseMRP                       PROCEDURE(),BYTE,VIRTUAL
SetMRPSize                      PROCEDURE(BYTE MRPSize),VIRTUAL
GetMRPSize                      PROCEDURE(),BYTE,VIRTUAL
GetAutoIncDone                  PROCEDURE(),BYTE,VIRTUAL

FunctionCalled                  PROCEDURE(SIGNED opCode, *Params Parameters, *CSTRING ErrCode, *CSTRING ErrMsg), BYTE,PROTECTED,VIRTUAL
FunctionDone                    PROCEDURE(SIGNED opCode, *Params Parameters, *CSTRING ErrCode, *CSTRING ErrMsg), BYTE,PROTECTED,VIRTUAL
! Client Triggers
PreDelete                       PROCEDURE(*CSTRING ErrCode, *CSTRING ErrMsg),BYTE,VIRTUAL
PostDelete                      PROCEDURE(*CSTRING ErrCode, *CSTRING ErrMsg),BYTE,VIRTUAL
PreInsert                       PROCEDURE(SIGNED OpCode, UNSIGNED AddLen, *CSTRING ErrCode, *CSTRING ErrMsg),BYTE,VIRTUAL
PostInsert                      PROCEDURE(*CSTRING ErrCode, *CSTRING ErrMsg),BYTE,VIRTUAL
PreUpdate                       PROCEDURE(LONG Pntr, UNSIGNED PutLen, *CSTRING ErrCode, *CSTRING ErrMsg),BYTE,VIRTUAL
PostUpdate                      PROCEDURE(*CSTRING ErrCode, *CSTRING ErrMsg),BYTE,VIRTUAL
                              END



!------------------------------------------------------------------
! The RelationManager class.
! The RelationManager class behaves as a file manager -except- it
! broadcasts commands on to child classes where useful.
! This layer contains Referential Integrity (RI) code.


! Defines how actions percolate through a relation tree.
  ITEMIZE(0),PRE(Propagate)
None                EQUATE          ! Only act on primary
OneMany             EQUATE          ! Only percolate down 1-Many relations
ManyOne             EQUATE          ! Only percolate down Many-1 relations
All                 EQUATE          ! Percolate down all relations
  END


  ITEMIZE(0),PRE(RI)
None                       EQUATE
Clear                      EQUATE
Restrict                   EQUATE
Cascade                    EQUATE
Clear_Server               EQUATE
Restrict_Server            EQUATE
Cascade_Server             EQUATE
  END

RelationManager               CLASS,TYPE,MODULE('ABFILE.CLW'),LINK('ABFILE.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
Me                              &FileManager               ! The FileManager object for this file???
Relations                       &RelationQueue,PRIVATE     ! QUEUE of all related files
AliasFile                       &RelationManager,PRIVATE   ! The RelationManager object for Alias file???
PrevUseLogout                   BYTE,PROTECTED             ! Previous Logout or not flag
UseLogout                       BYTE                       ! Logout or not flag
UseLogoutOnInsert               BYTE                       ! Logout or not flag for insert operation (when on trigger use to access other related files)
LogoutTimeout                   BYTE                       ! Number of seconds to attempt to begin the transaction LOGOUT(SELF.LogoutTimeout)
LastTouched                     LONG,PRIVATE               ! Time file was last touched
ForcingOpen                     BYTE,PRIVATE

Construct                       PROCEDURE

DeferedRelationsDone            BYTE,PRIVATE
DeferedRelations                PROCEDURE,PROTECTED

AddRelation                     PROCEDURE(RelationManager RM),PROTECTED !Add a relation M<<-->1
AddRelation                     PROCEDURE(RelationManager RM,BYTE UpdateMode,BYTE DeleteMode,KEY His),PROTECTED !Add a relation 1<-->>M
AddRelationLink                 PROCEDURE(*? Left,*? Right),PROTECTED !Add fields to the last added 1<-->>M
AddRelationLink                 PROCEDURE(*long Left,*long Right),PROTECTED !Add fields to the last added 1<-->>M
AddRelationLink                 PROCEDURE(*string Left,*string Right),PROTECTED !Add fields to the last added 1<-->>M
CancelAutoInc                   PROCEDURE(),BYTE,PROC,VIRTUAL
CascadeUpdates                  PROCEDURE,BYTE,PRIVATE
Close                           PROCEDURE(BYTE Cascading=0),BYTE,PROC,VIRTUAL
Delete                          PROCEDURE(BYTE Query=1),BYTE,VIRTUAL,PROC
DeleteSecondary                 PROCEDURE(KEY MyKey,BufferedPairsClass Links,BYTE Mode,BYTE Query=1),BYTE,PRIVATE,VIRTUAL
Init                            PROCEDURE(FileManager FM,BYTE UseLogout=0)   !,EXTENDS
Kill                            PROCEDURE,VIRTUAL
ListLinkingFields               PROCEDURE(RelationManager Him,FieldPairsClass Trgt,BYTE RightFirst = 0)
LogoutDelete                    PROCEDURE,BYTE,PRIVATE
LogoutPrime                     PROCEDURE,BYTE,PRIVATE
LogoutUpdate                    PROCEDURE,BYTE,PRIVATE
LogoutInsert                    PROCEDURE,BYTE,PRIVATE
OpenCloseServer                 PROCEDURE(BYTE Cascading=0,BYTE Opening),BYTE,PROC,PRIVATE
Open                            PROCEDURE(BYTE Cascading=0),BYTE,PROC,VIRTUAL
ForceOpen                       PROCEDURE(BYTE Cascading=0),BYTE,PROC,PRIVATE
Save                            PROCEDURE,VIRTUAL
SetAlias                        PROCEDURE(RelationManager RM)
SetQuickScan                    PROCEDURE(BYTE On,BYTE Propagate=Propagate:None),VIRTUAL
SetOpenRelated                  PROCEDURE() !This should be called before the Open to force the Open to open all the related tables in levels deeper than 1
Insert                          PROCEDURE(),BYTE,PROC,VIRTUAL
Update                          PROCEDURE(BYTE FromForm=0),BYTE,VIRTUAL,PROC
UpdateSecondary                 PROCEDURE(KEY MyKey,BufferedPairsClass Links,BYTE Mode),BYTE,PRIVATE,VIRTUAL

GetNbRelations                  PROCEDURE, LONG                           ! returns the number of relations defined for the primary file
GetNbFiles                      PROCEDURE(RelationManager parent), LONG     ! returns the number of children files in this relation
GetRelation                     PROCEDURE(LONG relPos), *RelationManager    ! returns the relation number relPos in the list of relations
GetRelation                     PROCEDURE(FILE f), *RelationManager         ! returns the relation manager for the file f
GetRelationType                 PROCEDURE(LONG relPos), LONG                ! returns the type of the relation i (-1 = pb, 1 : 1:many relation, 0 : other relation)
DeferedAddRelations             PROCEDURE,VIRTUAL                           ! derived this to add relationship just before they are needed
                              END



!---------------------------------------------------------
! The ViewManager class

  ITEMIZE(0),PRE(Limit)
None                    EQUATE          ! no range limit
Current                 EQUATE          ! range limited to current value
Single                  EQUATE          ! range limited to single value
Pair                    EQUATE          ! range falls between a pair of values
File                    EQUATE          ! range limited to current value of parent file's linking field
  END

FilterQueue QUEUE,TYPE
ID                  STRING(30)                   ! By convention first char is digit 0-9 for priority
Filter              &STRING
  END

SortOrder                     QUEUE,TYPE         ! QUEUE of sort info for this file
Filter                          &FilterQueue     ! A conjunctive list of filter expressions
FreeElement                     ANY              ! The Free key element
LimitType                       BYTE             ! Range limit flag/indicator
MainKey                         &KEY             ! The KEY
Order                           &STRING          ! ORDER clause for sort order
RangeList                       &BufferedPairsClass ! List of fields in range limit
                              END
BuffersQueue                  QUEUE,TYPE
Buff                            USHORT
Fm                              &FileManager
                              END

ViewManager                   CLASS,TYPE,MODULE('ABFILE.CLW'),DLL(_ABCDllMode_)
DisposeOrder                    BYTE,PRIVATE
Opened                          BYTE,PRIVATE               ! Opened or not flag
Order                           &SortOrder,PROTECTED       ! QUEUE of sort/range/filter info
PagesAhead                      USHORT
PagesBehind                     USHORT
PageSize                        USHORT
Primary                         &RelationManager           ! The RelationManager object for this VIEW
TimeOut                         USHORT
View                            &VIEW                      ! The object VIEW
SavedBuffers                    &BuffersQueue,PROTECTED
Inited                          BYTE,PRIVATE               ! The Init method was executed or not
Killed                          BYTE,PRIVATE               ! The kill method was executed or not
Used                            BYTE,PROTECTED

Destruct                        PROCEDURE,VIRTUAL

AddRange                        PROCEDURE(*? Field)
AddRange                        PROCEDURE(*? Field,*? Limit)
AddRange                        PROCEDURE(*? Field,*? Low,*? High)
AddRange                        PROCEDURE(*? Field,RelationManager MyFile,RelationManager RelatedFile)
AddSortOrder                    PROCEDURE(<KEY K>),BYTE,PROC
AppendOrder                     PROCEDURE(STRING Order),VIRTUAL
ApplyFilter                     PROCEDURE,VIRTUAL
ApplyOrder                      PROCEDURE,VIRTUAL
ApplyRange                      PROCEDURE,VIRTUAL,BYTE,PROC
Close                           PROCEDURE,VIRTUAL
Close                           PROCEDURE(BYTE Force),VIRTUAL
ClearFilesRecord                PROCEDURE(),VIRTUAL
GetFreeElementAscending         PROCEDURE,STRING,VIRTUAL
GetFreeElementName              PROCEDURE,STRING,VIRTUAL
GetFreeElementPosition          PROCEDURE,BYTE,PROTECTED,VIRTUAL
Init                            PROCEDURE(VIEW V,RelationManager RM,<SortOrder SO>)   !,EXTENDS
GetFieldAscending               PROCEDURE(*? Fld),BYTE
GetFieldName                    PROCEDURE(*? Fld),STRING
GetFirstSortField               PROCEDURE(),*ANY
GetFirstSortFieldName           PROCEDURE(),STRING
Kill                            PROCEDURE,VIRTUAL
LimitMajorComponents            PROCEDURE(*? Field),PRIVATE
Next                            PROCEDURE,VIRTUAL,BYTE
Open                            PROCEDURE,VIRTUAL
Previous                        PROCEDURE,VIRTUAL,BYTE
PrimeRecord                     PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,VIRTUAL
Reset                           PROCEDURE(BYTE Locate),VIRTUAL
Reset                           PROCEDURE,VIRTUAL
RestoreBuffers                  PROCEDURE(),PROTECTED,VIRTUAL
SaveBuffers                     PROCEDURE(),PROTECTED,VIRTUAL
SetFilter                       PROCEDURE(STRING Filter),VIRTUAL
SetFilter                       PROCEDURE(STRING Filter,STRING Id),VIRTUAL
SetFreeElement                  PROCEDURE,PRIVATE
SetOrder                        PROCEDURE(STRING Order),VIRTUAL
SetSort                         PROCEDURE(BYTE OrderNumber),BYTE,VIRTUAL,PROC
UseView                         PROCEDURE,PROTECTED
UnUseView                       PROCEDURE,PROTECTED
ValidateRecord                  PROCEDURE,BYTE,VIRTUAL
                              END


!---------------------------------------------------
! DBTriggers

IDbChangeAudit INTERFACE
ChangeField       PROCEDURE(*? Left, *? Right, STRING Name, STRING FileName)
OnChange          PROCEDURE(STRING FileName, FILE File)
BeforeChange      PROCEDURE(STRING FileName, BufferedPairsClass BFP)
               END

DbLogFileManager CLASS(FileManager),TYPE,MODULE('ABFILE.CLW'),LINK('ABFILE.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
Init              PROCEDURE(ErrorClass EC, STRING LogFileName)   !,EXTENDS
                 END

DbTriggerQueue QUEUE,TYPE
ID                USHORT
FileName          ASTRING
BFP               &BufferedPairsClass
               END

DbNameQueue    QUEUE,TYPE
FileName          ASTRING
FieldName         ASTRING
Ptr               USHORT
               END

DbColumnQueue    QUEUE,TYPE
FileName          ASTRING
FieldName         ASTRING
FieldHeader       ASTRING
FieldPicture      ASTRING
Length            USHORT
Field             ANY
                 END

LogFileQueue     QUEUE,TYPE
FileName          ASTRING
LogFileName       ASTRING
                 END

DbChangeManager  CLASS,TYPE,MODULE('ABFILE.CLW'),LINK('ABFILE.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
TriggerQueue       &DbTriggerQueue,PROTECTED
NameQueue          &DbNameQueue,PROTECTED
DbChangeAudit      &IDbChangeAudit,PRIVATE
Crit               &ICriticalSection,PRIVATE
Inited             BYTE,PROTECTED
Killed             BYTE,PRIVATE               ! The kill method was executed or not

AddItem            PROCEDURE(*? Left, STRING Name, STRING FileName)
AddThread          PROCEDURE(STRING FileName)
CheckChanges       PROCEDURE(STRING FileName, FILE File)
CheckPair          PROCEDURE(FieldPairsClass FP)
Equal              PROCEDURE(STRING FileName),BYTE
Init               PROCEDURE(*IDbChangeAudit IDbC)   !,EXTENDS
Kill               PROCEDURE()
Update             PROCEDURE(STRING FileName)
SetThread          PROCEDURE(STRING FileName),BYTE
Construct          PROCEDURE
Destruct           PROCEDURE !,FINAL
                 END


ThreadedAction  QUEUE,TYPE
Id                UNSIGNED
Action            STRING(20)
                END

DbAuditManager  CLASS,IMPLEMENTS(IDbChangeAudit),TYPE,MODULE('ABFILE.CLW'),LINK('ABFILE.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
Actions            &ThreadedAction,PROTECTED
ColumnInfo         &DbColumnQueue,PROTECTED
LogFiles           &LogFileQueue,PROTECTED
LFM                &DbLogFileManager,PROTECTED
Errors             &ErrorClass,PROTECTED
Crit               &ICriticalSection,PROTECTED
Inited             BYTE,PROTECTED
Killed             BYTE,PRIVATE               ! The kill method was executed or not

SyncAction         PROCEDURE,PROTECTED
SyncAction         PROCEDURE(UNSIGNED Id),PROTECTED
SetAction          PROCEDURE(STRING Action),PROTECTED
SetAction          PROCEDURE(UNSIGNED Id, STRING Action),PROTECTED
GetAction          PROCEDURE(UNSIGNED Id),STRING,PROTECTED
GetAction          PROCEDURE,STRING,PROTECTED

AddItem            PROCEDURE(STRING FileName, STRING FieldName, *? Field, STRING FieldHeader, STRING FieldPicture)
AddLogFile         PROCEDURE(STRING FileName, STRING LogFileName)
AppendLog          PROCEDURE(STRING FileName)
BeforeChange       PROCEDURE(STRING FileName, BufferedPairsClass BFP),VIRTUAL
CreateHeader       PROCEDURE(STRING FileName, DbLogFileManager LFM),VIRTUAL
Init               PROCEDURE(ErrorClass ErrorHandler),VIRTUAL
Kill               PROCEDURE(),VIRTUAL
SetFM              PROCEDURE(STRING FileName),BYTE,PROTECTED
OnChange           PROCEDURE(STRING FileName, FILE File),VIRTUAL
OnDelete           PROCEDURE(STRING FileName, FILE File),VIRTUAL
OnFieldChange      PROCEDURE(*? Left, *? Right, STRING FieldName, STRING FileName),VIRTUAL
OnInsert           PROCEDURE(STRING FileName, FILE File),VIRTUAL
OpenLogFile        PROCEDURE(STRING FileName),PROTECTED
CloseLogFile       PROCEDURE(STRING FileName),PROTECTED
Construct          PROCEDURE
Destruct           PROCEDURE !,FINAL
                 END

TransactionManager  CLASS,TYPE,MODULE('ABFILE.CLW'),LINK('ABFILE.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
Files                   &TransactionManagerQueue,PROTECTED
RMList                  &FilesOnTransactionQueue,PRIVATE
UselogoutList           &FilesOnTransactionQueue,PRIVATE
LogoutOff               BYTE,PRIVATE
AutoLogoutOff           BYTE,PRIVATE
LogoutTimeout           BYTE,PRIVATE                      ! Number of seconds to attempt to begin the transaction LOGOUT(SELF.LogoutTimeout)
TransactionRuning       BYTE,PRIVATE
AddItem                 PROCEDURE(RelationManager RM,BYTE pCascadeTransaction=1)
AddFileToLogout         PROCEDURE(RelationManager RM,BYTE pCascadeTransaction),BYTE,PRIVATE
Reset                   PROCEDURE()
SetTimeout              PROCEDURE(BYTE pTimeout)
Run                     PROCEDURE(BYTE pTimeout=2),BYTE,PROC
Start                   PROCEDURE(),BYTE,VIRTUAL
Process                 PROCEDURE(),BYTE,VIRTUAL
Finish                  PROCEDURE(BYTE pErrorLevel),BYTE,PROC,VIRTUAL
TransactionCommit       PROCEDURE(),BYTE,PROC,VIRTUAL
TransactionRollBack     PROCEDURE(),BYTE,PROC,VIRTUAL
SetLogoutOff            PROCEDURE()
SetLogoutOff            PROCEDURE(RelationManager RM),PRIVATE
RestoreLogout           PROCEDURE()
Construct               PROCEDURE() !,FINAL
Destruct                PROCEDURE() !,FINAL
                    END
_EndOfInclude_
