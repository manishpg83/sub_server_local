
  MEMBER

BaseClassDllMode     EQUATE(0)

  INCLUDE('ICSTD.EQU')

  MAP
    INCLUDE('ICSTD.INC')
    MapFontSize(SIGNED PointSize),SIGNED
  .

  INCLUDE('ICHTML.INC')

CABINET:NAME        EQUATE('clarion.cab')
ZIP:NAME            EQUATE('clarion.zip')

!- Private Functions ----------------------------------------------------------

MapFontSize     PROCEDURE(SIGNED PointSize)

MAX_SIZE                EQUATE(7)
SizeGroup               GROUP
Size1                     SIGNED(8)
Size2                     SIGNED(10)
Size3                     SIGNED(12)
Size4                     SIGNED(14)
Size5                     SIGNED(18)
Size6                     SIGNED(24)
Size7                     SIGNED(36)
                        END
Sizes                   SIGNED,DIM(MAX_SIZE),OVER(SizeGroup)
Size                    SIGNED

  CODE

  LOOP Size = 1 TO MAX_SIZE-1
    IF (PointSize < (Sizes[Size] + Sizes[Size+1])/2)
      RETURN Size
    END
  END
  RETURN MAX_SIZE


!- Output class for generating HTML ------------------------------------------


HtmlClass.CreateOpen           PROCEDURE(STRING Filename, HtmlOptionGroup Opts, STRING JavaLibraryPath, *WebClientManagerClass Client)

  CODE
  SELF.Option :=: Opts
  SELF.Client &= Client
  SELF.Browser &= Client.Browser
  SELF.AppletCount = 0
  SELF.ListboxCount = 0
  SELF.FocusControl = 0
  SELF.FocusSelectable = FALSE

  IF (JavaLibraryPath)
    SELF.JavaLibraryCab = JavaLibraryPath & CABINET:NAME
    SELF.JavaLibraryZip = JavaLibraryPath & ZIP:NAME
  ELSE
    SELF.JavaLibraryCab = SELF.Files.GetAlias(CABINET:NAME)
    SELF.JavaLibraryZip = SELF.Files.GetAlias(ZIP:NAME)
  END

  PARENT.CreateOpen(Filename)


HtmlClass.GetPixelsX             PROCEDURE(SIGNED dlg)

  CODE
  RETURN INT(dlg * SELF.Option.ScaleX + SELF.Option.ScaleX/2)

HtmlClass.GetPixelsY             PROCEDURE(SIGNED dlg)

  CODE
  RETURN INT(dlg * SELF.Option.ScaleY + SELF.Option.ScaleY/2)

HtmlClass.GetFontChanged  PROCEDURE(*HtmlFontClass NewFont)

  CODE
  IF (RECORDS(SELF.Fonts) <> 0)
  IF SELF.Fonts.ThisFont.Color = NewFont.Color AND |
     SELF.Fonts.ThisFont.Face = NewFont.Face AND   |
     SELF.Fonts.ThisFont.Size = NewFont.Size AND   |
     SELF.Fonts.ThisFont.Style= NewFont.Style THEN
       RETURN FALSE
    END
  END
  RETURN TRUE


HtmlClass.GetFontStyle   PROCEDURE(*HtmlFontClass CurFont)

DummyFont            HtmlFontClass

  CODE
  IF (RECORDS(SELF.Fonts) > 0)
    RETURN SELF.GetFontStyle(CurFont, SELF.Fonts.ThisFont)
  ELSE
    RETURN SELF.GetFontStyle(CurFont, DummyFont)
  END


HtmlClass.GetFontStyle   PROCEDURE(*HtmlFontClass CurFont, *HtmlFontClass PrevFont)

