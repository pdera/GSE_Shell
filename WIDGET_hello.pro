pro WID_BASE_0_L, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

  Resolve_Routine, 'WIDGET_hello_eventcb',/COMPILE_FULL_FILE  ; Load event callback routines

  WID_BASE_0 = Widget_Base( GROUP_LEADER=wGroup, UNAME='WID_BASE_0'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=461 ,SCR_YSIZE=485  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)


  WID_DRAW_0 = Widget_Draw(WID_BASE_0, UNAME='WID_DRAW_0' ,XOFFSET=78  $
      ,YOFFSET=21 ,SCR_XSIZE=279 ,SCR_YSIZE=221)


  WID_BUTTON_0 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_0'  $
      ,XOFFSET=91 ,YOFFSET=405 ,SCR_XSIZE=259 ,SCR_YSIZE=39  $
      ,/ALIGN_CENTER ,VALUE='OK')


  WID_LIST_0 = Widget_List(WID_BASE_0, UNAME='WID_LIST_0' ,XOFFSET=77  $
      ,YOFFSET=253 ,SCR_XSIZE=281 ,SCR_YSIZE=132 ,XSIZE=11 ,YSIZE=2)

  Widget_Control, /REALIZE, WID_BASE_0

  widget_control, WID_DRAW_0, get_value=WID_DRAW_0
  read_jpeg, 'C:\Soft\GSE_shell\old versions\ver 1.0 beta\documentation\shell.jpg', pic
  tvscl, pic

  XManager, 'WID_BASE_0_L', WID_BASE_0, /NO_BLOCK

end
;
; Empty stub procedure used for autoloading.
;
pro WIDGET_hello, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
  WID_BASE_0, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
end
