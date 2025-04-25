  MEMBER('Alis8.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Alis8_BC3:DctInit    PROCEDURE
Alis8_BC3:DctKill    PROCEDURE
Alis8_BC3:FilesInit  PROCEDURE
  END

Hide:Access:payers   CLASS(FileManager),TYPE               ! FileManager for payers
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:payers   CLASS(RelationManager),TYPE           ! RelationManager for payers
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Claims   CLASS(FileManager),TYPE               ! FileManager for Claims
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Claims   CLASS(RelationManager),TYPE           ! RelationManager for Claims
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ChangeCare CLASS(FileManager),TYPE             ! FileManager for ChangeCare
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ChangeCare CLASS(RelationManager),TYPE         ! RelationManager for ChangeCare
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Temp     CLASS(FileManager),TYPE               ! FileManager for Temp
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Temp     CLASS(RelationManager),TYPE           ! RelationManager for Temp
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ExportIns CLASS(FileManager),TYPE              ! FileManager for ExportIns
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ExportIns CLASS(RelationManager),TYPE          ! RelationManager for ExportIns
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DiagnosticCodes CLASS(FileManager),TYPE        ! FileManager for DiagnosticCodes
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DiagnosticCodes CLASS(RelationManager),TYPE    ! RelationManager for DiagnosticCodes
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Accession CLASS(FileManager),TYPE              ! FileManager for Accession
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Accession CLASS(RelationManager),TYPE          ! RelationManager for Accession
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:RequestForms CLASS(FileManager),TYPE           ! FileManager for RequestForms
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:RequestForms CLASS(RelationManager),TYPE       ! RelationManager for RequestForms
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ExportCovid CLASS(FileManager),TYPE            ! FileManager for ExportCovid
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ExportCovid CLASS(RelationManager),TYPE        ! RelationManager for ExportCovid
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CovidOrders CLASS(FileManager),TYPE            ! FileManager for CovidOrders
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CovidOrders CLASS(RelationManager),TYPE        ! RelationManager for CovidOrders
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PrintList CLASS(FileManager),TYPE              ! FileManager for PrintList
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PrintList CLASS(RelationManager),TYPE          ! RelationManager for PrintList
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PatientList CLASS(FileManager),TYPE            ! FileManager for PatientList
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PatientList CLASS(RelationManager),TYPE        ! RelationManager for PatientList
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:CPL      CLASS(FileManager),TYPE               ! FileManager for CPL
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:CPL      CLASS(RelationManager),TYPE           ! RelationManager for CPL
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:NewPanels CLASS(FileManager),TYPE              ! FileManager for NewPanels
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:NewPanels CLASS(RelationManager),TYPE          ! RelationManager for NewPanels
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:HL7      CLASS(FileManager),TYPE               ! FileManager for HL7
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:HL7      CLASS(RelationManager),TYPE           ! RelationManager for HL7
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:payers  &Hide:Access:payers,AUTO,THREAD
_Hide:Relate:payers  &Hide:Relate:payers,AUTO,THREAD
_Hide:Access:Claims  &Hide:Access:Claims,AUTO,THREAD
_Hide:Relate:Claims  &Hide:Relate:Claims,AUTO,THREAD
_Hide:Access:ChangeCare &Hide:Access:ChangeCare,AUTO,THREAD
_Hide:Relate:ChangeCare &Hide:Relate:ChangeCare,AUTO,THREAD
_Hide:Access:Temp    &Hide:Access:Temp,AUTO,THREAD
_Hide:Relate:Temp    &Hide:Relate:Temp,AUTO,THREAD
_Hide:Access:ExportIns &Hide:Access:ExportIns,AUTO,THREAD
_Hide:Relate:ExportIns &Hide:Relate:ExportIns,AUTO,THREAD
_Hide:Access:DiagnosticCodes &Hide:Access:DiagnosticCodes,AUTO,THREAD
_Hide:Relate:DiagnosticCodes &Hide:Relate:DiagnosticCodes,AUTO,THREAD
_Hide:Access:Accession &Hide:Access:Accession,AUTO,THREAD
_Hide:Relate:Accession &Hide:Relate:Accession,AUTO,THREAD
_Hide:Access:RequestForms &Hide:Access:RequestForms,AUTO,THREAD
_Hide:Relate:RequestForms &Hide:Relate:RequestForms,AUTO,THREAD
_Hide:Access:ExportCovid &Hide:Access:ExportCovid,AUTO,THREAD
_Hide:Relate:ExportCovid &Hide:Relate:ExportCovid,AUTO,THREAD
_Hide:Access:CovidOrders &Hide:Access:CovidOrders,AUTO,THREAD
_Hide:Relate:CovidOrders &Hide:Relate:CovidOrders,AUTO,THREAD
_Hide:Access:PrintList &Hide:Access:PrintList,AUTO,THREAD
_Hide:Relate:PrintList &Hide:Relate:PrintList,AUTO,THREAD
_Hide:Access:PatientList &Hide:Access:PatientList,AUTO,THREAD
_Hide:Relate:PatientList &Hide:Relate:PatientList,AUTO,THREAD
_Hide:Access:CPL     &Hide:Access:CPL,AUTO,THREAD
_Hide:Relate:CPL     &Hide:Relate:CPL,AUTO,THREAD
_Hide:Access:NewPanels &Hide:Access:NewPanels,AUTO,THREAD
_Hide:Relate:NewPanels &Hide:Relate:NewPanels,AUTO,THREAD
_Hide:Access:HL7     &Hide:Access:HL7,AUTO,THREAD
_Hide:Relate:HL7     &Hide:Relate:HL7,AUTO,THREAD


Alis8_BC3:DctInit PROCEDURE
  CODE
  _Hide:Access:payers &= NEW(Hide:Access:payers)
  _Hide:Relate:payers &= NEW(Hide:Relate:payers)
  _Hide:Access:Claims &= NEW(Hide:Access:Claims)
  _Hide:Relate:Claims &= NEW(Hide:Relate:Claims)
  _Hide:Access:ChangeCare &= NEW(Hide:Access:ChangeCare)
  _Hide:Relate:ChangeCare &= NEW(Hide:Relate:ChangeCare)
  _Hide:Access:Temp &= NEW(Hide:Access:Temp)
  _Hide:Relate:Temp &= NEW(Hide:Relate:Temp)
  _Hide:Access:ExportIns &= NEW(Hide:Access:ExportIns)
  _Hide:Relate:ExportIns &= NEW(Hide:Relate:ExportIns)
  _Hide:Access:DiagnosticCodes &= NEW(Hide:Access:DiagnosticCodes)
  _Hide:Relate:DiagnosticCodes &= NEW(Hide:Relate:DiagnosticCodes)
  _Hide:Access:Accession &= NEW(Hide:Access:Accession)
  _Hide:Relate:Accession &= NEW(Hide:Relate:Accession)
  _Hide:Access:RequestForms &= NEW(Hide:Access:RequestForms)
  _Hide:Relate:RequestForms &= NEW(Hide:Relate:RequestForms)
  _Hide:Access:ExportCovid &= NEW(Hide:Access:ExportCovid)
  _Hide:Relate:ExportCovid &= NEW(Hide:Relate:ExportCovid)
  _Hide:Access:CovidOrders &= NEW(Hide:Access:CovidOrders)
  _Hide:Relate:CovidOrders &= NEW(Hide:Relate:CovidOrders)
  _Hide:Access:PrintList &= NEW(Hide:Access:PrintList)
  _Hide:Relate:PrintList &= NEW(Hide:Relate:PrintList)
  _Hide:Access:PatientList &= NEW(Hide:Access:PatientList)
  _Hide:Relate:PatientList &= NEW(Hide:Relate:PatientList)
  _Hide:Access:CPL &= NEW(Hide:Access:CPL)
  _Hide:Relate:CPL &= NEW(Hide:Relate:CPL)
  _Hide:Access:NewPanels &= NEW(Hide:Access:NewPanels)
  _Hide:Relate:NewPanels &= NEW(Hide:Relate:NewPanels)
  _Hide:Access:HL7 &= NEW(Hide:Access:HL7)
  _Hide:Relate:HL7 &= NEW(Hide:Relate:HL7)
  Relate:payers &= _Hide:Relate:payers
  Relate:Claims &= _Hide:Relate:Claims
  Relate:ChangeCare &= _Hide:Relate:ChangeCare
  Relate:Temp &= _Hide:Relate:Temp
  Relate:ExportIns &= _Hide:Relate:ExportIns
  Relate:DiagnosticCodes &= _Hide:Relate:DiagnosticCodes
  Relate:Accession &= _Hide:Relate:Accession
  Relate:RequestForms &= _Hide:Relate:RequestForms
  Relate:ExportCovid &= _Hide:Relate:ExportCovid
  Relate:CovidOrders &= _Hide:Relate:CovidOrders
  Relate:PrintList &= _Hide:Relate:PrintList
  Relate:PatientList &= _Hide:Relate:PatientList
  Relate:CPL &= _Hide:Relate:CPL
  Relate:NewPanels &= _Hide:Relate:NewPanels
  Relate:HL7 &= _Hide:Relate:HL7


Alis8_BC3:FilesInit PROCEDURE
  CODE
  _Hide:Relate:payers.Init
  _Hide:Relate:Claims.Init
  _Hide:Relate:ChangeCare.Init
  _Hide:Relate:Temp.Init
  _Hide:Relate:ExportIns.Init
  _Hide:Relate:DiagnosticCodes.Init
  _Hide:Relate:Accession.Init
  _Hide:Relate:RequestForms.Init
  _Hide:Relate:ExportCovid.Init
  _Hide:Relate:CovidOrders.Init
  _Hide:Relate:PrintList.Init
  _Hide:Relate:PatientList.Init
  _Hide:Relate:CPL.Init
  _Hide:Relate:NewPanels.Init
  _Hide:Relate:HL7.Init


Alis8_BC3:DctKill PROCEDURE
  CODE
  _Hide:Relate:payers.Kill
  DISPOSE(_Hide:Relate:payers)
  _Hide:Relate:Claims.Kill
  DISPOSE(_Hide:Relate:Claims)
  _Hide:Relate:ChangeCare.Kill
  DISPOSE(_Hide:Relate:ChangeCare)
  _Hide:Relate:Temp.Kill
  DISPOSE(_Hide:Relate:Temp)
  _Hide:Relate:ExportIns.Kill
  DISPOSE(_Hide:Relate:ExportIns)
  _Hide:Relate:DiagnosticCodes.Kill
  DISPOSE(_Hide:Relate:DiagnosticCodes)
  _Hide:Relate:Accession.Kill
  DISPOSE(_Hide:Relate:Accession)
  _Hide:Relate:RequestForms.Kill
  DISPOSE(_Hide:Relate:RequestForms)
  _Hide:Relate:ExportCovid.Kill
  DISPOSE(_Hide:Relate:ExportCovid)
  _Hide:Relate:CovidOrders.Kill
  DISPOSE(_Hide:Relate:CovidOrders)
  _Hide:Relate:PrintList.Kill
  DISPOSE(_Hide:Relate:PrintList)
  _Hide:Relate:PatientList.Kill
  DISPOSE(_Hide:Relate:PatientList)
  _Hide:Relate:CPL.Kill
  DISPOSE(_Hide:Relate:CPL)
  _Hide:Relate:NewPanels.Kill
  DISPOSE(_Hide:Relate:NewPanels)
  _Hide:Relate:HL7.Kill
  DISPOSE(_Hide:Relate:HL7)


Hide:Relate:payers.Init PROCEDURE
  CODE
  _Hide:Access:payers.Init
  SELF.Init(Access:payers,1)


Hide:Access:payers.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PA:Record
  SELF.FileNameValue = 'payers'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= payers
  PARENT.Init
  Access:payers &= SELF


Hide:Access:payers.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:payers &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:payers.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(payers,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PA:PayerKey,'PA:PayerKey',0)
    SELF.AddKey(PA:OrderKey,'PA:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:payers.Kill PROCEDURE

  CODE
  _Hide:Access:payers.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:payers &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:payers)                             ! destroy the file manager


Hide:Relate:Claims.Init PROCEDURE
  CODE
  _Hide:Access:Claims.Init
  SELF.Init(Access:Claims,1)


Hide:Access:Claims.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CLM:Record
  SELF.FileNameValue = 'Claims'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Claims
  PARENT.Init
  Access:Claims &= SELF


Hide:Access:Claims.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Claims &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Claims.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Claims,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(CLM:OrderKey,'CLM:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Claims.Kill PROCEDURE

  CODE
  _Hide:Access:Claims.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Claims &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Claims)                             ! destroy the file manager


Hide:Relate:ChangeCare.Init PROCEDURE
  CODE
  _Hide:Access:ChangeCare.Init
  SELF.Init(Access:ChangeCare,1)


Hide:Access:ChangeCare.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CC:Record
  SELF.FileNameValue = 'ChangeCare'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ChangeCare
  PARENT.Init
  Access:ChangeCare &= SELF


Hide:Access:ChangeCare.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ChangeCare &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ChangeCare.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ChangeCare,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(CC:OrderKey,'CC:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ChangeCare.Kill PROCEDURE

  CODE
  _Hide:Access:ChangeCare.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ChangeCare &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ChangeCare)                         ! destroy the file manager


Hide:Relate:Temp.Init PROCEDURE
  CODE
  _Hide:Access:Temp.Init
  SELF.Init(Access:Temp,1)


Hide:Access:Temp.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TMP:Record
  SELF.FileNameValue = 'Temp'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Temp
  PARENT.Init
  Access:Temp &= SELF


Hide:Access:Temp.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Temp &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Temp.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Temp,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TMP:OrderKey,'TMP:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Temp.Kill PROCEDURE

  CODE
  _Hide:Access:Temp.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:Temp &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Temp)                               ! destroy the file manager


