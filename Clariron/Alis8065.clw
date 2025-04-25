

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module

                     MAP
                       INCLUDE('ALIS8065.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
LabelPrinter         PROCEDURE                             ! Declare Procedure
locPort              SHORT                                 !
locCTS               SHORT(1)                              !
locDSR               SHORT(1)                              !
locXon               SHORT(0)                              !
locReceiveBufferSize SHORT(1024)                           !
locTransmitBufferSize SHORT(1024)                          !
locModemStatus       BYTE                                  !

  CODE
  X# += 1
