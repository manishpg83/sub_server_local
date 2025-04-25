#TEMPLATE(InMemoryCachedTable,'Softvelocity In-MemoryCachedTable'),FAMILY('CW20','ABC')
#HELP('IMDD.Chm')
#INCLUDE('SVFnGrp.TPW')
#EXTENSION(InMemoryCachedTableSupport, 'In-Memory Data Caching support'),APPLICATION,HLP('~IMDD_Global.htm')
#!
#PREPARE
  #CALL(%ReadABCFiles(ABC))
  #CALL(%SetupGlobalObjects)
#ENDPREPARE
#!
#INSERT(%OOPPrompts(ABC))
#PROMPT('Enable In-MemoryCachedTable',CHECK),%MEMCachedEnableGlobal,DEFAULT(%True),AT(10)
#SHEET
   #TAB('General'),HLP('~IMDD_DLL.htm'),WHERE(%DefaultExternal = 'All External')
     #!BOXED
     #!,AT(0,0),WHERE(%DefaultExternal = 'All External')
        #PROMPT('Select GEM File',OPENDIALOG('Select GEM File','DataDLL GEM|*.GEM')),%GEMFile,WHENACCEPTED(%ReadGEMFile(1))
        #VALIDATE(%DefaultExternal = 'All External' AND FILEEXISTS(%GEMFile),'The GEM file '&%GEMFile&' doesn''t exist. Select other file.')
        #DISPLAY()
        #DISPLAY('All settings are made in the Data DLL, are stored in ')
        #DISPLAY('the GEM file and automatically carried forward here. ')
        #DISPLAY()
     #!ENDBOXED
   #ENDTAB
   #TAB('Tables')
      #DISPLAY('Memory Tables Source')
      #ENABLE(%MEMCachedEnableGlobal)
      #SHEET
          #TAB('Generated Table'),HLP('~IMDD_GenTables.htm')
              #BOXED,SECTION
                #BOXED,AT(0,0),WHERE(%DefaultExternal = 'All External')
                    #BUTTON('Generated - Cached Tables'),FROM(%File,CHOOSE(%MEMCachedEnable,'X__'&%File,'___'&%File)),INLINE,WHERE(%FileDriver<>'MEMORY' AND %EnableOnServer(%File))
                        #DISPLAY('Table Name: '&%File)
                        #DISPLAY(CHOOSE(%MEMCachedEnable,'Table Cached','Table no Cached'))
                        #DISPLAY()
                        #DISPLAY('All settings are made in the Data DLL.')
                    #ENDBUTTON
                #ENDBOXED
                #BOXED,AT(0,0),WHERE(NOT %GlobalExternal)
                   #ENABLE(NOT %GlobalExternal)
                      #BUTTON('Generated - Cached Tables'),FROM(%File,CHOOSE(%MEMCachedEnable,'X__'&%File,'___'&%File)),INLINE,WHERE(%FileDriver<>'MEMORY' AND %EnableOnServer(%File))
                         #DISPLAY('Table Name: '&%File)
                         #PROMPT('Cache this table in Memory',CHECK),%MEMCachedEnable,DEFAULT(%False),AT(10)
                            #ENABLE(%MEMCachedEnable)
                               #PROMPT('Records to Read:',DROP('ALL|Limited')),%MEMCachedLimitType,DEFAULT('ALL')
                               #ENABLE(%MEMCachedLimitType='Limited')
                                  #PROMPT('Read this many Records:',SPIN(@n4,1,9999)),%MEMCachedLimitNumber,DEFAULT(100)
                               #ENDENABLE
                               #ENABLE(%isSQL(%File))
                                  #DISPLAY('SQL Query:')
                                  #PROMPT('SQL Query:',TEXT),%MEMCachedSQLQuery
                               #ENDENABLE
                               #PROMPT('Filter:',@S255),%MEMCachedRecordFilter
                               #PROMPT('KEY to Use:',KEY(%File)),%MEMCachedSortKey
                               #ENABLE(%MEMCachedSortKey)
                                      #PROMPT('Range Limit &Field:',COMPONENT(%MEMCachedSortKey)),%MEMCachedRangeField
                                      #ENABLE(%MEMCachedRangeField)
                                        #PROMPT('Range Limit &Type:',DROP('Single Value|Range of Values')),%MEMCachedRangeLimitType,DEFAULT('Single Value')
                                        #BOXED,SECTION
                                          #BOXED('Range Limit Boundary'),WHERE(%MEMCachedRangeLimitType='Single Value'),AT(,0)
                                            #PROMPT('&Range Limit Value:',@S255),%MEMCachedRangeLimit
                                          #ENDBOXED
                                          #BOXED('Range Limit Boundaries'),WHERE(%MEMCachedRangeLimitType='Range of Values'),AT(,0)
                                            #PROMPT('&Low Limit Value:',@S255),%MEMCachedRangeLow
                                            #PROMPT('&High Limit Value:',@S255),%MEMCachedRangeHigh
                                          #ENDBOXED
                                        #ENDBOXED
                                      #ENDENABLE
                               #ENDENABLE
                               #PROMPT('Include Blobs',CHECK),%MEMCachedIncludeBlobs,DEFAULT(%False),AT(10)
                               #BOXED(''),WHERE(NOT %isSQL(%File))
                               #ENABLE(%MEMCachedLimitType='ALL' AND NOT %isSQL(%File)),CLEAR
                               #PROMPT('Re-write physical file on Application Exit',CHECK),%MEMCachedSaveOnExit,DEFAULT(%False),AT(10)
                                  #ENABLE(%MEMCachedSaveOnExit),CLEAR
                                     #PROMPT('User defined Save (Optimize Save)',CHECK),%MEMCachedSaveOptimize,DEFAULT(%False),AT(10)
                                  #ENDENABLE
                               #ENDENABLE
                               #ENDBOXED
                               #PROMPT('Load the file on a background thread',CHECK),%MEMCachedAsynchronicLoad,DEFAULT(%False),AT(10)
                               #ENABLE(NOT %MEMCachedSaveOnExit),CLEAR
                                  #PROMPT('Keep physical file synchronized',CHECK),%MEMCachedKeepSynchronized,DEFAULT(%False),AT(10)
                               #ENDENABLE
                            #ENDENABLE
                      #ENDBUTTON
                   #ENDENABLE
                #ENDBOXED
              #ENDBOXED
          #ENDTAB
          #TAB('Dictionary Table'),HLP('~IMDD_SuppliedTables.htm')
             #BUTTON('Dictionary - Cached Tables'),MULTI(%MEMSuppliedFiles,%MEMSuppliedPhysical&' --> '&%MEMSuppliedInMemory),INLINE,HLP('~IMDD_SuppliedTables.htm')
                #ENABLE(NOT %GlobalExternal)
                    #PROMPT('Physical Table:',FROM(%FILE,%FileDriver<>'MEMORY')),%MEMSuppliedPhysical,REQ
                    #PROMPT('In-Memory Table:',FROM(%FILE,%FileDriver='MEMORY')),%MEMSuppliedInMemory,REQ
                #ENDENABLE
                #BOXED,SECTION
                    #BOXED,AT(0,0),WHERE(%DefaultExternal = 'All External')
                        #DISPLAY('All settings are made in the Data DLL, are stored in ')
                        #DISPLAY('the GEM file and automatically carried forward here. ')
                    #ENDBOXED
                    #BOXED,AT(0,0),WHERE(NOT %GlobalExternal)
                        #PROMPT('Clear Record Before Assign',CHECK),%MEMSuppliedClear,DEFAULT(%True),AT(10)
                        #BUTTON('Field Assignment'),HLP('~IMDD_SuppliedTables.htm#IMDD_FieldAssign')
                           #BUTTON(''),MULTI(%MEMSuppliedFilesFields,%MEMSuppliedPhysicalField&' --> '&%MEMSuppliedInMemoryField),INLINE
                           #PROMPT('Physical Field:',FIELD(%MEMSuppliedPhysical)),%MEMSuppliedPhysicalField,REQ
                           #PROMPT('In-Memory Field:',FIELD(%MEMSuppliedInMemory)),%MEMSuppliedInMemoryField,REQ
                           #ENDBUTTON
                           #BUTTON('Assign by Name'),WHENACCEPTED(%MEMSuppliedFilesAssignByName())
                           #ENDBUTTON
                        #ENDBUTTON
                        #PROMPT('Records to Read:',DROP('ALL|Limited')),%MEMSuppliedLimitType,DEFAULT('ALL')
                        #ENABLE(%MEMSuppliedLimitType='Limited')
                           #PROMPT('Read this many Records:',SPIN(@n4,1,9999)),%MEMSuppliedLimitNumber,DEFAULT(100)
                        #ENDENABLE
                        #ENABLE(%isSQL(%MEMSuppliedPhysical))
                           #DISPLAY('SQL Query:')
                           #PROMPT('SQL Query:',TEXT),%MEMSuppliedSQLQuery
                        #ENDENABLE
                        #PROMPT('Filter:',@S255),%MEMSuppliedRecordFilter
                        #PROMPT('KEY to Use:',KEY(%MEMSuppliedPhysical)),%MEMSuppliedSortKey
                        #ENABLE(%MEMSuppliedSortKey)
                               #PROMPT('Range Limit &Field:',COMPONENT(%MEMSuppliedSortKey)),%MEMSuppliedRangeField
                               #ENABLE(%MEMSuppliedRangeField)
                                 #PROMPT('Range Limit &Type:',DROP('Single Value|Range of Values')),%MEMSuppliedRangeLimitType,DEFAULT('Single Value')
                                 #BOXED,SECTION
                                   #BOXED('Range Limit Boundary'),WHERE(%MEMSuppliedRangeLimitType='Single Value'),AT(,0)
                                     #PROMPT('&Range Limit Value:',@S255),%MEMSuppliedRangeLimit
                                   #ENDBOXED
                                   #BOXED('Range Limit Boundaries'),WHERE(%MEMSuppliedRangeLimitType='Range of Values'),AT(,0)
                                     #PROMPT('&Low Limit Value:',@S255),%MEMSuppliedRangeLow
                                     #PROMPT('&High Limit Value:',@S255),%MEMSuppliedRangeHigh
                                   #ENDBOXED
                                 #ENDBOXED
                               #ENDENABLE
                        #ENDENABLE
                        #BOXED,HIDE,WHERE(%isThreadedContent(%MEMSuppliedInMemory))
                           #DISPLAY('Disable because the table has /THREADEDCONTENT=ON')
                        #ENDBOXED
                        #ENABLE(NOT %isThreadedContent(%MEMSuppliedInMemory)),CLEAR
                           #PROMPT('Cache this table Globally',CHECK),%MEMCachedEnableGlobally,DEFAULT(%False),AT(10)
                           #BOXED(''),WHERE(NOT %isSQL(%MEMSuppliedPhysical))
                              #ENABLE(%MEMSuppliedLimitType='ALL'  AND NOT %isSQL(%MEMSuppliedPhysical)),CLEAR
                                 #PROMPT('Re-write physical file on Application Exit',CHECK),%MEMSuppliedSaveOnExit,DEFAULT(%False),AT(10)
                                 #ENABLE(%MEMSuppliedSaveOnExit),CLEAR
                                    #PROMPT('User defined Save (Optimize Save)',CHECK),%MEMSuppliedSaveOptimize,DEFAULT(%False),AT(10)
                                 #ENDENABLE
                              #ENDENABLE
                           #ENDBOXED
                        #ENDENABLE
                        #ENABLE(NOT %MEMSuppliedSaveOnExit),CLEAR
                           #PROMPT('Keep physical file synchronized',CHECK),%MEMSuppliedKeepSynchronized,DEFAULT(%False),AT(10)
                        #ENDENABLE
                    #ENDBOXED
                #ENDBOXED
             #ENDBUTTON
          #ENDTAB
      #ENDSHEET
      #ENDENABLE
   #ENDTAB
   #TAB('Classes'),HLP('~IMDD_Classes.htm'),WHERE(%MEMCachedEnableGlobal AND NOT %GlobalExternal)
    #BOXED
       #PROMPT('Default In-Memory Cache Manager:', FROM(%pClassName)),%CachedManagerType,DEFAULT('FileSynchronizationClass'),REQ
    #ENDBOXED
    #BOXED('Individual In-Memory Cache Manager Overrides'),HIDE
       #BUTTON('Individual Cached Overrides for '&%File&' file'),FROM(%File,%File & ' - ' & %FileDescription),AT(10,,180),INLINE,SORT,WHERE(%MEMCachedEnable OR %IsSelectedForMem(%File)),HLP('~IMDD_Classes.htm')
         #WITH(%ClassItem, 'CachedManager:' & %File)
           #INSERT(%GlobalClassPrompts(ABC))
         #ENDWITH
      #ENDBUTTON
    #ENDBOXED
   #ENDTAB
