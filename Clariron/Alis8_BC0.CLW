  MEMBER('Alis8.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
Alis8_BC0:DctInit    PROCEDURE
Alis8_BC0:DctKill    PROCEDURE
Alis8_BC0:FilesInit  PROCEDURE
  END

Hide:Access:Cli_panl CLASS(FileManager),TYPE               ! FileManager for Cli_panl
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Cli_panl CLASS(RelationManager),TYPE           ! RelationManager for Cli_panl
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:ClientPanelTests CLASS(FileManager),TYPE       ! FileManager for ClientPanelTests
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:ClientPanelTests CLASS(RelationManager),TYPE   ! RelationManager for ClientPanelTests
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:PanelReview CLASS(FileManager),TYPE            ! FileManager for PanelReview
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:PanelReview CLASS(RelationManager),TYPE        ! RelationManager for PanelReview
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Docs     CLASS(FileManager),TYPE               ! FileManager for Docs
BindFields             PROCEDURE(),DERIVED
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Docs     CLASS(RelationManager),TYPE           ! RelationManager for Docs
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Text     CLASS(FileManager),TYPE               ! FileManager for Text
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Text     CLASS(RelationManager),TYPE           ! RelationManager for Text
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:plates   CLASS(FileManager),TYPE               ! FileManager for plates
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:plates   CLASS(RelationManager),TYPE           ! RelationManager for plates
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:template CLASS(FileManager),TYPE               ! FileManager for template
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:template CLASS(RelationManager),TYPE           ! RelationManager for template
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Setup    CLASS(FileManager),TYPE               ! FileManager for Setup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Setup    CLASS(RelationManager),TYPE           ! RelationManager for Setup
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:wpSetup  CLASS(FileManager),TYPE               ! FileManager for wpSetup
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:wpSetup  CLASS(RelationManager),TYPE           ! RelationManager for wpSetup
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Monitor  CLASS(FileManager),TYPE               ! FileManager for Monitor
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Monitor  CLASS(RelationManager),TYPE           ! RelationManager for Monitor
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:SpecimenReceived CLASS(FileManager),TYPE       ! FileManager for SpecimenReceived
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:SpecimenReceived CLASS(RelationManager),TYPE   ! RelationManager for SpecimenReceived
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Botanical CLASS(FileManager),TYPE              ! FileManager for Botanical
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Botanical CLASS(RelationManager),TYPE          ! RelationManager for Botanical
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Rast     CLASS(FileManager),TYPE               ! FileManager for Rast
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Rast     CLASS(RelationManager),TYPE           ! RelationManager for Rast
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Panels   CLASS(FileManager),TYPE               ! FileManager for Panels
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Panels   CLASS(RelationManager),TYPE           ! RelationManager for Panels
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Pnl_test CLASS(FileManager),TYPE               ! FileManager for Pnl_test
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Pnl_test CLASS(RelationManager),TYPE           ! RelationManager for Pnl_test
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Client   CLASS(FileManager),TYPE               ! FileManager for Client
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
ValidateFieldServer    PROCEDURE(UNSIGNED Id,BYTE HandleErrors),BYTE,PROC,DERIVED
                     END


Hide:Relate:Client   CLASS(RelationManager),TYPE           ! RelationManager for Client
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Phone    CLASS(FileManager),TYPE               ! FileManager for Phone
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Phone    CLASS(RelationManager),TYPE           ! RelationManager for Phone
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Physicians CLASS(FileManager),TYPE             ! FileManager for Physicians
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Physicians CLASS(RelationManager),TYPE         ! RelationManager for Physicians
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Login    CLASS(FileManager),TYPE               ! FileManager for Login
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Login    CLASS(RelationManager),TYPE           ! RelationManager for Login
Init                   PROCEDURE
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LogInPanels CLASS(FileManager),TYPE            ! FileManager for LogInPanels
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LogInPanels CLASS(RelationManager),TYPE        ! RelationManager for LogInPanels
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:Cli_panl &Hide:Access:Cli_panl,AUTO,THREAD
_Hide:Relate:Cli_panl &Hide:Relate:Cli_panl,AUTO,THREAD
_Hide:Access:ClientPanelTests &Hide:Access:ClientPanelTests,AUTO,THREAD
_Hide:Relate:ClientPanelTests &Hide:Relate:ClientPanelTests,AUTO,THREAD
_Hide:Access:PanelReview &Hide:Access:PanelReview,AUTO,THREAD
_Hide:Relate:PanelReview &Hide:Relate:PanelReview,AUTO,THREAD
_Hide:Access:Docs    &Hide:Access:Docs,AUTO,THREAD
_Hide:Relate:Docs    &Hide:Relate:Docs,AUTO,THREAD
_Hide:Access:Text    &Hide:Access:Text,AUTO,THREAD
_Hide:Relate:Text    &Hide:Relate:Text,AUTO,THREAD
_Hide:Access:plates  &Hide:Access:plates,AUTO,THREAD
_Hide:Relate:plates  &Hide:Relate:plates,AUTO,THREAD
_Hide:Access:template &Hide:Access:template,AUTO,THREAD
_Hide:Relate:template &Hide:Relate:template,AUTO,THREAD
_Hide:Access:Setup   &Hide:Access:Setup,AUTO,THREAD
_Hide:Relate:Setup   &Hide:Relate:Setup,AUTO,THREAD
_Hide:Access:wpSetup &Hide:Access:wpSetup,AUTO,THREAD
_Hide:Relate:wpSetup &Hide:Relate:wpSetup,AUTO,THREAD
_Hide:Access:Monitor &Hide:Access:Monitor,AUTO,THREAD
_Hide:Relate:Monitor &Hide:Relate:Monitor,AUTO,THREAD
_Hide:Access:SpecimenReceived &Hide:Access:SpecimenReceived,AUTO,THREAD
_Hide:Relate:SpecimenReceived &Hide:Relate:SpecimenReceived,AUTO,THREAD
_Hide:Access:Botanical &Hide:Access:Botanical,AUTO,THREAD
_Hide:Relate:Botanical &Hide:Relate:Botanical,AUTO,THREAD
_Hide:Access:Rast    &Hide:Access:Rast,AUTO,THREAD
_Hide:Relate:Rast    &Hide:Relate:Rast,AUTO,THREAD
_Hide:Access:Panels  &Hide:Access:Panels,AUTO,THREAD
_Hide:Relate:Panels  &Hide:Relate:Panels,AUTO,THREAD
_Hide:Access:Pnl_test &Hide:Access:Pnl_test,AUTO,THREAD
_Hide:Relate:Pnl_test &Hide:Relate:Pnl_test,AUTO,THREAD
_Hide:Access:Client  &Hide:Access:Client,AUTO,THREAD
_Hide:Relate:Client  &Hide:Relate:Client,AUTO,THREAD
_Hide:Access:Phone   &Hide:Access:Phone,AUTO,THREAD
_Hide:Relate:Phone   &Hide:Relate:Phone,AUTO,THREAD
_Hide:Access:Physicians &Hide:Access:Physicians,AUTO,THREAD
_Hide:Relate:Physicians &Hide:Relate:Physicians,AUTO,THREAD
_Hide:Access:Login   &Hide:Access:Login,AUTO,THREAD
_Hide:Relate:Login   &Hide:Relate:Login,AUTO,THREAD
_Hide:Access:LogInPanels &Hide:Access:LogInPanels,AUTO,THREAD
_Hide:Relate:LogInPanels &Hide:Relate:LogInPanels,AUTO,THREAD


Alis8_BC0:DctInit PROCEDURE
  CODE
  _Hide:Access:Cli_panl &= NEW(Hide:Access:Cli_panl)
  _Hide:Relate:Cli_panl &= NEW(Hide:Relate:Cli_panl)
  _Hide:Access:ClientPanelTests &= NEW(Hide:Access:ClientPanelTests)
  _Hide:Relate:ClientPanelTests &= NEW(Hide:Relate:ClientPanelTests)
  _Hide:Access:PanelReview &= NEW(Hide:Access:PanelReview)
  _Hide:Relate:PanelReview &= NEW(Hide:Relate:PanelReview)
  _Hide:Access:Docs &= NEW(Hide:Access:Docs)
  _Hide:Relate:Docs &= NEW(Hide:Relate:Docs)
  _Hide:Access:Text &= NEW(Hide:Access:Text)
  _Hide:Relate:Text &= NEW(Hide:Relate:Text)
  _Hide:Access:plates &= NEW(Hide:Access:plates)
  _Hide:Relate:plates &= NEW(Hide:Relate:plates)
  _Hide:Access:template &= NEW(Hide:Access:template)
  _Hide:Relate:template &= NEW(Hide:Relate:template)
  _Hide:Access:Setup &= NEW(Hide:Access:Setup)
  _Hide:Relate:Setup &= NEW(Hide:Relate:Setup)
  _Hide:Access:wpSetup &= NEW(Hide:Access:wpSetup)
  _Hide:Relate:wpSetup &= NEW(Hide:Relate:wpSetup)
  _Hide:Access:Monitor &= NEW(Hide:Access:Monitor)
  _Hide:Relate:Monitor &= NEW(Hide:Relate:Monitor)
  _Hide:Access:SpecimenReceived &= NEW(Hide:Access:SpecimenReceived)
  _Hide:Relate:SpecimenReceived &= NEW(Hide:Relate:SpecimenReceived)
  _Hide:Access:Botanical &= NEW(Hide:Access:Botanical)
  _Hide:Relate:Botanical &= NEW(Hide:Relate:Botanical)
  _Hide:Access:Rast &= NEW(Hide:Access:Rast)
  _Hide:Relate:Rast &= NEW(Hide:Relate:Rast)
  _Hide:Access:Panels &= NEW(Hide:Access:Panels)
  _Hide:Relate:Panels &= NEW(Hide:Relate:Panels)
  _Hide:Access:Pnl_test &= NEW(Hide:Access:Pnl_test)
  _Hide:Relate:Pnl_test &= NEW(Hide:Relate:Pnl_test)
  _Hide:Access:Client &= NEW(Hide:Access:Client)
  _Hide:Relate:Client &= NEW(Hide:Relate:Client)
  _Hide:Access:Phone &= NEW(Hide:Access:Phone)
  _Hide:Relate:Phone &= NEW(Hide:Relate:Phone)
  _Hide:Access:Physicians &= NEW(Hide:Access:Physicians)
  _Hide:Relate:Physicians &= NEW(Hide:Relate:Physicians)
  _Hide:Access:Login &= NEW(Hide:Access:Login)
  _Hide:Relate:Login &= NEW(Hide:Relate:Login)
  _Hide:Access:LogInPanels &= NEW(Hide:Access:LogInPanels)
  _Hide:Relate:LogInPanels &= NEW(Hide:Relate:LogInPanels)
  Relate:Cli_panl &= _Hide:Relate:Cli_panl
  Relate:ClientPanelTests &= _Hide:Relate:ClientPanelTests
  Relate:PanelReview &= _Hide:Relate:PanelReview
  Relate:Docs &= _Hide:Relate:Docs
  Relate:Text &= _Hide:Relate:Text
  Relate:plates &= _Hide:Relate:plates
  Relate:template &= _Hide:Relate:template
  Relate:Setup &= _Hide:Relate:Setup
  Relate:wpSetup &= _Hide:Relate:wpSetup
  Relate:Monitor &= _Hide:Relate:Monitor
  Relate:SpecimenReceived &= _Hide:Relate:SpecimenReceived
  Relate:Botanical &= _Hide:Relate:Botanical
  Relate:Rast &= _Hide:Relate:Rast
  Relate:Panels &= _Hide:Relate:Panels
  Relate:Pnl_test &= _Hide:Relate:Pnl_test
  Relate:Client &= _Hide:Relate:Client
  Relate:Phone &= _Hide:Relate:Phone
  Relate:Physicians &= _Hide:Relate:Physicians
  Relate:Login &= _Hide:Relate:Login
  Relate:LogInPanels &= _Hide:Relate:LogInPanels


Alis8_BC0:FilesInit PROCEDURE
  CODE
  _Hide:Relate:Cli_panl.Init
  _Hide:Relate:ClientPanelTests.Init
  _Hide:Relate:PanelReview.Init
  _Hide:Relate:Docs.Init
  _Hide:Relate:Text.Init
  _Hide:Relate:plates.Init
  _Hide:Relate:template.Init
  _Hide:Relate:Setup.Init
  _Hide:Relate:wpSetup.Init
  _Hide:Relate:Monitor.Init
  _Hide:Relate:SpecimenReceived.Init
  _Hide:Relate:Botanical.Init
  _Hide:Relate:Rast.Init
  _Hide:Relate:Panels.Init
  _Hide:Relate:Pnl_test.Init
  _Hide:Relate:Client.Init
  _Hide:Relate:Phone.Init
  _Hide:Relate:Physicians.Init
  _Hide:Relate:Login.Init
  _Hide:Relate:LogInPanels.Init


Alis8_BC0:DctKill PROCEDURE
  CODE
  _Hide:Relate:Cli_panl.Kill
  DISPOSE(_Hide:Relate:Cli_panl)
  _Hide:Relate:ClientPanelTests.Kill
  DISPOSE(_Hide:Relate:ClientPanelTests)
  _Hide:Relate:PanelReview.Kill
  DISPOSE(_Hide:Relate:PanelReview)
  _Hide:Relate:Docs.Kill
  DISPOSE(_Hide:Relate:Docs)
  _Hide:Relate:Text.Kill
  DISPOSE(_Hide:Relate:Text)
  _Hide:Relate:plates.Kill
  DISPOSE(_Hide:Relate:plates)
  _Hide:Relate:template.Kill
  DISPOSE(_Hide:Relate:template)
  _Hide:Relate:Setup.Kill
  DISPOSE(_Hide:Relate:Setup)
  _Hide:Relate:wpSetup.Kill
  DISPOSE(_Hide:Relate:wpSetup)
  _Hide:Relate:Monitor.Kill
  DISPOSE(_Hide:Relate:Monitor)
  _Hide:Relate:SpecimenReceived.Kill
  DISPOSE(_Hide:Relate:SpecimenReceived)
  _Hide:Relate:Botanical.Kill
  DISPOSE(_Hide:Relate:Botanical)
  _Hide:Relate:Rast.Kill
  DISPOSE(_Hide:Relate:Rast)
  _Hide:Relate:Panels.Kill
  DISPOSE(_Hide:Relate:Panels)
  _Hide:Relate:Pnl_test.Kill
  DISPOSE(_Hide:Relate:Pnl_test)
  _Hide:Relate:Client.Kill
  DISPOSE(_Hide:Relate:Client)
  _Hide:Relate:Phone.Kill
  DISPOSE(_Hide:Relate:Phone)
  _Hide:Relate:Physicians.Kill
  DISPOSE(_Hide:Relate:Physicians)
  _Hide:Relate:Login.Kill
  DISPOSE(_Hide:Relate:Login)
  _Hide:Relate:LogInPanels.Kill
  DISPOSE(_Hide:Relate:LogInPanels)


Hide:Relate:Cli_panl.Init PROCEDURE
  CODE
  _Hide:Access:Cli_panl.Init
  SELF.Init(Access:Cli_panl,1)


Hide:Access:Cli_panl.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CP:Record
  SELF.FileNameValue = 'Cli_panl'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Cli_panl
  PARENT.Init
  Access:Cli_panl &= SELF


Hide:Access:Cli_panl.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Cli_panl &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Cli_panl.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Cli_panl,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(CP:ORDER_KEY,'CP:ORDER_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Cli_panl.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Pnl_test,RI:None,RI:None,PT:ORDER_KEY)
  SELF.AddRelationLink(CP:Panel,PT:PANEL)

  SELF.AddRelation(Relate:Client)


Hide:Relate:Cli_panl.Kill PROCEDURE

  CODE
  _Hide:Access:Cli_panl.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Cli_panl &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Cli_panl)                           ! destroy the file manager


Hide:Relate:ClientPanelTests.Init PROCEDURE
  CODE
  _Hide:Access:ClientPanelTests.Init
  SELF.Init(Access:ClientPanelTests,1)


Hide:Access:ClientPanelTests.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CPT:Record
  SELF.FileNameValue = 'ClientPanelTests'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= ClientPanelTests
  PARENT.Init
  Access:ClientPanelTests &= SELF


Hide:Access:ClientPanelTests.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:ClientPanelTests &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:ClientPanelTests.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(ClientPanelTests,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(CPT:OrderKey,'CPT:OrderKey',0)
    SELF.AddKey(CPT:CodeKey,'CPT:CodeKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:ClientPanelTests.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:PanelReview)


Hide:Relate:ClientPanelTests.Kill PROCEDURE

  CODE
  _Hide:Access:ClientPanelTests.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:ClientPanelTests &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:ClientPanelTests)                   ! destroy the file manager


Hide:Relate:PanelReview.Init PROCEDURE
  CODE
  _Hide:Access:PanelReview.Init
  SELF.Init(Access:PanelReview,1)


Hide:Access:PanelReview.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PR:Record
  SELF.FileNameValue = 'PanelReview'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= PanelReview
  PARENT.Init
  Access:PanelReview &= SELF


Hide:Access:PanelReview.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:PanelReview &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:PanelReview.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(PanelReview,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PR:OrderKey,'PR:OrderKey',0)
    SELF.AddKey(PR:maxKey,'PR:maxKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:PanelReview.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:ClientPanelTests,RI:None,RI:None,CPT:OrderKey)
  SELF.AddRelationLink(PR:MaxLinesPerPanel,CPT:Client)


Hide:Relate:PanelReview.Kill PROCEDURE

  CODE
  _Hide:Access:PanelReview.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:PanelReview &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:PanelReview)                        ! destroy the file manager


Hide:Relate:Docs.Init PROCEDURE
  CODE
  _Hide:Access:Docs.Init
  SELF.Init(Access:Docs,1)


Hide:Access:Docs.BindFields PROCEDURE

  CODE
  PARENT.BindFields
  BIND('DOC:Body',DOC:Body)                                ! Bind memo field


Hide:Access:Docs.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= DOC:Record
  SELF.FileNameValue = 'Docs'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Docs
  PARENT.Init
  Access:Docs &= SELF


Hide:Access:Docs.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Docs &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Docs.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Docs,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(DOC:OrderKey,'By Doc Number',0)
    SELF.AddKey(DOC:SubjectKey,'by Doc Subject',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Docs.Kill PROCEDURE

  CODE
  _Hide:Access:Docs.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:Docs &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Docs)                               ! destroy the file manager


Hide:Relate:Text.Init PROCEDURE
  CODE
  _Hide:Access:Text.Init
  SELF.Init(Access:Text,1)


Hide:Access:Text.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TXT:Record
  SELF.FileNameValue = 'Text'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Text
  SELF.FileName &= gloFileName
  PARENT.Init
  Access:Text &= SELF


Hide:Access:Text.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Text &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Text.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Text,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Text.Kill PROCEDURE

  CODE
  _Hide:Access:Text.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:Text &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Text)                               ! destroy the file manager


Hide:Relate:plates.Init PROCEDURE
  CODE
  _Hide:Access:plates.Init
  SELF.Init(Access:plates,1)


Hide:Access:plates.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PLT:Record
  SELF.FileNameValue = 'plates'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= plates
  PARENT.Init
  Access:plates &= SELF


Hide:Access:plates.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:plates &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:plates.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(plates,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PLT:DATE_KEY,'PLT:DATE_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:plates.Kill PROCEDURE

  CODE
  _Hide:Access:plates.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:plates &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:plates)                             ! destroy the file manager


Hide:Relate:template.Init PROCEDURE
  CODE
  _Hide:Access:template.Init
  SELF.Init(Access:template,1)


Hide:Access:template.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= TPL:Record
  SELF.FileNameValue = 'template'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= template
  PARENT.Init
  Access:template &= SELF


Hide:Access:template.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:template &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:template.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(template,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(TPL:KeyType,'TPL:KeyType',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:template.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 4
    GlobalErrors.SetField('TPL:Relation')
    IF INSTRING(']' & CLIP(TPL:Relation) & '[', ']S[]E[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''Start'',''End''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:template.Kill PROCEDURE

  CODE
  _Hide:Access:template.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:template &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:template)                           ! destroy the file manager


Hide:Relate:Setup.Init PROCEDURE
  CODE
  _Hide:Access:Setup.Init
  SELF.Init(Access:Setup,1)


Hide:Access:Setup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SU:Record
  SELF.FileNameValue = 'Setup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Setup
  PARENT.Init
  Access:Setup &= SELF


Hide:Access:Setup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Setup &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Setup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Setup,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Setup.Kill PROCEDURE

  CODE
  _Hide:Access:Setup.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:Setup &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Setup)                              ! destroy the file manager


Hide:Relate:wpSetup.Init PROCEDURE
  CODE
  _Hide:Access:wpSetup.Init
  SELF.Init(Access:wpSetup,1)


Hide:Access:wpSetup.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= wpS:Record
  SELF.FileNameValue = 'wpSetup'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= wpSetup
  PARENT.Init
  Access:wpSetup &= SELF


Hide:Access:wpSetup.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:wpSetup &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:wpSetup.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(wpSetup,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:wpSetup.Kill PROCEDURE

  CODE
  _Hide:Access:wpSetup.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:wpSetup &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:wpSetup)                            ! destroy the file manager


Hide:Relate:Monitor.Init PROCEDURE
  CODE
  _Hide:Access:Monitor.Init
  SELF.Init(Access:Monitor,1)


Hide:Access:Monitor.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= MON:Record
  SELF.FileNameValue = 'Monitor'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Monitor
  SELF.FileName &= gloFileName
  PARENT.Init
  Access:Monitor &= SELF


Hide:Access:Monitor.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Monitor &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Monitor.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Monitor,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(MON:ORDERKEY,'MON:ORDERKEY',0)
    SELF.AddKey(MON:STATUSKEY,'MON:STATUSKEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Monitor.Kill PROCEDURE

  CODE
  _Hide:Access:Monitor.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Monitor &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Monitor)                            ! destroy the file manager


Hide:Relate:SpecimenReceived.Init PROCEDURE
  CODE
  _Hide:Access:SpecimenReceived.Init
  SELF.Init(Access:SpecimenReceived,1)


Hide:Access:SpecimenReceived.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= SR:Record
  SELF.FileNameValue = 'SpecimenReceived'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= SpecimenReceived
  PARENT.Init
  Access:SpecimenReceived &= SELF


Hide:Access:SpecimenReceived.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:SpecimenReceived &= NULL                          ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:SpecimenReceived.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(SpecimenReceived,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(SR:OrderKey,'SR:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:SpecimenReceived.Kill PROCEDURE

  CODE
  _Hide:Access:SpecimenReceived.Kill                       ! Kill the file manager
  PARENT.Kill
  Relate:SpecimenReceived &= NULL                          ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:SpecimenReceived)                   ! destroy the file manager


Hide:Relate:Botanical.Init PROCEDURE
  CODE
  _Hide:Access:Botanical.Init
  SELF.Init(Access:Botanical,1)


Hide:Access:Botanical.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= BOT:Record
  SELF.FileNameValue = 'Botanical'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Botanical
  PARENT.Init
  Access:Botanical &= SELF


Hide:Access:Botanical.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Botanical &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Botanical.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Botanical,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(BOT:OrderKey,'BOT:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Botanical.Kill PROCEDURE

  CODE
  _Hide:Access:Botanical.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Botanical &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Botanical)                          ! destroy the file manager


Hide:Relate:Rast.Init PROCEDURE
  CODE
  _Hide:Access:Rast.Init
  SELF.Init(Access:Rast,1)


Hide:Access:Rast.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= RST:Record
  SELF.FileNameValue = 'Rast'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Rast
  PARENT.Init
  Access:Rast &= SELF


Hide:Access:Rast.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Rast &= NULL                                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Rast.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Rast,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(RST:ORDER_KEY,'RST:ORDER_KEY',0)
    SELF.AddKey(RST:DESCRIPT_KEY,'RST:DESCRIPT_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Rast.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Pnl_test)

  SELF.AddRelation(Relate:Test,RI:None,RI:None,TST:ORDER_KEY)
  SELF.AddRelationLink(RST:NUMBER,TST:CODE)


Hide:Relate:Rast.Kill PROCEDURE

  CODE
  _Hide:Access:Rast.Kill                                   ! Kill the file manager
  PARENT.Kill
  Relate:Rast &= NULL                                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Rast)                               ! destroy the file manager


Hide:Relate:Panels.Init PROCEDURE
  CODE
  _Hide:Access:Panels.Init
  SELF.Init(Access:Panels,1)


Hide:Access:Panels.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PAN:Record
  SELF.FileNameValue = 'Panels'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Panels
  PARENT.Init
  Access:Panels &= SELF


Hide:Access:Panels.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Panels &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Panels.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Panels,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PAN:ORDER_KEY,'PAN:ORDER_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Panels.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Pnl_test,RI:CASCADE,RI:CASCADE,PT:ORDER_KEY)
  SELF.AddRelationLink(PAN:Number,PT:PANEL)


Hide:Relate:Panels.Kill PROCEDURE

  CODE
  _Hide:Access:Panels.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Panels &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Panels)                             ! destroy the file manager


Hide:Relate:Pnl_test.Init PROCEDURE
  CODE
  _Hide:Access:Pnl_test.Init
  SELF.Init(Access:Pnl_test,1)


Hide:Access:Pnl_test.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PT:Record
  SELF.FileNameValue = 'Pnl_test'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Pnl_test
  PARENT.Init
  Access:Pnl_test &= SELF


Hide:Access:Pnl_test.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Pnl_test &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Pnl_test.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Pnl_test,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(PT:ORDER_KEY,'PT:ORDER_KEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Pnl_test.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Cli_panl)

  SELF.AddRelation(Relate:Rast,RI:None,RI:None,RST:ORDER_KEY)
  SELF.AddRelationLink(PT:CODE,RST:NUMBER)

  SELF.AddRelation(Relate:Panels)

  SELF.AddRelation(Relate:NewPanels)


Hide:Relate:Pnl_test.Kill PROCEDURE

  CODE
  _Hide:Access:Pnl_test.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Pnl_test &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Pnl_test)                           ! destroy the file manager


Hide:Relate:Client.Init PROCEDURE
  CODE
  _Hide:Access:Client.Init
  SELF.Init(Access:Client,1)


Hide:Access:Client.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= CLI:Record
  SELF.FileNameValue = 'Client'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Client
  PARENT.Init
  Access:Client &= SELF


Hide:Access:Client.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Client &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Client.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Client,GlobalErrors)
    SELF.Create = 0
    SELF.LockRecover = 10
    SELF.AddKey(CLI:ORDER_KEY,'CLI:ORDER_KEY',0)
    SELF.AddKey(CLI:NAME_KEY,'CLI:NAME_KEY',0)
    SELF.AddKey(CLI:HOLD_KEY,'CLI:HOLD_KEY',0)
    SELF.AddKey(CLI:ZIP_NDX,'CLI:ZIP_NDX',0)
    SELF.AddKey(CLI:SALES_NDX,'CLI:SALES_NDX',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Access:Client.ValidateFieldServer PROCEDURE(UNSIGNED Id,BYTE HandleErrors)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ValidateFieldServer(Id,HandleErrors)
  CASE Id
  OF 1
    GlobalErrors.SetField('CLI:NUMBER')
    IF NOT INRANGE(CLI:NUMBER,100000,999999)
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldOutOfRange,'100000 .. 999999')
      END
    END
  OF 6
    GlobalErrors.SetField('CLI:Language')
    IF INSTRING(']' & CLIP(CLI:Language) & '[', ']E[]S[]B[', 1, 1) = 0
      ReturnValue = Level:Notify
    END
    IF ReturnValue <> Level:Benign
      IF HandleErrors
        ReturnValue = GlobalErrors.ThrowMessage(Msg:FieldNotInList,'''English'',''Spanish'',''Both''')
      END
    END
  END
  RETURN ReturnValue


Hide:Relate:Client.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Cli_panl,RI:None,RI:None,CP:ORDER_KEY)
  SELF.AddRelationLink(CLI:NUMBER,CP:Client)

  SELF.AddRelation(Relate:Phone,RI:None,RI:CASCADE,PHO:OrderKey)
  SELF.AddRelationLink(CLI:NUMBER,PHO:Client)

  SELF.AddRelation(Relate:Physicians,RI:None,RI:None,PHY:OrderKey)
  SELF.AddRelationLink(CLI:NUMBER,PHY:Client)

  SELF.AddRelation(Relate:PickUp,RI:None,RI:CASCADE,PU:ClientKey)
  SELF.AddRelationLink(CLI:NUMBER,PU:Client)

  SELF.AddRelation(Relate:Supplies,RI:CASCADE,RI:CASCADE,SUP:ClientKey)
  SELF.AddRelationLink(CLI:NUMBER,SUP:Client)

  SELF.AddRelation(Relate:Patient,RI:CASCADE,RI:None,Pat:CLIENT_KEY)
  SELF.AddRelationLink(CLI:NUMBER,Pat:CLIENT)

  SELF.AddRelation(Relate:Fees,RI:None,RI:None,FEE:OrderKey)
  SELF.AddRelationLink(CLI:NUMBER,FEE:Client)


