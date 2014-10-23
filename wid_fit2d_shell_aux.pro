;------------------------------------------

pro plot_rectangle, pos, draw
 wset, draw
 plots, pos[0], pos[1], color='00ff00'xl, /data
 plots, pos[2], pos[1], /continue, color='00ff00'xl, /data, linestyle=2
 plots, pos[2], pos[3], /continue, color='00ff00'xl, /data, linestyle=2
 plots, pos[0], pos[3], /continue, color='00ff00'xl, /data, linestyle=2
 plots, pos[0], pos[1], /continue, color='00ff00'xl, /data, linestyle=2
end

;------------------------------------------

function mca_bgr, spc, ing
 mca=obj_new('mca')
 mca->set_data, spc
 lal='bottom='+strcompress(string(ing),/remove_all)
 mca1 = mca->FIT_BACKGROUND(bottom=ing[0])
 spc1=mca1->get_data()
 obj_destroy, mca
 obj_destroy, mca1
 return, spc1
end




function test_write, dir
  ON_IOERROR, BAD
  MESSAGE, /RESET

 fn=dir+'xxxx.tst'
 openw, 3, fn, error=err
 close, 3
 BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)
 if err eq 0 then $
 begin
   file_delete, fn
   return, 1
 end else return, 0
end



pro display_image, fn1, drawi
 @COMMON_data
 wset, drawi
 ;print, query_tiff(fn)
 image=read_tiff(fn1)
 image=congrid(image, 650,650)
 tvscl, image
end

;----------------------------------------
pro modify_ovlist, ovlist,zpi
N=zpi->get_n()
if n eq 1 then ovlist = 'background' else $
  begin
    if n ge 2 then $
    begin
      if ovlist[0] eq 'background' then $
      begin ; replace
        zpi->delete_overlay, 1, 0
      endif else $ ; just insert
      begin
        ovlist=[ovlist,'']
        for i=0, n-2 do ovlist[i+1]=ovlist[i]
        ovlist[0]='background'
      endelse
    endif
  endelse
end
;---------------------------------------

;------------------------------------------


pro add_phase, wid_text_0, wid_text_16, phs, nphs,F, refs, xrange

common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user

if nphs lt 10 then $
begin
   p=0.0
   wv=0.0
   widget_control, wid_text_0, get_value=p
   widget_control, wid_text_16, get_value=wv
   if wv ne 0.0 then $
   begin
   abc=fltarr(6)
   file=DIALOG_PICKFILE(/READ, FILTER = '*.jcpds', path=jcpdsdir,GET_PATH=dir)
   if file ne '' then $
   begin
    ;if obj_valid(phs[nphs].j) then obj_destroy, phs[nphs].j
    if not(obj_valid(phs[nphs].j)) then phs[nphs].j=obj_new('jcpds') else $
    begin
     obj_destroy, phs[nphs].j
     phs[nphs].j=obj_new('jcpds')
    endelse

    phs[nphs].j -> read_file, file
    tth=calc_peaks(wv, p,f, abc, sym,phs[nphs].j, file, dir, npks, xrange) ; this routine reads the file
    if npks gt 0 then $
    begin
    phs[nphs].tth[0:npks-1,0:4]=tth
    phs[nphs].npks=npks
    for i=0, npks-1 do phs[nphs].excl[i]=1.0
    phs[nphs].wv=wv
    phs[nphs].p=p
    phs[nphs].abc=abc
    phs[nphs].err=fltarr(6)
    phs[nphs].sym=sym
    phs[nphs].file=file
    phs[nphs].dir=dir
    nphs=nphs+1
    IF NPHS EQ 1 THEN REFS=F ELSE REFS=[REFS,F]
    endif
   endif
   endif

end
end

;------

pro WID_fit2d_shell_commons

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
  WID_TEXT_43, $  ;   match v2
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
  WID_BUTTON_62a, $; save chi
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
  WID_BUTTON_72a, $; profile Gauss
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
  WID_BUTTON_91, $; search save
  WID_BUTTON_92, $; search save
  WID_BUTTON_93, $; delete overlay
  WID_BUTTON_94, $; delete overlay
  WID_BUTTON_95, $; delete overlay
  WID_BUTTON_96, $; delete overlay
  WID_BUTTON_97, $; delete overlay
  WID_BUTTON_98, $; save phase set
  WID_BUTTON_99, $; load phase set
  WID_BUTTON_100, $; load phase set
  WID_BUTTON_101, $; load phase set
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
  WID_DROPLIST_1,$   ; manual adjustment
  draw,$
  WID_BASE_1, $
  WID_BASE_38, $
  WID_BASE_20, $
  WID_fit2d_shell,$
  WID_BASE_21,$
  WID_BASE_22, $
  WIDImg_Button_27, $
  WIDImg_Text_12, $
  WIDImg_Draw_0


   common draw_reference, draw1, draw2, drawi

end



pro delete_phase, phs, nphs, refs, i, file1, dir1

 if i eq nphs-1 then $ ;  ----- deleted phase at the end of the table
 begin
   obj_destroy, phs[i].j
 endif else $
 begin
   phs1=phs[i+1:nphs-1]
   for j=i+1, nphs-1 do phs1[j-i-1].j=phs[j].j->copy_object1() ; create local copy of onjects after the deleted one
   for j=i, nphs-1 do obj_destroy, phs[j].j ; destroy from the deleted object to the end of the table
   phs[i:nphs-2]=phs1
   for j=i, nphs-2 do phs[j].j=phs1[j-i].j->copy_object1() ; duplicate from the local copy
   phs[nphs-1].j=phs[nphs-2].j
   for j=i, nphs-2 do obj_destroy, phs1[j-i].j ; destroy all local phs1
   for j=i, nphs-2 do $
   begin
     refs[j]=refs[j+1]
     file1[j]=file1[j+1]
     dir1[j]=dir1[j+1]
   end
 endelse
 ;--- final steps
 nphs=nphs-1 ; reduce number of phases param. value
 if nphs gt 0 then refs=refs[0:nphs-1] else refs=''

end



function get_principal_spectrum_name
 COMMON WID_fit2d_shell_elements
 widget_control, wid_text_3, get_value=fn
 return, fn
end

function overlay_mltp

 COMMON WID_fit2d_shell_elements
 WIDGET_CONTROl, WID_text_2,  GET_VALUE=step
 step=float(step)
 WIDGET_CONTROl, WID_text_13, GET_VALUE=mltp
 mltp=float(mltp)
 return, [mltp,step]
end

function get_image_filename
  COMMON WID_fit2d_shell_elements
  widget_control, wid_text_12, get_value=fn
  return, fn
end

;----------------------------------------------

function overlay_add

 COMMON WID_fit2d_shell_elements
 WIDGET_CONTROl, WID_text_15,  GET_VALUE=step
 step=float(step)
 WIDGET_CONTROl, WID_text_14, GET_VALUE=mltp
 mltp=float(mltp)
 return, [mltp,step]

end

;----------------------------------------------

function check_xscale
COMMON WID_fit2d_shell_elements
 re1=widget_info(WID_BUTTON_22, /BUTTON_SET)
 return, re1
end


FUNCTION GET_SYMMETRY_CODE
COMMON WID_fit2d_shell_elements
  AL=widget_INFO(wid_DROPLIST_0, /DROPLIST_SELECT)
  IF AL GT -1 THEN $
  begin
  SYM=al;symmetry_CODE(AL)
  RETURN, SYM
  end else return, -1
END


FUNCTION SYMMETRY_NAME, sym
case sym of
        0: symn = 'CUBIC'
        1: symn = 'TETRAGONAL'
        2: symn = 'ORTHORHOMBIC'
        3: symn = 'HEXAGONAL'
        4: symn = 'RHOMBOHEDRAL'
        5: symn = 'MONOCLINIC'
        else: symn = 'TRICLINIC'
endcase
return, symn
END
;--------------------------------------

pro symmetry_selection, sym
 COMMON WID_fit2d_shell_elements
 RE=symmetry_SEL(sym)
 widget_control, wid_DROPLIST_0, Set_DROPLIST_SELECT=RE
end

;--------------------------------------
; PERFORMS LOCAL FITTING OF ONE PEAK WITHIN A SPECIFIED WINDOW
;--------------------------------------
;  9/12/2008 pd
;     -- fixed problem with zoom too close to the spectrum edge
;  9/16/2008 pd
;     -- added limits to intensity and peakwidth

pro fit_one_peak, zpi, wind, theta, yfit, coeff, sig, chisq, spec
common function_names, peak_fit_function
    read_profile_function
    spec1=zpi->get_spectrum(0)
    spec=spec1
    N=n_elements(spec1)/2
    for i=0, N-1 do $
    begin
      spec[i,0]=abs(spec1[i,0]-theta)
    end
    cen=min(spec[0:N-1,0],k)
    IF K GE WIND AND K+WIND LE n-1 THEN $
    BEGIN
    spec=spec1[k-wind:k+wind,0:1]
    X=spec[0:2*wind,0]
    Y=spec[0:2*wind,1]
    start_parms=profile_parameters(peak_fit_function)
    start_parms[0]=max(y)/2.0
    start_parms[1]=theta
    start_parms[2]=0.05

    parinfo = replicate({value:0.D, fixed:0, tied:'',limited:[0,0],limits:[0.,0.] }, n_elements(start_parms))

    parinfo[0].limited    = [1,0]
    parinfo[0].limits[0]  = [0.0] ; Intensity positive
    parinfo[2].limited = [1,1]
    parinfo[2].limits  = [0.,read_width_max()] ; profile width
    parinfo[4].limited = [1,1]
    parinfo[4].limits[0:1]  = [-5.,5.] ; background slope
   ; peak_fit_function='GAUSS_PROFILE_CoKa1a2b'

    if read_flat_background() then parinfo[4].fixed = 1 else parinfo[4].fixed = 0
    if peak_fit_function eq 'GAUSS_PROFILE' then parinfo[5].fixed = 1
    if peak_fit_function eq 'LORENTZ_PROFILE' then parinfo[5].fixed = 1
    if peak_fit_function eq 'PSEUDOVOIGT_PROFILE' then $
    begin
    parinfo[5].limited = [1,1]
    parinfo[5].limits[0:1]  = [0.,1.] ; background slope
    end


    N=n_elements(X)
    Err=fltarr(N)
    for i=0, N-1 do Err=1.0
    fa={X:x, Y:y, Err:Err}
    COMMON parameters, N_profiles, WV, NPHS, NPKARR
    N_profiles=1
    coeff = MPFIT(peak_fit_function, start_parms, parinfo=parinfo, PERROR=sig, BESTNORM=BESTNORM, functargs=fa, quiet=1)

    if n_elements(sig) gt 0 then $
    begin
      DOF     = N_ELEMENTS(X) - N_ELEMENTS(P) ; deg of freedom
      PCERROR = sig * SQRT(BESTNORM / DOF)   ; scaled uncertainties

    endif
    chisq=BESTNORM
    sig=PCERROR

    for i=0, n_elements(Err)-1 do $
    begin
      Err[i]=-1.0
      Y[i]=0.0
    endfor
    y0=fltarr(n_elements(X))
    yfit=call_function(peak_fit_function, coeff, X=x, Y=y0, ERR=err)
    ENDIF
end

;-------------------------------------



;-------------------------------------

pro fit_all_peaks, tth1, zpi, dfit, sdfit, wind, N, excl, pha, refs, ovlist, op, ph
; this procedure performs peak fitting of all the peaks in tth1
COMMON WID_fit2d_shell_elements
common function_names, peak_fit_function
common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user

  ON_IOERROR, BAD
  MESSAGE, /RESET


    re=widget_info(wid_button_21, /button_set)
    fn=get_principal_spectrum_name()
    writing=test_write(destdir)
    if writing eq 0 then re=Dialog_message('Output file cannot be written - No write acess to the destination directiory - please, change spectra dirtectory') else $
    if re eq 1 then $ ; create a file for output
    begin
      free_lun, 9
      free_lun, 8
      fil=destdir+fn+'_'+refs[ph]+'.txt'
      openw, 9, fil
      fil2=destdir+fn+'_'+refs[ph]+'.dat'
      openw, 8, fil2
    end

    widget_control, wid_text_20, get_value=lam
    dfit=fltarr(N)
    sdfit=fltarr(N)
    list=''
    beg=0
    for i=0, N-1 do $
    begin
      ;if excl[i] eq 1 then $
      ;begin
      theta=tth1[i, 0]
      fit_one_peak, zpi, wind, theta, yfit, coeff, sig, chisq, spec
      FWHM=coeff[2]
      Int=coeff[0]
      if peak_fit_function eq 'PEARSON7_PROFILE' then $
      begin
         FWHM=2.0*coeff[2]*sqrt(2.0^(-1.0/coeff[5])-1.0)
         Int=coeff[0]*coeff[2]*sqrt(!pi)*gamma(-coeff[5]-0.5)/gamma(-coeff[5])
         sig[0]=sig[0]*coeff[2]*sqrt(!pi)*gamma(-coeff[5]-0.5)/gamma(-coeff[5])
      end
      dfit[i] =  lam/(2.0*sin(coeff[1]/2.0/!radeg))
      sdfit[i]=  sig[1]*lam*sin(coeff[1]/2.0/!radeg)/(2.0*sin(coeff[1]/2.0/!radeg)*sin(coeff[1]/2.0/!radeg))
      leg='Excl |    hkl     |   2th_c    |  I_calc |   2th_m    | sig(2th_m) | del 2th |     d_m    |     I_m    |  sig(I_m) |  FWHM   |
      leg2='|    hkl     |   2th_m    |
      ;leg=' Excl 2th_c     |    2th_m   |      d      |    FWHM   |  chi^2'
      dth=theta-coeff[1]
      if beg ne 0 and excl[i] eq 1 then $
      begin
      list=[list, string(excl[i], format='(I3)')+string(tth1[i,2], format='(I7)')+string(tth1[i,3], format='(I3)')+string(tth1[i,4], format='(I3)')+$
                     string(theta, format='(F12.3)')+string(tth1[i,1], format='(I9)')+string(coeff[1], format='(F14.4)')+string(sig[1], format='(F12.4)')+string(dth, format='(F12.4)')+string(dfit[i], format='(F12.3)')+$
                                                                string(int, format='(F12.1)')+string(sig[0], format='(F12.3)')+string(FWHM, format='(F12.3)')]
      list2=[list2, string(tth1[i,2], format='(I7)')+string(tth1[i,3], format='(I3)')+string(tth1[i,4], format='(I3)')+$
                     string(coeff[1], format='(F14.4)')]


      endif else if excl[i] eq 1 then $
      begin
                     list=     [leg, '',string(excl[i], format='(I3)')+string(tth1[i,2], format='(I7)')+string(tth1[i,3], format='(I3)')+string(tth1[i,4], format='(I3)')+$
                     string(theta, format='(F12.3)')+string(tth1[i,1], format='(I9)')+string(coeff[1], format='(F14.4)')+string(sig[1], format='(F12.4)')+string(dth, format='(F12.4)')+string(dfit[i], format='(F12.3)')+$
                                                           string(int, format='(F12.1)')+string(sig[0], format='(F12.3)')+string(FWHM, format='(F12.3)')]
                     list2=     [leg2, '',string(tth1[i,2], format='(I7)')+string(tth1[i,3], format='(I3)')+string(tth1[i,4], format='(I3)')+$
                     string(coeff[1], format='(F14.4)')]
                     beg=1
      end
      list2=[list2,'0  0  0']
   ;end
    endfor

    if re eq 1 and writing eq 1  then $ ; close output sile and spawn Write to display it
    begin
      printf, 9, fn+'  '+refs[ph]
      printf, 9, '-------------------------------'
      printf, 9,''
      printf, 9, 'Results of peak fitting:'
      printf, 9, ''
      printf, 9, peak_fit_function+' function used'
      printf, 9, ''
      printf, 9, list
      printf, 8, list2
      close, 9
      free_lun, 9
      close, 8
      free_lun, 8
      if op eq 1 then spawn, 'Write.exe '+fil, /nowait
    end

    ;widget_control, wid_list_11, set_value=list
  BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)

