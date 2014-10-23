pro WID_JCPDS_editor_commons

COMMON JCPDS_editor_objects, ja, dest

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

end

;--------------------------------------------

function read_range
 COMMON JCPDS_editor_commons
 widget_control, wid_text_16, get_value=r1
 widget_control, wid_text_15, get_value=r2
 return, [float(r1), float(r2)]
end
;--------------------------------------------
function read_lambda
 COMMON JCPDS_editor_commons
 widget_control, wid_text_17, get_value=la
 return, float(la)
end
;--------------------------------------------
function read_tth_or_d
 COMMON JCPDS_editor_commons
 re=widget_info(wid_button_3, /button_set)
 return, re
end
;--------------------------------------------

function read_lp_from_jade, file
if re.exists eq 1 then $
 begin
  free_lun, 5
  openr, 5, file
  readf, 5, un
  readf, 5, un
  ss=string
  i=0
  while not(eof(5)) do $
  begin
   readf, 5, ss
   if strmid(ss,0,5) eq 'CELL:' then $
   begin
    a1=strpos(ss,'x')
    a2=strpos(ss,'x',a1+1)
    a3=strpos(ss,'x',a2+1)
    a40=strpos(ss,'<')
    a41=strpos(ss,'x',a40)
    a50=strpos(ss,'<',a41)
    a51=strpos(ss,'x',a50)
    a60=strpos(ss,'<',a51)
    a61=strpos(ss,'x',a60)
    lp=fltarr(6)
    print, float(stmid(ss,6,a1-5))
    print, float(stmid(ss,a1+1,(a2-1)-(a1+1)))
    print, float(stmid(ss,a2+1,(a3-1)-(a2+1)))
    print, float(stmid(ss,6,a1-5))
    print, float(stmid(ss,6,a1-5))
    print, float(stmid(ss,6,a1-5))
  endif
  endwhile
  endif
end

;--------------------------------------------

function read_peaks_from_jade, file
    ref = {jcpds_reflection, $
        d0:    0., $
        d:     0., $
        inten: 0., $
        h:     0, $
        k:     0, $
        l:     0 }
 refs=replicate(ref, 200)
 re=file_info(file)
 un=''
 if re.exists eq 1 then $
 begin
  free_lun, 5
  openr, 5, file
  readf, 5, un
  readf, 5, un
  un7=string(7)
  i=0
  while not(eof(5)) do $
  begin
   readf, 5, un7
   b1 =strpos(un7,' ',2)
   b2 =strpos(un7,' ',b1+1)
   b3 =strpos(un7,')')
   b4 =strpos(un7,STRING(9b),12)
   ;print, b1,b2,b3
   h=strmid(un7, 1, 3)
   k=strmid(un7, b1, 3)
   l=strmid(un7, b2,b3-b2)
   d0=float(strmid(un7, b4, 7))
   inten=float(strmid(un7, b4+7, 6))
   refs[i].h=h
   refs[i].k=k
   refs[i].l=l
   refs[i].d0=d0
   refs[i].inten=inten
   print, h, k, l, d0, inten
  i=i+1
  endwhile
  print, 'finished'
  close, 5
 endif else print, 'file not found'
 return, refs[0:i-1]
end

pro widj_display_V0, v0
 COMMON JCPDS_editor_commons
 WIDGET_CONTROL, WID_TEXT_7, SET_VALUE=string(v0, format='(F8.2)')
end

function widj_read_peak
COMMON JCPDS_editor_commons
sz=size(rs)
sz=sz[1]
um=0
    ref = {jcpds_reflection, $
        d0:    0., $
        d:     0., $
        inten: 0., $
        h:     0, $
        k:     0, $
        l:     0 }
  WIDGET_CONTROL, WID_TEXT_10, GET_VALUE=um
  ref.h=long(um)
  WIDGET_CONTROL, WID_TEXT_11, GET_VALUE=um
  ref.k=long(um)
  WIDGET_CONTROL, WID_TEXT_12, GET_VALUE=um
  ref.l=long(um)
  WIDGET_CONTROL, WID_TEXT_13, GET_VALUE=um
  ref.d0=float(um)
  WIDGET_CONTROL, WID_TEXT_14, GET_VALUE=um
  ref.inten=float(um)
  return, ref
end
;-------------------------------------