Hide:Relate:Client.Kill PROCEDURE

  CODE
  _Hide:Access:Client.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Client &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Client)                             ! destroy the file manager


Hide:Relate:Phone.Init PROCEDURE
  CODE
  _Hide:Access:Phone.Init
  SELF.Init(Access:Phone,1)


Hide:Access:Phone.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PHO:Record
  SELF.FileNameValue = 'Phone'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Phone
  PARENT.Init
  Access:Phone &= SELF


Hide:Access:Phone.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Phone &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Phone.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Phone,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PHO:OrderKey,'PHO:OrderKey',0)
    SELF.AddKey(PHO:PhoneKey,'PHO:PhoneKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Phone.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Client)


Hide:Relate:Phone.Kill PROCEDURE

  CODE
  _Hide:Access:Phone.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:Phone &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Phone)                              ! destroy the file manager


Hide:Relate:Physicians.Init PROCEDURE
  CODE
  _Hide:Access:Physicians.Init
  SELF.Init(Access:Physicians,1)


Hide:Access:Physicians.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= PHY:Record
  SELF.FileNameValue = 'Physicians'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Physicians
  PARENT.Init
  Access:Physicians &= SELF


Hide:Access:Physicians.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Physicians &= NULL                                ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Physicians.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Physicians,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(PHY:OrderKey,'PHY:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Physicians.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Client)


Hide:Relate:Physicians.Kill PROCEDURE

  CODE
  _Hide:Access:Physicians.Kill                             ! Kill the file manager
  PARENT.Kill
  Relate:Physicians &= NULL                                ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Physicians)                         ! destroy the file manager


