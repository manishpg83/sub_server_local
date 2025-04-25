  MODULE('ALIS8X001.CLW')
LoginTests             PROCEDURE(BYTE)
LoginMain              PROCEDURE
LoginReview            PROCEDURE                      !Browse the Log file
Volume                 PROCEDURE
GenerateOutput         PROCEDURE
UpdateLog              PROCEDURE(BYTE)
AddPanelTests          PROCEDURE                      !Adds Tests to Panels when prmAction = 1 in LoginTests
  END