end

;-------------------------------------
pro print_V, V
COMMON WID_fit2d_shell_elements
 widget_control, wid_text_44, set_value=string(V, format='(F9.2)')

end
;-------------------------------------

pro print_lp, lp, err
COMMON WID_fit2d_shell_elements

 widget_control, wid_text_10, set_value=string(lp[0], format='(F9.4)')
 widget_control, wid_text_9,  set_value=string(lp[1], format='(F9.4)')
 widget_control, wid_text_8,  set_value=string(lp[2], format='(F9.4)')
 widget_control, wid_text_23, set_value=string(lp[3], format='(F9.3)')
 widget_control, wid_text_22, set_value=string(lp[4], format='(F9.3)')
 widget_control, wid_text_11, set_value=string(lp[5], format='(F9.3)')
 if n_params() eq 2 then $
 begin
  widget_control, wid_text_27, set_value=string(err[0], format='(F9.4)')
  widget_control, wid_text_28,  set_value=string(err[1], format='(F9.4)')
  widget_control, wid_text_29,  set_value=string(err[2], format='(F9.4)')
  widget_control, wid_text_24, set_value=string(err[3], format='(F9.4)')
  widget_control, wid_text_25, set_value=string(err[4], format='(F9.4)')
  widget_control, wid_text_26, set_value=string(err[5], format='(F9.4)')
 end

end
;--------------------------------------

pro print_dsp, tth, NPKS, excl
COMMON WID_fit2d_shell_elements
    widget_control, wid_text_20, get_value=lam
    lam=float(lam)
 if npks gt 0 then $
 begin
 te=['Excl |    hkl     |   2th_c    | d_calc |  I_calc  ','']
 d =  lam/(2.0*sin(tth[0,0]/2.0/!radeg))
 te=[te,string(excl[0], format='(I3)')+string(tth[0,2], format='(I7)')+string(tth[0,3], format='(I3)')+string(tth[0,4], format='(I3)')+string(tth[0,0], format='(F12.3)') $
 +string(d, format='(F12.3)') +string(tth[0,1], format='(I9)')]
 for i=1, NPKS-1 do $
 begin
    d =  lam/(2.0*sin(tth[i,0]/2.0/!radeg))
    te=[te,string(excl[i], format='(I3)')+string(tth[i,2], format='(I7)')+string(tth[i,3], format='(I3)')+string(tth[i,4], format='(I3)')+string(tth[i,0], format='(F12.3)') $
    +string(d, format='(F12.3)')+string(tth[i,1], format='(I9)')]
 endfor
 end else te=''
 widget_control,  wid_list_11, set_value=te
end

;--------------------------------------


pro display_cal, cal
COMMON WID_fit2d_shell_elements

 widget_control, wid_text_19, set_value=string(cal.xpix, format='(F9.2)')
 widget_control, wid_text_18, set_value=string(cal.ypix, format='(F9.2)')
 widget_control, wid_text_17, set_value=string(cal.dist  , format='(F9.2)')
 widget_control, wid_text_16, set_value=string(cal.wavel , format='(F9.5)')
 widget_control, wid_text_20, set_value=string(cal.wavel , format='(F9.5)')
 widget_control, wid_text_83, set_value=string(cal.xbeam , format='(F9.2)')
 widget_control, wid_text_82, set_value=string(cal.ybeam , format='(F9.2)')
 widget_control, wid_text_81, set_value=string(cal.tilt  , format='(F9.4)')
 widget_control, wid_text_80, set_value=string(cal.angle , format='(F9.4)')
end


pro get_cal_wid, cal
COMMON WID_fit2d_shell_elements
 al=0.0
 widget_control, wid_text_19, get_value=al
 cal.xpix=al
 widget_control, wid_text_18, get_value=al
 cal.ypix=al
 widget_control, wid_text_17, get_value=al
 cal.dist=al
 widget_control, wid_text_16, get_value=al
 widget_control, wid_text_20, set_value=al
 cal.wavel=al
 widget_control, wid_text_83, get_value=al
 cal.xbeam=al
 widget_control, wid_text_82, get_value=al
 cal.ybeam=al
 widget_control, wid_text_81, get_value=al
 cal.tilt=al
 widget_control, wid_text_80, get_value=al
 cal.angle=al
end


;-----------------------------------------


pro WID_fit2d_shell_L_event, ev


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


 ON_IOERROR, BAD
 MESSAGE, /RESET


  COMMON JCPDS_editor_objects, ja, dest
common function_names, peak_fit_function
COMMON data

COMMON BOX_COORDS, X1,X2,Y1,Y2, SEL1, SEL2, LISTEN,Xa1,Xa2,Ya1,Ya2, ox, oy
common draw_reference
COMMON cont, contextBase, contextBase1
common fit2dstatus, fit2d_online
common BG_nodes, nodes

common zoomob, zpi, zoo
; nsp - numer of spectra in the memory

COMMON WID_fit2d_shell_elements
common phases, phs, nphs
common timers, image_timer_status
common filesetup


 WIDGET_CONTROl, ev.id, GET_UVALUE=uv

if uv eq 'Draw' then $
begin
  ;if  ev.release eq 4 and zoo eq 0 then $
  ;begin
  ; WIDGET_DISPLAYCONTEXTMENU, WID_DRAW_0, ev.X-100, ev.Y-300, contextBase
  ;end
  cursor, xa, ya, /data, /nowait
  WIDGET_CONTROL, WID_TEXT_5, SET_VALUE=string(xa, format='(F8.3)')
  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)
  WIDGET_CONTROL, WID_TEXT_6, SET_VALUE=string(la/(2.0*sin(xa/!radeg/2.0)), format='(F8.3)')
  WIDGET_CONTROL, WID_TEXT_35, SET_VALUE=string(1.0/(la/(2.0*sin(xa/!radeg/2.0))), format='(F8.3)')
  ;WIDGET_CONTROL, WID_TEXT_7, SET_VALUE=string(ya, format='(F8.1)')
end

 case uv of
 'Close': $
 begin
   if fit2d_online eq 1 then exit_from_fit2d, un
   fn=''
   for i=0, nphs do obj_destroy, phs[i].j
   WIDGET_CONTROl, ev.top, /destroy
 end
 'Open': $ ; Opening image
 begin
   fn=Dialog_pickfile(/read, filter=['*.tif', '*.tiff','*.mar3450','*.MAR3450'],  PATH=datadir, GET_PATH=path)
   if fn ne '' then $
   begin
     if path ne '' then $
     begin
       datadir=path
       widget_control, wid_text_38, set_value=datadir
       write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
     end

     integrated=0
     open_file, un, fn, cal
     ;display_image, fn, wid_draw_1
     res=analyse_fname(fn, 3)
     sstart=find_series_start(res)
     send=find_series_end(res)
     widget_control, wid_text_92, set_value=string(sstart, format='(I4)')
     widget_control, wid_text_91, set_value=string(send, format='(I4)')
     widget_control, wid_text_89, set_value=string(sstart, format='(I4)')
     widget_control, wid_text_90, set_value=string(send, format='(I4)')
     flush_the_buffer, un
     tl=strlen(path)
     ttl=strlen(fn)
     widget_control, wid_text_12, set_value=strmid(fn, tl,ttl-tl)

	 ; Autoapply threshold mask

	  if use_mask() eq 0 then clear_mask, un

      z=auto_thershold_mask()
      if z[0] eq 1 then $
      begin
        clear_mask, un
        PRINTF, UN,  'Mask'
      	PRINTF, UN,  'THRESHOLD MASK'
      	PRINTF, UN,  'NO'
      	WIDGET_CONTROL, WID_TEXT_21, GET_VALUE=thr
      	PRINTF, UN,  thr
      	PRINTF, UN,  'EXIT'
      	flush_the_buffer, un
      endif
     ;--- open image in Draw widget
     ;read_mar345, fn, data, header
     ;data1=congrid(data, 650,650)
     ;wset, WID_DRAW_1
     ;tv, data1
   end
 end
'Read cal':$
begin
  fni=Dialog_pickfile(/read, filter='*.cal', path=destdir, get_path=path, default_extension='cal')
  cal=load_cal(fni, cal)
  set_calibration, un, cal
  display_cal, cal
end
'Integrate':$
begin
 if res.base ne '' then $
 begin
  redir=file_info(destdir)
  if redir.exists eq 0 or test_write(destdir) eq 0 then r=dialog_message('Spectra destination directory does not exist or you have no write permission. Change spectra directory.', /error) else $
  begin
  integrate, un
  flush_the_buffer, un
  chin=generate_chiname(res, -1)
  reschi=analyse_fname(chin, 3)
  aa=file_info(chin)
  if aa.exists eq 1 then FILE_DELETE, chin
  SAVE_CHI, un, chin
  PRINTF, UN,  'Exchange'
  eg=file_info(chin)
  while eg.exists eq 0 do eg=file_info(chin)
  wait, 1.0
  spec1=read_data_from_chi(chin)
  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  tl=strlen(destdir)
  ttl=strlen(chin)
  widget_control, wid_text_3, set_value=strmid(chin, tl,ttl-tl-4)
  if nsp eq 0 then zpi->add_spectrum_0,spec1, la else $
  zpi->add_spectrum_0a,spec1, la

  integrated=1
  nsp=1

   reschi=analyse_fname(chin, 3)
   sstart=find_series_start(reschi)
   send=find_series_end(reschi)
   plot_all_references, zpi, phs, draw, nphs
   widget_control, wid_text_85, set_value=string(sstart, format='(I4)')
   widget_control, wid_text_86, set_value=string(send, format='(I4)')
  endelse
endif
end
'Write cal':$
begin
  fni=Dialog_pickfile(/write, filter='*.cal', path=path, get_path=path, default_extension='cal')
  get_cal_wid, cal
  if fni ne '' then save_cal, fni, cal
end
'run cal':$
begin
  if fn ne '' then $
  begin
   mac_change_file_name, calibratescriptfile, fn
   spawn, fit2dexefile+" -mac"+calibratescriptfile, RESi
   free_lun, 2
   openw, 2, datadir+'log.cal0'
   printf,2, resi
   close, 2
   retrieve_cal, fn, un, cal
  endif
end
'SAVE CHI FILE':$ ; fit2d output chi
BEGIN
if nsp gt 0 then $
begin
  if integrated eq 1 then $
  begin
   fni=Dialog_pickfile(/write, filter='*.CHI', path=path, get_path=path, DEFAULT_EXTENSION='chi')
   if fni ne '' then $
   SAVE_CHI, un, FNI
  end
end
END
'Use mask':$
begin
 fn=get_image_filename()
  re=widget_info(WID_BUTTON_31, /button_set)
  if re eq 1 and fn ne '' then $
  begin
   widget_control, wid_text_4, get_value=fni
   if fni ne '' then $
   begin
     load_mask, un, fni
   endif else widget_control, WID_BUTTON_31, set_button=0
  endif else if re eq 0 then $
  begin
    if fn eq '' then $
    begin
     widget_control, WID_BUTTON_31, set_button=0
    endif else $
    begin
     clear_mask, un
    endelse
  end
  if re eq 1 and fn eq '' then $
  begin
    a=dialog_message('You have to open an image first', /error)
    widget_control, WID_BUTTON_31, set_button=0
  endif


end
'next file':$
begin
   if res.base ne '' then $
   begin
   res1=res
   res1.seq=res1.seq+1
   fn1=generate_fname(res1, 3)
   path=file_dirname(fn1)
   r=file_info(fn1)
   if r.exists eq 1 then $
   begin
    open_file, un, fn1, cal
    fn=fn1
    print, fn1
    res=res1
    tl=strlen(path)
    ttl=strlen(fn1)
    widget_control, wid_text_12, set_value=strmid(fn1, tl+1,ttl-tl)
   endif
   endif
end
'previous file':$
begin
   if res.base ne '' then $
    begin
    res1=res
    if res1.seq ge 1 then $
    begin
    res1.seq=res1.seq-1
    fn1=generate_fname(res1, 3)
    path=file_dirname(fn1)
    r=file_info(fn1)
    if r.exists eq 1 then $
    begin
     open_file, un, fn1, cal
     fn=fn1
     print, fn1
     res=res1
     tl=strlen(path)
     ttl=strlen(fn1)
     widget_control, wid_text_12, set_value=strmid(fn1, tl+1,ttl-tl)
    endif
    end
   end
end
'create mask':$
begin
  fn=get_image_filename()
  if fn ne '' then $
  begin
    mac_change_file_name, maskscriptfile, datadir+fn
    spawn, fit2dexefile+" -mac"+maskscriptfile
  end else $
  begin
    a=dialog_message('You have to open an image first', /error)
  endelse

end
'autoprocess':$
begin
 if res.base ne '' then $
 begin
 redir=file_info(destdir)
 if redir.exists eq 0 or test_write(destdir) eq 0 then r=dialog_message('Spectra destination directory does not exist or you have no write permission. Change spectra directory.', /error) else $
 begin
  widget_control, wid_text_89, get_value=sstart
  sstart=long(sstart)
  widget_control, wid_text_90, get_value=send
  send=long(send)
  res1=res
  for i=sstart[0], send[0] do $
  begin
   res1.seq=i
   fn1=generate_fname(res1, 3)
   open_file, un, fn1, cal
   print, fn1



   integrate, un
   flush_the_buffer, un
   chin=generate_chiname(res, i)
   reschi=analyse_fname(chin, 3)
   aa=file_info(chin)
   if aa.exists eq 1 then FILE_DELETE, chin
   SAVE_CHI, un, chin
   PRINTF, UN,  'Exchange'
   eg=file_info(chin)
   while eg.exists eq 0 do eg=file_info(chin)
   wait, 1.0
   spec1=read_data_from_chi(chin)
   WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
   la=float(la)

   if nsp eq 0 then zpi->add_spectrum_0,spec1, la else $
   zpi->add_spectrum_0a,spec1, la
   integrated=1
   nsp=1
   tl=strlen(destdir)
   ttl=strlen(chin)
   widget_control, wid_text_3, set_value=strmid(chin, tl,ttl-tl-4)

   reschi=analyse_fname(chin, 3)
   sstart=find_series_start(reschi)
   send=find_series_end(reschi)
   plot_all_references, zpi, phs, draw, nphs
   widget_control, wid_text_85, set_value=string(sstart, format='(I4)')
   widget_control, wid_text_86, set_value=string(send, format='(I4)')

  endfor
  endelse
  endif
end

'Fexit': PRINTF, UN,  'Exit'
'Fcancel': PRINTF, UN,  'Cancel'
'Fok': PRINTF, UN,  'O.K.'
'Fpowder': PRINTF, UN,  'Powder'
'Fexchange': PRINTF, UN,  'Exchange'

'wavelength':$
begin
  widget_control, wid_text_20, get_value=wv

  if finite(float(wv)) eq 1 then  $
  begin
    wave=float(wv)
    write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
  end
end
'add reference':$
begin
  if nsp gt 0 then $
  begin
   f=''
   add_phase, wid_text_0, wid_text_20, phs, nphs,F, refs, zpi->tth_range(peakfit_window())
   ;add_phase, wid_text_0, wid_text_20, phs, nphs,F, refs, zpi->tth_range0()
   if nphs gt 0 then $
   begin
   file1[nphs-1]=phs[nphs-1].file
   dir1[nphs-1]=phs[nphs-1].dir
   symmetry_selection, phs[nphs-1].sym
   print_lp, phs[nphs-1].abc, phs[nphs-1].err
   print_V, phs[nphs-1].j->compute_v()
   zpi->plot
   plot_all_references, zpi, phs, draw1, nphs
   for i=0, phs[nphs-1].NPKS-1 do  phs[nphs-1].excl[i]=1.0
   if nphs gt 0 then print_dsp, phs[nphs-1].tth,  phs[nphs-1].NPKS, phs[nphs-1].excl
   WIDGET_CONTROL, WID_LIST_10,SET_VALUE=REFS
   WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=nphs-1
   endif
  endif
