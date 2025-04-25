  MODULE('ALIS8X036.CLW')
EnglishResults         PROCEDURE                      !Report the Patient File
FaxCover               PROCEDURE(ULONG)
PatientReport          PROCEDURE                      !All Daily
PrintReport            PROCEDURE                      !Single Patient
BuildQueues            PROCEDURE(ULONG)
SpanishPDF             PROCEDURE                      !Report the Patient File
SignatureRequest       PROCEDURE(STRING,SHORT)        !Report the Patient File
SuppliesNotice         PROCEDURE(STRING)              !Report the Client File
SetPatientStatus       FUNCTION(LONG),SHORT
PanelNotifacation      PROCEDURE                      !Report the Client File
PrintPanelReview       PROCEDURE                      !Report the Client File
ResultsSendout         PROCEDURE                      !Report the Patient File
CreatePDF              PROCEDURE                      !Window
ResultsSendout100      PROCEDURE                      !Report the Patient File
ResultsSendout200      PROCEDURE                      !Report the Patient File
ResultsPeanut          PROCEDURE                      !Report the Patient File
VoidPDF                PROCEDURE
HotzeResults           PROCEDURE                      !Report the Patient File
BuildQueuesHotze       PROCEDURE(ULONG)
  END