#ENDSHEET
#DISPLAY('(c) 2005 by SoftVelocity - V2.2')
#ATSTART
    #IF(%MEMCachedEnableGlobal)
    #FIX(%Driver,'MEMORY')
    #PROJECT(%DriverLIB)
    #CALL(%ReadABCFiles(ABC))
    #CALL(%SetupGlobalObjects)
    #IF(NOT %GlobalExternal)
       #PROJECT(%Application&'M0.CLW')
    #ENDIF
    #ENDIF
    #DECLARE(%MEMUsingSuppliedFile)
#IF(%DefaultExternal = 'All External')
   #CALL(%ReadGEMFile)
#ENDIF
#ENDAT
#!
#AT(%AfterGeneratedApplication),WHERE(%DefaultExternal = 'None External' AND %ProgramExtension='DLL')
  #INSERT(%ConstructGEMFile)
#ENDAT
#!
#AT(%BeforeGlobalIncludes),WHERE(%MEMCachedEnableGlobal)
#CALL(%AddModuleIncludeFile(ABC),%CachedManagerType,1)
#ENDAT
#!
#AT(%CustomGlobalDeclarations),WHERE(%MEMCachedEnableGlobal)
#FOR(%MEMSuppliedFiles)
   #ADD(%UsedFile,%MEMSuppliedPhysical)
   #ADD(%UsedFile,%MEMSuppliedInMemory)
