pro WID_BASE_0L, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

  Resolve_Routine, 'new_gui_eventcb',/COMPILE_FULL_FILE  ; Load event callback routines

  WID_BASE_0aa = Widget_Base( GROUP_LEADER=wGroup,  $
      UNAME='WID_BASE_0aa' ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=1184  $
      ,SCR_YSIZE=830 ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)


  WID_TAB_0aa = Widget_Tab(WID_BASE_0aa, UNAME='WID_TAB_0aa'  $
      ,XOFFSET=3 ,YOFFSET=3 ,SCR_XSIZE=1110 ,SCR_YSIZE=790)


  WID_BASE_17aa = Widget_Base(WID_TAB_0aa, UNAME='WID_BASE_17aa'  $
      ,SCR_XSIZE=1102 ,SCR_YSIZE=764 ,TITLE='Image' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_DRAW_0aa = Widget_Draw(WID_BASE_17aa, UNAME='WID_DRAW_0aa'  $
      ,XOFFSET=5 ,YOFFSET=8 ,SCR_XSIZE=750 ,SCR_YSIZE=750)


  WID_TAB_2 = Widget_Tab(WID_BASE_17aa, UNAME='WID_TAB_2'  $
      ,XOFFSET=762 ,YOFFSET=9 ,SCR_XSIZE=330 ,SCR_YSIZE=243)


  WID_BASE_16 = Widget_Base(WID_TAB_2, UNAME='WID_BASE_16'  $
      ,SCR_XSIZE=322 ,SCR_YSIZE=217 ,TITLE='Integrate' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_BASE_39 = Widget_Base(WID_BASE_16, UNAME='WID_BASE_39'  $
      ,SCR_XSIZE=601 ,SCR_YSIZE=462 ,TITLE='Integrate' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_BUTTON_40 = Widget_Button(WID_BASE_39, UNAME='WID_BUTTON_40'  $
      ,XOFFSET=169 ,YOFFSET=11 ,SCR_XSIZE=66 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='=>>')


  WID_BUTTON_41 = Widget_Button(WID_BASE_39, UNAME='WID_BUTTON_41'  $
      ,XOFFSET=13 ,YOFFSET=11 ,SCR_XSIZE=151 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Integrate')


  WID_TEXT_86 = Widget_Text(WID_BASE_39, UNAME='WID_TEXT_86'  $
      ,XOFFSET=16 ,YOFFSET=107 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_87 = Widget_Text(WID_BASE_39, UNAME='WID_TEXT_87'  $
      ,XOFFSET=100 ,YOFFSET=106 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_88 = Widget_Text(WID_BASE_39, UNAME='WID_TEXT_88'  $
      ,XOFFSET=100 ,YOFFSET=82 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_93 = Widget_Text(WID_BASE_39, UNAME='WID_TEXT_93'  $
      ,XOFFSET=16 ,YOFFSET=83 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_49 = Widget_Label(WID_BASE_39, UNAME='WID_LABEL_49'  $
      ,XOFFSET=17 ,YOFFSET=61 ,/ALIGN_LEFT ,VALUE='File series'+ $
      ' range')


  WID_BASE_40 = Widget_Base(WID_TAB_2, UNAME='WID_BASE_40'  $
      ,SCR_XSIZE=322 ,SCR_YSIZE=217 ,TITLE='Calibrate' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_BUTTON_62 = Widget_Button(WID_BASE_40, UNAME='WID_BUTTON_62'  $
      ,XOFFSET=210 ,YOFFSET=125 ,SCR_XSIZE=107 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Get calibration')


  WID_BUTTON_63 = Widget_Button(WID_BASE_40, UNAME='WID_BUTTON_63'  $
      ,XOFFSET=209 ,YOFFSET=162 ,SCR_XSIZE=108 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Set calibration')


  WID_BUTTON_21 = Widget_Button(WID_BASE_40, UNAME='WID_BUTTON_21'  $
      ,XOFFSET=209 ,YOFFSET=49 ,SCR_XSIZE=106 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Read calibration')


  WID_BUTTON_22 = Widget_Button(WID_BASE_40, UNAME='WID_BUTTON_22'  $
      ,XOFFSET=209 ,YOFFSET=86 ,SCR_XSIZE=107 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Write calibration')


  WID_BUTTON_18 = Widget_Button(WID_BASE_40, UNAME='WID_BUTTON_18'  $
      ,XOFFSET=209 ,YOFFSET=12 ,SCR_XSIZE=106 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Run calibration')


  WID_TEXT_20 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_20'  $
      ,XOFFSET=79 ,YOFFSET=16 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_21 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_21'  $
      ,XOFFSET=79 ,YOFFSET=39 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_22 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_22'  $
      ,XOFFSET=79 ,YOFFSET=63 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_23 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_23'  $
      ,XOFFSET=79 ,YOFFSET=86 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_94 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_94'  $
      ,XOFFSET=79 ,YOFFSET=178 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_95 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_95'  $
      ,XOFFSET=79 ,YOFFSET=155 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_96 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_96'  $
      ,XOFFSET=79 ,YOFFSET=131 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_97 = Widget_Text(WID_BASE_40, UNAME='WID_TEXT_97'  $
      ,XOFFSET=79 ,YOFFSET=108 ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_LABEL_50 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_50'  $
      ,XOFFSET=11 ,YOFFSET=18 ,/ALIGN_LEFT ,VALUE='pix size x')


  WID_LABEL_52 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_52'  $
      ,XOFFSET=11 ,YOFFSET=40 ,/ALIGN_LEFT ,VALUE='pix size y')


  WID_LABEL_53 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_53'  $
      ,XOFFSET=11 ,YOFFSET=64 ,/ALIGN_LEFT ,VALUE='distance')


  WID_LABEL_54 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_54'  $
      ,XOFFSET=11 ,YOFFSET=87 ,/ALIGN_LEFT ,VALUE='wavelength')


  WID_LABEL_55 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_55'  $
      ,XOFFSET=11 ,YOFFSET=110 ,/ALIGN_LEFT ,VALUE='beam x')


  WID_LABEL_56 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_56'  $
      ,XOFFSET=11 ,YOFFSET=133 ,/ALIGN_LEFT ,VALUE='beam y')


  WID_LABEL_57 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_57'  $
      ,XOFFSET=10 ,YOFFSET=157 ,/ALIGN_LEFT ,VALUE='rotation')


  WID_LABEL_58 = Widget_Label(WID_BASE_40, UNAME='WID_LABEL_58'  $
      ,XOFFSET=10 ,YOFFSET=181 ,/ALIGN_LEFT ,VALUE='tilt')


  WID_BASE_41 = Widget_Base(WID_TAB_2, UNAME='WID_BASE_41'  $
      ,SCR_XSIZE=322 ,SCR_YSIZE=217 ,TITLE='Mask' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_BUTTON_49 = Widget_Button(WID_BASE_41, UNAME='WID_BUTTON_49'  $
      ,XOFFSET=14 ,YOFFSET=160 ,SCR_XSIZE=124 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Clear mask')


  WID_BUTTON_50 = Widget_Button(WID_BASE_41, UNAME='WID_BUTTON_50'  $
      ,XOFFSET=14 ,YOFFSET=124 ,SCR_XSIZE=124 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Pick mask file')


  WID_BUTTON_42 = Widget_Button(WID_BASE_41, UNAME='WID_BUTTON_42'  $
      ,XOFFSET=14 ,YOFFSET=88 ,SCR_XSIZE=124 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Create mask')


  WID_BASE_42 = Widget_Base(WID_BASE_41, UNAME='WID_BASE_42'  $
      ,XOFFSET=15 ,YOFFSET=23 ,TITLE='IDL' ,COLUMN=1 ,/NONEXCLUSIVE)


  WID_BUTTON_43 = Widget_Button(WID_BASE_42, UNAME='WID_BUTTON_43'  $
      ,/ALIGN_LEFT ,VALUE='Use mask')


  WID_TEXT_5 = Widget_Text(WID_BASE_41, UNAME='WID_TEXT_5'  $
      ,XOFFSET=14 ,YOFFSET=58 ,SCR_XSIZE=299 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_BASE_43 = Widget_Base(WID_TAB_2, UNAME='WID_BASE_43'  $
      ,SCR_XSIZE=322 ,SCR_YSIZE=217 ,TITLE='Misc.' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_TAB_7 = Widget_Tab(WID_BASE_43, UNAME='WID_TAB_7' ,XOFFSET=6  $
      ,YOFFSET=101 ,SCR_XSIZE=287 ,SCR_YSIZE=101)


  WID_BASE_44 = Widget_Base(WID_TAB_7, UNAME='WID_BASE_44'  $
      ,SCR_XSIZE=279 ,SCR_YSIZE=75 ,TITLE='Z-scale' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_BUTTON_64 = Widget_Button(WID_BASE_44, UNAME='WID_BUTTON_64'  $
      ,XOFFSET=13 ,YOFFSET=21 ,/ALIGN_CENTER ,VALUE='Max +')


  WID_BUTTON_65 = Widget_Button(WID_BASE_44, UNAME='WID_BUTTON_65'  $
      ,XOFFSET=60 ,YOFFSET=21 ,/ALIGN_CENTER ,VALUE='Max -')


  WID_BUTTON_66 = Widget_Button(WID_BASE_44, UNAME='WID_BUTTON_66'  $
      ,XOFFSET=60 ,YOFFSET=45 ,SCR_XSIZE=41 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Min -')


  WID_BUTTON_67 = Widget_Button(WID_BASE_44, UNAME='WID_BUTTON_67'  $
      ,XOFFSET=13 ,YOFFSET=45 ,SCR_XSIZE=44 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Min +')


  WID_BUTTON_68 = Widget_Button(WID_BASE_44, UNAME='WID_BUTTON_68'  $
      ,XOFFSET=159 ,YOFFSET=45 ,SCR_XSIZE=80 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Log scale')


  WID_BUTTON_70 = Widget_Button(WID_BASE_44, UNAME='WID_BUTTON_70'  $
      ,XOFFSET=158 ,YOFFSET=22 ,SCR_XSIZE=81 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Weak peaks')


  WID_BUTTON_44 = Widget_Button(WID_BASE_43, UNAME='WID_BUTTON_44'  $
      ,XOFFSET=6 ,YOFFSET=64 ,SCR_XSIZE=76 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Exit')


  WID_BUTTON_45 = Widget_Button(WID_BASE_43, UNAME='WID_BUTTON_45'  $
      ,XOFFSET=6 ,YOFFSET=35 ,SCR_XSIZE=76 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Cancel')


  WID_BUTTON_46 = Widget_Button(WID_BASE_43, UNAME='WID_BUTTON_46'  $
      ,XOFFSET=6 ,YOFFSET=5 ,SCR_XSIZE=76 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='O.K.')


  WID_BUTTON_51 = Widget_Button(WID_BASE_43, UNAME='WID_BUTTON_51'  $
      ,XOFFSET=84 ,YOFFSET=35 ,SCR_XSIZE=76 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Powder')


  WID_BUTTON_52 = Widget_Button(WID_BASE_43, UNAME='WID_BUTTON_52'  $
      ,XOFFSET=84 ,YOFFSET=64 ,SCR_XSIZE=76 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Exchange')


  WID_BASE_45 = Widget_Base(WID_TAB_2, UNAME='WID_BASE_45'  $
      ,SCR_XSIZE=322 ,SCR_YSIZE=217 ,TITLE='File' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_BUTTON_53 = Widget_Button(WID_BASE_45, UNAME='WID_BUTTON_53'  $
      ,XOFFSET=271 ,YOFFSET=41 ,SCR_XSIZE=34 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='->')


  WID_BUTTON_71 = Widget_Button(WID_BASE_45, UNAME='WID_BUTTON_71'  $
      ,XOFFSET=225 ,YOFFSET=41 ,SCR_XSIZE=34 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='<-')


  WID_BUTTON_72 = Widget_Button(WID_BASE_45, UNAME='WID_BUTTON_72'  $
      ,XOFFSET=7 ,YOFFSET=40 ,SCR_XSIZE=78 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Open image')


  WID_TEXT_13 = Widget_Text(WID_BASE_45, UNAME='WID_TEXT_13'  $
      ,XOFFSET=8 ,YOFFSET=13 ,SCR_XSIZE=299 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_98 = Widget_Text(WID_BASE_45, UNAME='WID_TEXT_98'  $
      ,XOFFSET=10 ,YOFFSET=150 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_99 = Widget_Text(WID_BASE_45, UNAME='WID_TEXT_99'  $
      ,XOFFSET=93 ,YOFFSET=149 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_100 = Widget_Text(WID_BASE_45, UNAME='WID_TEXT_100'  $
      ,XOFFSET=93 ,YOFFSET=123 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_101 = Widget_Text(WID_BASE_45, UNAME='WID_TEXT_101'  $
      ,XOFFSET=10 ,YOFFSET=124 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_59 = Widget_Label(WID_BASE_45, UNAME='WID_LABEL_59'  $
      ,XOFFSET=11 ,YOFFSET=102 ,/ALIGN_LEFT ,VALUE='File series'+ $
      ' range')


  WID_DRAW_0ab = Widget_Draw(WID_BASE_17aa, UNAME='WID_DRAW_0ab'  $
      ,XOFFSET=758 ,YOFFSET=418 ,SCR_XSIZE=340 ,SCR_YSIZE=339)


  WID_BUTTON_15 = Widget_Button(WID_BASE_17aa, UNAME='WID_BUTTON_15'  $
      ,XOFFSET=814 ,YOFFSET=262 ,SCR_XSIZE=69 ,SCR_YSIZE=32  $
      ,/ALIGN_CENTER ,VALUE='Start')


  WID_BUTTON_73 = Widget_Button(WID_BASE_17aa, UNAME='WID_BUTTON_73'  $
      ,XOFFSET=885 ,YOFFSET=262 ,SCR_XSIZE=69 ,SCR_YSIZE=32  $
      ,/ALIGN_CENTER ,VALUE='Close')


  WID_BUTTON_16 = Widget_Button(WID_BASE_17aa, UNAME='WID_BUTTON_16'  $
      ,XOFFSET=956 ,YOFFSET=262 ,SCR_XSIZE=69 ,SCR_YSIZE=32  $
      ,/ALIGN_CENTER ,VALUE='Locate')


  WID_BASE_18 = Widget_Base(WID_TAB_0aa, UNAME='WID_BASE_18'  $
      ,SCR_XSIZE=1102 ,SCR_YSIZE=764 ,TITLE='Spectrum' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_TAB_0 = Widget_Tab(WID_BASE_18, UNAME='WID_TAB_0' ,XOFFSET=3  $
      ,YOFFSET=3 ,SCR_XSIZE=416 ,SCR_YSIZE=305)


  WID_BASE_4 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_4'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='Phases' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_BUTTON_0 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_0'  $
      ,XOFFSET=18 ,YOFFSET=22 ,SCR_XSIZE=92 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Add phase')


  WID_TEXT_0 = Widget_Text(WID_BASE_4, UNAME='WID_TEXT_0'  $
      ,XOFFSET=228 ,YOFFSET=23 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,/EDITABLE  $
      ,XSIZE=20 ,YSIZE=1)


  WID_LABEL_0 = Widget_Label(WID_BASE_4, UNAME='WID_LABEL_0'  $
      ,XOFFSET=229 ,YOFFSET=3 ,/ALIGN_LEFT ,VALUE='Pressure [GPa]')


  WID_BUTTON_2 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_2'  $
      ,XOFFSET=226 ,YOFFSET=108 ,SCR_XSIZE=92 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Recalculate')


  WID_BUTTON_3 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_3'  $
      ,XOFFSET=18 ,YOFFSET=52 ,SCR_XSIZE=92 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Delete phase')


  WID_BUTTON_4 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_4'  $
      ,XOFFSET=18 ,YOFFSET=82 ,SCR_XSIZE=92 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Clear phases')


  WID_BUTTON_101 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_101'  $
      ,XOFFSET=130 ,YOFFSET=21 ,SCR_XSIZE=18 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='<')


  WID_BUTTON_102 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_102'  $
      ,XOFFSET=194 ,YOFFSET=21 ,SCR_XSIZE=18 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='>')


  WID_TEXT_30 = Widget_Text(WID_BASE_4, UNAME='WID_TEXT_30'  $
      ,XOFFSET=153 ,YOFFSET=22 ,SCR_XSIZE=37 ,SCR_YSIZE=21 ,/EDITABLE  $
      ,XSIZE=20 ,YSIZE=1)


  WID_BASE_2 = Widget_Base(WID_BASE_4, UNAME='WID_BASE_2' ,XOFFSET=21  $
      ,YOFFSET=136 ,TITLE='IDL' ,COLUMN=1 ,/NONEXCLUSIVE)


  WID_BUTTON_5 = Widget_Button(WID_BASE_2, UNAME='WID_BUTTON_5'  $
      ,/ALIGN_LEFT ,VALUE='Hide phase')


  WID_BASE_3 = Widget_Base(WID_BASE_4, UNAME='WID_BASE_3' ,XOFFSET=21  $
      ,YOFFSET=169 ,TITLE='IDL' ,COLUMN=1 ,/NONEXCLUSIVE)


  WID_BUTTON_6 = Widget_Button(WID_BASE_3, UNAME='WID_BUTTON_6'  $
      ,/ALIGN_LEFT ,VALUE='Show HKL labels')


  WID_BASE_7 = Widget_Base(WID_BASE_4, UNAME='WID_BASE_7' ,XOFFSET=21  $
      ,YOFFSET=202 ,TITLE='IDL' ,COLUMN=1 ,/NONEXCLUSIVE)


  WID_BUTTON_12 = Widget_Button(WID_BASE_7, UNAME='WID_BUTTON_12'  $
      ,/ALIGN_LEFT ,VALUE='Show legend')


  WID_TEXT_31 = Widget_Text(WID_BASE_4, UNAME='WID_TEXT_31'  $
      ,XOFFSET=153 ,YOFFSET=75 ,SCR_XSIZE=37 ,SCR_YSIZE=21 ,/EDITABLE  $
      ,XSIZE=20 ,YSIZE=1)


  WID_BUTTON_103 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_103'  $
      ,XOFFSET=194 ,YOFFSET=74 ,SCR_XSIZE=18 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='>')


  WID_BUTTON_104 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_104'  $
      ,XOFFSET=130 ,YOFFSET=74 ,SCR_XSIZE=18 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='<')


  WID_LABEL_7 = Widget_Label(WID_BASE_4, UNAME='WID_LABEL_7'  $
      ,XOFFSET=229 ,YOFFSET=56 ,/ALIGN_LEFT ,VALUE='Temperature [K]')


  WID_TEXT_28 = Widget_Text(WID_BASE_4, UNAME='WID_TEXT_28'  $
      ,XOFFSET=228 ,YOFFSET=76 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,/EDITABLE  $
      ,XSIZE=20 ,YSIZE=1)


  WID_TEXT_7 = Widget_Text(WID_BASE_4, UNAME='WID_TEXT_7'  $
      ,XOFFSET=259 ,YOFFSET=202 ,SCR_XSIZE=56 ,SCR_YSIZE=25  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_BUTTON_105 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_105'  $
      ,XOFFSET=227 ,YOFFSET=202 ,SCR_XSIZE=26 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='-')


  WID_BUTTON_106 = Widget_Button(WID_BASE_4, UNAME='WID_BUTTON_106'  $
      ,XOFFSET=320 ,YOFFSET=200 ,SCR_XSIZE=26 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='+')


  WID_TEXT_36 = Widget_Text(WID_BASE_4, UNAME='WID_TEXT_36'  $
      ,XOFFSET=259 ,YOFFSET=175 ,SCR_XSIZE=56 ,SCR_YSIZE=25  $
      ,/EDITABLE ,XSIZE=20 ,YSIZE=1)


  WID_LABEL_12 = Widget_Label(WID_BASE_4, UNAME='WID_LABEL_12'  $
      ,XOFFSET=238 ,YOFFSET=153 ,/ALIGN_LEFT ,VALUE='Scale')


  WID_BASE_5 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_5'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='File' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_BUTTON_107 = Widget_Button(WID_BASE_5, UNAME='WID_BUTTON_107'  $
      ,XOFFSET=16 ,YOFFSET=42 ,SCR_XSIZE=78 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Open chi')


  WID_BUTTON_108 = Widget_Button(WID_BASE_5, UNAME='WID_BUTTON_108'  $
      ,XOFFSET=292 ,YOFFSET=43 ,SCR_XSIZE=34 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='->')


  WID_BUTTON_109 = Widget_Button(WID_BASE_5, UNAME='WID_BUTTON_109'  $
      ,XOFFSET=256 ,YOFFSET=43 ,SCR_XSIZE=34 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='<-')


  WID_TEXT_3 = Widget_Text(WID_BASE_5, UNAME='WID_TEXT_3' ,XOFFSET=16  $
      ,YOFFSET=14 ,SCR_XSIZE=310 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)


  WID_BUTTON_110 = Widget_Button(WID_BASE_5, UNAME='WID_BUTTON_110'  $
      ,XOFFSET=96 ,YOFFSET=42 ,SCR_XSIZE=78 ,SCR_YSIZE=35  $
      ,/ALIGN_CENTER ,VALUE='Save chi')


  WID_LABEL_70 = Widget_Label(WID_BASE_5, UNAME='WID_LABEL_70'  $
      ,XOFFSET=17 ,YOFFSET=144 ,/ALIGN_LEFT ,VALUE='File series'+ $
      ' range')


  WID_TEXT_114 = Widget_Text(WID_BASE_5, UNAME='WID_TEXT_114'  $
      ,XOFFSET=16 ,YOFFSET=166 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_115 = Widget_Text(WID_BASE_5, UNAME='WID_TEXT_115'  $
      ,XOFFSET=99 ,YOFFSET=165 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_116 = Widget_Text(WID_BASE_5, UNAME='WID_TEXT_116'  $
      ,XOFFSET=99 ,YOFFSET=191 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_117 = Widget_Text(WID_BASE_5, UNAME='WID_TEXT_117'  $
      ,XOFFSET=16 ,YOFFSET=192 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_71 = Widget_Label(WID_BASE_5, UNAME='WID_LABEL_71'  $
      ,XOFFSET=17 ,YOFFSET=87 ,/ALIGN_LEFT ,VALUE='wavelength')


  WID_TEXT_29 = Widget_Text(WID_BASE_5, UNAME='WID_TEXT_29'  $
      ,XOFFSET=16 ,YOFFSET=107 ,SCR_XSIZE=93 ,SCR_YSIZE=21 ,/EDITABLE  $
      ,XSIZE=20 ,YSIZE=1)


  WID_BUTTON_111 = Widget_Button(WID_BASE_5, UNAME='WID_BUTTON_111'  $
      ,XOFFSET=211 ,YOFFSET=165 ,SCR_XSIZE=92 ,SCR_YSIZE=29  $
      ,/ALIGN_CENTER ,VALUE='Truncate')


  WID_BASE_6 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_6'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='Peak fit' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_TEXT_1 = Widget_Text(WID_BASE_6, UNAME='WID_TEXT_1'  $
      ,XOFFSET=166 ,YOFFSET=31 ,SCR_XSIZE=73 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_4 = Widget_Label(WID_BASE_6, UNAME='WID_LABEL_4'  $
      ,XOFFSET=169 ,YOFFSET=6 ,/ALIGN_LEFT ,VALUE='Window')


  WID_BUTTON_112 = Widget_Button(WID_BASE_6, UNAME='WID_BUTTON_112'  $
      ,XOFFSET=18 ,YOFFSET=15 ,SCR_XSIZE=127 ,SCR_YSIZE=39  $
      ,/ALIGN_CENTER ,VALUE='Fit')


  WID_BASE_9 = Widget_Base(WID_BASE_6, UNAME='WID_BASE_9' ,XOFFSET=58  $
      ,YOFFSET=92 ,TITLE='IDL' ,COLUMN=1 ,/EXCLUSIVE)


  WID_BUTTON_113 = Widget_Button(WID_BASE_9, UNAME='WID_BUTTON_113'  $
      ,/ALIGN_LEFT ,VALUE='Gaussian')


  WID_BUTTON_114 = Widget_Button(WID_BASE_9, UNAME='WID_BUTTON_114'  $
      ,YOFFSET=22 ,/ALIGN_LEFT ,VALUE='Lorentzian')


  WID_BUTTON_115 = Widget_Button(WID_BASE_9, UNAME='WID_BUTTON_115'  $
      ,YOFFSET=44 ,/ALIGN_LEFT ,VALUE='PearsonVII')


  WID_BUTTON_116 = Widget_Button(WID_BASE_9, UNAME='WID_BUTTON_116'  $
      ,YOFFSET=66 ,/ALIGN_LEFT ,VALUE='Pseudo-Voigt')


  WID_LABEL_13 = Widget_Label(WID_BASE_6, UNAME='WID_LABEL_13'  $
      ,XOFFSET=23 ,YOFFSET=69 ,/ALIGN_LEFT ,VALUE='Profile function')


  WID_LABEL_14 = Widget_Label(WID_BASE_6, UNAME='WID_LABEL_14'  $
      ,XOFFSET=138 ,YOFFSET=68 ,/ALIGN_LEFT ,VALUE='Profile'+ $
      ' background')


  WID_BASE_14 = Widget_Base(WID_BASE_6, UNAME='WID_BASE_14'  $
      ,XOFFSET=173 ,YOFFSET=91 ,TITLE='IDL' ,COLUMN=1 ,/EXCLUSIVE)


  WID_BUTTON_117 = Widget_Button(WID_BASE_14, UNAME='WID_BUTTON_117'  $
      ,/ALIGN_LEFT ,VALUE='Linear')


  WID_BUTTON_118 = Widget_Button(WID_BASE_14, UNAME='WID_BUTTON_118'  $
      ,YOFFSET=22 ,/ALIGN_LEFT ,VALUE='Constant')


  WID_BUTTON_119 = Widget_Button(WID_BASE_14, UNAME='WID_BUTTON_119'  $
      ,YOFFSET=44 ,/ALIGN_LEFT ,VALUE='No background')


  WID_BASE_11 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_11'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='Unit cell' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_TEXT_8 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_8'  $
      ,XOFFSET=184 ,YOFFSET=57 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_9 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_9'  $
      ,XOFFSET=184 ,YOFFSET=36 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_10 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_10'  $
      ,XOFFSET=184 ,YOFFSET=13 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_11 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_11'  $
      ,XOFFSET=183 ,YOFFSET=133 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_32 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_32'  $
      ,XOFFSET=183 ,YOFFSET=112 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_33 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_33'  $
      ,XOFFSET=183 ,YOFFSET=89 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_34 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_34'  $
      ,XOFFSET=266 ,YOFFSET=90 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_35 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_35'  $
      ,XOFFSET=266 ,YOFFSET=113 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_37 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_37'  $
      ,XOFFSET=266 ,YOFFSET=134 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_38 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_38'  $
      ,XOFFSET=267 ,YOFFSET=14 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_39 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_39'  $
      ,XOFFSET=267 ,YOFFSET=37 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_40 = Widget_Text(WID_BASE_11, UNAME='WID_TEXT_40'  $
      ,XOFFSET=267 ,YOFFSET=58 ,SCR_XSIZE=66 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_DROPLIST_0 = Widget_Droplist(WID_BASE_11,  $
      UNAME='WID_DROPLIST_0' ,XOFFSET=37 ,YOFFSET=48 ,SCR_XSIZE=126  $
      ,SCR_YSIZE=22)


  WID_BUTTON_120 = Widget_Button(WID_BASE_11, UNAME='WID_BUTTON_120'  $
      ,XOFFSET=39 ,YOFFSET=89 ,SCR_XSIZE=101 ,SCR_YSIZE=47  $
      ,/ALIGN_CENTER ,VALUE='Refine')


  WID_LABEL_2 = Widget_Label(WID_BASE_11, UNAME='WID_LABEL_2'  $
      ,XOFFSET=37 ,YOFFSET=26 ,/ALIGN_LEFT ,VALUE='Crystal system')


  WID_BASE_13 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_13'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='Background' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_LABEL_19 = Widget_Label(WID_BASE_13, UNAME='WID_LABEL_19'  $
      ,XOFFSET=28 ,YOFFSET=8 ,/ALIGN_LEFT ,VALUE='Sampling interval')


  WID_TEXT_41 = Widget_Text(WID_BASE_13, UNAME='WID_TEXT_41'  $
      ,XOFFSET=28 ,YOFFSET=32 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_20 = Widget_Label(WID_BASE_13, UNAME='WID_LABEL_20'  $
      ,XOFFSET=144 ,YOFFSET=7 ,/ALIGN_LEFT ,VALUE='Tension')


  WID_TEXT_42 = Widget_Text(WID_BASE_13, UNAME='WID_TEXT_42'  $
      ,XOFFSET=144 ,YOFFSET=31 ,SCR_XSIZE=85 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_BUTTON_121 = Widget_Button(WID_BASE_13, UNAME='WID_BUTTON_121'  $
      ,XOFFSET=25 ,YOFFSET=77 ,SCR_XSIZE=94 ,SCR_YSIZE=37  $
      ,/ALIGN_CENTER ,VALUE='Fit')


  WID_BUTTON_122 = Widget_Button(WID_BASE_13, UNAME='WID_BUTTON_122'  $
      ,XOFFSET=25 ,YOFFSET=115 ,SCR_XSIZE=94 ,SCR_YSIZE=37  $
      ,/ALIGN_CENTER ,VALUE='Subtract')


  WID_BUTTON_123 = Widget_Button(WID_BASE_13, UNAME='WID_BUTTON_123'  $
      ,XOFFSET=25 ,YOFFSET=153 ,SCR_XSIZE=94 ,SCR_YSIZE=37  $
      ,/ALIGN_CENTER ,VALUE='Save')


  WID_TEXT_43 = Widget_Text(WID_BASE_13, UNAME='WID_TEXT_43'  $
      ,XOFFSET=257 ,YOFFSET=32 ,SCR_XSIZE=85 ,SCR_YSIZE=20 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_21 = Widget_Label(WID_BASE_13, UNAME='WID_LABEL_21'  $
      ,XOFFSET=257 ,YOFFSET=7 ,/ALIGN_LEFT ,VALUE='Marigin')


  WID_LIST_0 = Widget_List(WID_BASE_13, UNAME='WID_LIST_0'  $
      ,XOFFSET=235 ,YOFFSET=93 ,SCR_XSIZE=162 ,SCR_YSIZE=143  $
      ,XSIZE=11 ,YSIZE=2)


  WID_BUTTON_124 = Widget_Button(WID_BASE_13, UNAME='WID_BUTTON_124'  $
      ,XOFFSET=207 ,YOFFSET=95 ,SCR_XSIZE=23 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='X')


  WID_LABEL_5 = Widget_Label(WID_BASE_13, UNAME='WID_LABEL_5'  $
      ,XOFFSET=238 ,YOFFSET=70 ,/ALIGN_LEFT ,VALUE='Spline nodes')


  WID_BASE_10 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_10'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='Output' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)


  WID_BUTTON_8 = Widget_Button(WID_BASE_10, UNAME='WID_BUTTON_8'  $
      ,XOFFSET=13 ,YOFFSET=20 ,SCR_XSIZE=117 ,SCR_YSIZE=41  $
      ,/ALIGN_CENTER ,VALUE='Save graph')


  WID_BUTTON_9 = Widget_Button(WID_BASE_10, UNAME='WID_BUTTON_9'  $
      ,XOFFSET=133 ,YOFFSET=20 ,SCR_XSIZE=117 ,SCR_YSIZE=41  $
      ,/ALIGN_CENTER ,VALUE='Save peak fitting')


  WID_BUTTON_10 = Widget_Button(WID_BASE_10, UNAME='WID_BUTTON_10'  $
      ,XOFFSET=252 ,YOFFSET=20 ,SCR_XSIZE=117 ,SCR_YSIZE=41  $
      ,/ALIGN_CENTER ,VALUE='Save cell refinement')


  WID_BUTTON_11 = Widget_Button(WID_BASE_10, UNAME='WID_BUTTON_11'  $
      ,XOFFSET=13 ,YOFFSET=63 ,SCR_XSIZE=117 ,SCR_YSIZE=41  $
      ,/ALIGN_CENTER ,VALUE='Print graph')


  WID_BASE_12 = Widget_Base(WID_TAB_0, UNAME='WID_BASE_12'  $
      ,SCR_XSIZE=408 ,SCR_YSIZE=279 ,TITLE='Overlays' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)


  WID_BUTTON_125 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_125'  $
      ,XOFFSET=11 ,YOFFSET=60 ,SCR_XSIZE=90 ,SCR_YSIZE=25  $
      ,/ALIGN_CENTER ,VALUE='Clear overlays')


  WID_BUTTON_126 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_126'  $
      ,XOFFSET=11 ,YOFFSET=34 ,SCR_XSIZE=90 ,SCR_YSIZE=25  $
      ,/ALIGN_CENTER ,VALUE='Delete overlay')


  WID_BUTTON_127 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_127'  $
      ,XOFFSET=11 ,YOFFSET=7 ,SCR_XSIZE=90 ,SCR_YSIZE=25  $
      ,/ALIGN_CENTER ,VALUE='Add overlay')


  WID_BUTTON_128 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_128'  $
      ,XOFFSET=164 ,YOFFSET=139 ,SCR_XSIZE=57 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Reset')


  WID_BUTTON_129 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_129'  $
      ,XOFFSET=162 ,YOFFSET=63 ,SCR_XSIZE=57 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='Reset')


  WID_BUTTON_130 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_130'  $
      ,XOFFSET=164 ,YOFFSET=112 ,SCR_XSIZE=26 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='-')


  WID_BUTTON_131 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_131'  $
      ,XOFFSET=257 ,YOFFSET=110 ,SCR_XSIZE=26 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='+')


  WID_BUTTON_132 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_132'  $
      ,XOFFSET=255 ,YOFFSET=33 ,SCR_XSIZE=26 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='+')


  WID_BUTTON_133 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_133'  $
      ,XOFFSET=162 ,YOFFSET=35 ,SCR_XSIZE=26 ,SCR_YSIZE=26  $
      ,/ALIGN_CENTER ,VALUE='-')


  WID_LABEL_72 = Widget_Label(WID_BASE_12, UNAME='WID_LABEL_72'  $
      ,XOFFSET=127 ,YOFFSET=8 ,/ALIGN_LEFT ,VALUE='Overlay mltpl.')


  WID_LABEL_9 = Widget_Label(WID_BASE_12, UNAME='WID_LABEL_9'  $
      ,XOFFSET=130 ,YOFFSET=89 ,/ALIGN_LEFT ,VALUE='Overlay shift')


  WID_TEXT_2 = Widget_Text(WID_BASE_12, UNAME='WID_TEXT_2'  $
      ,XOFFSET=194 ,YOFFSET=35 ,SCR_XSIZE=56 ,SCR_YSIZE=25 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_15 = Widget_Text(WID_BASE_12, UNAME='WID_TEXT_15'  $
      ,XOFFSET=290 ,YOFFSET=33 ,SCR_XSIZE=68 ,SCR_YSIZE=25 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_44 = Widget_Text(WID_BASE_12, UNAME='WID_TEXT_44'  $
      ,XOFFSET=290 ,YOFFSET=110 ,SCR_XSIZE=68 ,SCR_YSIZE=25 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_45 = Widget_Text(WID_BASE_12, UNAME='WID_TEXT_45'  $
      ,XOFFSET=195 ,YOFFSET=112 ,SCR_XSIZE=55 ,SCR_YSIZE=25 ,XSIZE=20  $
      ,YSIZE=1)


  WID_BUTTON_134 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_134'  $
      ,XOFFSET=10 ,YOFFSET=147 ,SCR_XSIZE=94 ,SCR_YSIZE=34  $
      ,/ALIGN_CENTER ,VALUE='Spread all')


  WID_BUTTON_135 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_135'  $
      ,XOFFSET=10 ,YOFFSET=184 ,SCR_XSIZE=94 ,SCR_YSIZE=34  $
      ,/ALIGN_CENTER ,VALUE='Reset all')


  WID_BASE_8 = Widget_Base(WID_BASE_12, UNAME='WID_BASE_8'  $
      ,XOFFSET=310 ,YOFFSET=213 ,TITLE='IDL' ,COLUMN=1  $
      ,/NONEXCLUSIVE)


  WID_BUTTON_7 = Widget_Button(WID_BASE_8, UNAME='WID_BUTTON_7'  $
      ,/ALIGN_LEFT ,VALUE='Show legend')


  WID_BASE_19 = Widget_Base(WID_BASE_12, UNAME='WID_BASE_19'  $
      ,XOFFSET=160 ,YOFFSET=192 ,TITLE='IDL' ,COLUMN=1 ,/EXCLUSIVE)


  WID_BUTTON_136 = Widget_Button(WID_BASE_19, UNAME='WID_BUTTON_136'  $
      ,/ALIGN_LEFT ,VALUE='Add')


  WID_BUTTON_137 = Widget_Button(WID_BASE_19, UNAME='WID_BUTTON_137'  $
      ,YOFFSET=22 ,/ALIGN_LEFT ,VALUE='Subtract')


  WID_BUTTON_138 = Widget_Button(WID_BASE_12, UNAME='WID_BUTTON_138'  $
      ,XOFFSET=239 ,YOFFSET=191 ,SCR_XSIZE=59 ,SCR_YSIZE=44  $
      ,/ALIGN_CENTER ,VALUE='Execute')


  WID_DRAW_0 = Widget_Draw(WID_BASE_18, UNAME='WID_DRAW_0' ,XOFFSET=2  $
      ,YOFFSET=312 ,SCR_XSIZE=852 ,SCR_YSIZE=446)


  WID_DRAW_2 = Widget_Draw(WID_BASE_18, UNAME='WID_DRAW_2'  $
      ,XOFFSET=421 ,YOFFSET=3 ,SCR_XSIZE=433 ,SCR_YSIZE=306)


  WID_LABEL_11 = Widget_Label(WID_BASE_18, UNAME='WID_LABEL_11'  $
      ,XOFFSET=869 ,YOFFSET=75 ,/ALIGN_LEFT ,VALUE='Overlay')


  WID_LABEL_8 = Widget_Label(WID_BASE_18, UNAME='WID_LABEL_8'  $
      ,XOFFSET=871 ,YOFFSET=290 ,/ALIGN_LEFT ,VALUE='Phase')


  WID_LABEL_10 = Widget_Label(WID_BASE_18, UNAME='WID_LABEL_10'  $
      ,XOFFSET=868 ,YOFFSET=507 ,/ALIGN_LEFT ,VALUE='Peak')


  WID_LIST_11 = Widget_List(WID_BASE_18, UNAME='WID_LIST_11'  $
      ,XOFFSET=869 ,YOFFSET=525 ,SCR_XSIZE=222 ,SCR_YSIZE=230  $
      ,XSIZE=11 ,YSIZE=2)


  WID_LIST_10 = Widget_List(WID_BASE_18, UNAME='WID_LIST_10'  $
      ,XOFFSET=868 ,YOFFSET=309 ,SCR_XSIZE=222 ,SCR_YSIZE=189  $
      ,XSIZE=11 ,YSIZE=2)


  WID_LIST_12 = Widget_List(WID_BASE_18, UNAME='WID_LIST_12'  $
      ,XOFFSET=867 ,YOFFSET=94 ,SCR_XSIZE=223 ,SCR_YSIZE=188  $
      ,XSIZE=11 ,YSIZE=2)


  WID_TEXT_46 = Widget_Text(WID_BASE_18, UNAME='WID_TEXT_46'  $
      ,XOFFSET=1011 ,YOFFSET=40 ,SCR_XSIZE=68 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_6 = Widget_Label(WID_BASE_18, UNAME='WID_LABEL_6'  $
      ,XOFFSET=992 ,YOFFSET=47 ,/ALIGN_LEFT ,VALUE='Q')


  WID_LABEL_3 = Widget_Label(WID_BASE_18, UNAME='WID_LABEL_3'  $
      ,XOFFSET=992 ,YOFFSET=23 ,/ALIGN_LEFT ,VALUE='d')


  WID_TEXT_47 = Widget_Text(WID_BASE_18, UNAME='WID_TEXT_47'  $
      ,XOFFSET=1010 ,YOFFSET=19 ,SCR_XSIZE=68 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_TEXT_48 = Widget_Text(WID_BASE_18, UNAME='WID_TEXT_48'  $
      ,XOFFSET=898 ,YOFFSET=17 ,SCR_XSIZE=68 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)


  WID_LABEL_1 = Widget_Label(WID_BASE_18, UNAME='WID_LABEL_1'  $
      ,XOFFSET=872 ,YOFFSET=20 ,/ALIGN_LEFT ,VALUE='2 th')


  WID_BUTTON_1 = Widget_Button(WID_BASE_0aa, UNAME='WID_BUTTON_1'  $
      ,XOFFSET=1117 ,YOFFSET=765 ,SCR_XSIZE=54 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='Close')


  WID_BUTTON_139 = Widget_Button(WID_BASE_0aa, UNAME='WID_BUTTON_139'  $
      ,XOFFSET=1117 ,YOFFSET=733 ,SCR_XSIZE=54 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='About')


  WID_BUTTON_140 = Widget_Button(WID_BASE_0aa, UNAME='WID_BUTTON_140'  $
      ,XOFFSET=1117 ,YOFFSET=701 ,SCR_XSIZE=54 ,SCR_YSIZE=28  $
      ,/ALIGN_CENTER ,VALUE='Help')

  Widget_Control, /REALIZE, WID_BASE_0aa

  XManager, 'WID_BASE_0L', WID_BASE_0aa, /NO_BLOCK

end