Hide:Relate:Login.Init PROCEDURE
  CODE
  _Hide:Access:Login.Init
  SELF.Init(Access:Login,1)


Hide:Access:Login.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LI:Record
  SELF.FileNameValue = 'Login'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Login
  PARENT.Init
  Access:Login &= SELF


Hide:Access:Login.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Login &= NULL                                     ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Login.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Login,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LI:STATUSKEY,'LI:STATUSKEY',0)
    SELF.AddKey(LI:DATEKEY,'LI:DATEKEY',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Login.Kill PROCEDURE

  CODE
  _Hide:Access:Login.Kill                                  ! Kill the file manager
  PARENT.Kill
  Relate:Login &= NULL                                     ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Login)                              ! destroy the file manager


Hide:Relate:LogInPanels.Init PROCEDURE
  CODE
  _Hide:Access:LogInPanels.Init
  SELF.Init(Access:LogInPanels,1)


Hide:Access:LogInPanels.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= LP:Record
  SELF.FileNameValue = 'LogInPanels'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LogInPanels
  PARENT.Init
  Access:LogInPanels &= SELF


Hide:Access:LogInPanels.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LogInPanels &= NULL                               ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LogInPanels.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LogInPanels,GlobalErrors)
    IF NOT SELF.OpenModeOverridden
       SELF.OpenMode = 22h
    END
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(LP:OrderKey,'LP:OrderKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LogInPanels.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LogInPanelTests,RI:None,RI:None,LPT:OrderKey)
  SELF.AddRelationLink(LP:PanelNumber,LPT:Panel)


Hide:Relate:LogInPanels.Kill PROCEDURE

  CODE
  _Hide:Access:LogInPanels.Kill                            ! Kill the file manager
  PARENT.Kill
  Relate:LogInPanels &= NULL                               ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LogInPanels)                        ! destroy the file manager