Style           CSTRING(400)
NewWeight       SIGNED,AUTO
OldWeight       SIGNED,AUTO

  CODE

  IF (CurFont.Face <> PrevFont.Face) OR (CurFont.Size <> PrevFont.Size)
    Style = 'font:'
    IF (CurFont.Size <> 0) AND (CurFont.Size <> PrevFont.Size)
      Style = Style & ' ' & CurFont.Size & 'pt'
    ELSIF (CurFont.Size = 1)
      Style = Style & ' 1pt' ! Face is otherwise ignored.
    END
    Style = Style & ' ' & CLIP(CurFont.Face) & ';'
  END
  NewWeight = BAND(CurFont.Style, FONT:Weight)
  OldWeight = BAND(PrevFont.Style, FONT:Weight)
  IF (NewWeight >= FONT:bold) XOR (OldWeight >= FONT:bold)
    Style = Style & ' font-weight: '
    IF (NewWeight >= FONT:bold)
      Style = Style & 'bold;'
    ELSE
      Style = Style & 'normal;'
    END
  END
  IF (BAND(CurFont.Style, FONT:Italic) )
    Style = Style & ' font-style: italic;'
  END
  IF (CurFont.Color <> COLOR:None) AND (CurFont.Color <> PrevFont.Color)
    Style = Style & ' color: ' & IC:ColorText(CurFont.Color) & ';'
  END
  IF (Style)
    RETURN ' STYLE="' & Style & '"'
  END
  RETURN ''


HtmlClass.GetControlReference           PROCEDURE(SIGNED Feq)
  CODE
  RETURN SELF.Files.GetProgramRef() & '?X' & IC:Feq2Id(Feq)


HtmlClass.TakeNewControl        PROCEDURE(SIGNED Feq, BYTE CanSelect)
  CODE
  IF (SELF.FocusControl = 0) OR (CanSelect AND FOCUS()=Feq)
    SELF.FocusControl = Feq
    SELF.FocusSelectable = CanSelect
  END


HtmlClass.WriteControlHeader PROCEDURE

  CODE

  IF (NOT SELF.Browser.SupportsStyleSheets AND SELF.UseFonts)
    IF (RECORDS(SELF.Fonts) > 0)
      SELF.WriteFontHeader(SELF.Fonts.ThisFont)
    END
  END

HtmlClass.WriteControlFooter PROCEDURE

  CODE

  IF (NOT SELF.Browser.SupportsStyleSheets AND SELF.UseFonts)
    IF (RECORDS(SELF.Fonts) > 0)
      SELF.WriteFontFooter(SELF.Fonts.ThisFont)
    END
  END


HtmlClass.WriteEventHandler      PROCEDURE(SIGNED Update, STRING HandlerName, STRING NewValue)
  CODE
  IF (Update = Update:Full)
    SELF.Write(' ' & HandlerName & '="icSubmitForm()"')
  ELSE
    SELF.Write(' ' & HandlerName & '="changed(' & Update & ',this.name,' & NewValue & ')"')
  END


HtmlClass.WriteOnFocusHandler     PROCEDURE(<STRING ActionText>)
  CODE
  IF (ActionText = '')
    SELF.Write(' OnFocus="this.select()"')
  ElSE
    SELF.Write(' OnFocus="' & ActionText & '"')
  END


HtmlClass.WriteFontHeader PROCEDURE(*HtmlFontClass CurFont)

  CODE
  SELF.Write('<<FONT')
  IF (CurFont.Face)
    SELF.Write(' FACE="' & CLIP(CurFont.Face) & '"')
  END
  IF (CurFont.Size)
    SELF.Write(' SIZE=' & MapFontSize(CurFont.Size))
  END
  IF (CurFont.Color <> COLOR:None) AND (CurFont.Color <> COLOR:Black)
    SELF.Write(' COLOR="' & IC:ColorText(CurFont.Color) & '"')
  END
  SELF.Write('>')
  IF (BAND(CurFont.Style, FONT:Weight) >= FONT:bold)
    SELF.Write('<<B>')
  END
  IF (BAND(CurFont.Style, FONT:Italic))
    SELF.Write('<<I>')
  END


