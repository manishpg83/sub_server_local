  MEMBER
  INCLUDE('svapi.INC'),ONCE
  MAP
    INCLUDE('svapifnc.inc')
    WinExtSubClassFunc(UNSIGNED,UNSIGNED,UNSIGNED,LONG),LONG,PASCAL
  END
  INCLUDE('WinExt.INC'),ONCE

!------------------------------------------------------------------------------
GloCurrentWinExt            &WindowExtenderClass,THREAD

WindowExtenderClass.Construct                   PROCEDURE()
 CODE

WindowExtenderClass.Destruct                    PROCEDURE()
 CODE
    CASE STATUS (SELF.MainWindow)
    OF WINDOW:OK
    OROF WINDOW:ClosePending
    OROF WINDOW:InDestroy
      SELF.MainWindow {PROP:WndProc} = SELF.OrigWndProc
    END
    GloCurrentWinExt &= SELF.PrvWinExt

WindowExtenderClass.Init                        PROCEDURE(WINDOW TheMainWindow,BYTE AllowShutDown,BYTE AllowTrayIcon,STRING TrayIconName,<STRING ToolTip>)
 CODE
    SELF.MainWindow &= TheMainWindow
    SELF.AllowTrayIcon = AllowTrayIcon
    SELF.AllowShutDown = AllowShutDown
    SELF.ToTrayOnLosefocus = False
    SELF.PrvWinExt &= GloCurrentWinExt
    GloCurrentWinExt &= SELF
    SELF.OrigWndProc = TheMainWindow{PROP:WndProc}
    TheMainWindow{PROP:WndProc} = ADDRESS(WinExtSubClassFunc)
    SELF.SetIconName(TrayIconName)
    IF NOT OMITTED(6)
       SELF.SetToolTip(ToolTip)
    END

WindowExtenderClass.SetIconName                 PROCEDURE(STRING TrayIconName)
 CODE
    SELF.IconName = TrayIconName
    IF SELF.IconName
       IF SELF.IconName[LEN(SELF.IconName)-3]='.'
          SELF.IconName[LEN(SELF.IconName)-3]='_'
       END
    END
    SELF.IconHandle = LoadImage(SYSTEM{PROP:AppInstance},ADDRESS(SELF.IconName),1,16,16,0)
    IF SELF.OnTray AND SELF.AllowTrayIcon
       SELF.ModifyTrayIcon()
    END

WindowExtenderClass.SetToolTip                  PROCEDURE(STRING ToolTip)
 CODE
    SELF.ToolTip = ToolTip
    IF SELF.OnTray AND SELF.AllowTrayIcon
       SELF.ModifyTrayIcon()
    END

WindowExtenderClass.SetAllowTrayIcon            PROCEDURE(BYTE OnOff)
 CODE
    IF NOT SELF.OnTray
       SELF.AllowTrayIcon = OnOff
    END

WindowExtenderClass.SetAllowShutDown            PROCEDURE(BYTE OnOff)
 CODE
    IF NOT SELF.OnShutDown
       SELF.AllowShutDown = OnOff
    END

WindowExtenderClass.SetToTrayOnLosefocus        PROCEDURE(BYTE OnOff)
 CODE
    SELF.ToTrayOnLosefocus = OnOff

WindowExtenderClass.GetToTrayOnLosefocus        PROCEDURE()
 CODE
    RETURN SELF.ToTrayOnLosefocus

WindowExtenderClass.GetAllowTrayIcon            PROCEDURE()
 CODE
    RETURN SELF.AllowTrayIcon

WindowExtenderClass.GetOnTray                   PROCEDURE()
 CODE
    RETURN SELF.OnTray

WindowExtenderClass.GetAllowShutDown            PROCEDURE()
 CODE
    RETURN SELF.AllowShutDown

WindowExtenderClass.TakeEvent                   PROCEDURE()
NotifyCode      UNSIGNED
NotifyThread    SIGNED
NotifyParameter LONG
lRetVal         BYTE
 CODE
    CASE EVENT()
    OF EVENT:CloseDown
    OF EVENT:CloseWindow
       IF SELF.OnTray
          SELF.DeleteTrayIcon()
          SELF.MainWindow{PROP:HIDE}=False
          SELF.MainWindow{PROP:Active}=true
          SELF.OnTray = False
       END
    OF EVENT:Maximize
       IF SELF.OnTray
          SELF.RestoreFromTray()
       END
    OF EVENT:Iconized
       IF NOT SELF.SendToTray()
          POST(EVENT:Maximize)
       END
    OF EVENT:Notify
       IF NOTIFICATION(NotifyCode,NotifyThread,NotifyParameter)
          IF NotifyThread=THREAD()
             IF SELF.OnTray
                CASE NotifyCode
                OF Notify:TrayIconMouseLeft
                   SELF.TrayIconMouseLeft()
                OF Notify:TrayIconMouseRight
                   SELF.TrayIconMouseRight()
                OF Notify:TrayIconMouseLeft2
                   SELF.TrayIconMouseLeft2()
                OF Notify:TrayIconMouseRight2
                   SELF.TrayIconMouseRight2()
                END
             ELSE
                CASE NotifyCode
                OF EVENT:Losefocus
                   IF SELF.ToTrayOnLosefocus
                      lRetVal = SELF.SendToTray()
                   END
                END
             END
          END
          IF NotifyCode=Event:CloseDown
             POST(EVENT:CloseDown)
          END
       END
    END

