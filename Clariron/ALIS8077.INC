  MODULE('ALIS8077.CLW')
MakeNewTest            PROCEDURE
Verify                 PROCEDURE(LONG)
UpdateVerifyPatient    PROCEDURE                      !Form VerifyPatient
SummarySendouts        PROCEDURE                      !Report the SendOuts File
ExportBilling          PROCEDURE                      !Browse the ExportList file
UpdateExportList       PROCEDURE                      !Form ExportList
CheckMedicare          PROCEDURE(LONG)                !Window
PayerImport            PROCEDURE                      !Browse the payers file
Updatepayers           PROCEDURE                      !Form payers
SelectPayer            PROCEDURE                      !Browse the payers file
  END
