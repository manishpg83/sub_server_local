  MEMBER('Alis8.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Alis8_BC1:DctInit    PROCEDURE
Alis8_BC1:DctKill    PROCEDURE
Alis8_BC1:FilesInit  PROCEDURE
  END

Hide:Access:LogInPanelTests CLASS(FileManager),TYPE        ! FileManager for LogInPanelTests
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LogInPanelTests CLASS(RelationManager),TYPE    ! RelationManager for LogInPanelTests
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LogInTests CLASS(FileManager),TYPE             ! FileManager for LogInTests
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LogInTests CLASS(RelationManager),TYPE         ! RelationManager for LogInTests
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Log      CLASS(FileManager),TYPE               ! FileManager for Log
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Log      CLASS(RelationManager),TYPE           ! RelationManager for Log
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Patient  CLASS(FileManager),TYPE               ! FileManager for Patient
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Patient  CLASS(RelationManager),TYPE           ! RelationManager for Patient
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Patient4Week CLASS(FileManager),TYPE           ! FileManager for Patient4Week
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Patient4Week CLASS(RelationManager),TYPE       ! RelationManager for Patient4Week
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:FollowUp CLASS(FileManager),TYPE               ! FileManager for FollowUp
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:FollowUp CLASS(RelationManager),TYPE           ! RelationManager for FollowUp
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PatientName CLASS(FileManager),TYPE            ! FileManager for PatientName
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PatientName CLASS(RelationManager),TYPE        ! RelationManager for PatientName
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Test     CLASS(FileManager),TYPE               ! FileManager for Test
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Test     CLASS(RelationManager),TYPE           ! RelationManager for Test
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:AddTests CLASS(FileManager),TYPE               ! FileManager for AddTests
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:AddTests CLASS(RelationManager),TYPE           ! RelationManager for AddTests
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Normals  CLASS(FileManager),TYPE               ! FileManager for Normals
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Normals  CLASS(RelationManager),TYPE           ! RelationManager for Normals
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Salesman CLASS(FileManager),TYPE               ! FileManager for Salesman
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Salesman CLASS(RelationManager),TYPE           ! RelationManager for Salesman
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Specialty CLASS(FileManager),TYPE              ! FileManager for Specialty
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Specialty CLASS(RelationManager),TYPE          ! RelationManager for Specialty
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Courier  CLASS(FileManager),TYPE               ! FileManager for Courier
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Courier  CLASS(RelationManager),TYPE           ! RelationManager for Courier
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Supplies CLASS(FileManager),TYPE               ! FileManager for Supplies
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:Supplies CLASS(RelationManager),TYPE           ! RelationManager for Supplies
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PickUp   CLASS(FileManager),TYPE               ! FileManager for PickUp
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:PickUp   CLASS(RelationManager),TYPE           ! RelationManager for PickUp
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SendOuts CLASS(FileManager),TYPE               ! FileManager for SendOuts
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SendOuts CLASS(RelationManager),TYPE           ! RelationManager for SendOuts
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:GAM      CLASS(FileManager),TYPE               ! FileManager for GAM
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:GAM      CLASS(RelationManager),TYPE           ! RelationManager for GAM
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PCodes   CLASS(FileManager),TYPE               ! FileManager for PCodes
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PCodes   CLASS(RelationManager),TYPE           ! RelationManager for PCodes
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Exceptions CLASS(FileManager),TYPE             ! FileManager for Exceptions
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Exceptions CLASS(RelationManager),TYPE         ! RelationManager for Exceptions
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:EventsTable CLASS(FileManager),TYPE            ! FileManager for EventsTable
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:EventsTable CLASS(RelationManager),TYPE        ! RelationManager for EventsTable
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:LogInPanelTests &Hide:Access:LogInPanelTests,AUTO,THREAD
_Hide:Relate:LogInPanelTests &Hide:Relate:LogInPanelTests,AUTO,THREAD
_Hide:Access:LogInTests &Hide:Access:LogInTests,AUTO,THREAD
_Hide:Relate:LogInTests &Hide:Relate:LogInTests,AUTO,THREAD
_Hide:Access:Log     &Hide:Access:Log,AUTO,THREAD
_Hide:Relate:Log     &Hide:Relate:Log,AUTO,THREAD
_Hide:Access:Patient &Hide:Access:Patient,AUTO,THREAD
_Hide:Relate:Patient &Hide:Relate:Patient,AUTO,THREAD
_Hide:Access:Patient4Week &Hide:Access:Patient4Week,AUTO,THREAD
_Hide:Relate:Patient4Week &Hide:Relate:Patient4Week,AUTO,THREAD
_Hide:Access:FollowUp &Hide:Access:FollowUp,AUTO,THREAD
_Hide:Relate:FollowUp &Hide:Relate:FollowUp,AUTO,THREAD
_Hide:Access:PatientName &Hide:Access:PatientName,AUTO,THREAD
_Hide:Relate:PatientName &Hide:Relate:PatientName,AUTO,THREAD
_Hide:Access:Test    &Hide:Access:Test,AUTO,THREAD
_Hide:Relate:Test    &Hide:Relate:Test,AUTO,THREAD
_Hide:Access:AddTests &Hide:Access:AddTests,AUTO,THREAD
_Hide:Relate:AddTests &Hide:Relate:AddTests,AUTO,THREAD
_Hide:Access:Normals &Hide:Access:Normals,AUTO,THREAD
_Hide:Relate:Normals &Hide:Relate:Normals,AUTO,THREAD
_Hide:Access:Salesman &Hide:Access:Salesman,AUTO,THREAD
_Hide:Relate:Salesman &Hide:Relate:Salesman,AUTO,THREAD
_Hide:Access:Specialty &Hide:Access:Specialty,AUTO,THREAD
_Hide:Relate:Specialty &Hide:Relate:Specialty,AUTO,THREAD
_Hide:Access:Courier &Hide:Access:Courier,AUTO,THREAD
_Hide:Relate:Courier &Hide:Relate:Courier,AUTO,THREAD
_Hide:Access:Supplies &Hide:Access:Supplies,AUTO,THREAD
_Hide:Relate:Supplies &Hide:Relate:Supplies,AUTO,THREAD
_Hide:Access:PickUp  &Hide:Access:PickUp,AUTO,THREAD
_Hide:Relate:PickUp  &Hide:Relate:PickUp,AUTO,THREAD
_Hide:Access:SendOuts &Hide:Access:SendOuts,AUTO,THREAD
_Hide:Relate:SendOuts &Hide:Relate:SendOuts,AUTO,THREAD
_Hide:Access:GAM     &Hide:Access:GAM,AUTO,THREAD
_Hide:Relate:GAM     &Hide:Relate:GAM,AUTO,THREAD
_Hide:Access:PCodes  &Hide:Access:PCodes,AUTO,THREAD
_Hide:Relate:PCodes  &Hide:Relate:PCodes,AUTO,THREAD
_Hide:Access:Exceptions &Hide:Access:Exceptions,AUTO,THREAD
_Hide:Relate:Exceptions &Hide:Relate:Exceptions,AUTO,THREAD
_Hide:Access:EventsTable &Hide:Access:EventsTable,AUTO,THREAD
_Hide:Relate:EventsTable &Hide:Relate:EventsTable,AUTO,THREAD


Alis8_BC1:DctInit PROCEDURE
  CODE
  _Hide:Access:LogInPanelTests &= NEW(Hide:Access:LogInPanelTests)
  _Hide:Relate:LogInPanelTests &= NEW(Hide:Relate:LogInPanelTests)
  _Hide:Access:LogInTests &= NEW(Hide:Access:LogInTests)
  _Hide:Relate:LogInTests &= NEW(Hide:Relate:LogInTests)
  _Hide:Access:Log &= NEW(Hide:Access:Log)
  _Hide:Relate:Log &= NEW(Hide:Relate:Log)
  _Hide:Access:Patient &= NEW(Hide:Access:Patient)
  _Hide:Relate:Patient &= NEW(Hide:Relate:Patient)
  _Hide:Access:Patient4Week &= NEW(Hide:Access:Patient4Week)
  _Hide:Relate:Patient4Week &= NEW(Hide:Relate:Patient4Week)
  _Hide:Access:FollowUp &= NEW(Hide:Access:FollowUp)
  _Hide:Relate:FollowUp &= NEW(Hide:Relate:FollowUp)
  _Hide:Access:PatientName &= NEW(Hide:Access:PatientName)
  _Hide:Relate:PatientName &= NEW(Hide:Relate:PatientName)
  _Hide:Access:Test &= NEW(Hide:Access:Test)
  _Hide:Relate:Test &= NEW(Hide:Relate:Test)
  _Hide:Access:AddTests &= NEW(Hide:Access:AddTests)
  _Hide:Relate:AddTests &= NEW(Hide:Relate:AddTests)
  _Hide:Access:Normals &= NEW(Hide:Access:Normals)
  _Hide:Relate:Normals &= NEW(Hide:Relate:Normals)
  _Hide:Access:Salesman &= NEW(Hide:Access:Salesman)
  _Hide:Relate:Salesman &= NEW(Hide:Relate:Salesman)
  _Hide:Access:Specialty &= NEW(Hide:Access:Specialty)
  _Hide:Relate:Specialty &= NEW(Hide:Relate:Specialty)
  _Hide:Access:Courier &= NEW(Hide:Access:Courier)
  _Hide:Relate:Courier &= NEW(Hide:Relate:Courier)
  _Hide:Access:Supplies &= NEW(Hide:Access:Supplies)
  _Hide:Relate:Supplies &= NEW(Hide:Relate:Supplies)
  _Hide:Access:PickUp &= NEW(Hide:Access:PickUp)
  _Hide:Relate:PickUp &= NEW(Hide:Relate:PickUp)
  _Hide:Access:SendOuts &= NEW(Hide:Access:SendOuts)
  _Hide:Relate:SendOuts &= NEW(Hide:Relate:SendOuts)
  _Hide:Access:GAM &= NEW(Hide:Access:GAM)
  _Hide:Relate:GAM &= NEW(Hide:Relate:GAM)
  _Hide:Access:PCodes &= NEW(Hide:Access:PCodes)
  _Hide:Relate:PCodes &= NEW(Hide:Relate:PCodes)
  _Hide:Access:Exceptions &= NEW(Hide:Access:Exceptions)
  _Hide:Relate:Exceptions &= NEW(Hide:Relate:Exceptions)
  _Hide:Access:EventsTable &= NEW(Hide:Access:EventsTable)
  _Hide:Relate:EventsTable &= NEW(Hide:Relate:EventsTable)
  Relate:LogInPanelTests &= _Hide:Relate:LogInPanelTests
  Relate:LogInTests &= _Hide:Relate:LogInTests
  Relate:Log &= _Hide:Relate:Log
  Relate:Patient &= _Hide:Relate:Patient
  Relate:Patient4Week &= _Hide:Relate:Patient4Week
  Relate:FollowUp &= _Hide:Relate:FollowUp
  Relate:PatientName &= _Hide:Relate:PatientName
  Relate:Test &= _Hide:Relate:Test
  Relate:AddTests &= _Hide:Relate:AddTests
  Relate:Normals &= _Hide:Relate:Normals
  Relate:Salesman &= _Hide:Relate:Salesman
  Relate:Specialty &= _Hide:Relate:Specialty
  Relate:Courier &= _Hide:Relate:Courier
  Relate:Supplies &= _Hide:Relate:Supplies
  Relate:PickUp &= _Hide:Relate:PickUp
  Relate:SendOuts &= _Hide:Relate:SendOuts
  Relate:GAM &= _Hide:Relate:GAM
  Relate:PCodes &= _Hide:Relate:PCodes
  Relate:Exceptions &= _Hide:Relate:Exceptions
  Relate:EventsTable &= _Hide:Relate:EventsTable


Alis8_BC1:FilesInit PROCEDURE
  CODE
  _Hide:Relate:LogInPanelTests.Init
  _Hide:Relate:LogInTests.Init
  _Hide:Relate:Log.Init
  _Hide:Relate:Patient.Init
  _Hide:Relate:Patient4Week.Init
  _Hide:Relate:FollowUp.Init
  _Hide:Relate:PatientName.Init
  _Hide:Relate:Test.Init
  _Hide:Relate:AddTests.Init
  _Hide:Relate:Normals.Init
  _Hide:Relate:Salesman.Init
  _Hide:Relate:Specialty.Init
  _Hide:Relate:Courier.Init
  _Hide:Relate:Supplies.Init
  _Hide:Relate:PickUp.Init
  _Hide:Relate:SendOuts.Init
  _Hide:Relate:GAM.Init
  _Hide:Relate:PCodes.Init
  _Hide:Relate:Exceptions.Init
  _Hide:Relate:EventsTable.Init


Alis8_BC1:DctKill PROCEDURE
  CODE
  _Hide:Relate:LogInPanelTests.Kill
  DISPOSE(_Hide:Relate:LogInPanelTests)
  _Hide:Relate:LogInTests.Kill
  DISPOSE(_Hide:Relate:LogInTests)
  _Hide:Relate:Log.Kill
  DISPOSE(_Hide:Relate:Log)
  _Hide:Relate:Patient.Kill
  DISPOSE(_Hide:Relate:Patient)
  _Hide:Relate:Patient4Week.Kill
  DISPOSE(_Hide:Relate:Patient4Week)
  _Hide:Relate:FollowUp.Kill
  DISPOSE(_Hide:Relate:FollowUp)
  _Hide:Relate:PatientName.Kill
  DISPOSE(_Hide:Relate:PatientName)
  _Hide:Relate:Test.Kill
  DISPOSE(_Hide:Relate:Test)
  _Hide:Relate:AddTests.Kill
  DISPOSE(_Hide:Relate:AddTests)
  _Hide:Relate:Normals.Kill
  DISPOSE(_Hide:Relate:Normals)
  _Hide:Relate:Salesman.Kill
  DISPOSE(_Hide:Relate:Salesman)
  _Hide:Relate:Specialty.Kill
  DISPOSE(_Hide:Relate:Specialty)
  _Hide:Relate:Courier.Kill
  DISPOSE(_Hide:Relate:Courier)
  _Hide:Relate:Supplies.Kill
  DISPOSE(_Hide:Relate:Supplies)
  _Hide:Relate:PickUp.Kill
  DISPOSE(_Hide:Relate:PickUp)
  _Hide:Relate:SendOuts.Kill
  DISPOSE(_Hide:Relate:SendOuts)
  _Hide:Relate:GAM.Kill
  DISPOSE(_Hide:Relate:GAM)
  _Hide:Relate:PCodes.Kill
  DISPOSE(_Hide:Relate:PCodes)
  _Hide:Relate:Exceptions.Kill
  DISPOSE(_Hide:Relate:Exceptions)
  _Hide:Relate:EventsTable.Kill
  DISPOSE(_Hide:Relate:EventsTable)


Hide:Relate:LogInPanelTests.Init PROCEDURE
  CODE
  _Hide:Access:LogInPanelTests.Init
  SELF.Init(Access:LogInPanelTests,1)


Hide:Access:LogInPanelTests.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LPT:Record
  SELF.FileNameValue = 'LogInPanelTests'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LogInPanelTests
  PARENT.Init
  Access:LogInPanelTests &= SELF


Hide:Access:LogInPanelTests.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LogInPanelTests &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LogInPanelTests.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LogInPanelTests,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = 22h
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LPT:OrderKey,'LPT:OrderKey',0)
    SELF.AddKey(LPT:RemoveDupsKey,'LPT:RemoveDupsKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LogInPanelTests.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LogInPanels)


Hide:Relate:LogInPanelTests.Kill PROCEDURE

  CODE
  _Hide:Access:LogInPanelTests.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:LogInPanelTests &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LogInPanelTests)                    ! destroy the file manager