#ENDFOR
#ENDAT
#!
#AT(%BeforeFileDeclaration),LAST,WHERE(UPPER(%AppTemplateFamily)='ABC' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#! create the physical table structure with the existing name prepended with MEM_
#! and change the prefix to make it unique
!This table was modified by the In-MemoryCachedTableSupport Template
!the driver attribute was changed to the In-Memory driver
#INSERT(%GenerateFileDeclaration,%File,'MEMAUX_'&%File,'MEMAUX_'&%FilePrefix)

!This table was generated by the In-MemoryCachedTableSupport Template
#ENDAT
#!
#AT(%IPDRVEndOfGetFileStructHeader),FIRST,WHERE(UPPER(%AppTemplateFamily)='ABC' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#SET(%RVal,REPLACE(%RVal,'DRIVER','''MEMORY''',1))
#CALL(%AppendAttr(ABC), %RVal, 'CREATE',%True)
#CALL(%RemoveAttr(ABC), %RVal, 'OWNER')
#CALL(%RemoveAttr(ABC), %RVal, 'ENCRYPT')
#CALL(%RemoveAttr(ABC), %RVal, 'RECLAIM')
#ENDAT
#!
#AT(%IPDRVEndOfGetFileStructHeader),FIRST,WHERE(UPPER(%AppTemplateFamily)='CLARION' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#SET(%ValueConstruct,REPLACE(%ValueConstruct,'DRIVER','''MEMORY''',1))
#CALL(%AppendAttr(ABC), %ValueConstruct, 'CREATE',%True)
#CALL(%RemoveAttr(ABC), %ValueConstruct, 'OWNER')
#CALL(%RemoveAttr(ABC), %ValueConstruct, 'ENCRYPT')
#CALL(%RemoveAttr(ABC), %ValueConstruct, 'RECLAIM')
#ENDAT
#!
#AT(%EndOfGetFileStructHeader),FIRST,WHERE(UPPER(%AppTemplateFamily)='ABC' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#! then replace the Driver for the table in the
#SET(%RVal,REPLACE(%RVal,'DRIVER','''MEMORY''',1))
#CALL(%AppendAttr(ABC), %RVal, 'CREATE',%True)
#CALL(%RemoveAttr(ABC), %RVal, 'OWNER')
#CALL(%RemoveAttr(ABC), %RVal, 'ENCRYPT')
#CALL(%RemoveAttr(ABC), %RVal, 'RECLAIM')
#ENDAT
#!
#AT(%BeforeFileDeclaration),LAST,WHERE(UPPER(%AppTemplateFamily)='CLARION' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#! create the physical table structure with the existing name prepended with MEM_
#! and change the prefix to make it unique
!This table was modified by the In-MemoryCachedTableSupport Template
!the driver attribute was changed to the In-Memory driver
#INSERT(%GenerateFileDeclaration,%File,'MEMAUX_'&%File,'MEMAUX_'&%FilePrefix)

!This table was generated by the In-MemoryCachedTableSupport Template
#SET(%ValueConstruct,REPLACE(%ValueConstruct,'DRIVER','''MEMORY''',1))
#CALL(%AppendAttr(ABC), %ValueConstruct, 'CREATE',%True)
#CALL(%RemoveAttr(ABC), %ValueConstruct, 'OWNER')
#CALL(%RemoveAttr(ABC), %ValueConstruct, 'ENCRYPT')
#CALL(%RemoveAttr(ABC), %ValueConstruct, 'RECLAIM')
#ENDAT
#!
#AT(%OverrideLogoutDesired),LAST,WHERE(UPPER(%AppTemplateFamily)='CLARION' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#SET(%LogoutDesired,%False)
#ENDAT
#!
#AT(%EndOfGetFileStructHeader),FIRST,WHERE(UPPER(%AppTemplateFamily)='CLARION' AND %MEMCachedEnable AND %MEMCachedEnableGlobal)
#! then replace the Driver for the table in the
#ENDAT
#!
#AT(%AfterFileDeclarations),WHERE(%MEMCachedEnableGlobal)
#IF(NOT %GlobalExternal)
MemDriverIniterClass CLASS,THREAD
Construct               PROCEDURE
Destruct                PROCEDURE
                     END
#ENDIF
#CALL(%GenerateMemAccessPointers)
#ENDAT
#!
#!
#AT(%ProcedureDeclarationsInsideGlobalMap),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal)
     MODULE('%(%Application&'M0.CLW')')
MemDriverInit     PROCEDURE                                           #<! Initializes the MemDriver definition module
MemDriverKill     PROCEDURE                                           #<! Kills the MemDriver definition module
     END
#ENDAT
#!
#AT(%CachedManagerCodeSection),PRIORITY(5000),DESCRIPTION('Parent Call'),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal)
  #CALL(%GenerateParentCall(ABC))
#ENDAT
#!
#AT(%ProgramProcedures),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal)
MemDriverIniterClass.Construct               PROCEDURE
 CODE
 #EMBED(%BeforeMemDriverInitialization),HIDE
 MemDriverInit()
 #EMBED(%AfterMemDriverInitialization),HIDE


MemDriverIniterClass.Destruct                PROCEDURE
 CODE
 #EMBED(%BeforeMemDriverDestruction),HIDE
 MemDriverKill()
 #EMBED(%AfterMemDriverDestruction),HIDE

#CALL(%GenerateMemCLW)
#ENDAT
#AT(%DLLKillCode),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND %ProgramExtension='DLL')
MemDriverKill()
#ENDAT
#AT(%AfterDctInitialization),PRIORITY(2500),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal)
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
Relate:%File.UseLogout = False
   #ENDIF
#ENDFOR
#FOR(%MEMSuppliedFiles)
   #FIX(%File,%MEMSuppliedInMemory)
   #IF(%File AND INLIST(%File,%UsedFile))
Relate:%File.UseLogout = False
   #ENDIF
#ENDFOR
#ENDAT
#!
#AT(%ProgramSetup),PRIORITY(5000),DESCRIPTION('Load In-MemoryTables'),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal)
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
      #IF(%MEMCachedAsynchronicLoad)
MemAccess:%File.AsynchronicLoad()
      #ELSE
MemAccess:%File.Load()
      #ENDIF
   #ENDIF
#ENDFOR
#FOR(%MEMSuppliedFiles)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
      #FIX(%File,%MEMSuppliedInMemory)
      #IF(NOT %isThreadedContent(%MEMSuppliedInMemory))
         #IF(%MEMCachedEnableGlobally)
MemAccess:%MEMSuppliedInMemory.Load()
         #ENDIF
      #ENDIF
   #ENDIF
#ENDFOR
#ENDAT
#!
#AT(%FileManagerCodeSection,,'PreUpdate','(LONG Pntr,UNSIGNED PutLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE'),PRIORITY(101),DESCRIPTION('Synchronize In-MemoryTable'),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND UPPER(%AppTemplateFamily)='ABC')
    #IF(%MEMCachedEnable AND %MEMCachedKeepSynchronized)