WindowExtenderClass.SendToTray                   PROCEDURE()
RetVal  BYTE
 CODE
    IF SELF.AllowTrayIcon
       IF SELF.OnTray=False
          IF SELF.AddTrayIcon()
             SELF.MainWindow{PROP:HIDE}=true
             SELF.MainWindow{PROP:Active}=false
             SELF.OnTray = True
             RetVal = True
          ELSE
             SELF.OnTray = False
             RetVal = False
          END
       END
    END
    RETURN SELF.OnTray

WindowExtenderClass.RestoreFromTray              PROCEDURE()
 CODE
    IF SELF.OnTray = True
       SELF.OnTray = False
       SELF.DeleteTrayIcon()
       SELF.MainWindow{PROP:HIDE}=False
       SELF.MainWindow{PROP:Active}=true
       ShowWindow(SELF.MainWindow{Prop:Handle},SW_RESTORE)
    END

WindowExtenderClass.AddTrayIcon PROCEDURE()
lError      LONG
IconImage   LONG
 CODE
    lError=0
    SELF.NID.uId = 1
    SELF.NID.hIcon = SELF.IconHandle
    SELF.NID.ToolTip = SELF.ToolTip
    SELF.NID.cbSize = SIZE(SELF.NID)
    SELF.NID.hWnd = SELF.MainWindow{Prop:Handle}
    SELF.NID.uFlags = NIF_ICON + NIF_MESSAGE + NIF_TIP
    SELF.NID.uCBmessage = EVENT:TrayIcon
    lError=Shell_NotifyIcon(NIM_ADD,ADDRESS(SELF.NID))
    IF lError=0
       IF GetLastError()
          RETURN False
       ELSE
          RETURN True
       END
    ELSE
       RETURN True
    END

WindowExtenderClass.ModifyTrayIcon PROCEDURE()
lError  LONG
 CODE
    lError=0
    SELF.NID.uId = 1
    SELF.NID.hIcon = SELF.IconHandle
    SELF.NID.ToolTip = SELF.ToolTip
    SELF.NID.cbSize = SIZE(SELF.NID)
    SELF.NID.uFlags = NIF_ICON + NIF_TIP
    SELF.NID.hWnd = SELF.MainWindow{Prop:Handle}
    SELF.NID.uCBmessage = EVENT:TrayIcon
    lError=Shell_NotifyIcon(NIM_MODIFY,ADDRESS(SELF.NID))

WindowExtenderClass.DeleteTrayIcon PROCEDURE()
lError  LONG
 CODE
    lError=0
    SELF.NID.uId = 1
    SELF.NID.hIcon = SELF.IconHandle
    SELF.NID.ToolTip = SELF.ToolTip
    SELF.NID.cbSize = SIZE(SELF.NID)
    SELF.NID.hWnd = SELF.MainWindow{Prop:Handle}
    SELF.NID.uFlags = NIF_ICON + NIF_MESSAGE + NIF_TIP
    SELF.NID.uCBmessage = EVENT:TrayIcon
    lError=Shell_NotifyIcon(NIM_DELETE,ADDRESS(SELF.NID))

WindowExtenderClass.ProcessShutDown                PROCEDURE()
 CODE
    RETURN True
WindowExtenderClass.TrayIconMouseLeft              PROCEDURE()
 CODE
WindowExtenderClass.TrayIconMouseRight             PROCEDURE()
 CODE
WindowExtenderClass.TrayIconMouseLeft2             PROCEDURE()
 CODE
WindowExtenderClass.TrayIconMouseRight2            PROCEDURE()
 CODE

WinExtSubClassFunc       FUNCTION (UNSIGNED hWnd,UNSIGNED wMsg,UNSIGNED wParam,LONG lParam)
lIconID  LONG
  CODE                                                     ! Begin processed code
    CASE wMsg
    OF EVENT:TrayIcon
        CASE BAND(lParam, 0FFFFh)
        OF WM_LBUTTONDOWN
        OF WM_LBUTTONUP
           lIconID = wParam
           NOTIFY (Notify:TrayIconMouseLeft,, lIconID)
        OF WM_LBUTTONDBLCLK
            lIconID = wParam
            NOTIFY (Notify:TrayIconMouseLeft2,, lIconID)
        OF WM_RBUTTONDOWN
        OF WM_RBUTTONUP
            lIconID = wParam
            NOTIFY (Notify:TrayIconMouseRight,, lIconID)
        OF WM_RBUTTONDBLCLK
            lIconID = wParam
            NOTIFY (Notify:TrayIconMouseRight2,, lIconID)
        END
        RETURN(0)
    OF WM_QUERYENDSESSION
      IF GloCurrentWinExt.AllowShutDown
         GloCurrentWinExt.OnShutDown=GloCurrentWinExt.ProcessShutDown()
         IF GloCurrentWinExt.OnShutDown
            RETURN(GloCurrentWinExt.OnShutDown)
         ELSE
            RETURN(False)
         END
      ELSE
         RETURN(False)
      END
    OF WM_ENDSESSION
      IF GloCurrentWinExt.AllowShutDown
         NOTIFY (Event:CloseDown)
         RETURN(True)
      ELSE
         RETURN(False)
      END
    OF WM_ACTIVATEAPP
       IF wParam=0
          NOTIFY(EVENT:Losefocus,, 0)
          RETURN(true)
       END
    END
    RETURN(CallWindowProc(GloCurrentWinExt.OrigWndProc,hWnd,wMsg,wParam,lParam))
