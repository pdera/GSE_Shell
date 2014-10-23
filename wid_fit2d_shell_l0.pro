pro WID_fit2d_shell_L, GROUP_LEADER=wGroup, _EXTRA=_VWBExtra_

COMMON WID_fit2d_shell_elements, $
  WID_TAB_0, $    ;
  WID_TAB_1, $    ;
  WID_TAB_2, $    ;
  WID_TEXT_0, $   ; pressure
  WID_TEXT_1, $   ; peak fit window
  WID_TEXT_2, $   ; mltp step
  WID_TEXT_12, $   ; file name
  WID_TEXT_3, $   ; file name
  WID_TEXT_4, $   ; mask file
  WID_TEXT_5, $   ; mask file
  WID_TEXT_6, $   ; mask file
  WID_TEXT_7, $   ; phase scale step
  WID_TEXT_8, $   ; mask file
  WID_TEXT_9, $   ; mask file
  WID_TEXT_10, $   ; mask file
  WID_TEXT_11, $   ; mask file
  WID_TEXT_13, $   ; mltp
  WID_TEXT_14, $   ; mask file
  WID_TEXT_15, $   ; mask file
  WID_TEXT_22, $   ; mask file
  WID_TEXT_23, $   ; mask file
  WID_TEXT_83, $  ; bx
  WID_TEXT_82, $  ; by
  WID_TEXT_81, $  ; rot
  WID_TEXT_80, $  ; tilt
  WID_TEXT_16, $  ; wv
  WID_TEXT_17, $  ; dist
  WID_TEXT_18, $  ; py
  WID_TEXT_19, $  ; px
  WID_TEXT_20, $  ; wavelength (spectrum)
  WID_TEXT_21, $  ;   threshold mask
  WID_TEXT_24, $  ;   array x
  WID_TEXT_25, $  ;   array x
  WID_TEXT_26, $  ;   array x
  WID_TEXT_27, $  ;   array x
  WID_TEXT_28, $  ;   array x
  WID_TEXT_29, $  ;   array x
  WID_TEXT_30, $  ;   pressure step
  WID_TEXT_31, $  ;   destination directory
  WID_TEXT_32, $  ;   bcgr interval
  WID_TEXT_33, $  ;   tension
  WID_TEXT_34, $  ;   marigin
  WID_TEXT_35, $  ;   Q
  WID_TEXT_36, $  ;   phase scale
  WID_TEXT_37, $  ;   BG node change step
  WID_TEXT_38, $  ;   image directory
  WID_TEXT_39, $  ;   search peaks assigned
  WID_TEXT_40, $  ;   match intensity score
  WID_TEXT_41, $  ;   match v1
  WID_TEXT_42, $  ;   match v2
  WID_TEXT_44, $  ;   search minI
  WID_TEXT_45, $  ;   search I/s
  WID_TEXT_46, $  ;   search wind
  WID_TEXT_47, $  ;   searchsep
  WID_TEXT_85, $  ;   spectrum file series range
  WID_TEXT_86, $  ;   spectrum file series range
  WID_TEXT_87, $  ;   spectrum file series range
  WID_TEXT_88, $  ;   spectrum file series range
  WID_TEXT_89, $  ;   image series range
  WID_TEXT_90, $  ;   image series range
  WID_TEXT_91, $  ;   image series range
  WID_TEXT_92, $  ;   image series range
  WID_BUTTON_0, $ ; add reference
  WID_BUTTON_1, $ ; close
  WID_BUTTON_2, $ ; recalculate ref
  WID_BUTTON_3, $ ; delete ref
  WID_BUTTON_4, $ ; clear refs
  WID_BUTTON_5, $ ; BG show all nodes
  WID_BUTTON_6, $ ; Threshold  mask
  WID_BUTTON_7, $ ; overlay legend show
  WID_BUTTON_8, $ ; save plot as tiff
  WID_BUTTON_9, $ ; graphic output small
  WID_BUTTON_10, $ ; graphic output small
  WID_BUTTON_11, $ ; plot on printer
  WID_BUTTON_12, $ ; show phase legend
  WID_BUTTON_13, $ ; start fit2d
  WID_BUTTON_14, $ ; locate fit2d
  WID_BUTTON_15, $; unit cell refine
  WID_BUTTON_16, $; reset mlt
  WID_BUTTON_17, $; cal run
  WID_BUTTON_18, $; reset add
  WID_BUTTON_19, $; cal write
  WID_BUTTON_20, $; cal read
  WID_BUTTON_21, $; x axis 2theta
  WID_BUTTON_22, $; x axis dspc
  WID_BUTTON_23, $; spread overl.
  WID_BUTTON_24, $; =>>
  WID_BUTTON_25, $; reset all
  WID_BUTTON_26, $; integrate
  WID_BUTTON_27, $; open file
  WID_BUTTON_28, $; <
  WID_BUTTON_29, $; >
  WID_BUTTON_30, $; READ CHI
  WID_BUTTON_31, $; use mask
  WID_BUTTON_32, $; create mask
  WID_BUTTON_33, $; exchange
  WID_BUTTON_34, $; powder
  WID_BUTTON_35, $; o.k.
  WID_BUTTON_36, $; cancel
  WID_BUTTON_37, $; exit
  WID_BUTTON_38, $; next chi
  WID_BUTTON_39, $; previous chi
  WID_BUTTON_40, $; add overlay
  WID_BUTTON_41, $; delete BG node
  WID_BUTTON_42, $; overlay add
  WID_BUTTON_43, $; overlay del
  WID_BUTTON_44, $; overlay clear
  WID_BUTTON_45, $; overlay mlt -
  WID_BUTTON_46, $; overlay mlt +
  WID_BUTTON_47, $; mask change
  WID_BUTTON_48, $; mask clear
  WID_BUTTON_49, $; pressure -
  WID_BUTTON_50, $; pressure +
  WID_BUTTON_51, $; bcgr fit
  WID_BUTTON_52, $; bcgr subtract
  WID_BUTTON_53, $; fit peaks
  WID_BUTTON_54, $; z
  WID_BUTTON_55, $; z
  WID_BUTTON_56, $; z
  WID_BUTTON_57, $; z
  WID_BUTTON_58, $; z
  WID_BUTTON_59, $; z
  WID_BUTTON_60, $; set cal
  WID_BUTTON_61, $; get cal
  WID_BUTTON_62, $; save chi
  WID_BUTTON_63, $; refine BG
  WID_BUTTON_64, $; use BG marigins
  WID_BUTTON_65, $; phase scale -
  WID_BUTTON_66, $; ovrlay sh +
  WID_BUTTON_67, $; ovrlay sh -
  WID_BUTTON_68, $; phase scale +
  WID_BUTTON_69, $; close fit2d
  WID_BUTTON_70, $; save background
  WID_BUTTON_71, $; truncate
  WID_BUTTON_72, $; profile Gauss
  WID_BUTTON_73, $; profile Lorentz
  WID_BUTTON_74, $; profile Pearson
  WID_BUTTON_75, $; profile pseudo Voigt
  WID_BUTTON_76, $; mask thr max
  WID_BUTTON_77, $; mask thr min
  WID_BUTTON_78, $; mask auto apply
  WID_BUTTON_79, $; BG node Y+
  WID_BUTTON_80, $; BG node Y-
  WID_BUTTON_81, $; destination directory pick
  WID_BUTTON_82, $; image directory
  WID_BUTTON_83, $; BG undo
  WID_BUTTON_84, $; autoprocess image
  WID_BUTTON_85, $; modify existing mask
  WID_BUTTON_86, $; subtract overlay
  WID_BUTTON_87, $; swap with principal
  WID_BUTTON_88, $; search
  WID_BUTTON_89, $; search delete
  WID_BUTTON_90, $; search save
  WID_BUTTON_93, $; delete overlay
  WID_DRAW_0, $      ;
  WID_DRAW_1, $      ;
  WID_DRAW_2, $      ;
  WID_DRAW_3, $      ;
  WID_LIST_0, $      ;
  WID_LIST_1, $      ; peak search list
  WID_LIST_10,$      ;
  WID_LIST_11,$      ;
  WID_LIST_2,$      ;
  WID_LIST_3,$      ;
  WID_SLIDER_0, $
  WID_SLIDER_1, $
  WID_SLIDER_2, $
  WID_DROPLIST_0,$   ; symmetry
  draw,$
  WID_BASE_1, $
  WID_BASE_15, $
  WID_BASE_20, $
  WID_fit2d_shell,$
  WID_BASE_21,$
  WID_BASE_22

  common draw_reference, draw1, draw2


  WID_fit2d_shell = Widget_Base( GROUP_LEADER=wGroup,  $
      UNAME='WID_fit2d_shell' ,YOFFSET=5 ,SCR_XSIZE=1015  $
      ,SCR_YSIZE=806 ,TITLE='GSE_shell   ver 1.02' ,SPACE=3 ,XPAD=3  $
      ,YPAD=3)

  WID_TAB_1 = Widget_Tab(WID_fit2d_shell, UNAME='WID_TAB_1'  $
      ,XOFFSET=2 ,YOFFSET=8 ,SCR_XSIZE=786 ,SCR_YSIZE=760)

  WID_BASE_21 = Widget_Base(WID_TAB_1, UNAME='WID_BASE_21'  $
      ,SCR_XSIZE=775 ,SCR_YSIZE=740 ,TITLE='Analysis' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)

  WID_BASE_22 = Widget_Base(WID_TAB_1, UNAME='WID_BASE_22'  $
      ,SCR_XSIZE=775 ,SCR_YSIZE=740 ,TITLE='Image' ,SPACE=3  $
      ,XPAD=3 ,YPAD=3)

  WID_DRAW_2 = Widget_Draw(WID_base_21, UNAME='WID_DRAW_2'  $
      ,XOFFSET=423 ,YOFFSET=39 ,SCR_XSIZE=364 ,SCR_YSIZE=269)

  WID_DRAW_0 = Widget_Draw(WID_base_21, UNAME='WID_DRAW_0'  $
      ,XOFFSET=5 ,YOFFSET=309 ,SCR_XSIZE=782 ,SCR_YSIZE=446)

  WID_TAB_0 = Widget_Tab(WID_base_21, UNAME='WID_TAB_0'  $
      ,XOFFSET=3 ,YOFFSET=34 ,SCR_XSIZE=416 ,SCR_YSIZE=274)

;----------------------------------------------------------------------------
  ;----------------------------------------------------------------------------


  draw2=wid_draw_2

  WID_LIST_2=WID_LIST_12

  Widget_Control, /REALIZE, WID_fit2d_shell

  common refa, refg

  refg={WID_BUTTON_7  :WID_BUTTON_7,$
        WID_BUTTON_12 :WID_BUTTON_12}


  WID_LIST_11 = Widget_List(WID_fit2d_shell, UNAME='WID_LIST_11'  $
      ,XOFFSET=793 ,YOFFSET=542 ,SCR_XSIZE=195 ,SCR_YSIZE=182  $
      ,XSIZE=11 ,YSIZE=2, /CONTEXT_EVENTS)

  WID_fit2d_shell_aux

  XManager, 'WID_fit2d_shell_L', WID_fit2d_shell, /NO_BLOCK

end