IF MemAccess:%File.SyncUpdate(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
    #ENDIF
    #FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%File)
        #IF(%MEMSuppliedKeepSynchronized)
IF MemAccess:%File.SyncUpdate(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
        #ENDIF
    #ENDFOR
#ENDAT
#!
#AT(%FileManagerCodeSection,,'PreInsert','(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE'),PRIORITY(101),DESCRIPTION('Synchronize In-MemoryTable'),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND UPPER(%AppTemplateFamily)='ABC')
    #IF(%MEMCachedEnable AND %MEMCachedKeepSynchronized)
IF MemAccess:%File.SyncInsert(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
    #ENDIF
    #FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%File)
        #IF(%MEMSuppliedKeepSynchronized)
IF MemAccess:%File.SyncInsert(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
        #ENDIF
    #ENDFOR
#ENDAT
#!
#AT(%FileManagerCodeSection,,'PreDelete','(*CSTRING ErrCode,*CSTRING ErrMsg),BYTE'),PRIORITY(101),DESCRIPTION('Synchronize In-MemoryTable'),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND UPPER(%AppTemplateFamily)='ABC')
    #IF(%MEMCachedEnable AND %MEMCachedKeepSynchronized)
IF MemAccess:%File.SyncDelete(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
    #ENDIF
    #FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%File)
        #IF(%MEMSuppliedKeepSynchronized)
IF MemAccess:%File.SyncDelete(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
        #ENDIF
    #ENDFOR
#ENDAT
#!
#AT(%TriggerManagerCodeSection,,'PreDelete','(*CSTRING ErrCode,*CSTRING ErrMsg),BYTE'),PRIORITY(101),DESCRIPTION('Synchronize In-MemoryTable'),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND UPPER(%AppTemplateFamily)='CLARION')
    #IF(%MEMCachedEnable AND %MEMCachedKeepSynchronized)
IF MemAccess:%File.SyncDelete(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
    #ENDIF
    #FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%File)
        #IF(%MEMSuppliedKeepSynchronized)
IF MemAccess:%File.SyncDelete(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
        #ENDIF
    #ENDFOR
#ENDAT
#AT(%TriggerManagerCodeSection,,'PreInsert','(SIGNED OpCode,UNSIGNED AddLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE'),PRIORITY(101),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND UPPER(%AppTemplateFamily)='CLARION')
    #IF(%MEMCachedEnable AND %MEMCachedKeepSynchronized)
IF MemAccess:%File.SyncInsert(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
    #ENDIF
    #FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%File)
        #IF(%MEMSuppliedKeepSynchronized)
IF MemAccess:%File.SyncInsert(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
        #ENDIF
    #ENDFOR
#ENDAT
#AT(%TriggerManagerCodeSection,,'PreUpdate','(LONG Pntr,UNSIGNED PutLen,*CSTRING ErrCode,*CSTRING ErrMsg),BYTE'),PRIORITY(101),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal AND UPPER(%AppTemplateFamily)='CLARION')
    #IF(%MEMCachedEnable AND %MEMCachedKeepSynchronized)
IF MemAccess:%File.SyncUpdate(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
    #ENDIF
    #FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%File)
        #IF(%MEMSuppliedKeepSynchronized)
IF MemAccess:%File.SyncUpdate(%File)<>Level:Benign
   ErrCode=90
   ErrMsg ='The file could not be synchronized.('&MemAccess:%File.GetSyncErrorCode()&') '&MemAccess:%File.GetSyncError()
   POPERRORS()
   ReturnValue = False
   RETURN ReturnValue
END
        #ENDIF
    #ENDFOR
#ENDAT
#!
#AT(%CachedManagerAfterInit),PRIORITY(5000),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal),AUTO
#DECLARE(%lMEMCachedRecordFilter)
   #IF(%MEMCachedLimitType='Limited')
MemAccess:%File.SetRecordsToRead(%MEMCachedLimitNumber)
   #ENDIF
   #IF(%MEMCachedRecordFilter)
      #SET(%lMEMCachedRecordFilter,%MEMCachedRecordFilter)
      #CALL(%ReplaceSubString,%lMEMCachedRecordFilter,%FilePrefix&':','MEMAUX_'&%FilePrefix&':')
      #CALL(%StripPling(ABC),%lMEMCachedRecordFilter),%lMEMCachedRecordFilter
MemAccess:%File.SetFilter(%lMEMCachedRecordFilter)
   #ENDIF
   #IF(%MEMCachedSortKey)
MemAccess:%File.SetOrderKey(MEMAUX_%MEMCachedSortKey)
      #IF(%MEMCachedRangeField)
         #IF(%MEMCachedRangeLimitType='Single Value')
MemAccess:%File.SetRange(MEMAUX_%MEMCachedRangeField,%MEMCachedRangeLimit)
         #ELSE
MemAccess:%File.SetRange(MEMAUX_%MEMCachedRangeField,%MEMCachedRangeLow,%MEMCachedRangeHigh)
         #ENDIF
      #ENDIF
   #ENDIF
#ENDAT
#!
#!
#AT(%CachedManagerAfterInitSupplied),PRIORITY(5000),WHERE(NOT %GlobalExternal AND %MEMCachedEnableGlobal),AUTO
#DECLARE(%lMEMCachedRecordFilter)
   #IF(%MEMSuppliedLimitType='Limited')
MemAccess:%MEMSuppliedInMemory.SetRecordsToRead(%MEMSuppliedLimitNumber)
   #ENDIF
   #IF(%MEMSuppliedRecordFilter)
   #CALL(%StripPling(ABC),%MEMSuppliedRecordFilter),%lMEMCachedRecordFilter
MemAccess:%MEMSuppliedInMemory.SetFilter(%lMEMCachedRecordFilter)
   #ENDIF
   #IF(%MEMSuppliedSortKey)
MemAccess:%MEMSuppliedInMemory.SetOrderKey(%MEMSuppliedSortKey)
      #IF(%MEMSuppliedRangeField)
         #IF(%MEMSuppliedRangeLimitType='Single Value')
MemAccess:%MEMSuppliedInMemory.SetRange(%MEMSuppliedRangeField,%MEMSuppliedRangeLimit)
         #ELSE
MemAccess:%MEMSuppliedInMemory.SetRange(%MEMSuppliedRangeField,%MEMSuppliedRangeLow,%MEMSuppliedRangeHigh)
         #ENDIF
      #ENDIF
   #ENDIF
#ENDAT
#!
#AT(%DLLExportList),WHERE(%MEMCachedEnableGlobal),AUTO
#IF(UPPER(%AppTemplateFamily)='CLARION')
#EQUATE(%NoGenerateGlobals,%False)
#ENDIF
  #IF(~%GlobalExternal)
    #IF(~%NoGenerateGlobals)
      #FOR(%UsedFile)
         #FIX(%File,%UsedFile)
         #IF(%MEMCachedEnable)
  #INSERT(%AddExpItem(ABC),'$MemAccess:'&%File)
         #ENDIF
      #ENDFOR
      #FOR(%MEMSuppliedFiles)
         #FIX(%File,%MEMSuppliedPhysical)
         #IF(%File AND INLIST(%File,%UsedFile))
  #INSERT(%AddExpItem(ABC),'$MemAccess:'&%MEMSuppliedInMemory)
         #ENDIF
      #ENDFOR
    #ENDIF
  #ENDIF
#ENDAT
#!
#AT(%CachedManagerCodeSection,,'Init','(FILE pTargetFile,FILE pOriginalFile)'),PRIORITY(6000),WHERE(%MEMCachedEnableGlobal)
#IF(%MEMUsingSuppliedFile)
    #IF((%MEMSuppliedLimitType='ALL' AND %MEMSuppliedSaveOnExit AND %MEMSuppliedSaveOptimize) OR %isSQL(%MEMSuppliedPhysical))
SELF.OptimizeSave = True
    #ENDIF
    #IF(%isSQL(%MEMSuppliedPhysical))
SELF.BackupOnSave = False
        #IF(%MEMSuppliedSQLQuery)
SELF.SetUseSQL(True)
        #ENDIF
        #FIX(%File,%MEMSuppliedPhysical)
        #FOR(%MEMSuppliedFilesFields)
            #FIX(%Field,%MEMSuppliedPhysicalField)
            #IF(%FieldType='BLOB' OR %FieldType='MEMO')
SELF.SetUseBuffer(False)
               #BREAK
            #ENDIF
        #ENDFOR
    #ENDIF
#ELSE
    #IF((%MEMCachedLimitType='ALL' AND %MEMCachedSaveOnExit AND %MEMCachedSaveOptimize) OR %isSQL(%File))
SELF.OptimizeSave = True
    #ENDIF
    #IF(%isSQL(%File))
SELF.BackupOnSave = False
        #IF(%MEMCachedSQLQuery)
SELF.SetUseSQL(True)
        #ENDIF
        #IF(%MEMCachedIncludeBlobs)
            #FOR(%Field),WHERE(%FieldType='BLOB' OR %FieldType='MEMO')
SELF.SetUseBuffer(False)
                #BREAK
            #ENDFOR
        #ENDIF
    #ENDIF
#ENDIF
#ENDAT
#!
#AT(%CachedManagerCodeSection,,'ResetRange','()'),PRIORITY(6000),WHERE(%MEMCachedEnableGlobal)
#IF(%MEMUsingSuppliedFile)
    #IF(%isSQL(%MEMSuppliedPhysical) AND %MEMSuppliedSQLQuery)
SELF.Original{PROP:SQL}='%MEMSuppliedSQLQuery'
    #ENDIF
#ELSE
    #IF(%isSQL(%File) AND %MEMCachedSQLQuery)
SELF.Original{PROP:SQL}='%MEMCachedSQLQuery'
    #ENDIF
#ENDIF
#ENDAT
#!
#AT(%CachedManagerCodeSection,,'PrimeRecord','()'),PRIORITY(6000),WHERE(%MEMCachedEnableGlobal)
#IF(%MEMUsingSuppliedFile)
    #FIX(%File,%MEMSuppliedPhysical)
    #IF(%MEMSuppliedClear)
CLEAR(%MEMSuppliedInMemory.Record)
    #ENDIF
    #FOR(%MEMSuppliedFilesFields)
        #FIX(%Field,%MEMSuppliedPhysicalField)
        #IF(%FieldType='BLOB')
%MEMSuppliedInMemoryField[0:%MEMSuppliedPhysicalField{PROP:Size}] = %MEMSuppliedPhysicalField[0:%MEMSuppliedPhysicalField{PROP:Size}]
%MEMSuppliedInMemoryField{PROP:Size}=%MEMSuppliedPhysicalField{PROP:Size}
        #ELSE
%MEMSuppliedInMemoryField = %MEMSuppliedPhysicalField
        #ENDIF
    #ENDFOR
#ELSE
    #IF(%MEMCachedIncludeBlobs)
        #FOR(%Field),WHERE(%FieldType='BLOB' OR %FieldType='MEMO')
            #IF(%FieldType='BLOB')
%Field[0:MEMAUX_%Field{PROP:Size}] = MEMAUX_%Field[0:MEMAUX_%Field{PROP:Size}]
%Field{PROP:Size}=MEMAUX_%Field{PROP:Size}
            #ELSE
%Field = MEMAUX_%Field
            #ENDIF
        #ENDFOR
    #ENDIF
#ENDIF
#ENDAT
#!
#AT(%CachedManagerCodeSection,,'PrimeSaveRecord','()'),PRIORITY(6000),WHERE(%MEMCachedEnableGlobal)
#IF(%MEMUsingSuppliedFile)
    #FIX(%File,%MEMSuppliedPhysical)
    #IF(%MEMSuppliedClear)
CLEAR(%MEMSuppliedPhysical.Record)
    #ENDIF
    #FOR(%MEMSuppliedFilesFields)
        #FIX(%Field,%MEMSuppliedPhysicalField)
        #IF(%FieldType='BLOB')
%MEMSuppliedPhysicalField[0:%MEMSuppliedInMemoryField{PROP:Size}] = %MEMSuppliedInMemoryField[0:%MEMSuppliedInMemoryField{PROP:Size}]
%MEMSuppliedPhysicalField{PROP:Size}=%MEMSuppliedInMemoryField{PROP:Size}
        #ELSE
%MEMSuppliedPhysicalField = %MEMSuppliedInMemoryField
        #ENDIF
    #ENDFOR
#ELSE
    #IF(%MEMCachedIncludeBlobs)
        #FOR(%Field),WHERE(%FieldType='BLOB' OR %FieldType='MEMO')
            #IF(%FieldType='BLOB')
MEMAUX_%Field[0:%Field{PROP:Size}] = %Field[0:%Field{PROP:Size}]
MEMAUX_%Field{PROP:Size}=%Field{PROP:Size}
            #ELSE
MEMAUX_%Field = %Field
            #ENDIF
        #ENDFOR
    #ENDIF
#ENDIF
#ENDAT
#!
#!
#!
#!---------------------------------------------------------------------------------------
#!
#GROUP(%EnableOnServer,%pFile),PRESERVE
#FIX(%ApplicationTemplate,'IPClient(IPDRV)')
#IF(%ApplicationTemplate='IPClient(IPDRV)')
   #CONTEXT(%Application,%ApplicationTemplateInstance)
      #FIX(%File, %pFile)
      #IF(VAREXISTS(%IPSFileAttribute))
         #IF(INLIST('CACHED',%IPSFileAttribute))
             #RETURN(%True)
         #ELSE
             #RETURN(%False)
         #ENDIF
      #ELSE
          #RETURN(%False)
      #ENDIF
   #ENDCONTEXT
#ELSE
   #RETURN(%true)
#ENDIF
#!
#!
#!---------------------------------------------------------------------------------------
#!
#GROUP(%GenerateFileDeclaration,%pFile,%pFileName,%pFilePrefix),PRESERVE,AUTO
#DECLARE(%lKeyStruct)
#DECLARE(%lFileStructHeader)
#FIX(%File,%pFile)
#SET(%lFileStructHeader,%GetFileStructHeader())
#SET(%lFileStructHeader,REPLACE(%lFileStructHeader,'PRE',%pFilePrefix,1))
#IF(NOT %FileName)
   #IF(LEN(%File)>8)
      #CALL(%AppendAttr(ABC), %lFileStructHeader, 'NAME('''&LEFT(%File,8)&''')')
   #ELSE
      #CALL(%AppendAttr(ABC), %lFileStructHeader, 'NAME('''&%File&''')')
   #ENDIF
#ENDIF
#EMBED(%IMDDEndOfGetFileStructHeader),%File,HIDE
%[20]pFileName %lFileStructHeader
    #FOR(%Key)
      #SET(%lKeyStruct,%KeyStruct)
      #CALL(%ReplaceSubString,%lKeyStruct,','&%FilePrefix&':',','&%pFilePrefix&':')
      #CALL(%ReplaceSubString,%lKeyStruct,',-'&%FilePrefix&':',',-'&%pFilePrefix&':')
      #CALL(%ReplaceSubString,%lKeyStruct,',+'&%FilePrefix&':',',+'&%pFilePrefix&':')
      #CALL(%ReplaceSubString,%lKeyStruct,'('&%FilePrefix&':','('&%pFilePrefix&':')
      #CALL(%ReplaceSubString,%lKeyStruct,'(-'&%FilePrefix&':','(-'&%pFilePrefix&':')
      #CALL(%ReplaceSubString,%lKeyStruct,'(+'&%FilePrefix&':','(+'&%pFilePrefix&':')
%lKeyStruct
    #ENDFOR
    #FOR(%Field),WHERE(%FieldType = 'MEMO')
%FieldStruct
    #ENDFOR
    #FOR(%Field),WHERE(%FieldType = 'BLOB')
%FieldStruct
    #ENDFOR
%FileStructRec,PRE()
  #FOR(%Field),WHERE(%FieldType <> 'MEMO' AND %FieldType <> 'BLOB')
%FieldStruct
  #ENDFOR
%FileStructRecEnd
%[20]NULL %(LEFT(%FileStructEnd))
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%GetFileStructHeader),AUTO
#DECLARE(%lFileStructHeader)
#DECLARE(%ReturnValue)
#DECLARE(%RVal)
    #SET(%RVal,CLIP(LEFT(SLICE(%FileStruct,INSTRING(' ',%FileStruct,1,1),LEN(%FileStruct)))))
    #CALL(%GetFileCreateable(ABC)),%ReturnValue
    #IF(%ReturnValue)
      #CALL(%AppendAttr(ABC), %RVal, 'CREATE',%True)
    #ENDIF
    #CALL(%AppendAttr(ABC), %RVal, 'BINDABLE', %True)
    #CALL(%GetFileThreaded(ABC)),%ReturnValue
    #IF(%ReturnValue)
      #CALL(%AppendAttr(ABC), %Rval, 'THREAD',%True)
    #ENDIF
  #CASE(%OverrideExternal)
  #OF('External')
    #SET(%FileExternalFlag,%True)
    #CALL(%FileAppendExternal(ABC), %RVal, %OverrideExternalSource)
  #OF('Use Default')
    #IF(%DefaultExternal='All External')
      #IF(%DefaultExternalAPP)
        #SET(%FileExternalFlag,%True)
      #ENDIF
      #CALL(%FileAppendExternal(ABC), %RVal, %DefaultExternalSource)
    #ENDIF
  #OF('Not External')
  #ELSE
    #IF(%DefaultExternal='All External')
      #IF(%DefaultExternalAPP)
        #SET(%FileExternalFlag,%True)
      #ENDIF
      #CALL(%FileAppendExternal(ABC), %RVal, %DefaultExternalSource)
    #ENDIF
  #ENDCASE
    #IF(EXTRACT(%RVal, 'EXTERNAL'))
      #CALL(%RemoveAttr(ABC), %RVal, 'NAME')
      #CALL(%RemoveAttr(ABC), %RVal, 'OWNER')
      #CALL(%RemoveAttr(ABC), %RVal, 'ENCRYPT')
      #SET(%RVal, REPLACE(%RVal,'DRIVER','DRIVER(''' & %FileDriver & ''')'))
    #ENDIF
  #RETURN(%RVal)
#!
#GROUP(%MemDriverClassCodeGeneration),PRESERVE
#SET(%MEMUsingSuppliedFile,%False)
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
     #CALL(%SetClassItem(ABC) , 'CachedManager:' & %File)
#CALL(%GenerateVirtuals(ABC), 'CachedManager:' & %File, 'Global Objects|Abc Objects|Memory Cached Managers|CachedManager for ' & %File, '%CachedManagerVirtuals(InMemoryCachedTable)', %True)
   #ENDIF
#ENDFOR
#SET(%MEMUsingSuppliedFile,%True)
#FOR(%MEMSuppliedFiles)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
     #FIX(%File,%MEMSuppliedInMemory)
     #IF(%File AND INLIST(%File,%UsedFile))
     #CALL(%SetClassItem(ABC) , 'CachedManager:' & %File)
#CALL(%GenerateVirtuals(ABC), 'CachedManager:' & %File, 'Global Objects|Abc Objects|Memory Cached Managers|CachedManager for ' & %File, '%CachedManagerVirtuals(InMemoryCachedTable)', %True)
     #ENDIF
   #ENDIF
#ENDFOR
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%MemDriverClassDataGeneration),PRESERVE
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
     #CALL(%SetClassItem(ABC) , 'CachedManager:' & %File)
#INSERT(%GenerateClass(ABC), 'CachedManager:' & %File, 'CachedManager for ' & %File, %True)
   #ENDIF
#ENDFOR
#FOR(%MEMSuppliedFiles)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
     #FIX(%File,%MEMSuppliedInMemory)
     #IF(%File AND INLIST(%File,%UsedFile))
     #CALL(%SetClassItem(ABC) , 'CachedManager:' & %File)
#INSERT(%GenerateClass(ABC), 'CachedManager:' & %File, 'CachedManager for ' & %File, %True)
     #ENDIF
   #ENDIF
#ENDFOR
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%CachedManagerVirtuals, %TreeText, %DataText, %CodeText)
#EMBED(%CachedManagerDataSection,'Cached Manager Data Section'),%File,%pClassMethod,%pClassMethodPrototype,PREPARE(,%FixClassName(%FixBaseClassToUse('CachedManager:' & %File))),TREE(%TreeText & %DataText)
  #?CODE
  #EMBED(%CachedManagerCodeSection,'Cached Manager Executable Code Section'),%File,%pClassMethod,%pClassMethodPrototype,PREPARE(,%FixClassName(%FixBaseClassToUse('CachedManager:' & %File))),TREE(%TreeText & %CodeText)
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%SetupGlobalObjects)
 #FOR(%File)
   #IF(%MEMCachedEnable)
  #CALL(%SetClassDefaults(ABC), 'CachedManager:' & %File, 'CachedManager:' & %File, %CachedManagerType)
   #ENDIF
 #ENDFOR
#FOR(%MEMSuppliedFiles)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File)
    #FIX(%File,%MEMSuppliedInMemory)
    #IF(%File)
  #CALL(%SetClassDefaults(ABC), 'CachedManager:' & %File, 'CachedManager:' & %File, %CachedManagerType)
    #ENDIF
   #ENDIF
#ENDFOR
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%GenerateMemAccessPointers),AUTO
#DECLARE(%lCodeLine)
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
      #SET(%lCodeLine,'MemAccess:'&%File)
      #IF(%GlobalExternal)
         #IF(~%NoGenerateGlobals)
%[20]lCodeLine &%CachedManagerType,EXTERNAL,DLL            !CachedManager for %File
         #ENDIF
      #ELSE
%[20]lCodeLine &%CachedManagerType                         !CachedManager for %File
      #ENDIF
   #ENDIF
#ENDFOR
#FOR(%MEMSuppliedFiles)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
      #FIX(%File,%MEMSuppliedInMemory)
      #IF(%File AND INLIST(%File,%UsedFile))
        #SET(%lCodeLine,'MemAccess:'&%File)
        #IF(%GlobalExternal)
           #IF(~%NoGenerateGlobals)
              #IF(%MEMCachedEnableGlobally)
%[20]lCodeLine &%CachedManagerType,EXTERNAL,DLL            !CachedManager for %File
              #ELSE
%[20]lCodeLine &%CachedManagerType,THREAD,EXTERNAL,DLL            !CachedManager for %File
              #ENDIF
           #ENDIF
        #ELSE
           #IF(%MEMCachedEnableGlobally)
%[20]lCodeLine &%CachedManagerType                         !CachedManager for %File
           #ELSE
%[20]lCodeLine &%CachedManagerType,THREAD                         !CachedManager for %File
           #ENDIF
        #ENDIF
      #ENDIF
   #ENDIF
#ENDFOR
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%IsSelectedForMem,%pFile),PRESERVE
#FOR(%MEMSuppliedFiles),WHERE(%MEMSuppliedInMemory=%pFile)
  #RETURN(%True)
  #BREAK
#ENDFOR
#RETURN(%False)
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%GenerateMemCLW)
#CREATE(%Application&'M0.2$$')
#SECTION
#INSERT(%MemDriverClassCodeGeneration)
#ENDSECTION
#CLOSE(%Application&'M0.2$$')
#!
#CREATE(%Application&'M0.1$$')
#SECTION
#INSERT(%MemDriverClassDataGeneration)
#ENDSECTION
#CLOSE(%Application&'M0.1$$')
#!
#!
#!
#CREATE(%Application&'M0.$$$')
#!
  MEMBER('%Program')

  INCLUDE('ABTblSyn.INC'),ONCE


#APPEND(%Application&'M0.1$$')
#APPEND(%Application&'M0.2$$')
#!
#!

MemDriverInit     PROCEDURE                                           #<! Initializes the MemDriver definition module
 CODE
    #?IF THREAD()=1
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
       MemAccess:%File &= NEW CachedManager:%File
       MemAccess:%File.Init(%File,MEMAUX_%File)
    #IF(%MEMCachedLimitType='ALL' AND %MEMCachedSaveOnExit AND NOT %isSQL(%File))
       MemAccess:%File.SaveOnKill = True
    #ENDIF
       #EMBED(%CachedManagerAfterInit),%File,HIDE
   #ENDIF
#ENDFOR
#FOR(%MEMSuppliedFiles),WHERE(%MEMCachedEnableGlobally)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
        #FIX(%File,%MEMSuppliedInMemory)
        #IF(%File AND INLIST(%File,%UsedFile))
       MemAccess:%File &= NEW CachedManager:%File
       MemAccess:%File.Init(%MEMSuppliedInMemory,%MEMSuppliedPhysical)
            #IF(%MEMSuppliedLimitType='ALL' AND %MEMSuppliedSaveOnExit AND NOT %isSQL(%MEMSuppliedPhysical))
       MemAccess:%File.SaveOnKill = True
            #ENDIF
       #EMBED(%CachedManagerAfterInitSupplied),%File,HIDE
        #ENDIF
   #ENDIF
#ENDFOR
    #?END
#!
#FOR(%MEMSuppliedFiles),WHERE(NOT %MEMCachedEnableGlobally)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
        #FIX(%File,%MEMSuppliedInMemory)
        #IF(%File AND INLIST(%File,%UsedFile))
    MemAccess:%File &= NEW CachedManager:%File
    MemAccess:%File.Init(%MEMSuppliedInMemory,%MEMSuppliedPhysical)
            #IF(%MEMSuppliedLimitType='ALL' AND %MEMSuppliedSaveOnExit AND NOT %isSQL(%MEMSuppliedPhysical))
    MemAccess:%File.SaveOnKill = True
            #ENDIF
    #EMBED(%CachedManagerAfterInitSupplied),%File,HIDE
        #ENDIF
   #ENDIF
#ENDFOR

MemDriverKill     PROCEDURE                                           #<! Kills the MemDriver definition module
 CODE
    #?IF THREAD()=1
#FOR(%UsedFile)
   #FIX(%File,%UsedFile)
   #IF(%MEMCachedEnable)
       IF NOT MemAccess:%File &= NULL
          MemAccess:%File.Kill()
          DISPOSE(MemAccess:%File)
       END
   #ENDIF
#ENDFOR
#FOR(%MEMSuppliedFiles),WHERE(%MEMCachedEnableGlobally)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
    #FIX(%File,%MEMSuppliedInMemory)
    #IF(%File AND INLIST(%File,%UsedFile))
       IF NOT MemAccess:%File &= NULL
          MemAccess:%File.Kill()
          DISPOSE(MemAccess:%File)
       END
    #ENDIF
   #ENDIF
#ENDFOR
    #?END
#FOR(%MEMSuppliedFiles),WHERE(NOT %MEMCachedEnableGlobally)
   #FIX(%File,%MEMSuppliedPhysical)
   #IF(%File AND INLIST(%File,%UsedFile))
    #FIX(%File,%MEMSuppliedInMemory)
    #IF(%File AND INLIST(%File,%UsedFile))
    IF NOT MemAccess:%File &= NULL
       MemAccess:%File.Kill()
       DISPOSE(MemAccess:%File)
    END
    #ENDIF
   #ENDIF
#ENDFOR
#!
#!
#CLOSE(%Application&'M0.$$$')
#REPLACE(%Application&'M0.CLW',%Application&'M0.$$$')
#REMOVE(%Application&'M0.$$$')
#REMOVE(%Application&'M0.1$$')
#REMOVE(%Application&'M0.2$$')
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%MEMSuppliedFilesAssignByName),AUTO
#FREE(%MEMSuppliedFilesFields)
#FIX(%File,%MEMSuppliedPhysical)
#FOR(%Field)
    #ADD(%MEMSuppliedFilesFields,ITEMS(%MEMSuppliedFilesFields)+1)
    #SET(%MEMSuppliedPhysicalField,%Field)
    #SET(%MEMSuppliedInMemoryField,%GetMEMSuppliedInMemoryField(%FieldID))
    #IF(NOT %MEMSuppliedInMemoryField)
        #DELETE(%MEMSuppliedFilesFields)
    #ENDIF
#ENDFOR
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%GetMEMSuppliedInMemoryField,%pName),PRESERVE
#FIX(%File,%MEMSuppliedInMemory)
#FOR(%Field),WHERE(%FieldID=%pName)
#RETURN(%Field)
#ENDFOR
#RETURN('')
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%SetMEMPhysicalTable,%pName,*%pPhysicalName),PRESERVE
#FIND(%MEMSuppliedInMemory,%pName)
#IF(%MEMSuppliedFiles)
#SET(%pPhysicalName,%MEMSuppliedPhysical)
#ELSE
#SET(%pPhysicalName,'')
#ENDIF
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%isSQL,%pFile),PRESERVE
#FIX(%File, %pFile)
#FIX(%Driver, %FileDriver)
#RETURN(%DriverSQL)
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%isThreadedContent,%pFile),PRESERVE
#FIX(%File,%pFile)
#IF(INSTRING('/THREADEDCONTENT',UPPER(%FileDriverParameter),1,1))
    #RETURN(%True)