Hide:Relate:LogInTests.Init PROCEDURE
  CODE
  _Hide:Access:LogInTests.Init
  SELF.Init(Access:LogInTests,1)


Hide:Access:LogInTests.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LT:Record
  SELF.FileNameValue = 'LogInTests'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LogInTests
  PARENT.Init
  Access:LogInTests &= SELF


Hide:Access:LogInTests.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LogInTests &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LogInTests.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LogInTests,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = 22h
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LT:CodeKey,'LT:CodeKey',0)
    SELF.AddKey(LT:IndexKey,'LT:IndexKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LogInTests.Kill PROCEDURE

  CODE
  _Hide:Access:LogInTests.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:LogInTests &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LogInTests)                         ! destroy the file manager


Hide:Relate:Log.Init PROCEDURE
  CODE
  _Hide:Access:Log.Init
  SELF.Init(Access:Log,1)


Hide:Access:Log.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LOG:Record
  SELF.FileNameValue = 'Log'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Log
  PARENT.Init
  Access:Log &= SELF


Hide:Access:Log.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Log &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Log.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Log,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LOG:OrderKey,'LOG:OrderKey',0)
    SELF.AddKey(LOG:RequestAlpha,'LOG:RequestAlpha',0)
    SELF.AddKey(LOG:RequestKey,'LOG:RequestKey',0)
    SELF.AddKey(LOG:AlphaKey,'LOG:AlphaKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Log.Kill PROCEDURE

  CODE
  _Hide:Access:Log.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:Log &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Log)                                ! destroy the file manager


