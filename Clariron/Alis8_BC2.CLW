  MEMBER('Alis8.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Alis8_BC2:DctInit    PROCEDURE
Alis8_BC2:DctKill    PROCEDURE
Alis8_BC2:FilesInit  PROCEDURE
  END

Hide:Access:Online   CLASS(FileManager),TYPE               ! FileManager for Online
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Online   CLASS(RelationManager),TYPE           ! RelationManager for Online
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Upload   CLASS(FileManager),TYPE               ! FileManager for Upload
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Upload   CLASS(RelationManager),TYPE           ! RelationManager for Upload
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ToDo     CLASS(FileManager),TYPE               ! FileManager for ToDo
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ToDo     CLASS(RelationManager),TYPE           ! RelationManager for ToDo
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ResultsSendout CLASS(FileManager),TYPE         ! FileManager for ResultsSendout
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ResultsSendout CLASS(RelationManager),TYPE     ! RelationManager for ResultsSendout
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PDF      CLASS(FileManager),TYPE               ! FileManager for PDF
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PDF      CLASS(RelationManager),TYPE           ! RelationManager for PDF
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Billing  CLASS(FileManager),TYPE               ! FileManager for Billing
BindFields             PROCEDURE(),DERIVED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Billing  CLASS(RelationManager),TYPE           ! RelationManager for Billing
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:NameList CLASS(FileManager),TYPE               ! FileManager for NameList
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:NameList CLASS(RelationManager),TYPE           ! RelationManager for NameList
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Payments CLASS(FileManager),TYPE               ! FileManager for Payments
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Payments CLASS(RelationManager),TYPE           ! RelationManager for Payments
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Insurance CLASS(FileManager),TYPE              ! FileManager for Insurance
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Insurance CLASS(RelationManager),TYPE          ! RelationManager for Insurance
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Providers CLASS(FileManager),TYPE              ! FileManager for Providers
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Providers CLASS(RelationManager),TYPE          ! RelationManager for Providers
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PayType  CLASS(FileManager),TYPE               ! FileManager for PayType
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PayType  CLASS(RelationManager),TYPE           ! RelationManager for PayType
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Fees     CLASS(FileManager),TYPE               ! FileManager for Fees
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Fees     CLASS(RelationManager),TYPE           ! RelationManager for Fees
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:BillingItems CLASS(FileManager),TYPE           ! FileManager for BillingItems
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:BillingItems CLASS(RelationManager),TYPE       ! RelationManager for BillingItems
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:BillingReadIn CLASS(FileManager),TYPE          ! FileManager for BillingReadIn
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:BillingReadIn CLASS(RelationManager),TYPE      ! RelationManager for BillingReadIn
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:VerifyPatient CLASS(FileManager),TYPE          ! FileManager for VerifyPatient
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:VerifyPatient CLASS(RelationManager),TYPE      ! RelationManager for VerifyPatient
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:DeleteTests CLASS(FileManager),TYPE            ! FileManager for DeleteTests
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:DeleteTests CLASS(RelationManager),TYPE        ! RelationManager for DeleteTests
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:TestMem  CLASS(FileManager),TYPE               ! FileManager for TestMem
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:TestMem  CLASS(RelationManager),TYPE           ! RelationManager for TestMem
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Service  CLASS(FileManager),TYPE               ! FileManager for Service
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Service  CLASS(RelationManager),TYPE           ! RelationManager for Service
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ExportList CLASS(FileManager),TYPE             ! FileManager for ExportList
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ExportList CLASS(RelationManager),TYPE         ! RelationManager for ExportList
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:MedicareTests CLASS(FileManager),TYPE          ! FileManager for MedicareTests
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:MedicareTests CLASS(RelationManager),TYPE      ! RelationManager for MedicareTests
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:Online  &Hide:Access:Online,AUTO,THREAD
_Hide:Relate:Online  &Hide:Relate:Online,AUTO,THREAD
_Hide:Access:Upload  &Hide:Access:Upload,AUTO,THREAD
_Hide:Relate:Upload  &Hide:Relate:Upload,AUTO,THREAD
_Hide:Access:ToDo    &Hide:Access:ToDo,AUTO,THREAD
_Hide:Relate:ToDo    &Hide:Relate:ToDo,AUTO,THREAD
_Hide:Access:ResultsSendout &Hide:Access:ResultsSendout,AUTO,THREAD
_Hide:Relate:ResultsSendout &Hide:Relate:ResultsSendout,AUTO,THREAD
_Hide:Access:PDF     &Hide:Access:PDF,AUTO,THREAD
_Hide:Relate:PDF     &Hide:Relate:PDF,AUTO,THREAD
_Hide:Access:Billing &Hide:Access:Billing,AUTO,THREAD
_Hide:Relate:Billing &Hide:Relate:Billing,AUTO,THREAD
_Hide:Access:NameList &Hide:Access:NameList,AUTO,THREAD
_Hide:Relate:NameList &Hide:Relate:NameList,AUTO,THREAD
_Hide:Access:Payments &Hide:Access:Payments,AUTO,THREAD
_Hide:Relate:Payments &Hide:Relate:Payments,AUTO,THREAD
_Hide:Access:Insurance &Hide:Access:Insurance,AUTO,THREAD
_Hide:Relate:Insurance &Hide:Relate:Insurance,AUTO,THREAD
_Hide:Access:Providers &Hide:Access:Providers,AUTO,THREAD
_Hide:Relate:Providers &Hide:Relate:Providers,AUTO,THREAD
_Hide:Access:PayType &Hide:Access:PayType,AUTO,THREAD
_Hide:Relate:PayType &Hide:Relate:PayType,AUTO,THREAD
_Hide:Access:Fees    &Hide:Access:Fees,AUTO,THREAD
_Hide:Relate:Fees    &Hide:Relate:Fees,AUTO,THREAD
_Hide:Access:BillingItems &Hide:Access:BillingItems,AUTO,THREAD
_Hide:Relate:BillingItems &Hide:Relate:BillingItems,AUTO,THREAD
_Hide:Access:BillingReadIn &Hide:Access:BillingReadIn,AUTO,THREAD
_Hide:Relate:BillingReadIn &Hide:Relate:BillingReadIn,AUTO,THREAD
_Hide:Access:VerifyPatient &Hide:Access:VerifyPatient,AUTO,THREAD
_Hide:Relate:VerifyPatient &Hide:Relate:VerifyPatient,AUTO,THREAD
_Hide:Access:DeleteTests &Hide:Access:DeleteTests,AUTO,THREAD
_Hide:Relate:DeleteTests &Hide:Relate:DeleteTests,AUTO,THREAD
_Hide:Access:TestMem &Hide:Access:TestMem,AUTO,THREAD
_Hide:Relate:TestMem &Hide:Relate:TestMem,AUTO,THREAD
_Hide:Access:Service &Hide:Access:Service,AUTO,THREAD
_Hide:Relate:Service &Hide:Relate:Service,AUTO,THREAD
_Hide:Access:ExportList &Hide:Access:ExportList,AUTO,THREAD
_Hide:Relate:ExportList &Hide:Relate:ExportList,AUTO,THREAD
_Hide:Access:MedicareTests &Hide:Access:MedicareTests,AUTO,THREAD
_Hide:Relate:MedicareTests &Hide:Relate:MedicareTests,AUTO,THREAD


Alis8_BC2:DctInit PROCEDURE
  CODE
  _Hide:Access:Online &= NEW(Hide:Access:Online)
  _Hide:Relate:Online &= NEW(Hide:Relate:Online)
  _Hide:Access:Upload &= NEW(Hide:Access:Upload)
  _Hide:Relate:Upload &= NEW(Hide:Relate:Upload)
  _Hide:Access:ToDo &= NEW(Hide:Access:ToDo)
  _Hide:Relate:ToDo &= NEW(Hide:Relate:ToDo)
  _Hide:Access:ResultsSendout &= NEW(Hide:Access:ResultsSendout)
  _Hide:Relate:ResultsSendout &= NEW(Hide:Relate:ResultsSendout)
  _Hide:Access:PDF &= NEW(Hide:Access:PDF)
  _Hide:Relate:PDF &= NEW(Hide:Relate:PDF)
  _Hide:Access:Billing &= NEW(Hide:Access:Billing)
  _Hide:Relate:Billing &= NEW(Hide:Relate:Billing)
  _Hide:Access:NameList &= NEW(Hide:Access:NameList)
  _Hide:Relate:NameList &= NEW(Hide:Relate:NameList)
  _Hide:Access:Payments &= NEW(Hide:Access:Payments)
  _Hide:Relate:Payments &= NEW(Hide:Relate:Payments)
  _Hide:Access:Insurance &= NEW(Hide:Access:Insurance)
  _Hide:Relate:Insurance &= NEW(Hide:Relate:Insurance)
  _Hide:Access:Providers &= NEW(Hide:Access:Providers)
  _Hide:Relate:Providers &= NEW(Hide:Relate:Providers)
  _Hide:Access:PayType &= NEW(Hide:Access:PayType)
  _Hide:Relate:PayType &= NEW(Hide:Relate:PayType)
  _Hide:Access:Fees &= NEW(Hide:Access:Fees)
  _Hide:Relate:Fees &= NEW(Hide:Relate:Fees)
  _Hide:Access:BillingItems &= NEW(Hide:Access:BillingItems)
  _Hide:Relate:BillingItems &= NEW(Hide:Relate:BillingItems)
  _Hide:Access:BillingReadIn &= NEW(Hide:Access:BillingReadIn)
  _Hide:Relate:BillingReadIn &= NEW(Hide:Relate:BillingReadIn)
  _Hide:Access:VerifyPatient &= NEW(Hide:Access:VerifyPatient)
  _Hide:Relate:VerifyPatient &= NEW(Hide:Relate:VerifyPatient)
  _Hide:Access:DeleteTests &= NEW(Hide:Access:DeleteTests)
  _Hide:Relate:DeleteTests &= NEW(Hide:Relate:DeleteTests)
  _Hide:Access:TestMem &= NEW(Hide:Access:TestMem)
  _Hide:Relate:TestMem &= NEW(Hide:Relate:TestMem)
  _Hide:Access:Service &= NEW(Hide:Access:Service)
  _Hide:Relate:Service &= NEW(Hide:Relate:Service)
  _Hide:Access:ExportList &= NEW(Hide:Access:ExportList)
  _Hide:Relate:ExportList &= NEW(Hide:Relate:ExportList)
  _Hide:Access:MedicareTests &= NEW(Hide:Access:MedicareTests)
  _Hide:Relate:MedicareTests &= NEW(Hide:Relate:MedicareTests)
  Relate:Online &= _Hide:Relate:Online
  Relate:Upload &= _Hide:Relate:Upload
  Relate:ToDo &= _Hide:Relate:ToDo
  Relate:ResultsSendout &= _Hide:Relate:ResultsSendout
  Relate:PDF &= _Hide:Relate:PDF
  Relate:Billing &= _Hide:Relate:Billing
  Relate:NameList &= _Hide:Relate:NameList
  Relate:Payments &= _Hide:Relate:Payments
  Relate:Insurance &= _Hide:Relate:Insurance
  Relate:Providers &= _Hide:Relate:Providers
  Relate:PayType &= _Hide:Relate:PayType
  Relate:Fees &= _Hide:Relate:Fees
  Relate:BillingItems &= _Hide:Relate:BillingItems
  Relate:BillingReadIn &= _Hide:Relate:BillingReadIn
  Relate:VerifyPatient &= _Hide:Relate:VerifyPatient
  Relate:DeleteTests &= _Hide:Relate:DeleteTests
  Relate:TestMem &= _Hide:Relate:TestMem
  Relate:Service &= _Hide:Relate:Service
  Relate:ExportList &= _Hide:Relate:ExportList
  Relate:MedicareTests &= _Hide:Relate:MedicareTests


Alis8_BC2:FilesInit PROCEDURE
  CODE
  _Hide:Relate:Online.Init
  _Hide:Relate:Upload.Init
  _Hide:Relate:ToDo.Init
  _Hide:Relate:ResultsSendout.Init
  _Hide:Relate:PDF.Init
  _Hide:Relate:Billing.Init
  _Hide:Relate:NameList.Init
  _Hide:Relate:Payments.Init
  _Hide:Relate:Insurance.Init
  _Hide:Relate:Providers.Init
  _Hide:Relate:PayType.Init
  _Hide:Relate:Fees.Init
  _Hide:Relate:BillingItems.Init
  _Hide:Relate:BillingReadIn.Init
  _Hide:Relate:VerifyPatient.Init
  _Hide:Relate:DeleteTests.Init
  _Hide:Relate:TestMem.Init
  _Hide:Relate:Service.Init
  _Hide:Relate:ExportList.Init
  _Hide:Relate:MedicareTests.Init


Alis8_BC2:DctKill PROCEDURE
  CODE
  _Hide:Relate:Online.Kill
  DISPOSE(_Hide:Relate:Online)
  _Hide:Relate:Upload.Kill
  DISPOSE(_Hide:Relate:Upload)
  _Hide:Relate:ToDo.Kill
  DISPOSE(_Hide:Relate:ToDo)
  _Hide:Relate:ResultsSendout.Kill
  DISPOSE(_Hide:Relate:ResultsSendout)
  _Hide:Relate:PDF.Kill
  DISPOSE(_Hide:Relate:PDF)
  _Hide:Relate:Billing.Kill
  DISPOSE(_Hide:Relate:Billing)
  _Hide:Relate:NameList.Kill
  DISPOSE(_Hide:Relate:NameList)
  _Hide:Relate:Payments.Kill
  DISPOSE(_Hide:Relate:Payments)
  _Hide:Relate:Insurance.Kill
  DISPOSE(_Hide:Relate:Insurance)
  _Hide:Relate:Providers.Kill
  DISPOSE(_Hide:Relate:Providers)
  _Hide:Relate:PayType.Kill
  DISPOSE(_Hide:Relate:PayType)
  _Hide:Relate:Fees.Kill
  DISPOSE(_Hide:Relate:Fees)
  _Hide:Relate:BillingItems.Kill
  DISPOSE(_Hide:Relate:BillingItems)
  _Hide:Relate:BillingReadIn.Kill
  DISPOSE(_Hide:Relate:BillingReadIn)
  _Hide:Relate:VerifyPatient.Kill
  DISPOSE(_Hide:Relate:VerifyPatient)
  _Hide:Relate:DeleteTests.Kill
  DISPOSE(_Hide:Relate:DeleteTests)
  _Hide:Relate:TestMem.Kill
  DISPOSE(_Hide:Relate:TestMem)
  _Hide:Relate:Service.Kill
  DISPOSE(_Hide:Relate:Service)
  _Hide:Relate:ExportList.Kill
  DISPOSE(_Hide:Relate:ExportList)
  _Hide:Relate:MedicareTests.Kill
  DISPOSE(_Hide:Relate:MedicareTests)


Hide:Relate:Online.Init PROCEDURE
  CODE
  _Hide:Access:Online.Init
  SELF.Init(Access:Online,1)


Hide:Access:Online.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= OL:Record
  SELF.FileNameValue = 'Online'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Online
  PARENT.Init
  Access:Online &= SELF


Hide:Access:Online.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Online &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Online.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Online,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Online.Kill PROCEDURE

  CODE
  _Hide:Access:Online.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Online &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Online)                             ! destroy the file manager


