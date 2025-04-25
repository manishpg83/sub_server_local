

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module

                     MAP
                       INCLUDE('ALIS8046.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
GetPatient           PROCEDURE  (prmPatient)               ! Declare Procedure

  CODE
! stop(prmPatient)

!  globalRequest = ChangeRecord
!  Pat:INVOICE = prmPatient
!  GET(Patient,Pat:INVOICE_KEY)
!  UpdatePatient(0)
