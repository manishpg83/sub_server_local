  MODULE('ALIS8038.CLW')
Monitor                PROCEDURE                      !Monitors number of tests logged in and verified
TestCount              FUNCTION(short,short,short),short !Function to count available wells for tests
TestSet                FUNCTION(SHORT,SHORT),SHORT    !Create a list of tests for the next set (drop file)
Templates              PROCEDURE                      !Table of Test Set Templates
MakeDrop               FUNCTION(SHORT),SHORT
CheckQNS               FUNCTION(LONG),BYTE
SummaryReport          PROCEDURE                      !Report the monitor File
MonitorTable           PROCEDURE                      !Browse the monitor file
UpdateTemplate         PROCEDURE                      !Update the Template File
GetMonitor             PROCEDURE                      !Browse the Monitor File
  END
