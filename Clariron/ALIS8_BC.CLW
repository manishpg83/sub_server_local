  MEMBER('Alis8.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('Alis8_BC0.CLW')
Alis8_BC0:DctInit             PROCEDURE
Alis8_BC0:DctKill             PROCEDURE
Alis8_BC0:FilesInit           PROCEDURE
    END
    MODULE('Alis8_BC1.CLW')
Alis8_BC1:DctInit             PROCEDURE
Alis8_BC1:DctKill             PROCEDURE
Alis8_BC1:FilesInit           PROCEDURE
    END
    MODULE('Alis8_BC2.CLW')
Alis8_BC2:DctInit             PROCEDURE
Alis8_BC2:DctKill             PROCEDURE
Alis8_BC2:FilesInit           PROCEDURE
    END
    MODULE('Alis8_BC3.CLW')
Alis8_BC3:DctInit             PROCEDURE
Alis8_BC3:DctKill             PROCEDURE
Alis8_BC3:FilesInit           PROCEDURE
    END
  END

DctInit PROCEDURE
  CODE
  Alis8_BC0:DctInit
  Alis8_BC1:DctInit
  Alis8_BC2:DctInit
  Alis8_BC3:DctInit
  Alis8_BC0:FilesInit
  Alis8_BC1:FilesInit
  Alis8_BC2:FilesInit
  Alis8_BC3:FilesInit


DctKill PROCEDURE
  CODE
  Alis8_BC0:DctKill
  Alis8_BC1:DctKill
  Alis8_BC2:DctKill
  Alis8_BC3:DctKill