#ELSE
    #RETURN(%False)
#ENDIF
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#CODE(InMemoryCachedTableLoad,'Fill IMDD'),DESCRIPTION('Fill ('&%MEMLocalLoadTable&') Table From ('&%MEMLocalPhysicalTable&')'&CHOOSE(%MEMCachedEnableGlobal,'',' Globally Disable')),HLP('~TPLInMemoryCachedTableLoad.htm')
#ENABLE(%MEMCachedEnableGlobal)
#PROMPT('File To Fill:',FROM(%MEMSuppliedFiles,,%MEMSuppliedInMemory)),%MEMLocalLoadTable,REQ,WHENACCEPTED(%SetMEMPhysicalTable(%MEMLocalLoadTable,%MEMLocalPhysicalTable))
#PROMPT('Source Data File:',@S250),%MEMLocalPhysicalTable,REQ,PROP(PROP:READONLY,1)
#ENDENABLE
#IF(%MEMCachedEnableGlobal)
MemAccess:%MEMLocalLoadTable.Load()
#ELSE
! Globally Disable, To enable go to global and check the "Enable In-MemoryCachedTable"
!MemAccess:%MEMLocalLoadTable.Load()
#ENDIF
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#CODE(InMemoryCachedTableSave,'Save IMDD'),DESCRIPTION('Save ('&%MEMLocalLoadTable&') Table To ('&%MEMLocalPhysicalTable&')'&CHOOSE(%MEMCachedEnableGlobal,'',' Globally Disable')),HLP('~TPLInMemoryCachedTableSave.htm')
#ENABLE(%MEMCachedEnableGlobal)
#PROMPT('File To Save:',FROM(%MEMSuppliedFiles,,%MEMSuppliedInMemory)),%MEMLocalLoadTable,REQ,WHENACCEPTED(%SetMEMPhysicalTable(%MEMLocalLoadTable,%MEMLocalPhysicalTable))
#PROMPT('Target Data File:',@S250),%MEMLocalPhysicalTable,REQ,PROP(PROP:READONLY,1)
#ENDENABLE
#IF(%MEMCachedEnableGlobal)
MemAccess:%MEMLocalLoadTable.Save()
#ELSE
! Globally Disable, To enable go to global and check the "Enable In-MemoryCachedTable"
!MemAccess:%MEMLocalLoadTable.Save()
#ENDIF
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%ConstructGEMFile)
#MESSAGE('Generating Module:    ' & %Application & '.GEM', 1) #! Post generation message
#MESSAGE('Generating MEM File', 2) #! Post generation message
#MESSAGE('',3)
#REMOVE(%Application&'.GEM')
#IF(%DefaultExternal = 'None External')
    #!SET(%MEMFile,%Application&'.GEM')
    #CREATE(%BuildFile)