pro widj_display_peak, pn, rs
COMMON JCPDS_editor_commons
sz=size(rs)
sz=sz[1]
if pn le sz-1 then $
begin
  WIDGET_CONTROL, WID_TEXT_10, SET_VALUE=string(rs[pn].h, format='(I4)')
  WIDGET_CONTROL, WID_TEXT_11, SET_VALUE=string(rs[pn].k, format='(I4)')
  WIDGET_CONTROL, WID_TEXT_12, SET_VALUE=string(rs[pn].l, format='(I4)')
  WIDGET_CONTROL, WID_TEXT_13, SET_VALUE=string(rs[pn].d0, format='(F8.4)')
  WIDGET_CONTROL, WID_TEXT_14, SET_VALUE=string(rs[pn].inten, format='(I4)')
end
end

;-------------------------------------

pro widj_display_comment, com
COMMON JCPDS_editor_commons
  WIDGET_CONTROL, WID_TEXT_0, SET_VALUE=com
end

;-------------------------------------

function widj_read_comment
COMMON JCPDS_editor_commons
  WIDGET_CONTROL, WID_TEXT_0, GET_VALUE=com
  return, com
end

;-------------------------------------

FUNCTION SYMMETRY_CODE, sym
 CASE sym of
  'CUBIC'       :res=0
  'TETRAGONAL'  :res=1
  'ORTHORHOMBIC':res=2
  'HEXAGONAL'   :res=3
  'RHOMBOHEDRAL':res=4
  'MONOCLINIC'  :res=5
  'TRICLINIC'   :res=6
 else: res=-1
 endcase
 return, res
end

;-------------------------------------
FUNCTION SYMMETRY_NAME, sym
res=''
 CASE sym of
  0:res='CUBIC'
  1:res='TETRAGONAL'
  2:res='ORTHORHOMBIC'
  3:res='HEXAGONAL'
  4:res='RHOMBOHEDRAL'
  5:res='MONOCLINIC'
  6:res='TRICLINIC'
 else: res=''
 endcase
 return, res
end

;-------------------------------------

pro widj_display_reflections, rs
COMMON JCPDS_editor_commons
 sz=size(rs)
 list=''
 sz=sz[1]
 list=string(rs[0].h, format='(I4)')+string(rs[0].k, format='(I4)')+string(rs[0].l, format='(I4)')+string(rs[0].d0, format='(F12.4)')+string(rs[0].inten, format='(I10)')
 if sz gt 1 then $
 for i=1, sz-1 do list=[list, string(rs[i].h, format='(I4)')+string(rs[i].k, format='(I4)')+string(rs[i].l, format='(I4)')+string(rs[i].d0, format='(F12.4)')+string(rs[i].inten, format='(I10)')]
 WIDGET_CONTROL, WID_LIST_0, SET_VALUE=list
end

;-------------------------------------

pro widj_display_symmetry, sym
COMMON JCPDS_editor_commons
  WIDGET_CONTROL, WID_DROPLIST_0, SET_DROPLIST_SELECT=SYMMETRY_CODE(sym)
end

;-------------------------------------

function widj_read_symmetry
COMMON JCPDS_editor_commons
  re=WIDGET_INFO(WID_DROPLIST_0, /DROPLIST_SELECT)
  if re ne -1 then res=SYMMETRY_NAME(re)
  return,res
end

;-------------------------------------

pro widj_display_KS, Ks
COMMON JCPDS_editor_commons
  WIDGET_CONTROL, WID_TEXT_1, SET_VALUE=string(KS[0], format='(F6.2)')
  WIDGET_CONTROL, WID_TEXT_2, SET_VALUE=string(KS[1], format='(F6.2)')
end

;-------------------------------------

function widj_read_KS
COMMON JCPDS_editor_commons
  up=''
  WIDGET_CONTROL, WID_TEXT_1, GET_VALUE=up
  K0=float(up)
  WIDGET_CONTROL, WID_TEXT_2, GET_VALUE=up
  KP=float(up)
  return, [K0, KP]
end

;-------------------------------------
pro widj_display_lp, lp
COMMON JCPDS_editor_commons
  WIDGET_CONTROL, WID_TEXT_9, SET_VALUE=string(lp[0], format='(F8.4)')
  WIDGET_CONTROL, WID_TEXT_8, SET_VALUE=string(lp[1], format='(F8.4)')
  WIDGET_CONTROL, WID_TEXT_3, SET_VALUE=string(lp[2], format='(F8.4)')
  WIDGET_CONTROL, WID_TEXT_6, SET_VALUE=string(lp[3], format='(F8.4)')
  WIDGET_CONTROL, WID_TEXT_5, SET_VALUE=string(lp[4], format='(F8.4)')
  WIDGET_CONTROL, WID_TEXT_4, SET_VALUE=string(lp[5], format='(F8.4)')
