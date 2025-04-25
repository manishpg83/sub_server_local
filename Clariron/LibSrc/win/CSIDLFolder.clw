
					MEMBER

	PRAGMA('project(#pragma link(Win32Ext.LIB))')
	PRAGMA('project(#pragma link(Win32.LIB))')

					MAP
						MODULE('Win32Ext')
SHGetFolderPath             PROCEDURE(LONG pHandleOwner, LONG nFolder, LONG nToken, LONG pFlag, *CSTRING szPath), LONG, PASCAL, RAW, NAME('SHGetFolderPathA')
SHCreateDirectoryEx			PROCEDURE(LONG pHandleOwner, *CSTRING szPath, LONG pSecurityAttribute), LONG, PASCAL, RAW, NAME('SHCreateDirectoryExA')
						END
						MODULE('Win32')
GetFullPathNameA            procedure(*cstring szPathIn, long lSize, *cstring szPathReturned, long pNull), long, proc, raw, pascal, name('GetFullPathNameA')
						END
						INCLUDE('cwutil.inc'), ONCE
					END

	INCLUDE('CSIDLFolder.inc'), ONCE
	INCLUDE('CSIDL.EQU'), ONCE

CSIDLFolder.Construct       PROCEDURE()

	CODE
		
		
CSIDLFolder.ISystemFolder.GetError  PROCEDURE()

	CODE
		RETURN SELF.LastResult

CSIDLFolder.ISystemFolder.GetDir   PROCEDURE(LONG nCSIDL)

szDirectory                             CSTRING(260)
sDirectory								STRING(261)

	CODE
		SELF.LastResult = SHGetFolderPath(0, nCSIDL, 0, SV:SHGFP_TYPE_CURRENT, szDirectory)
		sDirectory = szDirectory
		RETURN CLIP(sDirectory)
		
		
CSIDLFolder.ISystemFolder.CreateDir PROCEDURE(*CSTRING szDirectory)

szFullPath                              cstring(260)
lRetValue								long

	CODE
		
		lRetValue = GetFullPathNameA(szDirectory, 260, szFullPath, 0)
		IF lRetValue AND lRetValue < 260
			SELF.LastResult = SHCreateDirectoryEx(0, szFullPath, 0)
		ELSE
			SELF.LastResult = lRetValue
		END
		
		RETURN SELF.LastResult
		
		
CSIDLFolder.ISystemFolder.CreateDirIn       PROCEDURE(LONG nFolder, szSubDirectoryName)

szParentDirectory                               CSTRING(260)
szSubDirToCreate                                CSTRING(260)

szPath											CSTRING(260)

	CODE
		szParentDirectory = SELF.ISystemFolder.GetDir(nFolder)
		szSubDirToCreate = CHOOSE(szSubDirectoryName[1] = '\', szSubDirectoryName[2 : LEN(CLIP(szSubDirectoryName))], szSubDirectoryName)
		IF SELF.LastResult = 0
			szPath = szParentDirectory & '\' & szSubDirToCreate
			SELF.LastResult = SHCreateDirectoryEx(0, szPath, 0)
		END
		RETURN SELF.LastResult