end
'JCPDS editor':$
begin
  re=widget_info(wid_list_10, /list_select)
  if re ge 0 then $
   ja=phs[re].j->copy_object()
   if re ge 0 and nphs gt 0  then JCPDS_editor, file1[re], WID_fit2d_shell, wave else JCPDS_editor, '', WID_fit2d_shell, wave

end
'recalc reference':$
begin
 all=apply_to_all()
 if all eq 0 then $
begin
re=widget_info(wid_list_10, /list_select)
  if re gt -1 and nphs gt 0 then $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_0, get_value=p
    p=float(p)
    widget_control, wid_text_20, get_value=wv
    tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re], npks, zpi->tth_range(peakfit_window())) ;****
    for i=0, npks-1 do phs[re].excl[i]=1
    phs[re].tth[0:npks-1,0:4]=tth
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
    print_lp, phs[nphs-1].abc, phs[nphs-1].err
    print_V, phs[nphs-1].j->compute_v()
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    case n_elements(refs) of
     1:refs=[f1]
     else:refs[re]=f1
    endcase
    if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
    WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
    WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re
  endif
  endif else $
  begin
  for re=0, nphs-1 do $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_0, get_value=p
    p=float(p)
    widget_control, wid_text_20, get_value=wv
    tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re], npks, zpi->tth_range(peakfit_window())) ;****
    for i=0, npks-1 do phs[re].excl[i]=1
    phs[re].tth[0:npks-1,0:4]=tth
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
    print_lp, phs[nphs-1].abc, phs[nphs-1].err
    print_V, phs[nphs-1].j->compute_v()
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    case n_elements(refs) of
     1:refs=[f1]
     else:refs[re]=f1
    endcase
    if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
    WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
    WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re
  endfor

  end

 end

'del reference':$
begin
  ref=widget_info(wid_list_10, /list_select)
  if ref gt -1 then $
  begin
   delete_phase, phs, nphs, refs, ref, file1, dir1
   WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
   if nphs gt 0 then $
   begin
   if ref eq nphs then $
   re=ref-1 else $
   re=ref
   WIDGET_CONTROL, WID_LIST_10,SET_list_select=re
   tth=phs[re].tth
   if nphs gt 0 then print_dsp, phs[re].tth, phs[re].npks,phs[re].excl
   symmetry_selection, phs[re].sym
   print_lp, phs[re].abc, phs[re].err
   print_V, phs[re].j->compute_v()
   widget_control, wid_text_0, set_value=string(phs[re].p)
   widget_control, wid_text_36, set_value=string(phs[re].scl)


   endif else WIDGET_CONTROL, WID_LIST_11,SET_value=''
   zpi->plot
   plot_all_references, zpi, phs, draw1, nphs
  end
end
'LIST 0':$ ; BG nodes
begin
 re=widget_info(wid_list_0, /list_select)
 if re ne -1 then $
 begin
   zpi->plot
   plot_all_references, zpi, phs, draw1, nphs
   wset, draw
   sz=size(nodes)
   sz=sz[1]
   for i=0, sz-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
   plots, nodes[re,0], nodes[re,1], psym=2, color='FF0000'XL
 endif
end

'LIST 1':$ ;----- PHASE LIST --------
begin
 re=widget_info(wid_list_10, /list_select)
 if re ne -1 then $
 begin
       tth=phs[re].tth
       if nphs gt 0 then print_dsp, phs[re].tth, phs[re].npks,phs[re].excl
       symmetry_selection, phs[re].sym
       print_lp, phs[re].abc, phs[re].err
       print_V, phs[re].j->compute_v()
       widget_control, wid_text_0, set_value=string(phs[re].p)
       widget_control, wid_text_36, set_value=string(phs[re].scl)
 end
end

'LIST 11':$ ;---- PEAK LIST --------
begin

;---- display context menu for exclusions

  IF (TAG_NAMES(ev, /STRUCTURE_NAME) EQ 'WIDGET_CONTEXT') then $
  begin
   RE=WIDGET_INFO(WID_LIST_11, /LIST_SELECT)
   IF RE GT -1 THEN $
   WIDGET_DISPLAYCONTEXTMENU, WID_LIST_11, ev.X, ev.Y, contextBase1
  end

;---- perform individual peak fitting

 ph=widget_info(wid_list_10, /list_select) ; phase
 re=widget_info(wid_list_11, /list_select) ; peak number
 if re gt 1 and ph gt -1 then $
 begin
    re=re-2
    theta=phs[ph].tth[re]
    WIDGET_CONTROL, WID_TEXT_1,GET_VALUE=wind
    fit_one_peak, zpi, long(wind), theta, yfit, coeff, sig, chisq, spec
    if n_elements(yfit) gt 0 then $ ; -- if 0 then fitting failed for some reason
    begin
     dif=spec[0:2*long(wind)-1,1]-yfit
     ;sens=min(dif)
     sens=min(yfit)
     zpi->plot
     plot_all_references, zpi, phs, draw1, nphs, re
     plot_spectrum,spec[0:2*long(wind)-1,0:1] , nrefs, refs, tth1, tth2, tth3, wid_draw_2, sens, 2, 0,1,zpi, phs, nphs, re
     oplot, spec[0:2*long(wind)-1,0],yfit
     oplot, spec[0:2*long(wind)-1,0],sens+dif, color='00FF00'XL
    endif
 end
end
'LIST 3':$
begin
 re=widget_info(wid_list_3, /list_select)
 if re ne -1 then $
 begin
    theta=phs[re].tth[0]
    fit_one_peak, zpi, 10, theta, yfit, coeff, sig, chisq, spec
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    plot_spectrum,spec, nrefs, refs, tth1, tth2, tth3, wid_draw_2, sens, 2, 0,1, zpi, phs, nphs
    ;wset, wid_draw_2
    oplot, spec[0:20,0],yfit
 end
end
'clear reference':$
begin
  NREFS=0
  nphs=0
  sens=[0,0,0]
  zpi->plot
  refs=''
  ;WIDGET_CONTROL, WID_LIST_10,SET_VALUE=REFS
  WIDGET_CONTROL, WID_LIST_10,SET_VALUE=''
  WIDGET_CONTROL, WID_LIST_11,SET_value=''
end
'Fit peaks':$
begin
 if NPHS gt 0 then $
 begin
  ph=widget_info(wid_list_10, /list_select) ; phase
  if ph gt -1 then $
  begin
    tth=phs[ph].tth
    WIDGET_CONTROL, WID_TEXT_1,GET_VALUE=wind
    fit_all_peaks, tth, zpi, dfit, sdfit, long(wind), phs[ph].npks, phs[ph].excl, ph, refs, ovlist, 1, ph
    ;plot_all_references, zpi, phs, draw1, nphs
  endif
 endif
end

'Fit unit cell':$
begin
 if NPHS gt 0 then $
 begin
  ph=widget_info(wid_list_10, /list_select) ; phase
  if ph gt -1 then $
  begin


   WIDGET_CONTROL, WID_TEXT_1,GET_VALUE=wind
   tth=phs[ph].tth
   fit_all_peaks, tth, zpi, dfit, sdfit, long(wind), phs[ph].npks, phs[ph].excl, ph, refs, ovlist, 0, ph

    re=widget_info(wid_button_22, /button_set)
    fn=get_principal_spectrum_name()
    writing=test_write(destdir)
    if writing eq 0 then re=Dialog_message('Output file cannot be written - No write acess to the destination directiory - please, change spectra dirtectory') else $
    if re eq 1 then $ ; create a file for output
    begin
      free_lun, 8
      fil=destdir+fn+'_'+refs[ph]+'.txt'
      openu, 8, fil, /append
    end

   sz=size(dfit)
   N=sz[1]
   hkls=transpose(tth[0:N-1,2:4])
   SYM=GET_SYMMETRY_CODE()
   excl=intarr(N)
   for i=0, N-1 do excl[i]=1
   j = obj_new('jcpds')
   j -> read_file, file1[ph]
   j -> compute_v0
   j -> calculate_abc, phs[ph].p
   abc=j->get_lp()
   lp=automatic_lp_refinement3(abc, dfit, hkls, convert_symmetry_from_vg(SYM), phs[ph].excl[0:phs[ph].npks-1])
   abc=lp[0:5]
   j->set_lp, abc
   p=j->bm3_pressure()
   V=j->compute_V()
   print, 'Pressure: ', p
   widget_control, wid_text_0, set_value=string(p, format='(F6.2)')
   err= lp[6:11]
   print_lp, abc, err
   print_V, V
   obj_destroy, j

   ta=['a     =', 'b     =','c     =','alpha =','beta  =','gamma =']
   if re eq 1 and writing eq 1 then $ ; close output sile and spawn Write to display it
   begin
      printf, 8,''
      printf, 8,'Results of unit cell parameter refinement:'
      printf, 8,''
      for i=0, 5 do printf, 8, ta[i]+string(lp[i], format='(F12.4)')+string(lp[6+i], format='(F12.4)')
      printf, 8,''
      printf,8, 'Refined unit cell volume: ', V, ' A^3'
      printf, 8,''
      printf,8, 'Refined pressure: ', p, ' GPa'
      close, 8
      free_lun, 8
      spawn, 'Write.exe '+fil, /nowait
   end



   ENDIF
 end
end

'Zma+':$
  begin
    PRINTF, UN, 'Z-SCAL'
    PRINTF, UN, '+ MAXIM'
    PRINTF, UN, 'EXIT'
    flush_the_buffer, un
  end
'Zma-':$
  begin
    PRINTF, UN, 'Z-SCAL'
    PRINTF, UN, '- MAXIM'
    PRINTF, UN, 'EXIT'
    flush_the_buffer, un
  end
'Zmi-':$
  begin
    PRINTF, UN, 'Z-SCAL'
    PRINTF, UN, '+ MINI'
    PRINTF, UN, 'EXIT'
    flush_the_buffer, un
end
'Zmi+':$
  begin
    PRINTF, UN, 'Z-SCAL'
    PRINTF, UN, '- MIN'
    PRINTF, UN, 'EXIT'
    flush_the_buffer, un
  end
'Zls':$
  begin
    PRINTF, UN, 'Z-SCAL'
    PRINTF, UN, 'L'
    PRINTF, UN, 'EXIT'
    flush_the_buffer, un
  end
'Zwp':$
  begin
    PRINTF, UN, 'Z-SCAL'
    PRINTF, UN, 'WEAK PEAKS'
    PRINTF, UN, 'EXIT'
    flush_the_buffer, un
  end
  ;----------------------------------------------------------------------------
 'Read chi':$
 begin
  MESSAGE, /RESET
  chin=Dialog_pickfile(/read, filter=['*.chi', '*.mdi'],  path=destdir, get_path=path)
  if chin ne '' then $
  begin
  if path ne '' then $
  begin
    destdir=path
    write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
  end
   len=strlen(chin)
   ext=strmid(chin, len-3,3)
   print, ext
   WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
   la=float(la)
   nsp=nsp+1
   if ext eq 'chi' then spec1=read_data_from_chi(chin) else $
   if ext eq 'mdi' then spec1=read_mdi(chin)

   reschi=analyse_fname(chin, 3)
   sstart=find_series_start(reschi)
   send=find_series_end(reschi)

   widget_control, wid_text_85, set_value=string(sstart, format='(I4)')
   widget_control, wid_text_86, set_value=string(send, format='(I4)')

   ;widget_control, wid_text_88, set_value=string(sstart, format='(I4)')
   ;widget_control, wid_text_87, set_value=string(send, format='(I4)')

   path=file_dirname(chin)
   zpi->add_spectrum_0, spec1, la
   tl=strlen(path)
   ttl=strlen(chin)
   widget_control, wid_text_3, set_value=strmid(chin, tl,ttl-tl-4)
   if nsp eq 0 then nsp=1
   zpi->plot
   if nphs gt 0 then    plot_all_references, zpi, phs, draw1, nphs
  endif
 end
 ;----------------------------------------------------------------------------
 'BG add terminals':$
 begin
  if nsp gt 0 then $
  begin
  WIDGET_CONTROl, WID_text_32, GET_VALUE=in
  WIDGET_CONTROl, WID_text_33, GET_VALUE=ten
  print, '---------------'
  spec1=zpi->get_spectrum(0)
  N=size(spec1)
  N=N[1]
  NODES=[transpose([spec1[0,0],spec1[0,1]]),NODES,transpose([spec1[N-1,0],spec1[N-1,1]])]
  bcgr=refine_background(spec1[0:N-1,0:1],float(ten), NODES)
  bc=fltarr(N-1,2)
  bc[0:N-2,0]=spec1[0:N-2,0]
  bc[0:N-2,1]=bcgr[0:N-2] ; here teh bg is stored

  SZ=SIZE(NODES)
  N=SZ[1]
  TE=STRING(nodes[0,0], FORMAT='(f10.3)')+STRING(nodes[0,1], FORMAT='(f12.1)')
  FOR I=1,  N-1 DO te=[te,STRING(nodes[i,0], FORMAT='(f10.3)')+STRING(nodes[i,1], FORMAT='(f12.1)')]
  WIDGET_CONTROL, WID_list_0, sET_VALUE=TE



  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background
  if nsp ge 2 then $
   if ovlist[0] eq 'background' then $
   begin
     zpi->delete_overlay, 1, 0
     if nsp gt 2 then for i=0, nsp-2 do $
     begin
       ovlist[i]=ovlist[i+1]
       ovlist=ovlist[0:nsp-2]
     end
     nsp=nsp-1
   end

  if nsp eq 1  then $
  ovlist=['background'] else $
  begin
   ovlist=[ovlist,'']
   for i=0, n_elements(ovlist)-2 do ovlist[i+1]=ovlist[i]
   ovlist[0]=['background']
  end
  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1
  plot_all_references, zpi, phs, draw1, nphs
  nsp=nsp+1
  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
  endif

 end
 end

 ;--------------------------------------------------------------------------