Hide:Relate:Upload.Init PROCEDURE
  CODE
  _Hide:Access:Upload.Init
  SELF.Init(Access:Upload,1)


Hide:Access:Upload.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= UP:Record
  SELF.FileNameValue = 'Upload'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Upload
  PARENT.Init
  Access:Upload &= SELF


Hide:Access:Upload.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Upload &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Upload.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Upload,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(UP:OrderKey,'UP:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Upload.Kill PROCEDURE

  CODE
  _Hide:Access:Upload.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Upload &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Upload)                             ! destroy the file manager


Hide:Relate:ToDo.Init PROCEDURE
  CODE
  _Hide:Access:ToDo.Init
  SELF.Init(Access:ToDo,1)


Hide:Access:ToDo.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= ToD:Record
  SELF.FileNameValue = 'ToDo'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ToDo
  PARENT.Init
  Access:ToDo &= SELF


Hide:Access:ToDo.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ToDo &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ToDo.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ToDo,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(ToD:OrderKey,'ToD:OrderKey',0)
    SELF.AddKey(ToD:DateKey,'ToD:DateKey',0)
    SELF.AddKey(ToD:ForKey,'ToD:ForKey',0)
    SELF.AddKey(ToD:DupKey,'Eliminates Duplicates',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ToDo.Kill PROCEDURE

  CODE
  _Hide:Access:ToDo.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:ToDo &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ToDo)                               ! destroy the file manager


