pro WID_JCPDS_editor, fil, wGroup, la

COMMON JCPDS_editor_commons,$
  WID_LIST_0, $
  WID_DROPLIST_0, $
  WID_TEXT_0, $
  WID_TEXT_1, $
  WID_TEXT_2, $
  WID_TEXT_3, $
  WID_TEXT_4, $
  WID_TEXT_5, $
  WID_TEXT_6, $
  WID_TEXT_7, $
  WID_TEXT_8, $
  WID_TEXT_9, $
  WID_TEXT_10, $
  WID_TEXT_11, $
  WID_TEXT_12, $
  WID_TEXT_13, $
  WID_TEXT_14, $
  WID_TEXT_15, $
  WID_TEXT_16, $
  WID_TEXT_17, $
  WID_BUTTON_0, $
  WID_BUTTON_1, $
  WID_BUTTON_2, $
  WID_BUTTON_3, $
  WID_BUTTON_4, $
  WID_BUTTON_5, $
  WID_BUTTON_6, $
  WID_BUTTON_7, $
  WID_BUTTON_8, $
  WID_BUTTON_9

if n_params() lt 2 then $

  WID_BASE_0 = Widget_Base(UNAME='WID_BASE_0'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=615 ,SCR_YSIZE=537  $
      ,TITLE='JCPDS card editor' ,SPACE=3 ,XPAD=3 ,YPAD=3) else $

  WID_BASE_0 = Widget_Base( GROUP_LEADER=wGroup, UNAME='WID_BASE_0'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=615 ,SCR_YSIZE=537  $
      ,TITLE='JCPDS card editor' ,SPACE=3 ,XPAD=3 ,YPAD=3, /modal)


  WID_LABEL_0 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_0'  $
      ,XOFFSET=10 ,YOFFSET=18 ,SCR_XSIZE=96 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='Comment')


  WID_LIST_0 = Widget_List(WID_BASE_0, UNAME='WID_LIST_0'  $
      ,XOFFSET=277 ,YOFFSET=173 ,SCR_XSIZE=324 ,SCR_YSIZE=268  $
      ,XSIZE=11 ,YSIZE=2)


  WID_TEXT_0 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_0' ,XOFFSET=9  $
      ,YOFFSET=37 ,SCR_XSIZE=552 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_LABEL_1 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_1'  $
      ,XOFFSET=10 ,YOFFSET=73 ,/ALIGN_LEFT ,VALUE='K0')


  WID_LABEL_2 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_2'  $
      ,XOFFSET=135 ,YOFFSET=74 ,/ALIGN_LEFT ,VALUE='KP')


  WID_TEXT_1 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_1' ,XOFFSET=37  $
      ,YOFFSET=70 ,SCR_XSIZE=79 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_2 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_2'  $
      ,XOFFSET=155 ,YOFFSET=70 ,SCR_XSIZE=79 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_DROPLIST_0 = Widget_Droplist(WID_BASE_0, UNAME='WID_DROPLIST_0'  $
      ,XOFFSET=9 ,YOFFSET=124 ,SCR_XSIZE=142 ,SCR_YSIZE=22)


  WID_LABEL_3 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_3'  $
      ,XOFFSET=10 ,YOFFSET=104 ,/ALIGN_LEFT ,VALUE='Symmetry')


  WID_LABEL_9 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_9'  $
      ,XOFFSET=156 ,YOFFSET=267 ,SCR_XSIZE=42 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='V')


  WID_TEXT_7 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_7'  $
      ,XOFFSET=152 ,YOFFSET=287 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_5 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_5' ,XOFFSET=62  $
      ,YOFFSET=263 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_4 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_4' ,XOFFSET=62  $
      ,YOFFSET=288 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_3 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_3' ,XOFFSET=63  $
      ,YOFFSET=215 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_6 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_6' ,XOFFSET=63  $
      ,YOFFSET=238 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_8 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_8' ,XOFFSET=64  $
      ,YOFFSET=191 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_9 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_9' ,XOFFSET=64  $
      ,YOFFSET=167 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_LABEL_5 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_5'  $
      ,XOFFSET=11 ,YOFFSET=242 ,/ALIGN_LEFT ,VALUE='alpha')


  WID_LABEL_4 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_4'  $
      ,XOFFSET=10 ,YOFFSET=267 ,SCR_XSIZE=37 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='beta')


  WID_LABEL_6 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_6'  $
      ,XOFFSET=10 ,YOFFSET=291 ,SCR_XSIZE=42 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='gamma')


  WID_LABEL_7 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_7'  $
      ,XOFFSET=11 ,YOFFSET=218 ,SCR_XSIZE=19 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='c')


  WID_LABEL_8 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_8'  $
      ,XOFFSET=13 ,YOFFSET=195 ,SCR_XSIZE=18 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='b')


  WID_LABEL_10 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_10'  $
      ,XOFFSET=12 ,YOFFSET=171 ,/ALIGN_LEFT ,VALUE='a')


  WID_TEXT_10 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_10'  $
      ,XOFFSET=306 ,YOFFSET=100 ,SCR_XSIZE=65 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_11 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_11'  $
      ,XOFFSET=377 ,YOFFSET=100 ,SCR_XSIZE=65 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_12 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_12'  $
      ,XOFFSET=449 ,YOFFSET=100 ,SCR_XSIZE=65 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_BUTTON_0 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_0'  $
      ,XOFFSET=529 ,YOFFSET=108 ,SCR_XSIZE=71 ,SCR_YSIZE=23  $
      ,/ALIGN_CENTER ,VALUE='Add peak')


  WID_TEXT_13 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_13'  $
      ,XOFFSET=306 ,YOFFSET=134 ,SCR_XSIZE=90 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_14 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_14'  $
      ,XOFFSET=450 ,YOFFSET=134 ,SCR_XSIZE=65 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_11 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_11'  $
      ,XOFFSET=267 ,YOFFSET=138 ,/ALIGN_LEFT ,VALUE='d-spc')


  WID_LABEL_12 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_12'  $
      ,XOFFSET=426 ,YOFFSET=139 ,SCR_XSIZE=18 ,SCR_YSIZE=15  $
      ,/ALIGN_LEFT ,VALUE='I')


  WID_LABEL_13 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_13'  $
      ,XOFFSET=267 ,YOFFSET=103 ,/ALIGN_LEFT ,VALUE='HKL')


  WID_BUTTON_1 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_1'  $
      ,XOFFSET=529 ,YOFFSET=134 ,SCR_XSIZE=71 ,SCR_YSIZE=23  $
      ,/ALIGN_CENTER ,VALUE='Delete peak')


  WID_BUTTON_2 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_2'  $
      ,XOFFSET=16 ,YOFFSET=338 ,SCR_XSIZE=149 ,SCR_YSIZE=45  $
      ,/ALIGN_CENTER ,VALUE='Generate accessible peaks')


  WID_TEXT_15 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_15'  $
      ,XOFFSET=99 ,YOFFSET=410 ,SCR_XSIZE=65 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_16 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_16'  $
      ,XOFFSET=15 ,YOFFSET=409 ,SCR_XSIZE=65 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_14 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_14'  $
      ,XOFFSET=18 ,YOFFSET=389 ,/ALIGN_LEFT ,VALUE='Range')


  WID_BASE_1 = Widget_Base(WID_BASE_0, UNAME='WID_BASE_1'  $
      ,XOFFSET=177 ,YOFFSET=393 ,TITLE='IDL' ,COLUMN=1 ,/EXCLUSIVE)


  WID_BUTTON_3 = Widget_Button(WID_BASE_1, UNAME='WID_BUTTON_3'  $
      ,/ALIGN_LEFT ,VALUE='2 theta')


  WID_BUTTON_4 = Widget_Button(WID_BASE_1, UNAME='WID_BUTTON_4'  $
      ,YOFFSET=22 ,/ALIGN_LEFT ,VALUE='d-spc')


  WID_BUTTON_5 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_5'  $
      ,XOFFSET=529 ,YOFFSET=81 ,SCR_XSIZE=71 ,SCR_YSIZE=23  $
      ,/ALIGN_CENTER ,VALUE='Update peak')


  WID_TEXT_17 = Widget_Text(WID_BASE_0, UNAME='WID_TEXT_17'  $
      ,XOFFSET=176 ,YOFFSET=359 ,SCR_XSIZE=91 ,SCR_YSIZE=23 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_15 = Widget_Label(WID_BASE_0, UNAME='WID_LABEL_15'  $
      ,XOFFSET=177 ,YOFFSET=340 ,/ALIGN_LEFT ,VALUE='Wavelength')


  WID_BUTTON_6 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_6'  $
      ,XOFFSET=14 ,YOFFSET=465 ,SCR_XSIZE=78 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='Open jcpds')


  WID_BUTTON_7 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_7'  $
      ,XOFFSET=95 ,YOFFSET=465 ,SCR_XSIZE=78 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='Save jcpds')


  WID_BUTTON_8 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_8'  $
      ,XOFFSET=177 ,YOFFSET=465 ,SCR_XSIZE=78 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='Import Jade')


  WID_BUTTON_9 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_9'  $
      ,XOFFSET=350 ,YOFFSET=462 ,SCR_XSIZE=210 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='Close')

  Widget_Control, /REALIZE, WID_BASE_0

  WID_JCPDS_editor_aux, fil

  if n_params() eq 3 then widget_control, wid_text_17, set_value=string(la, format='(F8.4)')

  XManager, 'WID_JCPDS_editor', WID_BASE_0, /NO_BLOCK

end