'refine BG.':$
 begin
  if nsp gt 0 then $
  begin
  WIDGET_CONTROl, WID_text_32, GET_VALUE=in
  WIDGET_CONTROl, WID_text_33, GET_VALUE=ten
  print, '---------------'
  spec1=zpi->get_spectrum(0)
  N=size(spec1)
  N=N[1]

  bcgr=refine_background(spec1[0:N-1,0:1],float(ten), NODES)
  bc=fltarr(N-1,2)
  bc[0:N-2,0]=spec1[0:N-2,0]
  bc[0:N-2,1]=bcgr[0:N-2] ; here teh bg is stored

  SZ=SIZE(NODES)
  N=SZ[1]
  TE=STRING(nodes[0,0], FORMAT='(f10.3)')+STRING(nodes[0,1], FORMAT='(f12.1)')
  FOR I=1,  N-1 DO te=[te,STRING(nodes[i,0], FORMAT='(f10.3)')+STRING(nodes[i,1], FORMAT='(f12.1)')]
  WIDGET_CONTROL, WID_list_0, sET_VALUE=TE



  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background

  modify_ovlist, ovlist, zpi

  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1
  plot_all_references, zpi, phs, draw1, nphs
  nsp=nsp+1
  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
  endif

 end


 end

 ;--------------------------------------------------------------------------

 'Fit bcgr':$
 begin
  if zpi->get_n() gt 0 then $
  begin

       zp=zpi->get()
       zp.mlt[0:9]=[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0]
       zp.add[0:9]=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add

  WIDGET_CONTROl, WID_text_32, GET_VALUE=in ; interval
  WIDGET_CONTROl, WID_text_33, GET_VALUE=ten
  WIDGET_CONTROl, WID_text_34, GET_VALUE=marig
  marig=long(marig)
  print, '---------------'
  spec1=zpi->get_spectrum(0)
  N=size(spec1)
  N=N[1]

  r=widget_info(wid_button_64, /button_set)
  if r eq 1 then $
  begin
   edge=find_spectrum_edges(spec1)
   bcgr1=fit_background1(spec1[0:edge[0]+marig,0:1],5,float(ten), NODES1)
   bcgr2=fit_background1(spec1[edge[0]-marig:edge[1]+marig,0:1],long(in),float(ten), NODES2)
   bcgr3=fit_background1(spec1[edge[1]-marig:N-1,0:1],5,float(ten), NODES3)
   if finite(bcgr1[0]) eq 0 or $
      finite(bcgr2[0]) eq 0 or $
      finite(bcgr3[0]) eq 0 then $
      begin
        re=dialog_message('background fitting failed. Try changing the marigin checkbox status.')
        goto, ed
      end

   n1=n_elements(bcgr1)
   n2=n_elements(bcgr2)
   n3=n_elements(bcgr3)
   bcgr=[bcgr1[0:edge[0]],bcgr2[marig+1:n2-1-marig],bcgr3[marig+1:n3-1]]
   bc=fltarr(N-1,2)
   bc[0:N-2,0]=spec1[0:N-2,0]
   bc[0:N-2,1]=bcgr[0:N-2] ; here teh bg is stored
   NODES=[NODES1,NODES2,NODES3]
  endif else $
  begin
   bcgr=fit_background1(spec1[0:N-1,0:1],long(in),float(ten), NODES)
   bc=fltarr(N,2)
   bc[0:N-1,0]=spec1[0:N-1,0]
   bc[0:N-1,1]=bcgr[0:N-1] ; here teh bg is stored
  endelse


  SZ=SIZE(NODES)
  N=SZ[1]
  TE=STRING(nodes[0,0], FORMAT='(f10.3)')+STRING(nodes[0,1], FORMAT='(f12.1)')
  FOR I=1,  N-1 DO te=[te,STRING(nodes[i,0], FORMAT='(f10.3)')+STRING(nodes[i,1], FORMAT='(f12.1)')]
  WIDGET_CONTROL, WID_list_0, sET_VALUE=TE


  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background
  modify_ovlist, ovlist, zpi


  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1, 0
  plot_all_references, zpi, phs, draw1, nphs
  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='FF00FF'XL
  endif
 end
 ed:
 end

 ;--------------------------------------------------------------------------

 'Sub bcgr':$
 begin
  if zpi->get_n() gt 0 and ovlist[0] eq 'background' then $
  begin
   sp=zpi->get_spectrum(1)
   zpi->spectrum_subtract
   zpi->save_spectrum, sp, 10
   zpi->delete_overlay, 1, 1
   n=n_elements(ovlist)
   if n gt 1 then ovlist=ovlist[1:n-1] else ovlist=''
   widget_control, wid_list_2, set_value=ovlist
   zpi->plot
   plot_all_references, zpi, phs, draw1, nphs
  end
 end

'Set cal':$
begin
  get_cal_wid, cal
  set_calibration, un, cal
end
'Get cal':$
begin
  cal=get_calibration(un, cal)
  display_cal, cal
end
'Phase scale -':$
begin
  re=widget_info(wid_list_10, /list_select)
  if re gt -1 and nphs gt 0 then $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_7, get_value=dsc ; step
    widget_control, wid_text_36, get_value=sc ; cur. val.
    sc=float(sc)-float(dsc)
    phs[re].scl=sc
    widget_control, wid_text_36, set_value=string(sc)
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
  endif
end
'Phase scale +':$
begin
  re=widget_info(wid_list_10, /list_select)
  if re gt -1 and nphs gt 0 then $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_7, get_value=dsc ; step
    widget_control, wid_text_36, get_value=sc ; cur. val.
    sc=float(sc)+float(dsc)
    phs[re].scl=sc
    widget_control, wid_text_36, set_value=string(sc)
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
  endif
end
'Phase scale':$
begin
  re=widget_info(wid_list_10, /list_select)
  if re gt -1 and nphs gt 0 then $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_36, get_value=sc ; cur. val.
    sc=float(sc)
    phs[re].scl=sc
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
  endif
end

'pressure -':$
begin
  re=widget_info(wid_list_10, /list_select)
  all=apply_to_all()
  if all eq 0 then $
  begin
  if re gt -1 and nphs gt 0 then $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_0, get_value=p
    widget_control, wid_text_30, get_value=dp
    p=float(p)-float(dp)
    widget_control, wid_text_0, set_value=string(p)
    widget_control, wid_text_20, get_value=wv
    phs[re].tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, zpi->tth_range(peakfit_window())) ; ****
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
    for i=0, npks-1 do phs[re].excl[i]=1
    print_lp, phs[nphs-1].abc, phs[nphs-1].err
    print_V, phs[nphs-1].j->compute_v()
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    case n_elements(refs) of
     1:refs=[f1]
     else:refs[re]=f1
    endcase
    if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
    WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
    WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re
  endif
  endif else $
  begin
    for re=0, nphs-1 do $
    begin
    widget_control, wid_list_10, set_list_select=i
    widget_control, wid_text_0, set_value=string(phs[re].p)
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_0, get_value=p
    widget_control, wid_text_30, get_value=dp
    p=float(p)-float(dp)
    widget_control, wid_text_0, set_value=string(p)
    widget_control, wid_text_20, get_value=wv
    phs[re].tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, zpi->tth_range(peakfit_window())) ; ****
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
    for i=0, npks-1 do phs[re].excl[i]=1
    print_lp, phs[nphs-1].abc, phs[nphs-1].err
    print_V, phs[nphs-1].j->compute_v()
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    case n_elements(refs) of
     1:refs=[f1]
     else:refs[re]=f1
    endcase
    if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
    WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
    WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re
    endfor
  end
end
'pressure +':$
begin
  re=widget_info(wid_list_10, /list_select)
  all=apply_to_all()
  if all eq 0 then $
  begin
  if re gt -1 and nphs gt 0 then $
  begin
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_0, get_value=p
    widget_control, wid_text_30, get_value=dp
    p=float(p)+float(dp)
    widget_control, wid_text_0, set_value=string(p)
    widget_control, wid_text_20, get_value=wv
    phs[re].tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, zpi->tth_range(peakfit_window())) ; ****
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
    for i=0, npks-1 do phs[re].excl[i]=1
    print_lp, phs[nphs-1].abc, phs[nphs-1].err
    print_V, phs[nphs-1].j->compute_v()
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    case n_elements(refs) of
     1:refs=[f1]
     else:refs[re]=f1
    endcase
    if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
    WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
    WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re
  endif
  endif else $
  begin
    for re=0, nphs-1 do $
    begin
    widget_control, wid_list_10, set_list_select=i
    widget_control, wid_text_0, set_value=string(phs[re].p)
    f=''
    p=0.0
    wv=0.0
    dp=0.0
    widget_control, wid_text_0, get_value=p
    widget_control, wid_text_30, get_value=dp
    p=float(p)+float(dp)
    widget_control, wid_text_0, set_value=string(p)
    widget_control, wid_text_20, get_value=wv
    phs[re].tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, zpi->tth_range(peakfit_window())) ; ****
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
    for i=0, npks-1 do phs[re].excl[i]=1
    print_lp, phs[nphs-1].abc, phs[nphs-1].err
    print_V, phs[nphs-1].j->compute_v()
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
    case n_elements(refs) of
     1:refs=[f1]
     else:refs[re]=f1
    endcase
    if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
    WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
    WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re
    endfor
  end
end

'Zoom': $
begin
       zoo=1
       Widget_Control, WID_DRAW_0, DRAW_MOTION_EVENTS=1
end
'Draw':$
   ;if zoo eq 1 then zoom_draw_event_handler, WID_fit2d_shell, WID_DRAW_0, draw1
   begin
     if !mouse.button eq 1 then $
     begin
       wset, draw1
       cursor, x,y, /nowait, /data
       x0=x
       y0=y
       xo=x
       yo=y
       nel=0
       DEVICE, SET_GRAPHICS_FUNCTION = 6
       while !mouse.button ne 0 do $
       begin
         if nel ne 0 then plot_rectangle, [x0,y0,x,y], draw1 else nel=1
         cursor, x,y, /nowait, /data
         plot_rectangle, [x0,y0,x,y], draw1
       end
       plot_rectangle, [x0,y0,x,y], draw1
       DEVICE, SET_GRAPHICS_FUNCTION = 3
       if (x ne x0) and (y ne y0) then $
       begin
       if y lt y0 then $
       begin
        a=y0
        y0=y
        y=a
       endif
       if x lt x0 then $
       begin
        a=x0
        x0=x
        x=a
       endif


       zp=zpi->get()
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           y,y0,$
           zp.mlt[0:zp.n-1],$
           zp.add[0:zp.n-1]

        zpi->adjust_range,[x0,x]
     widget_control, wid_text_20, get_value=wv
     for i=0, nphs-1 do $
     begin
       phs[i].tth=calc_peaks(wv, phs[i].p,f1, abc, sym,phs[i].j, file1[i], dir1[i],npks, zpi->tth_range(peakfit_window())) ; ****
       phs[i].NPKS=npks
       for j=0, npks-1 do phs[i].excl[j]=1
     end
     plot_all_references, zpi, phs, draw1, nphs
     if nphs gt 0 then print_dsp, phs[nphs-1].tth, phs[nphs-1].NPKS, phs[nphs-1].excl
      ;  plot_spectrum, spec, fname, zoom
      ;  plot_peaks
      ;  plot_phases
       endif
   end else $
   if !mouse.button eq 4 then $
   begin
     zoo=0
     zpi->maximize_range
     widget_control, wid_text_20, get_value=wv
     for i=0, nphs-1 do $
     begin
       phs[i].tth=calc_peaks(wv, phs[i].p,f1, abc, sym,phs[i].j, file1[i], dir1[i],npks, zpi->tth_range(peakfit_window())) ; ****
       phs[i].NPKS=npks
       for j=0, npks-1 do phs[i].excl[j]=1
     end
     plot_all_references, zpi, phs, draw1, nphs
     if nphs gt 0 then print_dsp, phs[nphs-1].tth, phs[nphs-1].NPKS, phs[nphs-1].excl
   endif
   end
'plot on printer':$
begin
     if graphic_window_choice() eq 1 then $
     begin
       wset, draw
       al=tvrd(0,0,782,446,/order, true=1)
       xs=22
       ys=18
     end else $
     begin
       wset, wid_draw_2
       al=tvrd(0,0,364,269,/order, true=1)
       xs=10
       ys=10
     end

     set_plot, 'Printer', /copy
     device, /true_color
     device, /landscape
     result=dialog_printersetup()
     tv, al, true=1, /centimeters, xsize=xs, ysize=ys, /order
     ;zpi->plot, 1
     ;plot_all_references_1, zpi, phs, draw1, nphs
     device, /close
     set_plot, 'Win'
end
;------------------------------------------------------------------
'next chi': $
begin
   if reschi.base ne '' then $
   begin
    res1=reschi
    res1.seq=res1.seq+1
    fn1=generate_fname(res1, 3)
    path=file_dirname(fn1)
    r=file_info(fn1)
    if r.exists eq 1 then $
    begin
     tl=strlen(path)
     ttl=strlen(fn1)
     widget_control, wid_text_3, set_value=strmid(fn1, tl+1,ttl-tl-5)
     spec1=read_data_from_chi(fn1)
     reschi=analyse_fname(fn1, 3)
     path=file_dirname(fn1)
     chin=fn1
     WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
     la=float(la)
     zpi->add_spectrum_0a,spec1, la
     plot_all_references, zpi, phs, draw1, nphs
    endif
    endif
end
;------------------------------------------------------------------
'previous chi':$
begin
   if reschi.base ne '' then $
   begin
   res1=reschi
   res1.seq=res1.seq-1
   fn1=generate_fname(res1, 3)
   path=file_dirname(fn1)
   r=file_info(fn1)
   if r.exists eq 1 then $
   begin
    tl=strlen(path)
    ttl=strlen(fn1)
    widget_control, wid_text_3, set_value=strmid(fn1, tl+1,ttl-tl-5)
    spec1=read_data_from_chi(fn1)
    reschi=analyse_fname(fn1, 3)
    path=file_dirname(fn1)
    chin=fn1
    WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
    la=float(la)
    zpi->add_spectrum_0a,spec1, la
    plot_all_references, zpi, phs, draw1, nphs
   endif
   endif
end

'Overlay add':$
 begin
  if nsp gt 0 and nsp lt 10 then $
  begin
      chin=Dialog_pickfile(/read, filter='*.chi',  path=path, get_path=path)
     if chin ne '' then $
     begin
      ln=strlen(path)
      ln1=strlen(chin)
      sn=strmid(chin,ln,ln1-ln-4)
      if ovlist[0] eq '' then ovlist=[sn] else $
      ovlist=[ovlist,sn]
      widget_control, wid_list_2, set_value=ovlist
      nsp=nsp+1
      spec2=read_data_from_chi(chin)
      WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
      la=float(la)

      zpi->add_spectrum,spec2
      plot_all_references, zpi, phs, draw1, nphs
      print, nsp
      widget_control, wid_list_2, set_list_select=nsp-2
     endif
  endif
 end

'Overlay mlt -':$
begin
      re=widget_info(wid_list_2, /list_select)
      if re ne -1 then $
      begin
       zp=zpi->get()
       ms=overlay_mltp()
       zp.mlt[re+1]=ms[0]/ms[1]
       widget_control, wid_text_13, set_value=string(zp.mlt[re+1])
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range_y
        plot_all_references, zpi, phs, draw1, nphs
      end
end
'Overlay mlt +':$
begin
      re=widget_info(wid_list_2, /list_select)

      if re ne -1 then $
      begin
       zp=zpi->get()
       ms=overlay_mltp()
       zp.mlt[re+1]=ms[0]*ms[1]
       widget_control, wid_text_13, set_value=string(zp.mlt[re+1])
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range_y
        plot_all_references, zpi, phs, draw1, nphs

     endif
end

'Overlay shf +':$
begin
      re=widget_info(wid_list_2, /list_select)
      if re ne -1 then $
      begin
       zp=zpi->get()
       ad=overlay_add()
       zp.add[re+1]=ad[0]+ad[1]
       widget_control, wid_text_14, set_value=string(zp.add[re+1])
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range_y
        plot_all_references, zpi, phs, draw1, nphs
     endif
end
'Overlay shf -':$
begin
      re=widget_info(wid_list_2, /list_select)
      if re ne -1 then $
      begin
       zp=zpi->get()
       ad=overlay_add()
       zp.add[re+1]=ad[0]-ad[1]
       widget_control, wid_text_14, set_value=string(zp.add[re+1])
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range_y
        plot_all_references, zpi, phs, draw1, nphs
      endif
end

'Overlay del':$
begin
 re=widget_info(wid_list_2, /list_select)
 if re ne -1 then $
 begin
   if zpi->get_n() eq 2 then ovlist='' else $
   if re eq 0 then ovlist=ovlist[1:zpi->get_n()-2] else $
   if re eq zpi->get_n()-2 then ovlist=ovlist[0:zpi->get_n()-3] else $
   ovlist=[ovlist[0:re-1],ovlist[re+1:zpi->get_n()-2]]
   widget_control, wid_list_2, set_value=ovlist
   zpi->delete_overlay, re+1, 1
   if re eq nsp+2 then re=re-1
   nsp=zpi->get_n()
   plot_all_references, zpi, phs, draw1, nphs
   if nsp gt 1 then widget_control, wid_list_2, set_list_select=nsp-2
 end