%CachedManagerType
#IF(%MEMCachedEnableGlobal)
ENABLE
#ELSE
DISABLE
#ENDIF
[CACHED TABLES]
#IF(%MEMCachedEnableGlobal)
    #FOR(%File),WHERE(%MEMCachedEnable)
%File
    #ENDFOR
#ENDIF
[COPIED TABLES]
#IF(%MEMCachedEnableGlobal)
    #FOR(%MEMSuppliedFiles)
%MEMSuppliedPhysical
%MEMSuppliedInMemory
    #ENDFOR
#ENDIF
#CLOSE()
#REPLACE(%Application&'.GEM',%BuildFile)
#REMOVE(%BuildFile)
  #ENDIF
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!
#GROUP(%ReadGEMFile,%pSilence=0),AUTO
#IF(%EditProcedure)
    #RETURN
#ENDIF
#DECLARE(%lCounter)
#SET(%lCounter,1)
#FOR(%File)
   #SET(%MEMCachedEnable,0)
#ENDFOR
#FREE(%MEMSuppliedFiles)
#IF(FILEEXISTS(%GEMFile))
   #DECLARE(%NextLine)
   #DECLARE(%SecondNextLine)
   #OPEN(%GEMFile),READ
   #LOOP
     #READ(%NextLine)
     #IF(%NextLine = %Eof)
        #BREAK
     #ENDIF
     #IF(%NextLine = '[CACHED TABLES]' AND %lCounter>=2)
        #SET(%lCounter,3)
        #CYCLE
     #ENDIF
     #IF(%NextLine = '[COPIED TABLES]' AND %lCounter>=2)
        #SET(%lCounter,4)
        #CYCLE
     #ENDIF
     #CASE(%lCounter)
     #OF(1)
         #IF(%NextLine<>'')
            #SET(%CachedManagerType,%NextLine)
            #SET(%lCounter,2)
         #ENDIF
         #CYCLE
     #OF(2)
         #IF(UPPER(CLIP(%NextLine))='ENABLE')
             #SET(%MEMCachedEnableGlobal,%True)
         #ELSE
             #SET(%MEMCachedEnableGlobal,%False)
         #ENDIF
         #CYCLE
     #OF(3)
        #IF(%NextLine<>'')
            #FIX(%File,%NextLine)
            #IF(%File)
                #SET(%MEMCachedEnable,1)
            #ENDIF
        #ENDIF
        #CYCLE
     #OF(4)
        #IF(%NextLine<>'')
            #READ(%SecondNextLine)
            #IF(%SecondNextLine<>'' AND %SecondNextLine <> %Eof)
                #ADD(%MEMSuppliedFiles,ITEMS(%MEMSuppliedFiles)+1)
                #SET(%MEMSuppliedPhysical,%NextLine)
                #SET(%MEMSuppliedInMemory,%SecondNextLine)
                #CYCLE
            #ENDIF
        #ENDIF
     #ENDCASE
   #ENDLOOP
   #CLOSE,READ
#ELSE
   #IF(NOT %pSilence)
      #ERROR('MemTemplate: The GEM file '&%GEMFile&' doesn''t exist.')
      #ERROR('MemTemplate: Set the GEM file setting on the global extension')
   #ENDIF
#ENDIF
#!
#!
#!
#!---------------------------------------------------------------------------------------
#!
#!