Hide:Relate:Patient.Init PROCEDURE
  CODE
  _Hide:Access:Patient.Init
  SELF.Init(Access:Patient,1)


Hide:Access:Patient.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pat:Record
  SELF.FileNameValue = 'Patient'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Patient
  PARENT.Init
  Access:Patient &= SELF


Hide:Access:Patient.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Patient &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Patient.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Patient,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(Pat:ORDER_KEY,'Pat:ORDER_KEY',0)
    SELF.AddKey(Pat:INVOICE_KEY,'Pat:INVOICE_KEY',0)
    SELF.AddKey(Pat:DATE_KEY,'Pat:DATE_KEY',0)
    SELF.AddKey(Pat:ACCESS_KEY,'Pat:ACCESS_KEY',0)
    SELF.AddKey(Pat:CLIENT_KEY,'Pat:CLIENT_KEY',0)
    SELF.AddKey(Pat:SHIP_KEY,'Pat:SHIP_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Patient.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Client)

  SELF.AddRelation(Relate:Billing,RI:None,RI:None,BILL:patKey)
  SELF.AddRelationLink(Pat:INVOICE,BILL:Accession)

  SELF.AddRelation(Relate:NameList,RI:None,RI:None,NAM:OrderKey)
  SELF.AddRelationLink(Pat:INVOICE,NAM:Number)


Hide:Relate:Patient.Kill PROCEDURE

  CODE
  _Hide:Access:Patient.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Patient &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Patient)                            ! destroy the file manager


