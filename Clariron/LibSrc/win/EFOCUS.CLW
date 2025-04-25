  MEMBER

  MAP
  MODULE('API')
    EnterByTab_KeyBd_Event(BYTE,BYTE,UNSIGNED,UNSIGNED),PASCAL,NAME('KeyBd_Event')
  END
  END
  INCLUDE('EFOCUS.INC'),ONCE
  INCLUDE('KEYCODES.CLW'),ONCE

NextTabStopControlQueue   QUEUE,TYPE
CT                          UNSIGNED
NextCT                      UNSIGNED
                          END



EnhancedFocusClassType.Construct               PROCEDURE()
 CODE
   SELF.ExcludedControlType &= NEW(ControlTypeQueue)

EnhancedFocusClassType.Destruct                PROCEDURE()
 CODE
   FREE(SELF.ExcludedControlType)
   DISPOSE(SELF.ExcludedControlType)

EnhancedFocusClassType.Init                      PROCEDURE()
 CODE
   SELF.Init(True,COLOR:Yellow,True,True,COLOR:Yellow,True,COLOR:Yellow,COLOR:Black,2,COLOR:Yellow,COLOR:Black,True,COLOR:Gray,'»',8)

EnhancedFocusClassType.Init                      PROCEDURE(BYTE pChangeColor,LONG pBackgroundColor,BYTE pUseBoldText,BYTE pExcludeDropList,LONG pBackgroundColorRequired,BYTE pDisplayBox,LONG pBoxFillColor,LONG pBoxBorderColor,SHORT pBoxSize,LONG pBoxFillColorRequired,LONG pBoxBorderColorRequired,BYTE pDisplayIndicator,LONG pIndicatorColor,STRING pIndicatorCharacter,SHORT pIndicatorOffset)
 CODE
   SELF.ChangeColor               = pChangeColor
   SELF.BackgroundColor           = pBackgroundColor
   SELF.UseBoldText               = pUseBoldText
   SELF.ExcludeDropList           = False!pExcludeDropList
   SELF.BackgroundColorRequired   = pBackgroundColorRequired
!
   SELF.DisplayBox                = pDisplayBox
   SELF.BoxFillColor              = pBoxFillColor
   SELF.BoxBorderColor            = pBoxBorderColor
   SELF.BoxSize                   = pBoxSize
   SELF.BoxFillColorRequired      = pBoxFillColorRequired
   SELF.BoxBorderColorRequired    = pBoxBorderColorRequired
!
   SELF.DisplayIndicator          = pDisplayIndicator
   SELF.IndicatorColor            = pIndicatorColor
   SELF.IndicatorCharacter        = CLIP(pIndicatorCharacter)
   SELF.IndicatorOffset           = pIndicatorOffset

   SELF.DisableControlType(CREATE:sstring)
   SELF.DisableControlType(CREATE:string)
   SELF.DisableControlType(CREATE:image)
   SELF.DisableControlType(CREATE:region)
   SELF.DisableControlType(CREATE:line)
   SELF.DisableControlType(CREATE:box)
   SELF.DisableControlType(CREATE:ellipse)
   SELF.DisableControlType(CREATE:prompt)
   SELF.DisableControlType(CREATE:group)
   SELF.DisableControlType(CREATE:custom)
   SELF.DisableControlType(CREATE:window)
   SELF.DisableControlType(CREATE:ole)
   SELF.DisableControlType(CREATE:progress)
   SELF.DisableControlType(CREATE:sublist)
   SELF.DisableControlType(CREATE:toolbar)

   SELF.DisableControlType(CREATE:menu)
   SELF.DisableControlType(CREATE:item)
   SELF.DisableControlType(CREATE:menubar)
   SELF.DisableControlType(CREATE:application)

   SELF.DisableControlType(CREATE:sheet)
   SELF.DisableControlType(CREATE:tab)
   SELF.DisableControlType(CREATE:panel)

   SELF.DisableControlType(CREATE:button)



EnhancedFocusClassType.DisableControlType        PROCEDURE(USHORT pControlType)
  CODE
  SELF.ExcludedControlType.CT = pControlType
  ADD(SELF.ExcludedControlType)