end
'Overlay clr':$
  begin
    zpi->delete_overlays
    nsp=1
    ovlist=''
    widget_control, wid_list_2, set_value=ovlist
    zpi->plot
    plot_all_references, zpi, phs, draw1, nphs
  end
'Change array size':
'save chi':$
begin
  spec1=zpi->get_spectrum(0)
  chin=Dialog_pickfile(/write, filter='*.chi',  path=path, get_path=path, DEFAULT_EXTENSION='chi')
  if chin ne '' then  $
  begin
     write_data_to_chi, chin, spec1
     tl=strlen(path)
     ttl=strlen(chin)
     widget_control, wid_text_3, set_value=strmid(chin, tl,ttl-tl-4)
     zpi->plot
     reschi=analyse_fname(chin, 3)
     sstart=find_series_start(reschi)
     send=find_series_end(reschi)
     widget_control, wid_text_85, set_value=string(sstart, format='(I4)')
     widget_control, wid_text_86, set_value=string(send, format='(I4)')

  end
end
'save background':$
begin
 if nsp gt 1 then $
 begin
  spec1=zpi->get_spectrum(1)
  chin=Dialog_pickfile(/write, filter='*.chi',  path=path, get_path=path, DEFAULT_EXTENSION='chi')
  if chin ne '' then  write_data_to_chi, chin, spec1
 end
end
'Change mask':$
   begin
   fn=get_image_filename()
   if fn ne '' then $
   begin
     fni=Dialog_pickfile(/read, filter='*.msk', path=destdir)
     if fni ne '' then $
     begin
       widget_control, WID_BUTTON_31, set_button=1
       load_mask, un, fni
       tl=strlen(path)
       ttl=strlen(fni)
       widget_control, wid_text_4, set_value=fni
     endif
   endif else $
   begin
    a=dialog_message('You have to open an image first', /error)
    widget_control, WID_BUTTON_31, set_button=0
   endelse
   end
'Clear mask':$
   begin
   fn=get_image_filename()
   if fn eq '' then $
   begin
    a=dialog_message('You have to open an image first', /error)
    widget_control, WID_BUTTON_31, set_button=0
   end else $
   begin
     clear_mask, un
     widget_control, WID_BUTTON_31, set_button=0
   end
   end
'reset mlt':$
 begin
      re=widget_info(wid_list_2, /list_select)
      if re ne -1 then $
      begin
       zp=zpi->get()
       zp.mlt[re+1]=1.0
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range
        plot_all_references, zpi, phs, draw1, nphs
       widget_control, wid_text_13, set_value=string(zp.mlt[re+1])
      end
    end
'reset add':$
    begin
      re=widget_info(wid_list_2, /list_select)
      if re ne -1 then $
      begin
       zp=zpi->get()
       zp.add[re+1]=0.0
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range
       widget_control, wid_text_14, set_value=string(zp.add[re+1])
        plot_all_references, zpi, phs, draw1, nphs
      end
    end
'x axis 2theta':$
   begin
   end
'x axis dspc':$
   begin
   end
;---
'LIST 2':$
begin
      re=widget_info(wid_list_2, /list_select)
      if re ge 0 then $
      begin
       zp=zpi->get()
       WIDGET_CONTROl, WID_text_13,  SET_VALUE=string(zp.mlt[re+1])
       WIDGET_CONTROl, WID_text_14,  SET_VALUE=string(zp.add[re+1])
      end
end
;---
'Spread overl.':$
begin
       zp=zpi->get()
       ma=zpi->get_max_y()
       for i=0, zp.n-1 do $
       begin
         zp.add[i]=(i+1)*(ma/20.0)
       end
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range_y
       plot_all_references, zpi, phs, draw1, nphs
end
;---
'overlay legend':$
 begin
   zpi->plot
   plot_all_references, zpi, phs, draw1, nphs
 end
'phase legend':$
 begin
   zpi->plot
   plot_all_references, zpi, phs, draw1, nphs
 end
 'Reset overl.':$
begin
       zp=zpi->get()
       zp.mlt[0:9]=[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0]
       zp.add[0:9]=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
       zpi->maximize_range_y
       plot_all_references, zpi, phs, draw1, nphs
end
;-----
'Start fit2d':$
   begin
    if fit2d_online eq 0 then $
    begin
      re=file_info(fit2dexefile)
      re1=check_all_macro_files(maskscriptfile, exmaskscriptfile, calibratescriptfile)
      if re1 eq 0 then a=dialog_message('One or more macro files not found. Please, specify proper paths in the setup file.', /error) else $
      if re.exists eq 1  and re1 eq 1 then $
      begin
       spawn, fit2dexefile+" -com", UNIT=UN, EXIT_STATUS=ex
       PRINTF, UN, 'I ACCEPT'
       set_array_dims, un, 3500, 3500
       fit2d_online=1
       WIDGET_CONTROL, WID_TAB_2, SENSITIVE=1
      endif
    endif
  end
;-----
'Locate fit2d':$
  begin
    fn=dialog_pickfile(/read, filter='*.exe',GET_PATH=dir)
    re=file_info(fn)
    if fn ne '' and re.exists eq 1 then $
    begin
      fit2dexefile=fn
      write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
    end
  end
;-----
'Close fit2d':$
  begin
    if fit2d_online eq 1 then $
    begin
     close, un
     free_lun, un
     fit2d_online=0
     widget_control, wid_text_12, set_value=''
     WIDGET_CONTROL, WID_TAB_2, SENSITIVE=0
    end
  end
;-----

'save plot as tiff':$
 begin
  err=0
  catch, err
  if err ne 0 then $
  begin
      re=dialog_message(!ERR_STRING)
      catch, /cancel
      return
  endif
   fn=dialog_pickfile(/write,filter=['*.tiff', '*.tif'], path=ddir, get_path=ddir,  DEFAULT_EXTENSION='tiff')
   if fn ne '' then $
   begin
     if graphic_window_choice() eq 1 then $
     begin
       wset, draw
       al=tvrd(0,0,782,446,/order, true=1)
     end else $
     begin
       wset, wid_draw_2
       al=tvrd(0,0,364,269,/order, true=1)
     end
     write_tiff, fn, al
   end
 end
 'Truncate':$
 begin
   zpi->truncate_to_zoom
   widget_control, wid_text_0, get_value=p
   p=string(p)
   widget_control, wid_text_20, get_value=wv
   ra=zpi->tth_range(peakfit_window())
   ph=widget_info(wid_list_10, /list_select)
   for re=0, nphs-1 do $
   begin
    phs[re].tth=calc_peaks(wv, p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, ra) ; ****
    phs[re].NPKS=npks
    phs[re].p=p
    phs[re].abc=abc
   endfor
   if nphs gt 0 then $
   begin
    plot_all_references, zpi, phs, draw1, nphs
    if nphs gt 0 then print_dsp, phs[ph].tth, phs[ph].NPKS,phs[ph].excl
   end
 end

 'Search exec.':$ ; for now this is peak search test
begin
        widget_control, wid_text_47, get_value=minI
        widget_control, wid_text_45, get_value=wind
        widget_control, wid_text_44, get_value=sep

        pks=zpi->find_peaks(draw, long(wind), float(sep), float(minI), wid_list_1)
end

'BG node +':$
begin
re=widget_info(wid_list_0, /list_select)
 if re ne -1 then $
 begin
if nsp gt 0 then $
  begin
  WIDGET_CONTROl, WID_text_32, GET_VALUE=in
  WIDGET_CONTROl, WID_text_33, GET_VALUE=ten
  print, '---------------'
  spec1=zpi->get_spectrum(0)
  N=size(spec1)
  N=N[1]
  sz=size(nodes)
  sz=sz[1]
   widget_control, wid_text_37, get_value=step
   step=float(step)
   nodes[re,1]=nodes[re,1]+step

  bcgr=refine_background(spec1[0:N-1,0:1],float(ten), NODES)
  bc=fltarr(N-1,2)
  bc[0:N-2,0]=spec1[0:N-2,0]
  bc[0:N-2,1]=bcgr[0:N-2] ; here teh bg is stored

  SZ=SIZE(NODES)
  N=SZ[1]
  TE=STRING(nodes[0,0], FORMAT='(f10.3)')+STRING(nodes[0,1], FORMAT='(f12.1)')
  FOR I=1,  N-1 DO te=[te,STRING(nodes[i,0], FORMAT='(f10.3)')+STRING(nodes[i,1], FORMAT='(f12.1)')]
  WIDGET_CONTROL, WID_list_0, sET_VALUE=TE


  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background

  modify_ovlist, ovlist, zpi


  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1, 0
  plot_all_references, zpi, phs, draw1, nphs
  nsp=nsp+1
  widget_control, wid_list_0, set_list_select=re

  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
  endif

 end
 end
end


'BG node -':$
begin
re=widget_info(wid_list_0, /list_select)
 if re ne -1 then $
 begin
if nsp gt 0 then $
  begin
  WIDGET_CONTROl, WID_text_32, GET_VALUE=in
  WIDGET_CONTROl, WID_text_33, GET_VALUE=ten
  print, '---------------'
  spec1=zpi->get_spectrum(0)
  N=size(spec1)
  N=N[1]
  sz=size(nodes)
  sz=sz[1]
   widget_control, wid_text_37, get_value=step
   step=float(step)
   nodes[re,1]=nodes[re,1]-step

  bcgr=refine_background(spec1[0:N-1,0:1],float(ten), NODES)
  bc=fltarr(N-1,2)
  bc[0:N-2,0]=spec1[0:N-2,0]
  bc[0:N-2,1]=bcgr[0:N-2] ; here teh bg is stored

  SZ=SIZE(NODES)
  N=SZ[1]
  TE=STRING(nodes[0,0], FORMAT='(f10.3)')+STRING(nodes[0,1], FORMAT='(f12.1)')
  FOR I=1,  N-1 DO te=[te,STRING(nodes[i,0], FORMAT='(f10.3)')+STRING(nodes[i,1], FORMAT='(f12.1)')]
  WIDGET_CONTROL, WID_list_0, sET_VALUE=TE


  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background


  modify_ovlist, ovlist, zpi


  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1,0
  plot_all_references, zpi, phs, draw1, nphs
  nsp=nsp+1
  widget_control, wid_list_0, set_list_select=re

  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
  endif

 end
 end
end


'Delete BG node':$
begin
re=widget_info(wid_list_0, /list_select)
 if re ne -1 then $
 begin
if nsp gt 0 then $
  begin
  WIDGET_CONTROl, WID_text_32, GET_VALUE=in
  WIDGET_CONTROl, WID_text_33, GET_VALUE=ten
  print, '---------------'
  spec1=zpi->get_spectrum(0)
  N=size(spec1)
  N=N[1]
  sz=size(nodes)
  sz=sz[1]
  if re eq sz-1 then nodes=nodes[0:re-1,0:1] else $
  if re gt 0 then $
  nodes=[nodes[0:re-1,0:1],nodes[re+1:sz-1,0:1]] else $
  nodes=nodes[re+1:sz-1,0:1]

  bcgr=refine_background(spec1[0:N-1,0:1],float(ten), NODES)
  bc=fltarr(N-1,2)
  bc[0:N-2,0]=spec1[0:N-2,0]
  bc[0:N-2,1]=bcgr[0:N-2] ; here teh bg is stored

  SZ=SIZE(NODES)
  N=SZ[1]
  TE=STRING(nodes[0,0], FORMAT='(f10.3)')+STRING(nodes[0,1], FORMAT='(f12.1)')
  FOR I=1,  N-1 DO te=[te,STRING(nodes[i,0], FORMAT='(f10.3)')+STRING(nodes[i,1], FORMAT='(f12.1)')]
  WIDGET_CONTROL, WID_list_0, sET_VALUE=TE


  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background


  modify_ovlist, ovlist, zpi


  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1,0
  plot_all_references, zpi, phs, draw1, nphs
  nsp=nsp+1
  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
  endif

 end
 end
end

;--
'BG show all nodes':$
begin
  zpi->plot
  plot_all_references, zpi, phs, draw1, nphs
  re=widget_info(wid_button_5, /button_set)
  if re eq 1 then $
  begin
   SZ=SIZE(NODES)
   N=SZ[1]
   wset, draw
   for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='0000FF'XL
  endif
end
;-----
 'Pick image directory':$
   begin
     re=dialog_pickfile(/directory, PATH=datadir, GET_PATH=npath)
     if npath ne '' then $
     begin
       datadir=npath
       widget_control, wid_text_21, set_value=datadir
       write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
     end
     widget_control, wid_text_21, set_value=datadir
   end
 'Pick destination directory':$
   begin
     re=dialog_pickfile(/directory, PATH=destdir, GET_PATH=npath)
     if npath ne '' then $
     begin
       destdir=npath
       widget_control, wid_text_31, set_value=destdir
       write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
     end
   end
 'img series start2':$
   begin
     widget_CONTROL, WID_TEXT_92, GET_VALUE=S0
     widget_CONTROL, WID_TEXT_91, GET_VALUE=S1
     widget_CONTROL, WID_TEXT_89, GET_VALUE=N0
     widget_CONTROL, WID_TEXT_90, GET_VALUE=N1
     S0=LONG(S0)
     S1=LONG(S1)
     N0=LONG(N0)
     N1=LONG(N1)
     if (n1 lt s0) or (n1 gt s1) or (n1 lt n0) then $
     begin
        widget_CONTROL, WID_TEXT_90, SET_VALUE=string(s1, format='(I4)')
        re=Dialog_message('Improper sequence number',/error)
     end
   end
 'img series start1':$
   begin
     widget_CONTROL, WID_TEXT_92, GET_VALUE=S0
     widget_CONTROL, WID_TEXT_91, GET_VALUE=S1
     widget_CONTROL, WID_TEXT_89, GET_VALUE=N0
     widget_CONTROL, WID_TEXT_90, GET_VALUE=N1
     S0=LONG(S0)
     S1=LONG(S1)
     N0=LONG(N0)
     N1=LONG(N1)
     if (n0 lt s0) or (n0 gt s1) or (n0 gt n1) then $
     begin
        widget_CONTROL, WID_TEXT_89, SET_VALUE=string(s0, format='(I4)')
        re=Dialog_message('Improper sequence number',/error)
     end
   end
   'Check for new files TIMER':$
   begin
     print, 'TIC-TAC chi'
     if nsp gt 0 then $
     begin
      WIDGET_CONTROl, WID_text_86, get_value=send
      send=long(send)
      chin=generate_chiname(reschi, send+1)
      re=file_info(chin)
      if re.exists eq 1 then WIDGET_CONTROl, WID_text_86, set_value=string(send+1 ,format='(I4)')
     end
     WIDGET_CONTROl, WID_base_1, TIMER=2.0
   end

   'Check for new images TIMER small':$
   begin
   print, 'TIC-TAC image small'
   if res.base ne '' then $
   begin
     WIDGET_CONTROl, WID_text_91, get_value=send
     send=long(send)
     res1=res
     res1.seq=send+1
     fn1=generate_fname(res1, 3)
     re=file_info(fn1)
     if re.exists eq 1 then WIDGET_CONTROl, WID_text_91, set_value=string(send+1 ,format='(I4)')
    endif
     if image_timer_status eq 0 then WIDGET_CONTROl, WID_base_38, TIMER=2.0
   end

   'Check for new images TIMER':$