Hide:Relate:ExportIns.Init PROCEDURE
  CODE
  _Hide:Access:ExportIns.Init
  SELF.Init(Access:ExportIns,1)


Hide:Access:ExportIns.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EI:Record
  SELF.FileNameValue = 'ExportIns'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ExportIns
  PARENT.Init
  Access:ExportIns &= SELF


Hide:Access:ExportIns.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ExportIns &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ExportIns.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ExportIns,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(EI:OrderKey,'EI:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ExportIns.Kill PROCEDURE

  CODE
  _Hide:Access:ExportIns.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:ExportIns &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ExportIns)                          ! destroy the file manager


Hide:Relate:DiagnosticCodes.Init PROCEDURE
  CODE
  _Hide:Access:DiagnosticCodes.Init
  SELF.Init(Access:DiagnosticCodes,1)


Hide:Access:DiagnosticCodes.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DC:Record
  SELF.FileNameValue = 'DiagnosticCodes'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DiagnosticCodes
  PARENT.Init
  Access:DiagnosticCodes &= SELF


Hide:Access:DiagnosticCodes.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DiagnosticCodes &= NULL                           ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DiagnosticCodes.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DiagnosticCodes,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DC:OrderKey,'DC:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DiagnosticCodes.Kill PROCEDURE

  CODE
  _Hide:Access:DiagnosticCodes.Kill                        ! Kill the file manager
  PARENT.Kill
  Relate:DiagnosticCodes &= NULL                           ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DiagnosticCodes)                    ! destroy the file manager