EnhancedFocusClassType.EnableControlType        PROCEDURE(USHORT pControlType)
lIndex       UNSIGNED,AUTO
  CODE
  LOOP lIndex = 1 TO RECORDS(SELF.ExcludedControlType)
      GET(SELF.ExcludedControlType,lIndex)
      IF SELF.ExcludedControlType.CT = pControlType THEN
         DELETE(SELF.ExcludedControlType)
         BREAK
      END
  END

EnhancedFocusClassType.ControlAllowed        PROCEDURE(UNSIGNED pControl)
lControlType   USHORT,AUTO
lIndex         UNSIGNED,AUTO
  CODE
  IF NOT pControl THEN RETURN False.
  IF pControl{PROP:InToolbar}   THEN RETURN False.
  IF NOT pControl{PROP:Visible} THEN RETURN False.

  IF RECORDS(SELF.ExcludedControlType) = 0 THEN RETURN True.

  lControlType = pControl{PROP:Type}
  LOOP lIndex = 1 TO RECORDS(SELF.ExcludedControlType)
     GET (SELF.ExcludedControlType,lIndex)
     IF SELF.ExcludedControlType.CT = lControlType THEN RETURN False.
  END
  RETURN True

EnhancedFocusClassType.TakeEvent                PROCEDURE()
scField  UNSIGNED
 CODE
  CASE EVENT()
  OF EVENT:Maximized
     SELF.EnhanceFocusUnSelect()
     SELF.EnhanceFocusSelect(SELF.scField)
  OF EVENT:DoResize
     SELF.EnhanceFocusUnSelect()
     SELF.EnhanceFocusSelect(SELF.scField)
  OF EVENT:Selected
     SELF.EnhanceFocusUnselect()
     SELF.EnhanceFocusSelect(SELECTED())
  OF EVENT:TabChanging!NewSelection
     SELF.EnhanceFocusUnselect()
     SELF.EnhanceFocusSelect(SELECTED())
  END

EnhancedFocusClassType.EnhanceFocusUnSelect      PROCEDURE()
ControlType    BYTE,AUTO
ShowIndicator  BYTE,AUTO
  CODE
  IF SELF.scField
     ControlType = SELF.scField{PROP:Type}
     CASE ControlType
     OF CREATE:RTF
     OROF CREATE:List
     OROF CREATE:DropList
     ELSE
        IF SELF.ChangeColor
           SELF.scField{Prop:Background} = SELF.scColor
           IF SELF.UseBoldText
              SELF.scField{Prop:FontStyle} = SELF.scStyle
           END
        END
     END

     ShowIndicator = FALSE

     IF SELF.DisplayIndicator
        IF NOT SELF.DisplayBox
           ShowIndicator = TRUE
        ELSIF SELF.IndicatorOffset > SELF.BoxSize
           ShowIndicator = TRUE
        END
     END

     IF ShowIndicator
        BLANK (SELF.scX-SELF.IndicatorOffset,SELF.scY-SELF.BoxSize,SELF.scW+(2*SELF.IndicatorOffset),SELF.scH+(2*SELF.BoxSize))
     ELSIF SELF.DisplayBox
        BLANK (SELF.scX-SELF.BoxSize,SELF.scY-SELF.BoxSize,SELF.scW+(2*SELF.BoxSize),SELF.scH+(2*SELF.BoxSize))
     END
  END