begin
 print, 'TIC-TAC image'
 if res.base ne '' then $
 begin

   WIDGET_CONTROl, WID_text_91, get_value=send
   send=long(send)
   res1=res
   res1.seq=send+1
   fn1=generate_fname(res1, 3)
   re=file_info(fn1)
   if re.exists eq 1 then $
   begin
    redir=file_info(destdir)
    if redir.exists eq 0 or test_write(destdir) eq 0 then $
    begin
      r=dialog_message('Spectra destination directory does not exist or you have no write permission. Change spectra directory.', /error)
      widget_control, wid_button_84, set_button=0
    endif else $

    begin
     chin=generate_chiname(res1, res1.seq)
     open_file, un, fn1, cal
     print, fn1
     integrate, un
     r=file_info(chin)
     if r.exists eq 1 then FILE_DELETE, chin
     SAVE_CHI, un, chin
     eg=file_info(chin)
     while eg.exists eq 0 do eg=file_info(chin)
     wait, 1.0
     ;----- this needs to be changed to zpi

     WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
     la=float(la)

     spec=read_data_from_chi(chin)
     zpi->add_spectrum_0b, spec, la
     tl=strlen(destdir)
     ttl=strlen(chin)
     widget_control, wid_text_3, set_value=strmid(chin, tl,ttl-tl-4)

     ttl=strlen(fn1)
     tl=strlen(path)
     widget_control, wid_text_12, set_value=strmid(fn1, tl,ttl-tl)

     if nsp eq 0 then nsp=1
     zpi->plot
      if nphs gt 0 then    plot_all_references, zpi, phs, draw1, nphs


     PRINTF, UN,  'Exchange'
     flush_the_buffer, un
     WIDGET_CONTROl, WID_text_91, set_value=string(send+1 ,format='(I4)')
   endelse
  endif
  endif
  if image_timer_status eq 1 and test_write(destdir) eq 1 then WIDGET_CONTROl, WID_base_20, TIMER=2.0 else $
  WIDGET_CONTROl, WID_base_38, TIMER=2.0
end

'set new image timer':$
   begin
     r=widget_info(wid_button_84, /button_set)
     if r eq 1 then $
     begin
         if test_write(destdir) eq 1 then $
         begin
           WIDGET_CONTROl, WID_base_20, TIMER=2.0
           image_timer_status=1
         end else $
         begin
           image_timer_status=0
           widget_control, wid_button_84, set_button=0
           r=dialog_message('Spectra destination directory does not exist or you have no write permission. Change spectra directory.', /error)
         endelse
     endif else $
     begin
        image_timer_status=0
     endelse
   end
'Modify existing mask':$
   begin
     widget_control, wid_text_4, get_value=mask
     if fn ne '' and mask ne '' then $
     begin
      re=file_info(mask)
      if re.exists eq 1 then $
      begin
        mac_change_file_name, exmaskscriptfile, fn
        mac_change_mask_name, exmaskscriptfile, mask
        spawn, fit2dexefile+" -mac"+exmaskscriptfile
      end
     endif else if fn eq '' then $
     begin
       a=dialog_message('You have to open an image first', /error)
       widget_control, WID_BUTTON_31, set_button=0
     end
   end
'Threshold mask':$
   begin
     if fn ne '' then $
     begin
      PRINTF, UN,  'Mask'
      PRINTF, UN,  'THRESHOLD MASK'
      PRINTF, UN,  'NO'
      WIDGET_CONTROL, WID_TEXT_21, GET_VALUE=thr
      PRINTF, UN,  thr
      PRINTF, UN,  'EXIT'
      flush_the_buffer, un
     end else $
     begin
      a=dialog_message('You have to open an image first', /error)
      widget_control, WID_BUTTON_31, set_button=0
     end
   end
  'Image directory':$
  begin
     re=Dialog_pickfile(/directory, path=datadir, get_path=path)
     if path ne '' then $
     begin
        datadir=path
        write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
        widget_control, wid_text_38, set_value=datadir
     end
  end
  'Subtract spectra':$
   begin
   if nsp gt 1 then $
   begin
     m=overlay_mltp()
     mltp=m[0]
     a=overlay_add()
     add=a[0]

     zpi->spectrum_subtract, mltp, add
     zpi->plot
     plot_all_references, zpi, phs, draw1, nphs
   endif
   end
  'Add spectra':$
  begin
  if nsp gt 1 then $
  begin
     m=overlay_mltp()
     mltp=m[0]
     a=overlay_add()
     add=a[0]

     zpi->spectrum_add, mltp, add
     zpi->plot
     plot_all_references, zpi, phs, draw1, nphs
  endif
  end

  'Swap with principal':$
  begin
     re=widget_info(wid_list_2, /list_select)
     if re ne -1 then $
     begin
       zpi->swap_spectra,0,re+1
       widget_control, wid_text_3, Get_value=NAM
       ON=OVLIST[RE]
       OVLIST[RE]=NAM
       widget_control, wid_text_3, Set_value=on
       widget_control, wid_list_2, set_value=ovlist
       zpi->maximize_range
       plot_all_references, zpi, phs, draw1, nphs

     CHIN=destdir+on+'.chi'
     reschi=analyse_fname(chin, 3)
     sstart=find_series_start(reschi)
     send=find_series_end(reschi)

     widget_control, wid_text_85, set_value=string(sstart, format='(I4)')
     widget_control, wid_text_86, set_value=string(send, format='(I4)')
     widget_control, wid_list_2, set_list_select=re

     end
  end

  'Prof. Gauss':$
   begin
     re=widget_info(wid_button_72, /BUTTON_SET)
     if re eq 1 then $
     peak_fit_function='GAUSS_PROFILE'
   end
  'Prof. Lorentz':$
   begin
     re=widget_info(wid_button_73, /BUTTON_SET)
     if re eq 1 then $
      peak_fit_function='LORENTZ_PROFILE'
   end
  'Prof. Pearson':$
   begin
     re=widget_info(wid_button_74, /BUTTON_SET)
     if re eq 1 then $
      peak_fit_function='PEARSON7_PROFILE'
   end
   'Prof. pV':$
   begin
     re=widget_info(wid_button_75, /BUTTON_SET)
     if re eq 1 then $
      peak_fit_function='PSEUDOVOIGT_PROFILE'
   end
'Exclude peak':$
  begin
    ph=widget_info(wid_list_10, /list_select) ; phase
    re=widget_info(wid_list_11, /list_select) ; peak number
    if ph gt -1 and re gt 1 then phs[ph].excl[re-2]=0.0
    if nphs gt 0 then print_dsp, phs[ph].tth, phs[ph].NPKS,phs[ph].excl
  end
'Include peak':$
  begin
    ph=widget_info(wid_list_10, /list_select) ; phase
    re=widget_info(wid_list_11, /list_select) ; peak number
    if ph gt -1 and re gt 1 then phs[ph].excl[re-2]=1.0
    if nphs gt 0 then print_dsp, phs[ph].tth, phs[ph].NPKS,phs[ph].excl
  end
'save unit cell refine':$
  begin
    re=widget_info(wid_button_22, /button_set) ; phase
    if re eq 1 then widget_control, wid_button_21, set_button=1
  end

'Auto apply thr mask':$
  begin
  end
'max thr mask':$
  begin
  end
'min thr mask':$
  begin
  end
'BG undo':$
  begin
   zpi->undo_background
   if nphs gt 0 then plot_all_references, zpi, phs, draw1, nphs
  end
 'Colors':$
 begin
   xloadct,GROUP=ev.top, /MODAL
   wset, WID_DRAW_1
   tv, image
 end
'Open interactive':$
   begin
     if fn ne '' then $
     begin
        mac_change_open_with_cal, opencalfile, fn, cal
        spawn, fit2dexefile+" -mac"+opencalfile
     endif else if fn eq '' then $
     begin
       a=dialog_message('You have to open an image first', /error)
     end
   end

;-------------------------------

'Jesse':$
begin
   if nphs gt 0 then $
   begin
   abcs=fltarr(6,nphs)
   j = obj_new('jcpds')
   outfile=destdir+'\out.txt'
   outfn=strarr(nphs)
   get_lun, lu
   get_lun, lu1
   if outfile ne '' then $
   begin
   for i=0, nphs-1 do $
   begin
   j -> read_file, file1[i]
   j -> compute_v0
   j -> calculate_abc, phs[i].p
   abc0=j->get_lp()
   abcs[*,i]=abc0
   outfn[i]=outfile+strcompress(string(i), /remove_all)+'.ub'
   openW, lu1, outfn[i]
   close, lu1
   end
   ;outfile=dialog_pickfile(/write, default_extension='.txt', path=destdir, title='Select output file')
   openW, lu, outfile
   print, 'hallo Jesse'
   WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
   la=float(la)
   seq=[0,0]
   filename=''
   rootname=''
   number_of_digits=5
   Jesse,filename,rootname,seqnum,number_of_digits


  ; for i=seqnum[0], seqnum[1] do $
   for i=seqnum[0], seqnum[1] do $
   begin

   chin= file_name_from_series(rootname, i, number_of_digits)

   if chin ne '' then $
   begin
   spec1=read_data_from_chi(chin)
;   widget_control, wid_text_85, set_value=string(sstart, format='(I4)')
;   widget_control, wid_text_86, set_value=string(send, format='(I4)')
   zpi->add_spectrum_0, spec1, la
   if nsp eq 0 then nsp=1
   zpi->plot
   if nphs gt 0 then    plot_all_references, zpi, phs, draw1, nphs
   endif



 ph=widget_info(wid_list_10, /list_select) ; phase
 ; re=widget_info(wid_list_11, /list_select) ; peak number


 line=chin+'  '
 for ph=0, nphs-1 do $ ; phases
 begin
    abc=abcs[*,ph]

    j -> read_file, file1[ph]
    j -> compute_v0
    j -> set_lp, abc

    tth=fltarr(phs[ph].npks)
    dsp=fltarr(phs[ph].npks)
    for re=0, phs[ph].npks-1 do $ ; this is the loop for peaks
    begin
    if phs[ph].excl[re] eq 1 then $
    begin
    theta=phs[ph].tth[re]
    WIDGET_CONTROL, WID_TEXT_1,GET_VALUE=wind
    fit_one_peak, zpi, long(wind), theta, yfit, coeff, sig, chisq, spec
    if n_elements(yfit) gt 0 then $ ; -- if 0 then fitting failed for some reason
    begin
     tth[re]=coeff[1]
     dsp[re]=la/(2.0*sin(coeff[1]/2.0/!radeg))
     dif=spec[0:2*long(wind)-1,1]-yfit
     ;sens=min(dif)
     sens=min(yfit)
     zpi->plot
     plot_all_references, zpi, phs, draw1, nphs, re
     plot_spectrum,spec[0:2*long(wind)-1,0:1] , nrefs, refs, tth1, tth2, tth3, wid_draw_2, sens, 2, 0,1,zpi, phs, nphs, re
     oplot, spec[0:2*long(wind)-1,0],yfit
     oplot, spec[0:2*long(wind)-1,0],sens+dif, color='00FF00'XL
     line=line+string(coeff[0])+' '+string(coeff[1])+' '+string(coeff[2])+' '+string(coeff[5])
     line=line+string(sig[0])+' '+string(sig[1])+' '+string(sig[2])+' '+string(sig[5])
     phs[ph].tth[re]=coeff[1]
    endif
    ;wait, 1.0
    endif
    endfor ; peaks
    print, '---->  ', phs[ph].tth[0:1], i


   N=phs[ph].npks
   hkls=transpose(phs[ph].tth[0:N-1,2:4])
   SYM=GET_SYMMETRY_CODE()
   ;abc=abc0
   lp=automatic_lp_refinement3(abc, dsp, hkls, convert_symmetry_from_vg(SYM), phs[ph].excl[0:phs[ph].npks-1])
   abc=lp
   abcs[*,ph]=abc[0:5]
   if n_elements(lp) ge 12 then $
   begin
    j->set_lp, abc[0:5]
    p=j->bm3_pressure()
    openu, lu1,outfn[ph], /append
    printf, lu1, chin+' '+string(lp[0], format='(F10.5)')+' '+string(lp[6], format='(F10.5)')+' '+string(p, format='(F6.1)')
    close, lu1
   end
 endfor ; phases
 printf, lu, line
 endfor ; pattern

 close, lu
 free_lun, lu
; close, lu1
 free_lun, lu1
 obj_destroy, j
 endif
 endif else re=dialog_message('Please open a phase reference first')
end
;-------------------------------

'Lebail':$
begin
 ;----------- READ THE SPECTRUM ------------------------
 spec1=zpi->get_spectrum(0)
 NP=N_ELEMENTS(SPEC1)/2
 XRANGE=[ MIN(SPEC1[0:NP-1, 0]), MAX(SPEC1[0:NP-1, 0])]
 X=SPEC1[0:np-1,0]
 y0=SPEC1[0:np-1,1]
 ;plot, x, y0, YRange=[min(Y0),MAX(Y0)], XRange=[MIN(X),MAX(X)]
 ft=1
 if (nphs gt 0) and (max(phs[0:nphs-1].npks) gt 0) then $
 begin
 DEVICE, CURSOR_STANDARD = 32514
 wait, 0.1
 Lebail, nphs, spec1, wave, phs[0:nphs-1].p, phs[0:nphs-1].j, phs[0:nphs-1].sym, phs[0:nphs-1].npks, phs[0:nphs-1].abc, ft, coeff, SIG, yc
 if n_elements(sig) gt 0 then  begin
;-----------------------------
; add results as overlays

      if n_elements (ovlist) lt 2 then ovlist=['','']
      ovlist[0] = 'Calculated'
      ovlist[1] = 'Difference'
      widget_control, wid_list_2, set_value=ovlist
      if nsp ge 2 then $
      zpi->replace_spectrum,[[x],[yc]], 1, 1 else $
      zpi->add_spectrum,[[x],[yc]]
      if nsp ge 3 then $
      zpi->replace_spectrum,[[x],[y0-yc]], 2, 1 else $
      zpi->add_spectrum,[[x],[y0-yc]]

       m=max(y0)*0.2
       zp=zpi->get()
       nsp=zp.n
       zp.add[2]=-m
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add
      zpi->plot
      plot_all_references, zpi, phs, draw1, nphs
      widget_control, wid_list_2, set_list_select=nsp-2

;-----------------------------

 ;oplot, x, yc, color='0000FF'XL
 ;oplot, x, y0-yc-max(y0)/5., color='00FF00'XL

 ;------ Write ascii file with fitting results

 free_lun, 3
 openw, 3, reschi.base+string(reschi.seq, format='(I03)')+'_lebail.txt'
 free_lun, 4
 openw, 4, reschi.base+string(reschi.seq, format='(I03)')+'_lebail.dat'
 acc=0
 for i=0, nphs-1 do $
 begin
  printf, 3, '--------------------------------------------------------------------------'
  printf, 3, '--------------'+refs[i]
  printf, 3, '--------------------------------------------------------------------------'
  printf, 3, 'Unit cell parameters'
  abc=coeff[i*6:i*6+5]
  printf, 3, coeff[i*6:i*6+5]
  printf, 3, sig[i*6:i*6+5]
  printf, 3, ''
  printf, 3, 'Peaks:'
  printf, 3, ''
  printf, 3, ' hkl      2theta      Iobs     FWHM'
  printf, 4, ' hkl      2theta     '
  printf, 3, ''
  r = phs[i].j-> get_reflections_PD (xrange, wave)
  sz=size(r)
  sz=sz[1]
  for j=0, sz-1 do $
  begin
    hkl=[r[j].h,r[j].k,r[j].l]
    tth=tth_from_hkl_and_lp(hkl, abc, wave)
    printf, 3, string(r[j].h, format='(I3)')+string(r[j].k, format='(I3)')+string(r[j].l, format='(I3)')+string(tth, format='(F8.3)')+string(coeff[60+(acc+j)*8]*100., format='(F10.1)')+string(coeff[60+(acc+j)*8+4], format='(F10.4)')
    printf, 4, string(r[j].h, format='(I3)')+string(r[j].k, format='(I3)')+string(r[j].l, format='(I3)')+string(tth, format='(F8.3)')
  end
  acc=acc+j
  printf, 3, ''

 endfor
 close, 3
 close, 4
 free_lun, 3
 free_lun, 4

 ; ---- Write graphic file with fitting results
 wset, draw
 al=tvrd(0,0,782,446,/order, true=1)
 xs=22
 ys=18
 fn=reschi.base+string(reschi.seq, format='(I03)')+'_lebail.tiff'
 write_tiff, fn, al

  fnsp=reschi.base+string(reschi.seq, format='(I03)')+'_lebail_calc.chi'
  fndi=reschi.base+string(reschi.seq, format='(I03)')+'_lebail_diff.chi'
  aa=file_info(fnsp)
  if aa.exists eq 1 then FILE_DELETE, fnsp
  write_data_to_chi, fnsp, [[x],[yc]]
  aa=file_info(fndi)
  if aa.exists eq 1 then FILE_DELETE, fndi
  write_data_to_chi, fndi, [[x],[y0-yc]]


 DEVICE, CURSOR_STANDARD = 32512
 re=dialog_message('Computations completed!')
 end
 endif