Hide:Relate:ResultsSendout.Init PROCEDURE
  CODE
  _Hide:Access:ResultsSendout.Init
  SELF.Init(Access:ResultsSendout,1)


Hide:Access:ResultsSendout.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RS:Record
  SELF.FileNameValue = 'ResultsSendout'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ResultsSendout
  PARENT.Init
  Access:ResultsSendout &= SELF


Hide:Access:ResultsSendout.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ResultsSendout &= NULL                            ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ResultsSendout.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ResultsSendout,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(RS:OrderKey,'RS:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ResultsSendout.Kill PROCEDURE

  CODE
  _Hide:Access:ResultsSendout.Kill                         ! Kill the file manager
  PARENT.Kill
  Relate:ResultsSendout &= NULL                            ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ResultsSendout)                     ! destroy the file manager


Hide:Relate:PDF.Init PROCEDURE
  CODE
  _Hide:Access:PDF.Init
  SELF.Init(Access:PDF,1)


Hide:Access:PDF.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PDF:Record
  SELF.FileNameValue = 'PDF'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PDF
  PARENT.Init
  Access:PDF &= SELF


Hide:Access:PDF.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PDF &= NULL                                       ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PDF.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PDF,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PDF:OrderKey,'PDF:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PDF.Kill PROCEDURE

  CODE
  _Hide:Access:PDF.Kill                                    ! Kill the file manager
  PARENT.Kill
  Relate:PDF &= NULL                                       ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PDF)                                ! destroy the file manager