EnhancedFocusClassType.EnhanceFocusSelect              PROCEDURE(UNSIGNED pControl)
ComboListFeq   UNSIGNED
ComboListColor LONG,AUTO
ComboListStyle LONG,AUTO
ControlType    BYTE,AUTO
  CODE
  IF NOT SELF.ControlAllowed(pControl)
     SELF.scField = 0
     RETURN
  END
  SELF.scField = pControl
  SELF.scStyle = SELF.scField{Prop:FontStyle}
  SELF.scColor = SELF.scField{Prop:Background}

  ControlType = SELF.scField{PROP:Type}

  CASE ControlType
  OF CREATE:RTF
  OROF CREATE:List
  OROF CREATE:DropList
    ControlType = 0
  OF CREATE:Combo
  OROF CREATE:DropCombo
    ComboListFeq = SELF.scField{PROP:ListFeq}
    ComboListColor = ComboListFeq{Prop:Background}
    ComboListStyle = ComboListFeq{Prop:FontStyle}
  END  

  IF ControlType <> 0
     IF SELF.ChangeColor
        IF SELF.UseBoldText
           SELF.scField{Prop:FontStyle} = FONT:BOLD
        END
        IF SELF.scField{Prop:REQ}
           SELF.scField{Prop:Background} = SELF.BackgroundColorRequired
        ELSE
           SELF.scField{Prop:Background} = SELF.BackgroundColor
        END
     END
     IF ComboListFeq
        ComboListFeq{Prop:Background} = ComboListColor
        ComboListFeq{Prop:FontStyle} = ComboListStyle
     END
  END

  IF SELF.DisplayIndicator OR SELF.DisplayBox
     GETPOSITION(SELF.scField,SELF.scX,SELF.scY,SELF.scW,SELF.scH)
  END
  IF SELF.DisplayBox
     SELF.scPColor=PENCOLOR()
     IF SELF.scField{Prop:REQ}
        SETPENCOLOR(SELF.BoxBorderColorRequired)
        BOX(SELF.scX-SELF.BoxSize,SELF.scY-SELF.BoxSize,SELF.scW+(2*SELF.BoxSize),SELF.scH+(2*SELF.BoxSize),SELF.BoxFillColorRequired)
     ELSE
        SETPENCOLOR(SELF.BoxBorderColor)
        BOX(SELF.scX-SELF.BoxSize,SELF.scY-SELF.BoxSize,SELF.scW+(2*SELF.BoxSize),SELF.scH+(2*SELF.BoxSize),SELF.BoxFillColor)
     END
     SETPENCOLOR(SELF.scPColor)
  END
  IF SELF.DisplayIndicator
     SELF.scPColor=0{PROP:FONTCOLOR}
     0{PROP:FONTCOLOR}=SELF.IndicatorColor
     SHOW(SELF.scX-SELF.IndicatorOffset,SELF.scY,SELF.IndicatorCharacter)
     0{PROP:FONTCOLOR}=SELF.scPColor
  END

!-------------------------------------------------------------------

EnterByTabClass.Destruct                  PROCEDURE()
  CODE
   FREE(SELF.ExcludedControl)
   DISPOSE(SELF.ExcludedControl)
   FREE(SELF.NextTabStopControlQ)
   DISPOSE(SELF.NextTabStopControlQ)

EnterByTabClass.Construct                 PROCEDURE()
  CODE
  SELF.NextTabStopControlQ &= NEW(NextTabStopControlQueue)
  SELF.ExcludedControl &= NEW(ControlTypeQueue)

EnterByTabClass.Init                      PROCEDURE(BYTE pOmitListbox=1)
lIndex  UNSIGNED
  CODE
   LOOP lIndex = FirstField() to LastField()
      SELF.ExcludedControl.CT = lIndex
      GET(SELF.ExcludedControl,SELF.ExcludedControl.CT)
      IF ERRORCODE()
         CASE lIndex{PROP:Type}
         OF CREATE:text
         OROF CREATE:RTF
            lIndex{PROP:ALRT,254}=EnterKey
            IF lIndex{PROP:SINGLE}
               lIndex{PROP:ALRT,253}=DownKey
               lIndex{PROP:ALRT,255}=UpKey
            END
         OF CREATE:spin
            lIndex{PROP:ALRT,254}=EnterKey
         OF CREATE:entry
            lIndex{PROP:ALRT,253}=DownKey
            lIndex{PROP:ALRT,254}=EnterKey
            lIndex{PROP:ALRT,255}=UpKey
         OF CREATE:DROPCOMBO
         OROF CREATE:COMBO
              lIndex{PROP:ALRT,255}=EnterKey
         OF CREATE:List
         OROF CREATE:DROPLIST
            lIndex{PROP:ALRT,253}=EnterKey
            IF NOT pOmitListbox
               lIndex{PROP:ALRT,254}=RightKey
               lIndex{PROP:ALRT,255}=LeftKey
            END
         OF CREATE:Button
            lIndex{PROP:ALRT,252}=UpKey
            lIndex{PROP:ALRT,253}=DownKey
            lIndex{PROP:ALRT,254}=RightKey
            lIndex{PROP:ALRT,255}=LeftKey
         OF CREATE:Radio
            lIndex{PROP:ALRT,251}=EnterKey
         OF CREATE:Check
            lIndex{PROP:ALRT,251}=EnterKey
            lIndex{PROP:ALRT,252}=UpKey
            lIndex{PROP:ALRT,253}=DownKey
            lIndex{PROP:ALRT,254}=RightKey
            lIndex{PROP:ALRT,255}=LeftKey
         END
      END
      SELF.NextTabStopControlQ.CT = lIndex
      GET(SELF.NextTabStopControlQ,SELF.NextTabStopControlQ.CT)
      IF NOT ERRORCODE()
         lIndex{PROP:ALRT,249}=TabKey
         SELF.NextTabStopControlQ.NextCT{PROP:ALRT,250}=ShiftTab
      END
   END
   SELF.Inited = True

