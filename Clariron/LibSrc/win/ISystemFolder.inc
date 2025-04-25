
  OMIT('EndDefine',_ISystemFolder_)
_ISystemFolder_  EQUATE(1)

ISystemFolder       INTERFACE
GetDir                  PROCEDURE(LONG nCSIDL), STRING, PROC
CreateDirIn             PROCEDURE(LONG nCSIDL, *CSTRING szDirectory), LONG, PROC
CreateDir               PROCEDURE(*CSTRING szDirectory), LONG, PROC
GetError                PROCEDURE(), LONG
                    END

	EndDefine