end
;-------------------------------------
function widj_read_lp
COMMON JCPDS_editor_commons
  up=''
  lp=fltarr(6)
  WIDGET_CONTROL, WID_TEXT_9, GET_VALUE=up
  lp[0]=float(up)
  WIDGET_CONTROL, WID_TEXT_8, GET_VALUE=up
  lp[1]=float(up)
  WIDGET_CONTROL, WID_TEXT_3, GET_VALUE=up
  lp[2]=float(up)
  WIDGET_CONTROL, WID_TEXT_6, GET_VALUE=up
  lp[3]=float(up)
  WIDGET_CONTROL, WID_TEXT_5, GET_VALUE=up
  lp[4]=float(up)
  WIDGET_CONTROL, WID_TEXT_4, GET_VALUE=up
  lp[5]=float(up)
  return, lp
end
;-------------------------------------

pro WID_JCPDS_editor_event, ev



;******************************* NEW CODE **********************
;Error handling
Catch, GSE_Error
IF GSE_Error NE 0 THEN $
BEGIN
Catch, /Cancel
;Message, 'ERROR:'
ok = Dialog_Message (!Error_State.Msg + ' Returning...', $
                    /Error)
RETURN
ENDIF
;******************************* NEW CODE **********************

COMMON JCPDS_editor_objects

COMMON JCPDS_editor_commons
 WIDGET_CONTROl, ev.id, GET_UVALUE=uv
 case uv of
'Add peak':
'Delete peak':
'Generate peaks':$
begin

  sym=widj_read_symmetry()
  ks=widj_read_KS()
  lp=widj_read_lp()
  range=read_range()
  lam=read_lambda()
  ch=read_tth_or_d()
  ja->set_symmetry, sym
  ja->set_ks, ks
  ja->set_lp0, lp
  ja->set_lp, lp
  if ch eq 0 then ran=range else ran=[d_from_tth_and_en(range[0], A_to_kev(lam)), d_from_tth_and_en(range[1], A_to_kev(lam))]
  if ran[0] gt ran[1] then $
  begin
   ran=[ran[1],ran[0]]
   ;widget_control, wid_text_16, set_value=string(ran[0])
   ;widget_control, wid_text_15, set_value=string(ran[1])
  end
   ja->generate_accessible_peaks, ran, sym
   rs=ja->get_reflections()
   widj_display_reflections, rs
end
'Update peak':$
begin
 rs=ja->get_reflections()
 ref=widj_read_peak()
 re=widget_info(wid_list_0, /list_select)
 if re ne -1 then $
 begin
  rs[re]=ref
  ja->set_reflections, rs
  widj_display_reflections, rs
  widget_control, wid_list_0, set_list_select=re
 end
end

'Open jcpds':$
begin
 fil=Dialog_pickfile(/read, filter='*.jcpds')
 if fil ne '' then $
 begin
   ja->read_file, fil
   rs=ja->get_reflections()
   if N_ELEMENTS(RS) GT 1 then $
   widj_display_reflections, rs
   widj_display_comment, ja->get_comment()
   widj_display_symmetry, ja->get_symmetry()
   widj_display_KS, ja->get_ks()
   widj_display_lp, ja->get_lp()
   widj_display_V0, v_from_lp(ja->get_lp())

 end
end
'Save jcpds':$
begin
 com=widj_read_comment()
 sym=widj_read_symmetry()
 ks=widj_read_KS()
 lp=widj_read_lp()
 ja->set_comment, com
 ja->set_symmetry, sym
 ja->set_ks, ks
 ja->set_lp0, lp
 fil=Dialog_pickfile(/write, filter='*.jcpds', default_extension='jcpds')
 if fil ne '' then $
 begin
   ja->write_file, fil
 end

end
'Import jade':$
begin
  if not obj_valid(ja) then ja=obj_new('JCPDS')
  fil=Dialog_pickfile(/read, filter='*.txt')
  rs=read_peaks_from_jade(fil)
  ja->set_reflections, rs
  widj_display_reflections, rs
end
'range tth':$
begin
  if read_tth_or_d() eq 1 then $
  begin
  range=read_range()
  lam=read_lambda()
  ran=[tth_from_en_and_d(range[0], A_to_kev(lam)), tth_from_en_and_d(range[1], A_to_kev(lam))]
  if ran[0] gt ran[1] then $
  ran=[ran[1],ran[0]]
  widget_control, wid_text_16, set_value=string(ran[0], format='(F8.4)')
  widget_control, wid_text_15, set_value=string(ran[1], format='(F8.4)')
  end