Hide:Relate:Accession.Init PROCEDURE
  CODE
  _Hide:Access:Accession.Init
  SELF.Init(Access:Accession,1)


Hide:Access:Accession.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ACC:Record
  SELF.FileNameValue = 'Accession'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Accession
  PARENT.Init
  Access:Accession &= SELF


Hide:Access:Accession.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Accession &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Accession.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Accession,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ACC:OrderKey,'ACC:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Accession.Kill PROCEDURE

  CODE
  _Hide:Access:Accession.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Accession &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Accession)                          ! destroy the file manager


Hide:Relate:RequestForms.Init PROCEDURE
  CODE
  _Hide:Access:RequestForms.Init
  SELF.Init(Access:RequestForms,1)


Hide:Access:RequestForms.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RF:Record
  SELF.FileNameValue = 'RequestForms'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= RequestForms
  PARENT.Init
  Access:RequestForms &= SELF


Hide:Access:RequestForms.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:RequestForms &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:RequestForms.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(RequestForms,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RF:DateKey,'RF:DateKey',0)
    SELF.AddKey(RF:OrderKey,'RF:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:RequestForms.Kill PROCEDURE

  CODE
  _Hide:Access:RequestForms.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:RequestForms &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:RequestForms)                       ! destroy the file manager


Hide:Relate:ExportCovid.Init PROCEDURE
  CODE
  _Hide:Access:ExportCovid.Init
  SELF.Init(Access:ExportCovid,1)