Hide:Relate:Billing.Init PROCEDURE
  CODE
  _Hide:Access:Billing.Init
  SELF.Init(Access:Billing,1)


Hide:Access:Billing.BindFields PROCEDURE

  CODE
  PARENT.BindFields
  BIND('BILL:Comment',BILL:Comment)                        ! Bind memo field


Hide:Access:Billing.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BILL:Record
  SELF.FileNameValue = 'Billing'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Billing
  PARENT.Init
  Access:Billing &= SELF


Hide:Access:Billing.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Billing &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Billing.PrimeFields PROCEDURE

  CODE
  BILL:Spare = 1396790119                                  ! Assign initial field value
  BILL:Attribute = 1                                       ! Assign initial field value
  BILL:Vacination = 454                                    ! Assign initial field value
  BILL:CovID = 204571262                                   ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Billing.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Billing,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(BILL:DateKey,'BILL:DateKey',0)
    SELF.AddKey(BILL:OrderKey,'BILL:OrderKey',2)
    SELF.AddKey(BILL:qbKey,'BILL:qbKey',0)
    SELF.AddKey(BILL:patKey,'BILL:patKey',0)
    SELF.AddKey(BILL:NextLetterKey,'BILL:NextLetterKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Billing.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Patient)

  SELF.AddRelation(Relate:Payments,RI:None,RI:None,Pay:OrderKey)
  SELF.AddRelationLink(BILL:QB,Pay:Invoice)

  SELF.AddRelation(Relate:BillingItems,RI:None,RI:None,BI:OrderKey)
  SELF.AddRelationLink(BILL:Accession,BI:Patient)


Hide:Relate:Billing.Kill PROCEDURE

  CODE
  _Hide:Access:Billing.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Billing &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Billing)                            ! destroy the file manager