Hide:Relate:Patient4Week.Init PROCEDURE
  CODE
  _Hide:Access:Patient4Week.Init
  SELF.Init(Access:Patient4Week,1)


Hide:Access:Patient4Week.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAT4:Record
  SELF.FileNameValue = 'Patient4Week'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Patient4Week
  PARENT.Init
  Access:Patient4Week &= SELF


Hide:Access:Patient4Week.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Patient4Week &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Patient4Week.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Patient4Week,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PAT4:OrderKey,'PAT4:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Patient4Week.Kill PROCEDURE

  CODE
  _Hide:Access:Patient4Week.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:Patient4Week &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Patient4Week)                       ! destroy the file manager


Hide:Relate:FollowUp.Init PROCEDURE
  CODE
  _Hide:Access:FollowUp.Init
  SELF.Init(Access:FollowUp,1)


Hide:Access:FollowUp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FU:Record
  SELF.FileNameValue = 'FollowUp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= FollowUp
  PARENT.Init
  Access:FollowUp &= SELF


Hide:Access:FollowUp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:FollowUp &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:FollowUp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(FollowUp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(FU:OrderKey,'FU:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:FollowUp.Kill PROCEDURE

  CODE
  _Hide:Access:FollowUp.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:FollowUp &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:FollowUp)                           ! destroy the file manager


Hide:Relate:PatientName.Init PROCEDURE
  CODE
  _Hide:Access:PatientName.Init
  SELF.Init(Access:PatientName,1)


Hide:Access:PatientName.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PN:Record
  SELF.FileNameValue = 'PatientName'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PatientName
  PARENT.Init
  Access:PatientName &= SELF


Hide:Access:PatientName.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PatientName &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PatientName.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PatientName,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PN:OrderKey,'PN:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PatientName.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 8
    GlobalErrors.SetField('PN:Number')
    IF NOT INRANGE(PN:Number,100000,999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'100000 .. 999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:PatientName.Kill PROCEDURE

  CODE
  _Hide:Access:PatientName.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:PatientName &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PatientName)                        ! destroy the file manager


Hide:Relate:Test.Init PROCEDURE
  CODE
  _Hide:Access:Test.Init
  SELF.Init(Access:Test,1)


Hide:Access:Test.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TST:Record
  SELF.FileNameValue = 'Test'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Test
  PARENT.Init
  Access:Test &= SELF


Hide:Access:Test.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Test &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Test.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Test,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TST:ORDER_KEY,'TST:ORDER_KEY',0)
    SELF.AddKey(TST:STATUS_KEY,'TST:STATUS_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Test.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Rast)


Hide:Relate:Test.Kill PROCEDURE

  CODE
  _Hide:Access:Test.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:Test &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Test)                               ! destroy the file manager