end
'range d':$
begin
  if read_tth_or_d() eq 0 then $
  begin
  range=read_range()
  lam=read_lambda()
  ran=[d_from_tth_and_en(range[0], A_to_kev(lam)), d_from_tth_and_en(range[1], A_to_kev(lam))]
  if ran[0] gt ran[1] then $
  ran=[ran[1],ran[0]]
  widget_control, wid_text_16, set_value=string(ran[0], format='(F8.4)')
  widget_control, wid_text_15, set_value=string(ran[1], format='(F8.4)')
  endif
end


'peak list':$
begin
 re=widget_info(wid_list_0, /list_select)
 rs=ja->get_reflections()
 if re ne -1 then widj_display_peak, re, rs
end
'Close': $
begin
  if dest eq 1  then obj_destroy, ja
  WIDGET_CONTROl, ev.top, /destroy
end
else:
endcase

end

;-------------------------------------

pro WID_JCPDS_editor_aux, fil

COMMON JCPDS_editor_commons
COMMON JCPDS_editor_objects

 if fil ne '' and fil ne 'Use existing object' then $
 begin
   ja->read_file, fil
   rs=ja->get_reflections()
   widj_display_reflections, rs
   widj_display_comment, ja->get_comment()
   widj_display_symmetry, ja->get_symmetry()
   widj_display_KS, ja->get_ks()
   widj_display_lp, ja->get_lp0()
 end else if fil eq 'Use existing object' then $
 begin
   rs=ja->get_reflections()
   widj_display_reflections, rs
   widj_display_comment, ja->get_comment()
   widj_display_symmetry, ja->get_symmetry()
   widj_display_KS, ja->get_ks()
   widj_display_lp, ja->get_lp0()
   end


  WIDGET_CONTROL, WID_BUTTON_0, SET_UVALUE='Add peak'
  WIDGET_CONTROL, WID_BUTTON_1, SET_UVALUE='Delete peak'
  WIDGET_CONTROL, WID_BUTTON_2, SET_UVALUE='Generate peaks'
  WIDGET_CONTROL, WID_BUTTON_3, SET_UVALUE='range d'
  WIDGET_CONTROL, WID_BUTTON_4, SET_UVALUE='range tth'
  WIDGET_CONTROL, WID_BUTTON_5, SET_UVALUE='Update peak'
  WIDGET_CONTROL, WID_BUTTON_6, SET_UVALUE='Open jcpds'
  WIDGET_CONTROL, WID_BUTTON_7, SET_UVALUE='Save jcpds'
  WIDGET_CONTROL, WID_BUTTON_8, SET_UVALUE='Import jade'
  WIDGET_CONTROL, WID_BUTTON_9, SET_UVALUE='Close'


  WIDGET_CONTROL, WID_TEXT_0, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_1, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_2, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_3, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_4, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_5, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_6, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_7, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_8, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_9, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_10, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_11, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_12, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_13, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_14, SET_UVALUE=''
  WIDGET_CONTROL, WID_TEXT_15, SET_UVALUE='range2'
  WIDGET_CONTROL, WID_TEXT_16, SET_UVALUE='range1'
  WIDGET_CONTROL, WID_TEXT_17, SET_UVALUE='lambda'

  WIDGET_CONTROL, WID_TEXT_15, SET_VALUE='10.0'
  WIDGET_CONTROL, WID_TEXT_16, SET_VALUE='0.5'
  WIDGET_CONTROL, WID_TEXT_17, SET_VALUE='0.3344'
  WIDGET_CONTROL, WID_BUTTON_4, SET_Button=1

  WIDGET_CONTROL, WID_TEXT_3, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_4, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_5, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_6, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_8, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_9, EDITABLE=1

  WIDGET_CONTROL, WID_TEXT_10, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_11, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_12, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_14, EDITABLE=1

  WIDGET_CONTROL, WID_TEXT_0, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_1, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_2, EDITABLE=1


  WIDGET_CONTROL, WID_TEXT_17, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_16, EDITABLE=1
  WIDGET_CONTROL, WID_TEXT_15, EDITABLE=1

  list=['CUBIC',$
       'TETRAGONAL',$
       'ORTHORHOMBIC',$
       'HEXAGONAL',$
       'RHOMBOHEDRAL',$
       'MONOCLINIC',$
       'TRICLINIC']

  WIDGET_CONTROL, WID_LIST_0, SET_UVALUE='peak list'
  WIDGET_CONTROL, WID_DROPLIST_0, SET_UVALUE='symmetry'
  WIDGET_CONTROL, WID_DROPLIST_0, SET_VALUE=list



end