Hide:Relate:NameList.Init PROCEDURE
  CODE
  _Hide:Access:NameList.Init
  SELF.Init(Access:NameList,1)


Hide:Access:NameList.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= NAM:Record
  SELF.FileNameValue = 'NameList'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= NameList
  PARENT.Init
  Access:NameList &= SELF


Hide:Access:NameList.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:NameList &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:NameList.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(NameList,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(NAM:OrderKey,'NAM:OrderKey',0)
    SELF.AddKey(NAM:ContactKey,'NAM:ContactKey',0)
    SELF.AddKey(NAM:NameKey,'NAM:NameKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:NameList.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Patient)


Hide:Relate:NameList.Kill PROCEDURE

  CODE
  _Hide:Access:NameList.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:NameList &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:NameList)                           ! destroy the file manager


Hide:Relate:Payments.Init PROCEDURE
  CODE
  _Hide:Access:Payments.Init
  SELF.Init(Access:Payments,1)


Hide:Access:Payments.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pay:Record
  SELF.FileNameValue = 'Payments'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Payments
  PARENT.Init
  Access:Payments &= SELF


Hide:Access:Payments.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Payments &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Payments.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Payments,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Pay:DateKey,'Pay:DateKey',0)
    SELF.AddKey(Pay:OrderKey,'Pay:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Payments.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Billing)


Hide:Relate:Payments.Kill PROCEDURE

  CODE
  _Hide:Access:Payments.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Payments &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Payments)                           ! destroy the file manager