Hide:Relate:AddTests.Init PROCEDURE
  CODE
  _Hide:Access:AddTests.Init
  SELF.Init(Access:AddTests,1)


Hide:Access:AddTests.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= AT:Record
  SELF.FileNameValue = 'AddTests'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= AddTests
  PARENT.Init
  Access:AddTests &= SELF


Hide:Access:AddTests.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:AddTests &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:AddTests.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(AddTests,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(AT:locOrder,'AT:locOrder',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:AddTests.Kill PROCEDURE

  CODE
  _Hide:Access:AddTests.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:AddTests &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:AddTests)                           ! destroy the file manager


Hide:Relate:Normals.Init PROCEDURE
  CODE
  _Hide:Access:Normals.Init
  SELF.Init(Access:Normals,1)


Hide:Access:Normals.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NOR:Record
  SELF.FileNameValue = 'Normals'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Normals
  PARENT.Init
  Access:Normals &= SELF


Hide:Access:Normals.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Normals &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Normals.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Normals,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Normals.Kill PROCEDURE

  CODE
  _Hide:Access:Normals.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Normals &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Normals)                            ! destroy the file manager


Hide:Relate:Salesman.Init PROCEDURE
  CODE
  _Hide:Access:Salesman.Init
  SELF.Init(Access:Salesman,1)


