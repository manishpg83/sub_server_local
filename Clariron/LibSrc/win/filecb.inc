!ABCIncludeFile

  OMIT('_EndOfInclude_',_FileCallBackInterfacePresent_)  ! Omit this if already compiled
_FileCallBackInterfacePresent_        EQUATE(1)

Params GROUP,TYPE
Ahead         UNSIGNED
Behind        UNSIGNED
Buffer        UNSIGNED
Field         LONG
FieldList     &STRING
Fields        LONG
File          &FILE
Index         SIGNED
Key1          &KEY
Key2          &KEY
Len           UNSIGNED
openMode      SIGNED
Pointer       LONG
Position      &STRING
Property      &STRING
Records       LONG
Seconds       SIGNED
Start         ULONG
State         LONG
Stop          ULONG
Text          &STRING
TimeOut       UNSIGNED
ReturnStr     &STRING
ReturnLong    LONG
RestoreBuffer BYTE
TransactionOpCode SIGNED
SaveBlob      BYTE
View          &VIEW
       END

FileCallBackInterface INTERFACE
FunctionCalled PROCEDURE(SIGNED opCode, *Params Parameters, *CSTRING FileErrCode, *CSTRING FileErrMsg), BYTE
FunctionDone   PROCEDURE(SIGNED opCode, *Params Parameters, *CSTRING FileErrCode, *CSTRING FileErrMsg), BYTE
                      END

SQLCallBackInterface INTERFACE
ExecutingCode PROCEDURE(CONST *CSTRING inStr, *BYTE Err, *CSTRING FileErrCode, *CSTRING FileErrMsg), STRING
            END


  MAP
    MODULE('')
      CALLBACK(FILE, *FileCallBackInterface, BYTE remove=FALSE),NAME('CLA$FILE_CALLBACK')
      SQLCALLBACK(FILE, *SQLCallBackInterface, BYTE remove=FALSE),NAME('CLA$FILE_SQLCALLBACK')
    END
  END

_EndOfInclude_