Hide:Relate:Insurance.Init PROCEDURE
  CODE
  _Hide:Access:Insurance.Init
  SELF.Init(Access:Insurance,1)


Hide:Access:Insurance.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ins:Record
  SELF.FileNameValue = 'Insurance'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Insurance
  PARENT.Init
  Access:Insurance &= SELF


Hide:Access:Insurance.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Insurance &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Insurance.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Insurance,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Ins:OrderKey,'Ins:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Insurance.Kill PROCEDURE

  CODE
  _Hide:Access:Insurance.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Insurance &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Insurance)                          ! destroy the file manager


Hide:Relate:Providers.Init PROCEDURE
  CODE
  _Hide:Access:Providers.Init
  SELF.Init(Access:Providers,1)


Hide:Access:Providers.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pro:Record
  SELF.FileNameValue = 'Providers'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Providers
  PARENT.Init
  Access:Providers &= SELF


Hide:Access:Providers.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Providers &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Providers.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Providers,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Providers.Kill PROCEDURE

  CODE
  _Hide:Access:Providers.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Providers &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Providers)                          ! destroy the file manager


Hide:Relate:PayType.Init PROCEDURE
  CODE
  _Hide:Access:PayType.Init
  SELF.Init(Access:PayType,1)


Hide:Access:PayType.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pay1:Record
  SELF.FileNameValue = 'PayType'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PayType
  PARENT.Init
  Access:PayType &= SELF


Hide:Access:PayType.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PayType &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PayType.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PayType,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PayType.Kill PROCEDURE

  CODE
  _Hide:Access:PayType.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:PayType &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PayType)                            ! destroy the file manager


Hide:Relate:Fees.Init PROCEDURE
  CODE
  _Hide:Access:Fees.Init
  SELF.Init(Access:Fees,1)


Hide:Access:Fees.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= FEE:Record
  SELF.FileNameValue = 'Fees'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Fees
  PARENT.Init
  Access:Fees &= SELF


Hide:Access:Fees.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Fees &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Fees.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Fees,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(FEE:OrderKey,'FEE:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Fees.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Client)


Hide:Relate:Fees.Kill PROCEDURE

  CODE
  _Hide:Access:Fees.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:Fees &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Fees)                               ! destroy the file manager


Hide:Relate:BillingItems.Init PROCEDURE
  CODE
  _Hide:Access:BillingItems.Init
  SELF.Init(Access:BillingItems,1)


Hide:Access:BillingItems.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BI:Record
  SELF.FileNameValue = 'BillingItems'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BillingItems
  PARENT.Init
  Access:BillingItems &= SELF