Hide:Access:ExportCovid.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EC:Record
  SELF.FileNameValue = 'ExportCovid'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ExportCovid
  PARENT.Init
  Access:ExportCovid &= SELF


Hide:Access:ExportCovid.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ExportCovid &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ExportCovid.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ExportCovid,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(EC:OrderKey,'EC:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ExportCovid.Kill PROCEDURE

  CODE
  _Hide:Access:ExportCovid.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:ExportCovid &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ExportCovid)                        ! destroy the file manager


Hide:Relate:CovidOrders.Init PROCEDURE
  CODE
  _Hide:Access:CovidOrders.Init
  SELF.Init(Access:CovidOrders,1)


Hide:Access:CovidOrders.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Cov:Record
  SELF.FileNameValue = 'CovidOrders'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CovidOrders
  PARENT.Init
  Access:CovidOrders &= SELF


Hide:Access:CovidOrders.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CovidOrders &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CovidOrders.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CovidOrders,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Cov:OrderKey,'Cov:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CovidOrders.Kill PROCEDURE

  CODE
  _Hide:Access:CovidOrders.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:CovidOrders &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CovidOrders)                        ! destroy the file manager


Hide:Relate:PrintList.Init PROCEDURE
  CODE
  _Hide:Access:PrintList.Init
  SELF.Init(Access:PrintList,1)