Hide:Access:Salesman.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SM:Record
  SELF.FileNameValue = 'Salesman'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Salesman
  PARENT.Init
  Access:Salesman &= SELF


Hide:Access:Salesman.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Salesman &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Salesman.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Salesman,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SM:OrderKey,'SM:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Salesman.Kill PROCEDURE

  CODE
  _Hide:Access:Salesman.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Salesman &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Salesman)                           ! destroy the file manager


Hide:Relate:Specialty.Init PROCEDURE
  CODE
  _Hide:Access:Specialty.Init
  SELF.Init(Access:Specialty,1)


Hide:Access:Specialty.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SPY:Record
  SELF.FileNameValue = 'Specialty'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Specialty
  PARENT.Init
  Access:Specialty &= SELF


Hide:Access:Specialty.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Specialty &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Specialty.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Specialty,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(SPY:OrderKey,'SPY:OrderKey',1)
    SELF.AddKey(SPY:DisplayKey,'SPY:DisplayKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Specialty.Kill PROCEDURE

  CODE
  _Hide:Access:Specialty.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Specialty &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Specialty)                          ! destroy the file manager


Hide:Relate:Courier.Init PROCEDURE
  CODE
  _Hide:Access:Courier.Init
  SELF.Init(Access:Courier,1)


Hide:Access:Courier.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= COU:Record
  SELF.FileNameValue = 'Courier'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Courier
  PARENT.Init
  Access:Courier &= SELF


Hide:Access:Courier.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Courier &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Courier.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Courier,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(COU:OrderKey,'COU:OrderKey',1)
    SELF.AddKey(COU:DisplayKey,'COU:DisplayKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Courier.Kill PROCEDURE

  CODE
  _Hide:Access:Courier.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Courier &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Courier)                            ! destroy the file manager


Hide:Relate:Supplies.Init PROCEDURE
  CODE
  _Hide:Access:Supplies.Init
  SELF.Init(Access:Supplies,1)


Hide:Access:Supplies.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SUP:Record
  SELF.FileNameValue = 'Supplies'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Supplies
  PARENT.Init
  Access:Supplies &= SELF