end
'save phase set':$
  begin
  if nphs gt 0 then $
  begin
     fni=Dialog_pickfile(/write, filter='*.phs', path=destdir, DEFAULT_EXTENSION='phs')
     if fni ne '' then $
     begin
       openw, 4, fni
       printf, 4, nphs
       for i=0, nphs-1 do $
       begin
        printf, 4, dir1[i]
        ln=strlen(dir1[i])
        ln1=strlen(file1[i])
        printf, 4, strmid(file1[i],ln, ln1-ln+1)
        printf, 4, phs[i].p
       endfor
       close, 4
     endif
  endif
  end
'load phase set':$
  begin
     if nsp gt 0 then $
     begin
     fni=Dialog_pickfile(/read, filter='*.phs', path=destdir)
     abc=fltarr(6)
     al=''
     nphs=0
     widget_control, wid_text_20, get_value=wv
     fi=1.0
     if fni ne '' then $
     begin
       free_lun, 4
       openr, 4, fni
       readf, 4, nip
       for i=0, nip-1 do $
       begin
        readf, 4, al
        dir=al
        readf, 4, al
        file=al
        readf, 4, fi
        p=fi
        f=file
        xrange=zpi->tth_range(peakfit_window())
       if not(obj_valid(phs[nphs].j)) then phs[nphs].j=obj_new('jcpds') else $
       begin
         obj_destroy, phs[nphs].j
         phs[nphs].j=obj_new('jcpds')
       endelse
        phs[nphs].j -> read_file, dir+file
        tth=calc_peaks(wv, p,f, abc, sym,phs[nphs].j, dir+file, dir, npks, xrange) ; this routine reads the file
        phs[nphs].tth[0:npks-1,0:4]=tth
        phs[nphs].npks=npks
        for k=0, npks-1 do phs[nphs].excl[k]=1.0
        phs[nphs].wv=wv
        phs[nphs].p=p
        ;phs[nphs].j=j
        phs[nphs].abc=abc
        phs[nphs].err=fltarr(6)
        phs[nphs].sym=sym
        phs[nphs].file=dir+file
        phs[nphs].dir=dir
        IF NPHS EQ 0 THEN REFS=F ELSE REFS=[REFS,F]
        f=''
        file1[nphs]=phs[nphs].file
        dir1[nphs]=phs[nphs].dir
        symmetry_selection, phs[nphs].sym
        print_lp, phs[nphs].abc, phs[nphs].err
        print_V, phs[nphs].j->compute_v()
        zpi->plot
        if nphs gt 0 then print_dsp, phs[nphs].tth,  phs[nphs].NPKS, phs[nphs].excl
        nphs=nphs+1
       endfor
       close, 4
       plot_all_references, zpi, phs, draw1, nphs
       WIDGET_CONTROL, WID_LIST_10,SET_VALUE=REFS
       WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=nphs
     endif
     endif
  end

 'manual -':$
 begin
   choice=read_manual_choice()
   re=widget_info(wid_list_10, /list_select)
   if choice gt -1 and re gt -1 then $
   begin
     st=read_manu_step()
     lp0=phs[re].j->get_lp0()
     sym=GET_SYMMETRY_CODE()
     symn=SYMMETRY_NAME(sym)
     lp0[choice]=lp0[choice]-st
     apply_symmetry, lp0, choice, symn
     phs[re].j->set_lp0, lp0
     phs[re].j->compute_V0
     phs[re].tth=calc_peaks(wave, phs[re].p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, zpi->tth_range(peakfit_window()))
     phs[nphs-1].abc=abc
     phs[re].NPKS=npks
     for j=0, npks-1 do phs[re].excl[j]=1
     print_lp, phs[nphs-1].abc
     print_V, phs[nphs-1].j->compute_v()
     zpi->plot
     plot_all_references, zpi, phs, draw1, nphs
     case n_elements(refs) of
      1:refs=[f1]
      else:refs[re]=f1
     endcase
     if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
     WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
     WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re


   end
 end
 'manual +':$
  begin
   choice=read_manual_choice()
   re=widget_info(wid_list_10, /list_select)
   if choice gt -1 and re gt -1 then $
   begin
     st=read_manu_step()
     lp0=phs[re].j->get_lp0()
     sym=GET_SYMMETRY_CODE()
     symn=SYMMETRY_NAME(sym)
     lp0[choice]=lp0[choice]+st
     apply_symmetry, lp0, choice, symn
     phs[re].j->set_lp0, lp0
     phs[re].j->compute_V0
     phs[re].tth=calc_peaks(wave, phs[re].p,f1, abc, sym,phs[re].j, file1[re], dir1[re],npks, zpi->tth_range(peakfit_window()))
     phs[nphs-1].abc=abc
     phs[re].NPKS=npks
     for j=0, npks-1 do phs[re].excl[j]=1
     print_lp, phs[nphs-1].abc
     print_V, phs[nphs-1].j->compute_v()
     zpi->plot
     plot_all_references, zpi, phs, draw1, nphs
     case n_elements(refs) of
      1:refs=[f1]
      else:refs[re]=f1
     endcase
     if nphs gt 0 then print_dsp, phs[re].tth, phs[re].NPKS,phs[re].excl
     WIDGET_CONTROL, WID_LIST_10,SET_VALUE=refs
     WIDGET_CONTROL, WID_LIST_10,SET_LIST_SELECT=re


   end
 end

 'manual step':
 'manual value':
 'manual choice':

'Img Open Image':$
begin
  fn=dialog_pickfile(/read, filter=['*.mar3450','*.mar2300', '*.tiff', '*.tif'], path=dir, get_path=dir)
  if fn ne '' then $
  begin

   ;widget_control, wid_text_28, set_value=dir
   ;res=analyse_fname(fn, dir, 3)
   ;f0=find_series_start(res)
   ;f1=find_series_end(res)
  ;--------------

   ;widget_control, wid_text_9, set_value=res.name0
   ;widget_control, wid_text_12, set_value=string(f0, format='(I4)')
   ;widget_control, wid_text_11, set_value=string(f1, format='(I4)')
   ;widget_control, wid_text_6, set_value=string(f1-f0+1, format='(I4)')
   ;widget_control, wid_text_7, set_value=string(f0, format='(I4)')

    image->load_image, fn, adetector
    plot_image, image
  endif
 end


'Img Integrate':$
begin
   capture_calibration, oadetector, wv
   npoints=2000
   time0= SYSTIME(/SECONDS)
   ;Int=oimage->integrate(oadetector, 1500, [1.,30.])
   re=widget_info(wid_button_11, /button_set)
   if re eq 1 then $
   Int=oimage->integrate_dll(oadetector, 500.000, [double(3.),double(30.)]) else $
   Int=oimage->integrate_dll_chi(oadetector, 360., [double(-180.),double(180.)])
   zeroref=Int
   time1= SYSTIME(/SECONDS)
   print, 'DLL_integration: Computation time: ', (time1-time0)
   fnc=dialog_pickfile(/write,filter='*.chi', default_extension='chi', path=out_dir)
   n=n_elements(int)/2
   wset, wid_draw_6
   plot, int[0,0:n-1],int[1,0:n-1]
   write_data_to_chi, fnc, Int

end



'Cake':$
begin

     if fn ne '' then $
     begin
      re=file_info(fn)
      if re.exists eq 1 then $
      begin
        mac_change_file_name, cakescriptfile, fn
        spawn, fit2dexefile+" -mac"+cakescriptfile
      end
     endif else if fn eq '' then $
     begin
       a=dialog_message('You have to open an image first', /error)
       widget_control, WID_BUTTON_31, set_button=0
     end


end
'MCA background':$
begin
  if zpi->get_n() gt 0 then $
  begin

       zp=zpi->get()
       zp.mlt[0:9]=[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0]
       zp.add[0:9]=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           zp.ymax,$
           zp.ymin,$
           zp.mlt,$
           zp.add


  WIDGET_CONTROl, WID_text_32, GET_VALUE=in ; interval
  in=long(in)
  spec1=zpi->get_spectrum(0)
  NA=size(spec1)
  Na=NA[1]

  N=4*(Na/4)
  ;spec1=spec1[0:N-1,0:1]
  bcgr=mca_bgr(spec1[0:N-1,1], in*10)
  IF n LT NA THEN $
  begin
   DI=nA-n
   FOR I=0, DI DO bcGR=[bcGR,BCGR[n-1]]
  endif


  bc=fltarr(NA,2)
  bc[0:NA-1,0]=spec1[0:NA-1,0]
  bc[0:NA-1,1]=bcgr[0:NA-1] ; here teh bg is stored



  WIDGET_CONTROL, WID_TEXT_20, GET_VALUE=la
  la=float(la)

  ; recognize if background is present, if so, remove old background

  ; insert new background
  modify_ovlist, ovlist, zpi


  widget_control, wid_list_2, set_value=ovlist
  zpi->insert_spectrum, bc, 1, 0

  plot_all_references, zpi, phs, draw1, nphs
  ;re=widget_info(wid_button_5, /button_set)
  ;if re eq 1 then $
  ;begin
  ; wset, draw
  ; for i=0, n-1 do plots, nodes[i,0], nodes[i,1], psym=2, color='FF00FF'XL
  ;endif
 end
 end

 else:
 endcase

 BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)

end


pro WID_fit2d_shell_aux
COMMON data
COMMON WID_fit2d_shell_elements
common fit2dstatus, fit2d_online
common draw_reference
common fit2dstatus, fit2d_online
set_plot, 'Win'
common filesetup
common refa, refg


 WIDGET_CONTROl, WID_BUTTON_1, SET_UVALUE='Close'
 WIDGET_CONTROl, WID_BUTTON_0, SET_UVALUE='add reference'
 ;WIDGET_CONTROl, WID_BUTTON_2, SET_UVALUE='recalc reference'
 WIDGET_CONTROl, WID_BUTTON_3, SET_UVALUE='del reference'
 WIDGET_CONTROl, WID_BUTTON_4, SET_UVALUE='clear reference'

 WIDGET_CONTROl, WID_BUTTON_13, SET_UVALUE='Start fit2d'
 WIDGET_CONTROl, WID_BUTTON_69, SET_UVALUE='Close fit2d'
 WIDGET_CONTROl, WID_BUTTON_14, SET_UVALUE='Locate fit2d'

 WIDGET_CONTROl, WID_BUTTON_12, SET_BUTTON=1
 WIDGET_CONTROl, WID_BUTTON_12, SET_UVALUE='phase legend'


 WIDGET_CONTROl, WID_BUTTON_7, SET_BUTTON=1
 WIDGET_CONTROl, WID_BUTTON_7, SET_UVALUE='overlay legend'
 WIDGET_CONTROl, WID_BUTTON_27, SET_UVALUE='Open'
 WIDGET_CONTROl, WID_BUTTON_20, SET_UVALUE='Read cal'
 ;WIDGET_CONTROl, WID_BUTTON_26, SET_UVALUE='Integrate'
 WIDGET_CONTROl, WID_BUTTON_19, SET_UVALUE='Write cal'
 ;WIDGET_CONTROl, WID_BUTTON_18, SET_UVALUE='Change array size'
 WIDGET_CONTROl, WID_BUTTON_17, SET_UVALUE='run cal'
 ;WIDGET_CONTROl, WID_BUTTON_25, SET_UVALUE='SAVE CHI FILE'
 WIDGET_CONTROl, WID_BUTTON_31, SET_UVALUE='Use mask'
 WIDGET_CONTROl, WID_BUTTON_32, SET_UVALUE='create mask'
 WIDGET_CONTROl, WID_BUTTON_28, SET_UVALUE='previous file'
 WIDGET_CONTROl, WID_BUTTON_29, SET_UVALUE='next file'
 WIDGET_CONTROl, WID_BUTTON_30, SET_UVALUE='Read chi'
 ;WIDGET_CONTROl, WID_BUTTON_24, SET_UVALUE='autoprocess'
 WIDGET_CONTROl, WID_BUTTON_37, SET_UVALUE='Fexit'
 WIDGET_CONTROl, WID_BUTTON_36, SET_UVALUE='Fcancel'
 WIDGET_CONTROl, WID_BUTTON_35, SET_UVALUE='Fok'
 WIDGET_CONTROl, WID_BUTTON_34, SET_UVALUE='Fpowder'
 WIDGET_CONTROl, WID_BUTTON_33, SET_UVALUE='Fexchange'
 WIDGET_CONTROl, WID_BUTTON_53, SET_UVALUE='Fit peaks'

 WIDGET_CONTROl, WID_BUTTON_51, SET_UVALUE='Fit bcgr'
 WIDGET_CONTROl, WID_BUTTON_52, SET_UVALUE='Sub bcgr'


WIDGET_CONTROl, WID_BUTTON_47, SET_UVALUE='Change mask'
WIDGET_CONTROl, WID_BUTTON_48, SET_UVALUE='Clear mask'
WIDGET_CONTROl, WID_BUTTON_16, SET_UVALUE='reset mlt'
WIDGET_CONTROl, WID_BUTTON_18, SET_UVALUE='reset add'


WIDGET_CONTROl, WID_BUTTON_42, SET_UVALUE='Overlay add'
WIDGET_CONTROl, WID_BUTTON_43, SET_UVALUE='Overlay del'
WIDGET_CONTROl, WID_BUTTON_44, SET_UVALUE='Overlay clr'

WIDGET_CONTROl, WID_BUTTON_71, SET_UVALUE='Truncate'

WIDGET_CONTROl, WID_BUTTON_45, SET_UVALUE='Overlay mlt -'
WIDGET_CONTROl, WID_BUTTON_46, SET_UVALUE='Overlay mlt +'
WIDGET_CONTROl, WID_BUTTON_66, SET_UVALUE='Overlay shf +'
WIDGET_CONTROl, WID_BUTTON_67, SET_UVALUE='Overlay shf -'