Hide:Access:PrintList.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PL:Record
  SELF.FileNameValue = 'PrintList'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PrintList
  PARENT.Init
  Access:PrintList &= SELF


Hide:Access:PrintList.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PrintList &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PrintList.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PrintList,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PL:OrderKey,'PL:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PrintList.Kill PROCEDURE

  CODE
  _Hide:Access:PrintList.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:PrintList &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PrintList)                          ! destroy the file manager


Hide:Relate:PatientList.Init PROCEDURE
  CODE
  _Hide:Access:PatientList.Init
  SELF.Init(Access:PatientList,1)


Hide:Access:PatientList.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PatL:Record
  SELF.FileNameValue = 'PatientList'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PatientList
  PARENT.Init
  Access:PatientList &= SELF


Hide:Access:PatientList.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PatientList &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PatientList.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PatientList,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PatL:OrderKey,'PatL:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PatientList.Kill PROCEDURE

  CODE
  _Hide:Access:PatientList.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:PatientList &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PatientList)                        ! destroy the file manager


Hide:Relate:CPL.Init PROCEDURE
  CODE
  _Hide:Access:CPL.Init
  SELF.Init(Access:CPL,1)


Hide:Access:CPL.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CPL:Record
  SELF.FileNameValue = 'CPL'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= CPL
  PARENT.Init
  Access:CPL &= SELF


Hide:Access:CPL.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:CPL &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:CPL.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(CPL,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:CPL.Kill PROCEDURE

  CODE
  _Hide:Access:CPL.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:CPL &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:CPL)                                ! destroy the file manager


Hide:Relate:NewPanels.Init PROCEDURE
  CODE
  _Hide:Access:NewPanels.Init
  SELF.Init(Access:NewPanels,1)


Hide:Access:NewPanels.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NP:Record
  SELF.FileNameValue = 'NewPanels'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NewPanels
  PARENT.Init
  Access:NewPanels &= SELF


Hide:Access:NewPanels.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NewPanels &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:NewPanels.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(NewPanels,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(NP:Order_Key,'NP:Order_Key',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:NewPanels.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Pnl_test,RI:None,RI:None,PT:ORDER_KEY)
  SELF.AddRelationLink(NP:Number,PT:PANEL)


Hide:Relate:NewPanels.Kill PROCEDURE

  CODE
  _Hide:Access:NewPanels.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:NewPanels &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NewPanels)                          ! destroy the file manager


Hide:Relate:HL7.Init PROCEDURE
  CODE
  _Hide:Access:HL7.Init
  SELF.Init(Access:HL7,1)


Hide:Access:HL7.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= HL7:Record
  SELF.FileNameValue = 'HL7'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= HL7
  PARENT.Init
  Access:HL7 &= SELF


Hide:Access:HL7.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:HL7 &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:HL7.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(HL7,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(HL7:OrderKey,'HL7:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:HL7.Kill PROCEDURE

  CODE
  _Hide:Access:HL7.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:HL7 &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:HL7)                                ! destroy the file manager