Hide:Access:Supplies.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Supplies &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Supplies.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Supplies,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SUP:ClientKey,'SUP:ClientKey',0)
    SELF.AddKey(SUP:FindUnShippedKey,'SUP:FindUnShippedKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:Supplies.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('SUP:Client')
    IF NOT INRANGE(SUP:Client,100000,999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'100000 .. 999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:Supplies.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Client)


Hide:Relate:Supplies.Kill PROCEDURE

  CODE
  _Hide:Access:Supplies.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Supplies &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Supplies)                           ! destroy the file manager


Hide:Relate:PickUp.Init PROCEDURE
  CODE
  _Hide:Access:PickUp.Init
  SELF.Init(Access:PickUp,1)


Hide:Access:PickUp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PU:Record
  SELF.FileNameValue = 'PickUp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PickUp
  PARENT.Init
  Access:PickUp &= SELF


Hide:Access:PickUp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PickUp &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PickUp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PickUp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PU:DateKey,'PU:DateKey',0)
    SELF.AddKey(PU:ClientKey,'PU:ClientKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:PickUp.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('PU:Client')
    IF NOT INRANGE(PU:Client,100000,999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'100000 .. 999999')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:PickUp.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Client)


Hide:Relate:PickUp.Kill PROCEDURE

  CODE
  _Hide:Access:PickUp.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:PickUp &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PickUp)                             ! destroy the file manager


Hide:Relate:SendOuts.Init PROCEDURE
  CODE
  _Hide:Access:SendOuts.Init
  SELF.Init(Access:SendOuts,1)


Hide:Access:SendOuts.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SO:Record
  SELF.FileNameValue = 'SendOuts'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SendOuts
  PARENT.Init
  Access:SendOuts &= SELF


Hide:Access:SendOuts.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SendOuts &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SendOuts.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SendOuts,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SO:OrderKey,'SO:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SendOuts.Kill PROCEDURE

  CODE
  _Hide:Access:SendOuts.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:SendOuts &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SendOuts)                           ! destroy the file manager


Hide:Relate:GAM.Init PROCEDURE
  CODE
  _Hide:Access:GAM.Init
  SELF.Init(Access:GAM,1)


Hide:Access:GAM.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= GAM:Record
  SELF.FileNameValue = 'GAM'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= GAM
  PARENT.Init
  Access:GAM &= SELF


Hide:Access:GAM.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:GAM &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:GAM.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(GAM,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(GAM:OrderKey,'GAM:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:GAM.Kill PROCEDURE

  CODE
  _Hide:Access:GAM.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:GAM &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:GAM)                                ! destroy the file manager


Hide:Relate:PCodes.Init PROCEDURE
  CODE
  _Hide:Access:PCodes.Init
  SELF.Init(Access:PCodes,1)


Hide:Access:PCodes.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PC:Record
  SELF.FileNameValue = 'PCodes'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PCodes
  PARENT.Init
  Access:PCodes &= SELF


Hide:Access:PCodes.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PCodes &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PCodes.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PCodes,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PC:OrderKey,'PC:OrderKey',0)
    SELF.AddKey(PC:CodeKey,'PC:CodeKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PCodes.Kill PROCEDURE

  CODE
  _Hide:Access:PCodes.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:PCodes &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PCodes)                             ! destroy the file manager


Hide:Relate:Exceptions.Init PROCEDURE
  CODE
  _Hide:Access:Exceptions.Init
  SELF.Init(Access:Exceptions,1)


Hide:Access:Exceptions.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EXC:Record
  SELF.FileNameValue = 'Exceptions'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Exceptions
  PARENT.Init
  Access:Exceptions &= SELF


Hide:Access:Exceptions.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Exceptions &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Exceptions.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Exceptions,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(EXC:OrderKey,'EXC:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Exceptions.Kill PROCEDURE

  CODE
  _Hide:Access:Exceptions.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:Exceptions &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Exceptions)                         ! destroy the file manager


Hide:Relate:EventsTable.Init PROCEDURE
  CODE
  _Hide:Access:EventsTable.Init
  SELF.Init(Access:EventsTable,1)


Hide:Access:EventsTable.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ET:Record
  SELF.FileNameValue = 'EventsTable'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= EventsTable
  PARENT.Init
  Access:EventsTable &= SELF


Hide:Access:EventsTable.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:EventsTable &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:EventsTable.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(EventsTable,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:EventsTable.Kill PROCEDURE

  CODE
  _Hide:Access:EventsTable.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:EventsTable &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:EventsTable)                        ! destroy the file manager