Hide:Access:BillingItems.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BillingItems &= NULL                              ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:BillingItems.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(BillingItems,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(BI:OrderKey,'BI:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:BillingItems.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Billing)


Hide:Relate:BillingItems.Kill PROCEDURE

  CODE
  _Hide:Access:BillingItems.Kill                           ! Kill the file manager
  PARENT.Kill
  Relate:BillingItems &= NULL                              ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BillingItems)                       ! destroy the file manager


Hide:Relate:BillingReadIn.Init PROCEDURE
  CODE
  _Hide:Access:BillingReadIn.Init
  SELF.Init(Access:BillingReadIn,1)


Hide:Access:BillingReadIn.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BRI:Record
  SELF.FileNameValue = 'BillingReadIn'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= BillingReadIn
  PARENT.Init
  Access:BillingReadIn &= SELF


Hide:Access:BillingReadIn.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:BillingReadIn &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:BillingReadIn.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(BillingReadIn,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(BRI:OrderKey,'BRI:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:BillingReadIn.Kill PROCEDURE

  CODE
  _Hide:Access:BillingReadIn.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:BillingReadIn &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:BillingReadIn)                      ! destroy the file manager


Hide:Relate:VerifyPatient.Init PROCEDURE
  CODE
  _Hide:Access:VerifyPatient.Init
  SELF.Init(Access:VerifyPatient,1)


Hide:Access:VerifyPatient.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= VP:Record
  SELF.FileNameValue = 'VerifyPatient'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= VerifyPatient
  PARENT.Init
  Access:VerifyPatient &= SELF


Hide:Access:VerifyPatient.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:VerifyPatient &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:VerifyPatient.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(VerifyPatient,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(VP:CodeKey,'VP:CodeKey',0)
    SELF.AddKey(VP:OrderKey,'VP:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:VerifyPatient.Kill PROCEDURE

  CODE
  _Hide:Access:VerifyPatient.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:VerifyPatient &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:VerifyPatient)                      ! destroy the file manager


Hide:Relate:DeleteTests.Init PROCEDURE
  CODE
  _Hide:Access:DeleteTests.Init
  SELF.Init(Access:DeleteTests,1)


Hide:Access:DeleteTests.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DT:Record
  SELF.FileNameValue = 'DeleteTests'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= DeleteTests
  PARENT.Init
  Access:DeleteTests &= SELF


Hide:Access:DeleteTests.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:DeleteTests &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:DeleteTests.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(DeleteTests,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(DT:OrderKey,'DT:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:DeleteTests.Kill PROCEDURE

  CODE
  _Hide:Access:DeleteTests.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:DeleteTests &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:DeleteTests)                        ! destroy the file manager


Hide:Relate:TestMem.Init PROCEDURE
  CODE
  _Hide:Access:TestMem.Init
  SELF.Init(Access:TestMem,1)


Hide:Access:TestMem.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TM:Record
  SELF.FileNameValue = 'TestMem'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= TestMem
  PARENT.Init
  Access:TestMem &= SELF


Hide:Access:TestMem.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:TestMem &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:TestMem.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(TestMem,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(TM:ORDER_KEY,'TM:ORDER_KEY',0)
    SELF.AddKey(TM:STATUS_KEY,'TM:STATUS_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:TestMem.Kill PROCEDURE

  CODE
  _Hide:Access:TestMem.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:TestMem &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:TestMem)                            ! destroy the file manager


Hide:Relate:Service.Init PROCEDURE
  CODE
  _Hide:Access:Service.Init
  SELF.Init(Access:Service,1)


Hide:Access:Service.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ser:Record
  SELF.FileNameValue = 'Service'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Service
  PARENT.Init
  Access:Service &= SELF


Hide:Access:Service.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Service &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Service.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Service,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Ser:OrderKey,'Ser:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Service.Kill PROCEDURE

  CODE
  _Hide:Access:Service.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Service &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Service)                            ! destroy the file manager


Hide:Relate:ExportList.Init PROCEDURE
  CODE
  _Hide:Access:ExportList.Init
  SELF.Init(Access:ExportList,1)


Hide:Access:ExportList.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= EL:Record
  SELF.FileNameValue = 'ExportList'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ExportList
  PARENT.Init
  Access:ExportList &= SELF


Hide:Access:ExportList.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ExportList &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ExportList.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ExportList,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(EL:OrderKey,'EL:OrderKey',0)
    SELF.AddKey(EL:BilledKey,'EL:BilledKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ExportList.Kill PROCEDURE

  CODE
  _Hide:Access:ExportList.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:ExportList &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ExportList)                         ! destroy the file manager


Hide:Relate:MedicareTests.Init PROCEDURE
  CODE
  _Hide:Access:MedicareTests.Init
  SELF.Init(Access:MedicareTests,1)


Hide:Access:MedicareTests.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MT:Record
  SELF.FileNameValue = 'MedicareTests'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= MedicareTests
  PARENT.Init
  Access:MedicareTests &= SELF


Hide:Access:MedicareTests.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:MedicareTests &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:MedicareTests.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(MedicareTests,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(MT:OrderKey,'MT:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:MedicareTests.Kill PROCEDURE

  CODE
  _Hide:Access:MedicareTests.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:MedicareTests &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:MedicareTests)                      ! destroy the file manager

