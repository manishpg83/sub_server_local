

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module

                     MAP
                       INCLUDE('ALIS8066.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
PatientLabel         PROCEDURE  (prmPatient,prmAttributes) ! Declare Procedure

  CODE
  IF BAND(prmAttributes,LABEL:Serum1)
            InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '"<10>'
            ComPuts(CommPort,InitStr)
            InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '"<10>'
             ComPuts(CommPort,InitStr)
             InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
             ComPuts(CommPort,InitStr)

   .

  IF BAND(prmAttributes,LABEL:Serum2)
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
  .
  IF BAND(prmAttributes,LABEL:Serum3)
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
  .


    return(7)
