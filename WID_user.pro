pro WID_User_L, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

COMMON WID_User_common, WID_DROPLIST_0, WID_TEXT_0, WID_BUTTON_0, WID_BUTTON_1

  Resolve_Routine, 'WID_user_eventcb',/COMPILE_FULL_FILE  ; Load event callback routines

  WID_User = Widget_Base( GROUP_LEADER=wGroup, UNAME='WID_User'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=292 ,SCR_YSIZE=213  $
      ,TITLE='Select user account' ,SPACE=3 ,XPAD=3 ,YPAD=3)


  WID_DROPLIST_0 = Widget_Droplist(WID_User, UNAME='WID_DROPLIST_0'  $
      ,XOFFSET=14 ,YOFFSET=39 ,SCR_XSIZE=161 ,SCR_YSIZE=22)


  WID_LABEL_0 = Widget_Label(WID_User, UNAME='WID_LABEL_0'  $
      ,XOFFSET=14 ,YOFFSET=17 ,/ALIGN_LEFT ,VALUE='Existing user'+ $
      ' accounts')


  WID_TEXT_0 = Widget_Text(WID_User, UNAME='WID_TEXT_0' ,XOFFSET=15  $
      ,YOFFSET=84 ,SCR_XSIZE=128 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_BUTTON_0 = Widget_Button(WID_User, UNAME='WID_BUTTON_0'  $
      ,XOFFSET=152 ,YOFFSET=83 ,SCR_XSIZE=119 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Create new user')


  WID_BUTTON_1 = Widget_Button(WID_User, UNAME='WID_BUTTON_1'  $
      ,XOFFSET=14 ,YOFFSET=122 ,SCR_XSIZE=256 ,SCR_YSIZE=38  $
      ,/ALIGN_CENTER ,VALUE='Start the program')

  Widget_Control, /REALIZE, WID_User

  WID_User_aux

  XManager, 'WID_User_L', WID_User;, /NO_BLOCK

end