HtmlClass.WriteFontFooter PROCEDURE(*HtmlFontClass CurFont)

  CODE
  IF (BAND(CurFont.Style, FONT:Italic))
    SELF.Write('<</I>')
  END
  IF (BAND(CurFont.Style, FONT:Weight) >= FONT:bold)
    SELF.Write('<</B>')
  END
  SELF.Write('<</FONT>')


HtmlClass.WriteFormHeader PROCEDURE(<STRING attr>)
  CODE
  SELF.Writeln('<<FORM NAME="ClarionForm" METHOD=GET ACTION="' & SELF.Files.GetProgramRef() & '" ' & attr & ' onSubmit="return helpCount-- == 0">')

HtmlClass.WriteFormHeaderNoJava PROCEDURE(<STRING attr>)
  CODE
  SELF.Writeln('<<FORM NAME="ClarionForm" METHOD=GET ACTION="' & SELF.Files.GetProgramRef() & '" ' & attr & '>')


HtmlClass.WriteFormFooter PROCEDURE
  CODE
  SELF.Writeln('<</FORM>')


HtmlClass.WriteFrameCheckScript   PROCEDURE()
  CODE

  SELF.Writeln('<<SCRIPT LANGUAGE="JavaScript">')
  SELF.Writeln('<<!-- Hides script from old browsers')
  SELF.Writeln('  var ie30x = (navigator.userAgent.indexOf("Mozilla/2.0") != -1)')
  SELF.Writeln('  if (ie30x && (window.name != ''''))')
  SELF.Writeln('  {{')
  SELF.Writeln('    alert(''CWIC application cannot run within frames in IE3.0x\nPress OK to launch outside of this frame'');')
  SELF.Writeln('    top.location.href = window.location.href;')
  SELF.Writeln('  }')
  SELF.Writeln('// end hide -->')
  SELF.Writeln('<</SCRIPT>')


HtmlClass.WriteTableHeader PROCEDURE(<STRING attr>)
  CODE
  SELF.Writeln('<<TABLE' & attr & '><<TR><<TD>')


HtmlClass.WriteTableFooter PROCEDURE
  CODE
  SELF.Writeln('<</TD><</TR><</TABLE>')


HtmlClass.WriteTableNewCol PROCEDURE(<STRING attr>)
  CODE
  SELF.Writeln('<</TD><<TD' & attr & '>')



HtmlClass.WriteTableNewRow PROCEDURE(<STRING attr>)
  CODE
  SELF.Writeln('<</TD><</TR><<TR><<TD' & attr & '>')


HtmlClass.WriteSpace             PROCEDURE(SIGNED num)

  CODE

  LOOP num TIMES
    SELF.Write('&nbsp;')
  END


HtmlClass.WriteText              PROCEDURE(STRING Text)
NextIndex            SIGNED,AUTO
StartIndex           SIGNED,AUTO
SkipLen              SIGNED,AUTO
  CODE
  StartIndex = 1
  LOOP
    NextIndex = INSTRING('<13,10>', Text, 1, StartIndex)
    SkipLen = 2
    IF (NextIndex = 0)
      NextIndex = INSTRING('<10>', Text, 1, StartIndex)
      SkipLen = 1
    END
    IF (NextIndex = 0)
      SELF.Writeln(IC:QuoteText(Text[StartIndex : LEN(Text)], IC:RESET:Text))
      BREAK
    END
    SELF.Writeln(IC:QuoteText(Text[StartIndex : NextIndex-1], IC:RESET:Text) & '<<BR>')
    StartIndex = NextIndex + SkipLen
  END


HtmlClass.WriteRefreshTimer      PROCEDURE(SIGNED Delay)
  CODE
  IF (Delay)
    IF (SELF.Browser.Kind <> BROWSER:NetScape3) AND (SELF.Browser.Kind <> BROWSER:Mozilla4)
      SELF.Writeln('<<META HTTP-EQUIV="REFRESH" CONTENT="' & Delay & ';URL=' & SELF.Files.GetProgramRef() & '">')
    END
  END


HtmlClass.PushFont               PROCEDURE(*HtmlFontClass NewFont, SIGNED Feq)

  CODE
  IF (SELF.GetFontChanged(NewFont))
    SELF.Fonts.ThisFont &= NEW HtmlFontClass
    SELF.Fonts.ThisFont.Color = NewFont.Color
    SELF.Fonts.ThisFont.Face = NewFont.Face
    SELF.Fonts.ThisFont.Size = NewFont.Size
    SELF.Fonts.ThisFont.Style= NewFont.Style
    SELF.Fonts.Feq = Feq
    ADD(SELF.Fonts)
  END


HtmlClass.PopFont         PROCEDURE(SIGNED Feq)

  CODE

  IF (SELF.Fonts.Feq = Feq)
    DISPOSE(SELF.Fonts.ThisFont)
    DELETE(SELF.Fonts)
    IF (RECORDS(SELF.Fonts) = 0)
      CLEAR(SELF.Fonts)
    ELSE
      GET(SELF.Fonts, RECORDS(SELF.Fonts))
    END
  END


HtmlClass.WriteAppletHeaderPixel   PROCEDURE(SIGNED Feq, STRING ClassName, SIGNED Width, SIGNED Height)
  CODE

  SELF.WriteAppletHeader(Feq, ClassName, Width, Height, FALSE)


HtmlClass.WriteAppletHeader   PROCEDURE(SIGNED Feq, STRING ClassName, SIGNED Width, SIGNED Height, BYTE Scale)

Id              SIGNED,AUTO

  CODE
  IF (ClassName = 'ClarionListBox')
    SELF.ListboxCount += 1
  END
  Id = SELF.Client.Feq2Id(Feq)
  SELF.WriteAppletHeader(Feq, '_X' & Id, ClassName, Width, Height, Scale)


HtmlClass.WriteAppletHeader   PROCEDURE(SIGNED Feq, STRING AppletName, STRING ClassName, SIGNED Width, SIGNED Height, BYTE Scale)

  CODE
  SELF.WriteBasicAppletHeader(AppletName, 'ClarionLoader', Width, Height, Scale)
  SELF.WriteAppletParameter('className', ClassName)
  SELF.WriteAppletUAID(Feq)


HtmlClass.WriteContainerAppletHeader   PROCEDURE(SIGNED Feq, STRING ClassName, SIGNED Width, SIGNED Height, BYTE Scale)
  CODE
  SELF.WriteBasicAppletHeader('_X' & SELF.Client.Feq2Id(Feq), ClassName, Width, Height, Scale)


HtmlClass.WriteBasicAppletHeader   PROCEDURE(STRING AppletName, STRING ClassName, SIGNED Width, SIGNED Height, BYTE Scale)

  CODE
  IF (Scale)
    Width = SELF.GetPixelsX(Width)
    Height = SELF.GetPixelsY(Height)
  END

  IF (Width = 0) THEN Width = 2.
  IF (Height = 0) THEN Height = 2.

  SELF.AppletCount += 1

  SELF.Write('<<applet NAME="' & AppletName & '"')
  SELF.Write(' CODEBASE="' & SELF.Files.GetAlias() & '"')
  SELF.Write(' CODE=' & ClassName & '.class')
  SELF.Write(' ARCHIVE="' & SELF.JavaLibraryZip & '" MAYSCRIPT')
  SELF.Write(' WIDTH=' & Width)
  SELF.Write(' HEIGHT=' & Height)
  SELF.Writeln('>')
  SELF.WriteAppletParameter('cabbase', SELF.JavaLibraryCab)
  SELF.WriteAppletParameter('USID', SELF.Files.GetProgramRef())


HtmlClass.WriteAppletFooter   PROCEDURE

  CODE
  SELF.Writeln('<</applet>')


HtmlClass.WriteChildAppletHeader  PROCEDURE(STRING name, SIGNED Feq)
  CODE
  SELF.ShortParams = TRUE;
  SELF.Write('<<param name=' & name & ' value="')
  SELF.WriteAppletUAID(Feq)


HtmlClass.WriteChildAppletFooter  PROCEDURE
  CODE
  SELF.Writeln('">')
  SELF.ShortParams = FALSE;


HtmlClass.WriteSubmitApplet   PROCEDURE(SIGNED TimerDelay, SIGNED TimerUpdate)

  CODE
  SELF.WriteAppletHeader(ClarionComFeq, 'AppSubmit', 'ClarionCOM', 0, 0, TRUE)
  SELF.WriteAppletParameter('NumListBoxes', SELF.ListboxCount)
  IF TimerDelay AND |
     ((TimerUpdate = Update:Partial) OR (TimerUpdate = Update:Full))
    SELF.WriteAppletParameter('Timer', TimerDelay)
    SELF.WriteAppletParameter('Events', 'T' & TimerUpdate)
  END
  SELF.WriteAppletFooter


HtmlClass.WriteJavaScript     PROCEDURE

  CODE
  SELF.Writeln('<<SCRIPT LANGUAGE="JavaScript">')
  SELF.Writeln('<<!-- Hides script from old browsers')
  SELF.Writeln('  var timerID = 0')
  SELF.Writeln('  var ie30x = (navigator.userAgent.indexOf("Mozilla/2.0") != -1)')
  SELF.Writeln('  var netscape = (navigator.appName.indexOf("Netscape") != -1)')
  SELF.Writeln('  var ns30x = (navigator.userAgent.indexOf("Mozilla/3.0") != -1)')
  SELF.Writeln('  var mozilla4 = (navigator.userAgent.indexOf("Mozilla/4.") != -1)')
  SELF.Writeln('  var form;')
  SELF.Writeln('  var applet;')
  SELF.Writeln('  var helpCount = 0;')
  SELF.Writeln('  var pageLoaded = 0;')
  SELF.Writeln('')
  IF (NOT SELF.Browser.SubmitFromJava)
    SELF.Writeln('  function checkSubmit(form)')
    SELF.Writeln('  {{')
    SELF.Writeln('    if (0 != applet.getSubmit())')
    SELF.Writeln('    {{')
    SELF.Writeln('      form.X9998.value = applet.getSubmitValue()')
    SELF.Writeln('      applet.clearSubmit()')
    SELF.Writeln('      return 1')
    SELF.Writeln('    }')
    SELF.Writeln('    else')
    SELF.Writeln('    {{')
    SELF.Writeln('      var comm;')
    SELF.Writeln('')
    SELF.Writeln('      while (0 != applet.getUpdate())')
    SELF.Writeln('      {{')
    SELF.Writeln('        var cntrlcomm = applet.getControlCommand();')
    SELF.Writeln('')
    SELF.Writeln('        var c = cntrlcomm.charAt(0);')
    SELF.Writeln('        var cmd = cntrlcomm.substring(2, cntrlcomm.length);')
    SELF.Writeln('        if (c == ''U'')')
    SELF.Writeln('        {{')
    SELF.Writeln('          comm = "form."+cmd;')
    SELF.Writeln('')
    SELF.Writeln('          eval(comm);')
    SELF.Writeln('        }')
    SELF.Writeln('        else if (c == ''R'')')
    SELF.Writeln('        {{')
    SELF.Writeln('          reject(cmd);')
    SELF.Writeln('        }')
    SELF.Writeln('        else if (c == ''L'')')
    SELF.Writeln('        {{')
    SELF.Writeln('          hotlinkto(cmd);')
    SELF.Writeln('        }')
    SELF.Writeln('        else if (c == ''H'')')
    SELF.Writeln('        {{')
    SELF.Writeln('          var hp = cmd.indexOf('' '');')
    SELF.Writeln('          var help = cmd.substring(0, hp);')
    SELF.Writeln('          var style = cmd.substring(hp+1, cmd.length);')
    SELF.Writeln('          ShowHelp(help, style)')
    SELF.Writeln('        }')
    SELF.Writeln('')
    SELF.Writeln('        applet.nextControl();')
    SELF.Writeln('      }')
    SELF.Writeln('    }')
    SELF.Writeln('    return 0;')
    SELF.Writeln('  }')
    SELF.Writeln('')
  END
  SELF.Writeln('  function setuptimer()')
  SELF.Writeln('  {{')
  SELF.Writeln('    form = document.forms[0];')
  SELF.Writeln('    pageLoaded = 1')
  SELF.Writeln('')
  SELF.Writeln('    setupapplet();')
  SELF.Writeln('    freeChangeList();')
  SELF.Writeln('')
  SELF.Writeln('    if ((!netscape) && (0 == timerID))')
  SELF.Writeln('    {{')
  SELF.Writeln('      timerID = setTimeout(''dotimer()'', 500);')
  SELF.Writeln('    }')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function setupapplet()')
  SELF.Writeln('  {{')
  SELF.Writeln('    if (!ns30x)')
  SELF.Writeln('    {{')
  SELF.Writeln('      if (mozilla4)')
  SELF.Writeln('      {{')
  SELF.Writeln('        applet = document.AppSubmit;')
  SELF.Writeln('      }')
  SELF.Writeln('      else')
  SELF.Writeln('      {{')
  SELF.Writeln('        applet = form.AppSubmit;')
  SELF.Writeln('      }')
  SELF.Writeln('    }')

  SELF.Writeln('    if (!netscape)')
  SELF.Writeln('    {{')
  IF (SELF.FocusControl)
    SELF.Writeln('      form.X' & IC:Feq2Id(SELF.FocusControl) & '.focus();')
    IF (SELF.FocusSelectable)
      SELF.Writeln('      form.X' & IC:Feq2Id(SELF.FocusControl) & '.select();')
    END
  END
  SELF.Writeln('    }')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function dotimer()')
  SELF.Writeln('  {{')
  SELF.Writeln('    var dosubmit = 0;')
  SELF.Writeln('')
  SELF.Writeln('    if (1 == checkSubmit(form))')
  SELF.Writeln('    {{')
  SELF.Writeln('      form.submit();')
  SELF.Writeln('    }')
  SELF.Writeln('    else')
  SELF.Writeln('    {{')
  SELF.Writeln('      timerID = setTimeout(''dotimer()'', 500);')
  SELF.Writeln('    }')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function killtimer()')
  SELF.Writeln('  {{')
  SELF.Writeln('    if ((!netscape) && (0 != timerID))')
  SELF.Writeln('    {{')
  SELF.Writeln('      clearTimeout(timerID);')
  SELF.Writeln('    }')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function changed(i, name, value)')
  SELF.Writeln('  {{')
  SELF.Writeln('    if (!ns30x)')
  SELF.Writeln('    {{')
  SELF.Writeln('      if (1 == pageLoaded)')
  SELF.Writeln('      {{')
  SELF.Writeln('        applet.HTMLChanged(i, name, value);')
  SELF.Writeln('      }')
  SELF.Writeln('    }')
  SELF.Writeln('    else')
  SELF.Writeln('    {{')
  SELF.Writeln('      document.forms[0].elements[1].value = "" + i + ":" + name + "=" + value')
  SELF.Writeln('    }')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function freeChangeList()')
  SELF.Writeln('  {{')
  SELF.Writeln('    if (!ns30x)')
  SELF.Writeln('    {{')
  SELF.Writeln('      applet.NewPage();')
  SELF.Writeln('      applet.setFrameName(window.name);')
  SELF.Writeln('    }')
  SELF.Writeln('    else')
  SELF.Writeln('    {{')
  SELF.Writeln('      document.forms[0].elements[1].value = ''E'';')
  SELF.Writeln('      document.forms[0].elements[3].value = window.name;')
  SELF.Writeln('    }')
  SELF.Writeln('  }')
  SELF.Writeln('  function icSubmitForm()')
  SELF.Writeln('  {{')
  SELF.Writeln('    freeChangeList();')
  SELF.Writeln('    document.forms[0].elements[2].value = ''1'';')
  SELF.Writeln('    form.submit();')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function reject(name)')
  SELF.Writeln('  {{')
  SELF.Writeln('    alert("Invalid entry at : " + name);')
  SELF.Writeln('  }')
  SELF.Writeln('')
  SELF.Writeln('  function hotlinkto(where)')
  SELF.Writeln('  {{')
  SELF.Writeln('    window.location.href=where;')
  SELF.Writeln('  }')
  SELF.Writeln('  function ShowHelp(page,style)')
  SELF.Writeln('  {{')
  SELF.Writeln('     helpCount++')
  SELF.Writeln('     var helpWindow = window.open(page, "_HELP", style)')
  SELF.Writeln('  }')
  SELF.Writeln('// end hide -->')
  SELF.Writeln('<</SCRIPT>')


HtmlClass.WriteAppletParameter   PROCEDURE(STRING param, STRING value)
Target     &CSTRING
  CODE

  IF (SELF.ShortParams)
    Target &= NEW CSTRING(LEN(value) * 2 + 1)
    IC:DuplicateChar(Target, value, ';')
    SELF.Write('' & param & ' ' & IC:QuoteText(Target,IC:RESET:Value) & ';')
    DISPOSE(Target)
  ELSE
    SELF.Writeln('<<param name=' & param & ' value="' & IC:QuoteText(value,IC:RESET:Value) & '">')
  END


HtmlClass.WriteAppletFilenameParameter   PROCEDURE(STRING param, STRING Filename)
AliasName            CSTRING(FILE:MaxFilename)
  CODE
  IF (Filename)
    AliasName = SELF.Files.GetAlias(Filename)
    SELF.WriteAppletParameter(param, IC:QuoteText(AliasName, IC:RESET:Value))
  END


HtmlClass.WriteAppletOptParameter   PROCEDURE(STRING param, STRING value)
  CODE

  IF (value)
    SELF.WriteAppletParameter(param, value)
  END


HtmlClass.WriteAppletUAID  PROCEDURE(SIGNED Feq)
  CODE
  SELF.WriteAppletParameter('UAID', SELF.Client.Feq2Id(Feq))


HtmlClass.WriteAppletFontParameter  PROCEDURE(*HtmlFontClass CurFont)
  CODE

  IF (UPPER(CurFont.Face) = 'SYSTEM') AND (CurFont.Size=0) AND (CurFont.Style=0)
    IF (CurFont.Color = COLOR:None) OR (IC:RGB(CurFont.Color) = COLOR:Black)
      RETURN
    END
  END
  SELF.WriteAppletParameter('FontInfo', CLIP(CurFont.Face) & ',' & CurFont.Size & ',' & IC:RGB(CurFont.Color) & ',' & CurFont.Style)

HtmlClass.WriteAppletDimParameter   PROCEDURE(SIGNED x, SIGNED y, SIGNED dx, SIGNED dy)
  CODE
  x = SELF.GetPixelsX(x)
  y = SELF.GetPixelsY(y)
  dx = SELF.GetPixelsX(dx)
  dy = SELF.GetPixelsY(dy)
  SELF.WriteAppletParameter('dim', '' & x & ',' & y & ',' & dx & ',' & dy)


HtmlClass.Init                   PROCEDURE(*WebFilesClass Files)

  CODE
  SELF.Fonts &= NEW HtmlFontQueue
  SELF.UseFonts = TRUE
  SELF.Files &= Files


HtmlClass.Kill                   PROCEDURE

  CODE
  DISPOSE(SELF.Fonts)


