; 
; IDL Widget Interface Procedures. This Code is automatically 
;     generated and should not be modified.

; 
; Generated on:	03/18/2010 09:43.02
; 
pro WID_Image_event, Event

  wTarget = (widget_info(Event.id,/NAME) eq 'TREE' ?  $
      widget_info(Event.id, /tree_root) : event.id)


  wWidget =  Event.top

  case wTarget of

    else:
  endcase

end

pro WID_Image, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

  Resolve_Routine, 'WID_Image_eventcb',/COMPILE_FULL_FILE  ; Load event callback routines
  
  WID_Image = Widget_Base( GROUP_LEADER=wGroup, UNAME='WID_Image'  $
      ,XOFFSET=5 ,YOFFSET=5 ,SCR_XSIZE=780 ,SCR_YSIZE=736  $
      ,TITLE='IDL' ,SPACE=3 ,XPAD=3 ,YPAD=3)

  
  WID_DRAW_0 = Widget_Draw(WID_Image, UNAME='WID_DRAW_0' ,XOFFSET=5  $
      ,YOFFSET=5 ,SCR_XSIZE=550 ,SCR_YSIZE=550)

  
  WID_TEXT_0 = Widget_Text(WID_Image, UNAME='WID_TEXT_0' ,XOFFSET=778  $
      ,YOFFSET=36 ,SCR_XSIZE=87 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_0 = Widget_Label(WID_Image, UNAME='WID_LABEL_0'  $
      ,XOFFSET=779 ,YOFFSET=13 ,/ALIGN_LEFT ,VALUE='Cursor')

  
  WID_TEXT_1 = Widget_Text(WID_Image, UNAME='WID_TEXT_1' ,XOFFSET=778  $
      ,YOFFSET=63 ,SCR_XSIZE=87 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_TEXT_2 = Widget_Text(WID_Image, UNAME='WID_TEXT_2' ,XOFFSET=562  $
      ,YOFFSET=35 ,SCR_XSIZE=83 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_TEXT_3 = Widget_Text(WID_Image, UNAME='WID_TEXT_3' ,XOFFSET=651  $
      ,YOFFSET=35 ,SCR_XSIZE=83 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_1 = Widget_Label(WID_Image, UNAME='WID_LABEL_1'  $
      ,XOFFSET=563 ,YOFFSET=15 ,/ALIGN_LEFT ,VALUE='Imax')

  
  WID_LABEL_2 = Widget_Label(WID_Image, UNAME='WID_LABEL_2'  $
      ,XOFFSET=653 ,YOFFSET=13 ,/ALIGN_LEFT ,VALUE='Imin')

  
  WID_LABEL_6 = Widget_Label(WID_Image, UNAME='WID_LABEL_6'  $
      ,XOFFSET=716 ,YOFFSET=76 ,/ALIGN_LEFT ,VALUE='Chi')

  
  WID_TEXT_35 = Widget_Text(WID_Image, UNAME='WID_TEXT_35'  $
      ,XOFFSET=694 ,YOFFSET=92 ,SCR_XSIZE=63 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)

  
  WID_LABEL_3 = Widget_Label(WID_Image, UNAME='WID_LABEL_3'  $
      ,XOFFSET=659 ,YOFFSET=75 ,/ALIGN_LEFT ,VALUE='d')

  
  WID_LABEL_4 = Widget_Label(WID_Image, UNAME='WID_LABEL_4'  $
      ,XOFFSET=587 ,YOFFSET=75 ,/ALIGN_LEFT ,VALUE='2th')

  
  WID_TEXT_6 = Widget_Text(WID_Image, UNAME='WID_TEXT_6' ,XOFFSET=627  $
      ,YOFFSET=92 ,SCR_XSIZE=65 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_TEXT_5 = Widget_Text(WID_Image, UNAME='WID_TEXT_5' ,XOFFSET=563  $
      ,YOFFSET=92 ,SCR_XSIZE=63 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_BUTTON_82 = Widget_Button(WID_Image, UNAME='WID_BUTTON_82'  $
      ,XOFFSET=220 ,YOFFSET=648 ,SCR_XSIZE=19 ,SCR_YSIZE=22  $
      ,/ALIGN_CENTER ,VALUE='...')

  
  WID_BUTTON_29 = Widget_Button(WID_Image, UNAME='WID_BUTTON_29'  $
      ,XOFFSET=280 ,YOFFSET=588 ,SCR_XSIZE=34 ,SCR_YSIZE=21  $
      ,/ALIGN_CENTER ,VALUE='->')

  
  WID_BUTTON_28 = Widget_Button(WID_Image, UNAME='WID_BUTTON_28'  $
      ,XOFFSET=244 ,YOFFSET=588 ,SCR_XSIZE=34 ,SCR_YSIZE=21  $
      ,/ALIGN_CENTER ,VALUE='<-')

  
  WID_BUTTON_27 = Widget_Button(WID_Image, UNAME='WID_BUTTON_27'  $
      ,XOFFSET=220 ,YOFFSET=588 ,SCR_XSIZE=19 ,SCR_YSIZE=21  $
      ,/ALIGN_CENTER ,VALUE='...')

  
  WID_TEXT_38 = Widget_Text(WID_Image, UNAME='WID_TEXT_38' ,XOFFSET=9  $
      ,YOFFSET=649 ,SCR_XSIZE=202 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_55 = Widget_Label(WID_Image, UNAME='WID_LABEL_55'  $
      ,XOFFSET=9 ,YOFFSET=631 ,/ALIGN_LEFT ,VALUE='Image directory')

  
  WID_TEXT_12 = Widget_Text(WID_Image, UNAME='WID_TEXT_12' ,XOFFSET=9  $
      ,YOFFSET=589 ,SCR_XSIZE=203 ,SCR_YSIZE=21 ,XSIZE=20 ,YSIZE=1)

  
  WID_LABEL_56 = Widget_Label(WID_Image, UNAME='WID_LABEL_56'  $
      ,XOFFSET=11 ,YOFFSET=569 ,/ALIGN_LEFT ,VALUE='Image file')

  
  WID_BUTTON_93 = Widget_Button(WID_Image, UNAME='WID_BUTTON_93'  $
      ,XOFFSET=449 ,YOFFSET=671 ,SCR_XSIZE=100 ,SCR_YSIZE=20  $
      ,/ALIGN_CENTER ,VALUE='=>>')

  
  WID_BUTTON_94 = Widget_Button(WID_Image, UNAME='WID_BUTTON_94'  $
      ,XOFFSET=449 ,YOFFSET=647 ,SCR_XSIZE=100 ,SCR_YSIZE=20  $
      ,/ALIGN_CENTER ,VALUE='Integrate')

  
  WID_LABEL_51 = Widget_Label(WID_Image, UNAME='WID_LABEL_51'  $
      ,XOFFSET=280 ,YOFFSET=622 ,/ALIGN_LEFT ,VALUE='File series'+ $
      ' range')

  
  WID_TEXT_90 = Widget_Text(WID_Image, UNAME='WID_TEXT_90'  $
      ,XOFFSET=362 ,YOFFSET=669 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)

  
  WID_TEXT_89 = Widget_Text(WID_Image, UNAME='WID_TEXT_89'  $
      ,XOFFSET=279 ,YOFFSET=670 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)

  
  WID_TEXT_91 = Widget_Text(WID_Image, UNAME='WID_TEXT_91'  $
      ,XOFFSET=362 ,YOFFSET=643 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)

  
  WID_TEXT_92 = Widget_Text(WID_Image, UNAME='WID_TEXT_92'  $
      ,XOFFSET=279 ,YOFFSET=644 ,SCR_XSIZE=78 ,SCR_YSIZE=21 ,XSIZE=20  $
      ,YSIZE=1)

  
  WID_BASE_0 = Widget_Base(WID_Image, UNAME='WID_BASE_0' ,XOFFSET=497  $
      ,YOFFSET=563 ,TITLE='IDL' ,COLUMN=1 ,/EXCLUSIVE)

  
  WID_BUTTON_0 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_0'  $
      ,/ALIGN_LEFT ,VALUE='Image')

  
  WID_BUTTON_1 = Widget_Button(WID_BASE_0, UNAME='WID_BUTTON_1'  $
      ,YOFFSET=22 ,/ALIGN_LEFT ,VALUE='Cake')

  Widget_Control, /REALIZE, WID_Image

  XManager, 'WID_Image', WID_Image, /NO_BLOCK  

end
; 
; Empty stub procedure used for autoloading.
; 
pro WID_Image, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
  WID_Image, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_
end
