
!ABCIncludeFile

  OMIT('_EndOfInclude_',_FileDropBoxesPresent_)
_FileDropBoxesPresent_  EQUATE(1)

  INCLUDE('ABFILE.INC'),ONCE
  INCLUDE('ABWINDOW.INC'),ONCE

! ----------------------------------------------------------------------------
! The FileDropClass manages a drop box which displays values from a nominated
! field in a view. When an item is selected, the underlying view is
! synchronized with the selected item.
! ----------------------------------------------------------------------------

FileDropClass       CLASS(ViewManager),IMPLEMENTS(WindowComponent),MODULE('ABDROPS.CLW'),TYPE,LINK('ABDROPS.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
DisplayFields         &FieldPairsClass,PRIVATE                                              !Ref's to FieldPairsClass
UpdateFields          &FieldPairsClass,PRIVATE
Window                &WindowManager,PRIVATE
DefaultFill           BYTE
InitSyncPair          BYTE
AllowReset            BYTE
ListControl           SIGNED,PRIVATE                                                        !Feq of control
ListField             SIGNED,PRIVATE
ListQueue             &QUEUE,PRIVATE                                                        !Reference to list box queue
Loaded                BYTE,PRIVATE
ViewPosition          &STRING,PRIVATE                                                       !Reference to view
WindowCompOpen        BYTE,PRIVATE
UseMRP                BYTE,PROTECTED

AddField              PROCEDURE(*? Source,*? Destination)                                   !Adds a display pair
AddRecord             PROCEDURE(),BYTE,VIRTUAL,PROTECTED                                    !Adds a record to ListQueue
AddUpdateField        PROCEDURE(*? Source,*? Destination)                         !Adds an update field pair
BufferMatches         PROCEDURE,BYTE,PRIVATE,VIRTUAL
Init                  PROCEDURE(SIGNED Listbox,*STRING Position,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)  !Initializes
Kill                  PROCEDURE,VIRTUAL                                           !Kills
ResetQueue            PROCEDURE(BYTE Force=0),LONG,PROC,VIRTUAL                   !Rebuilds queue from View
SetQueueRecord        PROCEDURE,VIRTUAL                                           !Fills a queue record
TakeAccepted          PROCEDURE(),VIRTUAL
TakeEvent             PROCEDURE(),VIRTUAL                                         !Takes event from accept loop
TakeNewSelection      PROCEDURE(),VIRTUAL
TakeNewSelection      PROCEDURE(SIGNED Field),VIRTUAL
ValidateRecord        PROCEDURE(),BYTE,VIRTUAL                                    !Tests every record for inclusion during queue building
SetUseMRP             PROCEDURE(BYTE UseMRP=True),VIRTUAL
GetUseMRP             PROCEDURE(),BYTE,VIRTUAL
                    END


! ----------------------------------------------------------------------------
! The FileDropComboClass extends the functionality of the FileDropClass to
! allow 'Auto Entry Completion', this allows the user to quickly locate
! an item in the view.
! ----------------------------------------------------------------------------

FileDropComboClass  CLASS(FileDropClass),MODULE('ABDROPS.CLW'),TYPE,LINK('ABDROPS.CLW',_ABCLinkMode_),DLL(_ABCDllMode_)
AskProcedure          UNSIGNED
UseField              ANY,PROTECTED                                               !Reference to combos use variable
ButtonField           SIGNED,PRIVATE
EntryField            SIGNED,PRIVATE
EntryCompletion       BYTE
RemoveDuplicatesFlag  BYTE                                                        !Set True to not add duplicate records
ErrMgr                &ErrorClass,PRIVATE
AutoAddFlag           BYTE,PRIVATE                                                !Set to True to allow auto-add new records
ConfirmAutoAddFlag    BYTE,PRIVATE                                                !Set to True to ask for confirmation when auto-add
CaseSensitiveFlag     BYTE,PRIVATE                                                !Set True to force case sensitive comparisons
SyncronizeViewFlag    BYTE,PRIVATE                                                !Set True to keep the file buffers syncronized with the current list box choice
PromptCaption         PSTRING(80),PRIVATE
PromptText            PSTRING(256),PRIVATE
ECOn                  BYTE,PROTECTED                                              !Current state of entry completion, varies with keystrokes
LastEntry             CSTRING(256),PROTECTED

AddRecord             PROCEDURE(),BYTE,DERIVED,PROTECTED                          !Adds a record to ListQueue
Ask                   PROCEDURE,VIRTUAL,BYTE,PROTECTED                            !Return errorlevel = Level:Notify to prevent ResetQueue
BufferMatches         PROCEDURE,BYTE,DERIVED,PRIVATE
GetQueueMatch         PROCEDURE(STRING LookFor),LONG,PROTECTED
Init                  PROCEDURE(*? UseField,SIGNED Listbox,*STRING Pos,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM,ErrorClass EC,BYTE AutoAdd=1,BYTE AutoSync=1,BYTE Cased=0)
Kill                  PROCEDURE,DERIVED                                           !Kills
KeyValid              PROCEDURE(),BYTE,VIRTUAL
ResetQueue            PROCEDURE(BYTE Force=0),LONG,PROC,DERIVED
ResetFromList         PROCEDURE,PROTECTED
ResetFromItem         PROCEDURE(LONG Item)
TakeAccepted          PROCEDURE(),DERIVED
TakeNewSelection      PROCEDURE(),DERIVED
TakeNewSelection      PROCEDURE(SIGNED Field),DERIVED
TakeEvent             PROCEDURE(),DERIVED
UniquePosition        PROCEDURE(),LONG,PROTECTED
SetConfirmAutoAdd     PROCEDURE(BYTE pValue)
                    END

  _EndOfInclude_