WIDGET_CONTROl, WID_BUTTON_15, SET_UVALUE='Fit unit cell'


 WIDGET_CONTROl, WID_BUTTON_11, SET_UVALUE='plot on printer'
 WIDGET_CONTROl, WID_BUTTON_8, SET_UVALUE='save plot as tiff'


 WIDGET_CONTROl, WID_BUTTON_49, SET_UVALUE='pressure -'
 WIDGET_CONTROl, WID_BUTTON_50, SET_UVALUE='pressure +'


 WIDGET_CONTROl, WID_BUTTON_65, SET_UVALUE='Phase scale -'
 WIDGET_CONTROl, WID_BUTTON_68, SET_UVALUE='Phase scale +'
 WIDGET_CONTROl, WID_TEXT_36, SET_UVALUE='Phase scale'
 WIDGET_CONTROl, WID_TEXT_7,  SET_UVALUE=''
 WIDGET_CONTROl, WID_TEXT_36, EDITABLE=1
 WIDGET_CONTROl, WID_TEXT_7,  EDITABLE=1
 WIDGET_CONTROl, WID_TEXT_36, SET_VALUE='1.0'
 WIDGET_CONTROl, WID_TEXT_7,  SET_VALUE='0.1'


 WIDGET_CONTROl, WID_BUTTON_54, SET_UVALUE='Zma+'
 WIDGET_CONTROl, WID_BUTTON_55, SET_UVALUE='Zma-'
 WIDGET_CONTROl, WID_BUTTON_56, SET_UVALUE='Zmi-'
 WIDGET_CONTROl, WID_BUTTON_57, SET_UVALUE='Zmi+'
 WIDGET_CONTROl, WID_BUTTON_58, SET_UVALUE='Zls'
 WIDGET_CONTROl, WID_BUTTON_59, SET_UVALUE='Zwp'


WIDGET_CONTROl, WID_BUTTON_78, SET_UVALUE='Auto apply thr mask'
WIDGET_CONTROl, WID_BUTTON_76, SET_UVALUE='max thr mask'
WIDGET_CONTROl, WID_BUTTON_77, SET_UVALUE='min thr mask'
WIDGET_CONTROl, WID_BUTTON_83, SET_UVALUE='BG undo'

WIDGET_CONTROl, WID_BUTTON_78, SET_BUTTON=1
WIDGET_CONTROl, WID_BUTTON_76, SET_BUTTON=1


 WIDGET_CONTROl, WID_BUTTON_60, SET_UVALUE='Set cal'
 WIDGET_CONTROl, WID_BUTTON_61, SET_UVALUE='Get cal'
 WIDGET_CONTROl, WID_BUTTON_35, SET_UVALUE=''

 WIDGET_CONTROl, WID_BUTTON_41, SET_UVALUE='Delete BG node'

 WIDGET_CONTROl, WID_text_5, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_6, SET_UVALUE=''

 WIDGET_CONTROl, WID_text_85, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_86, SET_UVALUE=''
 ;WIDGET_CONTROl, WID_text_87, SET_UVALUE='spc series end'

 WIDGET_CONTROl, WID_button_88, SET_UVALUE='Apply yo all phases'


 WIDGET_CONTROl, WID_text_89, SET_UVALUE='img series start1'
 WIDGET_CONTROl, WID_text_90, SET_UVALUE='img series start2'
 WIDGET_CONTROl, WID_text_91, SET_UVALUE='img series start4'
 WIDGET_CONTROl, WID_text_92, SET_UVALUE='img series start3'

 WIDGET_CONTROl, WID_text_20, SET_UVALUE='wavelength'
 WIDGET_CONTROl, WID_text_20, KBRD_FOCUS_EVENTS=1



 WIDGET_CONTROl, WID_text_89, EDITABLE=1
 WIDGET_CONTROl, WID_text_90, EDITABLE=1

 WIDGET_CONTROl, WID_text_89, KBRD_FOCUS_EVENTS=1
 WIDGET_CONTROl, WID_text_90, KBRD_FOCUS_EVENTS=1


 WIDGET_CONTROl, WID_text_1, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_1, EDITABLE=1
 WIDGET_CONTROl, WID_text_1, SET_VALUE='10'
 WIDGET_CONTROl, WID_text_12, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_0, SET_UVALUE='recalc reference'
 WIDGET_CONTROl, WID_text_4, SET_UVALUE=''

 WIDGET_CONTROl, WID_text_19, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_18, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_17, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_16, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_83, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_82, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_81, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_80, SET_UVALUE=''

 WIDGET_CONTROl, WID_text_43, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_43, SET_VALUE='0.3'
 WIDGET_CONTROl, WID_text_43, EDITABLE=1

 WIDGET_CONTROl, WID_text_21, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_2,  SET_UVALUE=''
 WIDGET_CONTROl, WID_text_13, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_15, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_14, SET_UVALUE=''

 WIDGET_CONTROl, WID_text_44, SET_UVALUE=''
 ;WIDGET_CONTROl, WID_text_45, EDITABLE=1
 ;WIDGET_CONTROl, WID_text_46, EDITABLE=1
 ;WIDGET_CONTROl, WID_text_47, EDITABLE=1

  WIDGET_CONTROl, WID_button_72, SET_UVALUE='Prof. Gauss'
  WIDGET_CONTROl, WID_button_73, SET_UVALUE='Prof. Lorentz'
  WIDGET_CONTROl, WID_button_74, SET_UVALUE='Prof. Pearson'
  WIDGET_CONTROl, WID_button_75, SET_UVALUE='Prof. pV'

  WIDGET_CONTROl, WID_button_75, SET_BUTTON=1

  WIDGET_CONTROl, WID_button_85, SET_UVALUE='Modify existing mask'
  WIDGET_CONTROl, WID_button_86, SET_UVALUE='Subtract spectra'
  WIDGET_CONTROl, WID_button_40, SET_UVALUE='Add spectra'
 ; WIDGET_CONTROl, WID_button_93, SET_UVALUE=''
 ; WIDGET_CONTROl, WID_button_85, SET_BUTTON=1

  WIDGET_CONTROl, WID_tab_1, SET_UVALUE=''
  WIDGET_CONTROl, WID_base_21, SET_UVALUE=''
;  WIDGET_CONTROl, WID_base_22, SET_UVALUE=''
;  WIDGET_CONTROl, WID_base_22, sensitive=0

  WIDGET_CONTROl, WID_button_87, SET_UVALUE='Swap with principal'
  WIDGET_CONTROl, WID_button_89, SET_UVALUE='Open interactive'

  WIDGET_CONTROl, WID_button_6, SET_UVALUE='Threshold mask'

 ;WIDGET_CONTROl, WID_list_1, SET_UVALUE=''
 ;WIDGET_CONTROl, WID_tab_1, SET_UVALUE=''

 WIDGET_CONTROl, WID_button_79, SET_UVALUE='BG node +'
 WIDGET_CONTROl, WID_button_80, SET_UVALUE='BG node -'

 WIDGET_CONTROl, WID_text_2, SET_VALUE='1.1'
 WIDGET_CONTROl, WID_text_15, SET_VALUE='100'
 WIDGET_CONTROl, WID_text_13, SET_VALUE='1.0'
 WIDGET_CONTROl, WID_text_14, SET_VALUE='0.0'

 WIDGET_CONTROl, WID_text_3, SET_UVALUE=''

 WIDGET_CONTROl, WID_text_30, SET_UVALUE=''
 ;WIDGET_CONTROl, WID_text_31, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_30, SET_VALUE='1.0'

 WIDGET_CONTROl, WID_text_32, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_33, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_34, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_34, SET_VALUE='5'
 WIDGET_CONTROl, WID_text_34, EDITABLE=1


 WIDGET_CONTROl, WID_text_31, SET_UVALUE=''
 WIDGET_CONTROl, WID_button_81, SET_UVALUE='Pick destination directory'
 WIDGET_CONTROl, WID_text_31, SET_VALUE=destdir



 WIDGET_CONTROl, WID_text_37, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_37, EDITABLE=1
 WIDGET_CONTROl, WID_text_37, SET_VALUE='100'

WIDGET_CONTROl, WID_text_2, EDITABLE=1
WIDGET_CONTROl, WID_text_13, EDITABLE=1
WIDGET_CONTROl, WID_text_14, EDITABLE=1
WIDGET_CONTROl, WID_text_15, EDITABLE=1


WIDGET_CONTROl, WID_button_84, SET_UVALUE='set new image timer'
WIDGET_CONTROl, WID_base_20, SET_UVALUE='Check for new images TIMER'

; WIDGET_CONTROl, WID_text_21, SET_UVALUE=''
 ;WIDGET_CONTROl, WID_text_20, SET_UVALUE=''
 WIDGET_CONTROl, WID_text_20, SET_VALUE=string(wave)

 WIDGET_CONTROl, WID_button_23, SET_UVALUE='Spread overl.'
 WIDGET_CONTROl, WID_button_25, SET_UVALUE='Reset overl.'

 WIDGET_CONTROl, WID_button_63, SET_UVALUE='refine BG.'
 WIDGET_CONTROl, WID_button_64, SET_UVALUE='use BG marigins'
 WIDGET_CONTROl, WID_button_64, SET_BUTTON=1

 WIDGET_CONTROl, WID_button_38, SET_UVALUE='next chi'
 WIDGET_CONTROl, WID_button_39, SET_UVALUE='previous chi'

 WIDGET_CONTROl, WID_button_70, SET_UVALUE='save background'

 WIDGET_CONTROl, WID_button_73, SENSITIVE=0
 WIDGET_CONTROl, WID_button_91, SENSITIVE=0


 WIDGET_CONTROl, WID_button_82, SET_UVALUE='Image directory'

 WIDGET_CONTROl, WID_button_90, SET_UVALUE='MCA background'
 WIDGET_CONTROl, WID_button_91, SET_UVALUE='Lebail'

 WIDGET_CONTROl, WID_button_62, SET_UVALUE='save chi'
 WIDGET_CONTROl, WID_button_21, SET_UVALUE='save peak fit res'
 WIDGET_CONTROl, WID_button_22, SET_UVALUE='save unit cell refine'

 WIDGET_CONTROl, WID_button_5, SET_UVALUE='BG show all nodes'

 WIDGET_CONTROl, WID_button_9, SET_UVALUE='graphic output small'
 WIDGET_CONTROl, WID_button_10, SET_UVALUE='graphic output large'

 WIDGET_CONTROl, WID_button_62a, SET_UVALUE='Jesse'

 WIDGET_CONTROl, WID_button_93, SET_UVALUE='autoprocess'
 WIDGET_CONTROl, WID_button_72a, SET_UVALUE='flat background'
 WIDGET_CONTROl, WID_button_94, SET_UVALUE='Integrate'
 WIDGET_CONTROl, WID_button_95, SET_UVALUE='Cake'
 WIDGET_CONTROl, WID_button_96, SET_UVALUE='Cake Interactive'
 WIDGET_CONTROl, WID_button_97, SET_UVALUE='Fexchange'
 WIDGET_CONTROl, WID_button_98, SET_UVALUE='save phase set'
 WIDGET_CONTROl, WID_button_99, SET_UVALUE='load phase set'

 WIDGET_CONTROl, WID_button_100, SET_UVALUE='JCPDS editor'


 WIDGET_CONTROl, WID_button_92, SET_UVALUE='manual -'
 WIDGET_CONTROl, WID_button_101, SET_UVALUE='manual +'
 WIDGET_CONTROl, WID_text_40, SET_UVALUE='manual step'
 WIDGET_CONTROl, WID_text_40, SET_VALUE='0.01'
 WIDGET_CONTROl, WID_text_39, SET_UVALUE='manual value'
 WIDGET_CONTROl, WID_text_39, SET_VALUE=''
 WIDGET_CONTROl, WID_droplist_1, SET_UVALUE='manual choice'
 text=['a','b','c','alpha','beta','gamma','V']
 WIDGET_CONTROl, WID_droplist_1, SET_VALUE=text


 WIDGET_CONTROl, WID_button_10, SET_BUTTON=1

 WIDGET_CONTROl, WID_text_32, SET_VALUE='40'
 WIDGET_CONTROl, WID_text_33, SET_VALUE='1.0'

 WIDGET_CONTROl, WID_text_32, EDITABLE=1
 WIDGET_CONTROl, WID_text_33, EDITABLE=1
 WIDGET_CONTROl, WID_text_21, SET_VALUE='60000'

 WIDGET_CONTROl, WID_base_1, SET_UVALUE='Check for new files TIMER'
 ;WIDGET_CONTROl, WID_base_1, TIMER=2.0
 widget_control, wid_text_38, set_value=datadir


 WIDGET_CONTROl, WID_base_38, SET_UVALUE='Check for new images TIMER small'
 ;WIDGET_CONTROl, WID_base_38, TIMER=2.0

 WIDGET_CONTROl, WID_tab_0, SET_UVALUE=''
 WIDGET_CONTROl, WID_tab_2, SET_UVALUE=''
 WIDGET_CONTROl, WID_draw_0, SET_UVALUE='Draw'
 WIDGET_CONTROl, WID_draw_0, GET_VALUE=draw
 DEVICE, SET_GRAPHICS_FUNCTION = 3



  WIDGET_CONTROl, WIDImg_Button_27, set_uvalue='Img Open Image'
  WIDGET_CONTROl, WIDImg_Text_12, set_uvalue=''
  WIDGET_CONTROl, WIDImg_Draw_0,get_value=drawI
  WIDGET_CONTROl, WIDImg_Draw_0,set_uvalue='drawI'




 ;WIDGET_CONTROl, WID_draw_1, SET_UVALUE='Draw1'
 ;WIDGET_CONTROl, WID_draw_1, GET_VALUE=WID_draw_1

 WIDGET_CONTROl, WID_draw_2, SET_UVALUE=''
 WIDGET_CONTROl, WID_draw_2, GET_VALUE=WID_draw_2
 WIDGET_CONTROl, WID_LIST_0, sET_UVALUE='LIST 0'
 WIDGET_CONTROl, WID_LIST_10, sET_UVALUE='LIST 1'
 WIDGET_CONTROl, WID_LIST_2, sET_UVALUE='LIST 2'
 WIDGET_CONTROl, WID_LIST_11, sET_UVALUE='LIST 11'
 list=['CUBIC',$
       'TETRAGONAL',$
       'ORTHORHOMBIC',$
       'HEXAGONAL',$
       'RHOMBOHEDRAL',$
       'MONOCLINIC',$
       'TRICLINIC']
WIDGET_CONTROl, WID_DROPLIST_0, SET_UVALUE='DROP 0'
reschi={base:'',seq:0L,ext:'',path:'',base0:''}

WIDGET_CONTROl, WID_DROPLIST_0, SET_VALUE=list
WIDGET_CONTROl, WID_DROPLIST_0, SET_DROPLIST_SELECT=6
draw1=draw

COMMON cont, contextBase, contextBase1

contextBase = WIDGET_BASE(WID_DRAW_0, /CONTEXT_MENU)
button1 = WIDGET_BUTTON(contextBase, VALUE='Zoom', UVALUE='Zoom')
button2 = WIDGET_BUTTON(contextBase, VALUE='Unzoom', UVALUE='Unzoom')

WIDGET_CONTROl, WID_LIST_11, /context_EVENTS

contextBase1 = WIDGET_BASE(WID_LIST_11, /CONTEXT_MENU)
button1a = WIDGET_BUTTON(contextBase1, VALUE='Exclude', UVALUE='Exclude peak')
button2a = WIDGET_BUTTON(contextBase1, VALUE='Include', UVALUE='Include peak')



Widget_Control, WID_DRAW_0, DRAW_MOTION_EVENTS=1
Widget_Control, WID_DRAW_0, DRAW_BUTTON_EVENTS=1

if fit2d_online eq 0 then WIDGET_CONTROL, WID_TAB_2, SENSITIVE=0

   READ_JPEG, 'final_gsehead 1.5.jpg', img, true=3;, colors=256
   wset, draw
   tv, (img[100:959,100:719,0:2]), true=3
   READ_JPEG, 'acknowledgements.jpg', img, colors=256
 ;  READ_JPEG, 'C:\Soft\GSE_shell\current_version\acknowledgements.jpg', img, true=3;, colors=256
   wset, wid_draw_2
   tv, img

re=file_info('colors.ct')
  if re.exists then $
  begin
   wset, drawi
   free_lun, 2
   TVLCT, V1, V2, V3, /GET
   openr, 2, 'colors.ct'
   readf, 2 , V1
   readf, 2 , V2
   readf, 2 , V3
   TVLCT, V1, V2, V3
   close, 2
   free_lun, 2
  endif

end

