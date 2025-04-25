#TEMPLATE(IPServerInMemoryCachedTable,'Softvelocity In-MemoryCachedTable for IPDRV'),FAMILY('IPServer')
#HELP('IMDD.Chm')
#INCLUDE('SVFnGrp.TPW')
#EXTENSION(InMemoryCachedTableSupport, 'In-Memory Data Caching support'),APPLICATION,HLP('~IMDD_IPGlobal.htm')
#!
#!
#SHEET
#TAB('Server Files'),HLP('~IMDD_IPServer.htm')
#DISPLAY('This setting applies to all IMDD Tables in the target DCT,')
#DISPLAY('and overrides the File Control settings in the')
#DISPLAY('IPDRV Server template.')
#DISPLAY('')
#PROMPT('Generation Options',OPTION),%MEMAllTables,DEFAULT('DontGenerate')
#PROMPT('Don''t Generate IMDD table definitions',RADIO),VALUE('DontGenerate'),AT(15)
#PROMPT('Generate but don''t IP-enable the IMDD Tables',RADIO),VALUE('Generate'),AT(15)
#PROMPT('Use the IPserver template settings',RADIO),VALUE('Default'),AT(15)
#ENDTAB
#TAB('Client Files'),HLP('~IMDD_IPtables.htm')
    #DISPLAY
    #PROMPT('Disable Client-side In-Memory Cached Tables',CHECK),%MEMDisableAll,DEFAULT(%False),AT(10)
    #DISPLAY
    #DISPLAY('Tables available for Client-side Caching ')
    #ENABLE(NOT %MEMDisableAll)
      #BUTTON('Client Side - Cached Tables'),FROM(%File,CHOOSE(%MEMCachedEnable,'X__'&%File,'___'&%File)),INLINE,WHERE(%FileDriver<>'MEMORY'),HLP('~IMDD_IPTables.htm')
         #DISPLAY('Table Name: '&%File)
         #PROMPT('Enable this table to be cached on Client',CHECK),%MEMCachedEnable,DEFAULT(%False),AT(10)
      #ENDBUTTON
    #ENDENABLE
    #DISPLAY('The selected tables will be available for use')
    #DISPLAY('in the client application with the IMDD')
    #DISPLAY('Data Caching Support global extension template')
#ENDTAB
#ENDSHEET
#DISPLAY('')
#DISPLAY('(c) 2005 by SoftVelocity - V2.0')
#ATSTART
    #DECLARE(%MEMUsingSuppliedFile)
#ENDAT
#!
#!
#AT(%BeforeFileDeclaration),LAST,WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
#! create the physical table structure with the existing name prepended with MEMAUX_
#! and change the prefix to make it unique
!This table was modified by the In-MemoryCachedTableSupport Template
!
#INSERT(%GenerateFileDeclaration,%File,'MEMAUX_'&%File,'MEMAUX_'&%FilePrefix)

#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%BeforeWriteIPSFile),WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
#ADD(%FileIPSExtendedAttribute,'CACHED')
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%BeforePopulatingFile),WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
AddProto(MEMAUX_%File)
BIND(MEMAUX_%FilePrefix:RECORD)
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%BeforeExportFile),WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
$MEMAUX_%File @?
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%AfterSetFileExported),WHERE(%FileDriver='MEMORY')
#CASE(%MEMAllTables)
#OF('DontGenerate')
#SET(%FileExported,%False)
#SET(%GOverrideGenerateDontExport,%True)
#OF('Generate')
#SET(%FileExported,%True)
#SET(%GOverrideGenerateDontExport,%True)
#ENDCASE
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%BeforeSetFName),WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
    #FOR(%Field),WHERE(%FieldType<>'MEMO' AND %FieldType<>'BLOB')
OF 'MEMAUX_%(UPPER(%Field))' ! Change name for MEMAUX_%File
        #IF(%AliasFile)
   pstrNewName = CLIP(GLO_FileName:%AliasFile)
        #ELSE
   pstrNewName = CLIP(GLO_FileName:%File)
        #ENDIF
        #BREAK
    #ENDFOR
   ReturnValue = True
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%BeforeSetGLOFileName),WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
      #IF(%AliasFile)
OF 'MEMAUX_%(UPPER(%AliasFile))'
   GLO_FileName:%AliasFile = GetSafeName(RemoteFileName)
      #ELSE
OF 'MEMAUX_%(UPPER(%File))'
   GLO_FileName:%File = GetSafeName(RemoteFileName)
      #ENDIF
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
#AT(%BeforeGetGLOFileName),WHERE(%MEMCachedEnable AND NOT %MEMDisableAll)
      #IF(%AliasFile)
OF 'MEMAUX_%(UPPER(%AliasFile))'
   RETURN GLO_FileName:%AliasFile
      #ELSE
OF 'MEMAUX_%(UPPER(%File))'
   RETURN GLO_FileName:%File
      #ENDIF
#ENDAT
#!
#!---------------------------------------------------------------------------------------
#!
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
    #IF(EXTRACT(%RVal, 'EXTERNAL'))
      #CALL(%RemoveAttr(ABC), %RVal, 'NAME')
      #CALL(%RemoveAttr(ABC), %RVal, 'OWNER')
      #CALL(%RemoveAttr(ABC), %RVal, 'ENCRYPT')
      #SET(%RVal, REPLACE(%RVal,'DRIVER','DRIVER(''' & %FileDriver & ''')'))
    #ENDIF
  #RETURN(%RVal)
#!