EnterByTabClass.TakeEvent                 PROCEDURE()
RetVal  BYTE
  CODE
  RetVal = 0
  IF SELF.Inited
     IF FIELD()
        CASE EVENT()
        OF Event:AlertKey
           SELF.ExcludedControl.CT = FIELD()
           GET(SELF.ExcludedControl,SELF.ExcludedControl.CT)
           IF ERRORCODE()
              CASE KEYCODE()
              OF EnterKey
                 RetVal = 1
                 CASE FIELD() {PROP:Type}
                 OF CREATE:Text
                   IF FIELD() {PROP:Single}
                     SELF.PressKey (TabKey)
                   END
                 OROF CREATE:RTF
                   SELF.PressKey (ShiftEnter)
                   SELF.PressKey (272)
                 ELSE
                   SELF.PressKey (TabKey)
                 END
              OF UpKey
                 RetVal = 1
                 SELF.PressKey(ShiftTab)
              OF DownKey
                 RetVal = 1
                 SELF.PressKey(TabKey)
              OF RightKey
                 RetVal = 1
                 SELF.PressKey(TabKey)
              OF LeftKey
                 RetVal = 1
                 SELF.PressKey(ShiftTab)
              OF ShiftTab
                 RetVal = 1
                 SELF.NextTabStopControlQ.NextCT = FIELD()
                 GET(SELF.NextTabStopControlQ,SELF.NextTabStopControlQ.NextCT)
                 IF NOT ERRORCODE()
                    SELECT(SELF.NextTabStopControlQ.CT)
                 ELSE
                    SELECT(0{PROP:PrevTabStop})
                 END
              OF TabKey
                 RetVal = 1
                 SELF.NextTabStopControlQ.CT = FIELD()
                 GET(SELF.NextTabStopControlQ,SELF.NextTabStopControlQ.CT)
                 IF NOT ERRORCODE()
                    SELECT(SELF.NextTabStopControlQ.NextCT)
                 ELSE
                    SELECT(0{PROP:NextTabStop})
                 END
              END
           END
        END
     END
  END
  RETURN RetVal

EnterByTabClass.ExcludeControl            PROCEDURE(UNSIGNED pControl)
  CODE
  SELF.ExcludedControl.CT = pControl
  GET(SELF.ExcludedControl,SELF.ExcludedControl.CT)
  IF ERRORCODE()
     SELF.ExcludedControl.CT = pControl
     ADD(SELF.ExcludedControl,SELF.ExcludedControl.CT)
  END

EnterByTabClass.SetNextTabStop            PROCEDURE(UNSIGNED pControl,UNSIGNED pNextControl)
  CODE
  SELF.NextTabStopControlQ.CT = pControl
  GET(SELF.NextTabStopControlQ,SELF.NextTabStopControlQ.CT)
  IF ERRORCODE()
     SELF.NextTabStopControlQ.CT = pControl
     SELF.NextTabStopControlQ.NextCT = pNextControl
     ADD(SELF.NextTabStopControlQ,SELF.NextTabStopControlQ.CT)
  END

EnterByTabClass.PressKey                  PROCEDURE(UNSIGNED K)
NoShiftKey ULONG
  CODE
  IF K=ShiftTab
     NoShiftKey=BAND(K,0FFh)
     EnterByTab_KeyBd_Event(10h,0,0,0)!DOWN SHIFT
     EnterByTab_KeyBd_Event(NoShiftKey,0,0,0)!DOWN K
     EnterByTab_KeyBd_Event(NoShiftKey,0,2,0)!UP K
     EnterByTab_KeyBd_Event(10h,0,2,0)!UP SHIFT
  ELSE
     PRESSKEY(K)
  END
