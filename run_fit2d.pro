function check_all_macro_files, name1, name2, name3
  re1=file_info(name1)
  re2=file_info(name2)
  re3=file_info(name3)
  if re1.exists eq 1 and re2.exists eq 1 and re3.exists eq 1 then $
  return, 1 else return, 0
end

function check_show_overlay_legend
common refa, refg
 re1=widget_info(refg.WID_BUTTON_7, /BUTTON_SET)
 return, re1
end

function check_show_phase_legend
common refa, refg
 re1=widget_info(refg.WID_BUTTON_12, /BUTTON_SET)
 return, re1
end


function get_cal_number, st
 po1=strpos(st,'[')
 po2=strpos(st,']')
 st1=strmid(st,po1+1,po2-po1-1)
 ;print, st1
 return, float(st1)
end

function get_calibration, un, cal
; assuming the program is in powder menu
 al=''
 PRINTF, UN, 'Integrate'
 read_all_output, un
 PRINTF, UN,  'x-pixel'
 PRINTF, UN,  '79.0'
 readf, un, al
 readf, un, al
 readf, un, al
 cal.xpix=get_cal_number(al)
 if cal.xpix gt 1e-2 and cal.xpix lt 1e4 then $
 begin
  PRINTF, UN,  'x-pixel'
  PRINTF, UN,  cal.xpix
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.xpix=79.0
  ;---
 PRINTF, UN,  'y-pixel'
 PRINTF, UN,  '79.0'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.ypix=get_cal_number(al)
 if cal.ypix gt 1e-2 and cal.ypix lt 1e4 then $
 begin
  PRINTF, UN,  'y-pixel'
  PRINTF, UN,  cal.ypix
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.ypix=79.0
 ;---
 PRINTF, UN,  'distance'
 PRINTF, UN,  '1000.0'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.dist=get_cal_number(al)
 if cal.dist gt 1e-2 and cal.dist lt 1e4 then $
 begin
  PRINTF, UN,  'distance'
  PRINTF, UN,  cal.dist
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.dist=1000.0

 ;---
 PRINTF, UN,  'wavelength'
 PRINTF, UN,  '0.5'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.wavel=get_cal_number(al)
  if cal.wavel gt 1e-2 and cal.wavel lt 1e4 then $
 begin
  PRINTF, UN,  'wavelength'
  PRINTF, UN,  cal.wavel
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.wavel=0.5

 ;---
 PRINTF, UN,  'x-beam'
 PRINTF, UN,  '1000.0'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.xbeam=get_cal_number(al)
 if cal.xbeam gt -1e4 and cal.xbeam lt 1e4 then $
 begin
  PRINTF, UN,  'x-beam'
  PRINTF, UN,  cal.xbeam
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.xbeam=1000.0

 ;---
 PRINTF, UN,  'y-beam'
 PRINTF, UN,  '1000.0'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.ybeam=get_cal_number(al)
 if cal.ybeam gt -1e4 and cal.ybeam lt 1e4 then $
 begin
  PRINTF, UN,  'y-beam'
  PRINTF, UN,  cal.ybeam
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.ybeam=1000.0

 ;---
 PRINTF, UN,  'tilt'
 PRINTF, UN,  '0.0'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.tilt=get_cal_number(al)
 if cal.tilt gt -180.0 and cal.tilt lt 180.0 then $
 begin
  PRINTF, UN,  'tilt'
  PRINTF, UN,  cal.tilt
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.tilt=0.0

 ;---
 PRINTF, UN,  'angle'
 PRINTF, UN,  '0.0'
 readf, un, al
 readf, un, al
 readf, un, al
 print, al
 cal.angle=get_cal_number(al)
  if cal.angle gt -90.0 and cal.angle lt 90.0 then $
 begin
  PRINTF, UN,  'angle'
  PRINTF, UN,  cal.angle
  readf, un, al
  readf, un, al
  readf, un, al
 end else cal.angle=0.0

 ;---
 PRINTF, UN,  'cancel'
 return, cal
 end


;-------------------------------------------

pro mac_change_open_with_cal, macfile, fn, cal
  ON_IOERROR, BAD
  MESSAGE, /RESET

 re1=file_info(macfile)
 aa=''
 if re1.exists eq 1 and fn ne '' then $
 begin
   free_lun, 2
   openr, 2, macfile
   free_lun, 3
   openw, 3, macfile+'_'
   for i=0, 13 do $
   begin
      readf, 2, aa
      printf, 3, aa
   end
   readf, 2, aa
   printf, 3, fn
   for i=0, 6 do $
   begin
      readf, 2, aa
      printf, 3, aa
   end

      readf, 2, aa
      printf, 3, cal.xpix
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.ypix
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.dist
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.wavel
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.xbeam
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.ybeam
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.tilt
      readf, 2, aa
      printf, 3, aa

      readf, 2, aa
      printf, 3, cal.angle
      readf, 2, aa
      printf, 3, aa

   while not eof(2) do $
   begin
      readf, 2, aa
      printf, 3, aa
   end
   close, 2
   free_lun, 2
   close, 3
   free_lun, 3
   file_delete, macfile
   file_copy, macfile+'_', macfile
   file_delete, macfile+'_'

 end
  BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)

end


;-------------------------------------------

pro set_calibration, un, cal
; assuming the program is in powder menu
 al=''
 PRINTF, UN, 'Integrate'
 read_all_output, un
 PRINTF, UN,  'x-pixel'
 PRINTF, UN,  cal.xpix
 PRINTF, UN,  'y-pixel'
 PRINTF, UN,  cal.ypix
 PRINTF, UN,  'distance'
 PRINTF, UN,  cal.dist
 PRINTF, UN,  'wavelength'
 PRINTF, UN,  cal.wavel
 PRINTF, UN,  'x-beam'
 PRINTF, UN,  cal.xbeam
 PRINTF, UN,  'y-beam'
 PRINTF, UN,  cal.ybeam
 PRINTF, UN,  'tilt'
 PRINTF, UN,  cal.tilt
 PRINTF, UN,  'angle'
 PRINTF, UN,  cal.angle
 PRINTF, UN,  'o.k.'
 PRINTF, UN,  'cancel'
end
;----------------------------------------------

function zoom_plot, plot_data, wid_draw

; INPUT:
;      plot_data   - structure containing all data being plotted with the following fields
;           n      - number of plots in the graph
;           x      - x-axis data
;           ys     - y-axis data. For oplot graphs there might be more than one dimension. y data for each oplot have to have same n_elements
;           xrange - index of beginning and end x data to display
;           ymax   - maxim y for plotting
;           color  - colors for each plot
;           psym   - symbol for each plot
;           psize  - symbol size for each plot
;
; OUTPUT:
; the output is a structure variable with the fields as above

end
;----------------------------------------------


;-------------------------------------------

pro mac_change_file_name, macfile, fn

 re1=file_info(macfile)
 ;re2=file_info(fn)
 aa=''
 if re1.exists eq 1 and fn ne '' then $
 begin
   free_lun, 2
   openr, 2, macfile
   free_lun, 3
   openw, 3, macfile+'_'
   for i=0, 13 do $
   begin
      readf, 2, aa
      printf, 3, aa
   end
   readf, 2, aa
   printf, 3, fn
   while not eof(2) do $
   begin
      readf, 2, aa
      printf, 3, aa
   end
   close, 2
   free_lun, 2
   close, 3
   free_lun, 3
   file_delete, macfile
   file_copy, macfile+'_', macfile
   file_delete, macfile+'_'

 end

end
;------------------------------------------
pro mac_change_mask_name, macfile, fn

 re1=file_info(macfile)
 ;re2=file_info(fn)
 aa=''
 if re1.exists eq 1 and fn ne '' then $
 begin
   free_lun, 2
   openr, 2, macfile
   free_lun, 3
   openw, 3, macfile+'_'
   for i=0, 23 do $
   begin
      readf, 2, aa
      printf, 3, aa
   end
   readf, 2, aa
   printf, 3, fn
   while not eof(2) do $
   begin
      readf, 2, aa
      printf, 3, aa
   end
   close, 2
   free_lun, 2
   close, 3
   free_lun, 3
   file_delete, macfile
   file_copy, macfile+'_', macfile
   file_delete, macfile+'_'

 end

end
;------------------------------------------

pro retrieve_cal, fil, un, cal
common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
  path=datadir
  spawn, fit2dexefile+" -com", UNIT=UN1
  PRINTF, UN1, 'I ACCEPT'
  set_array_dims, un1, 3500, 3500
  open_file, un1, fil, cal
  flush_the_buffer, un1
  ;cal=get_calibration(un, cal)
  exit_from_fit2d, un1
  set_calibration, un, cal
  display_cal, cal
end

function find_spectrum_edges, spec1
 sz=size(spec1)
 N=sz[1]
 i=0
 sum=0.0
 av=total(spec1[0:N-1,1])/N
 while sum lt av and i lt N-4 do $
 begin
   sum=total(spec1[i:i+3,1])/4.0
   i=i+1
 end
 if i lt N then lm=i else lm=0
 sum=0.0
 i=N-1
 while sum lt av and i gt 3 do $
 begin
   sum=total(spec1[i-3:i,1])/4.0
   i=i-1
 end
 if i gt 3 then rm=i else rm=N-1
 oplot, [spec1[lm+20,0], 100], psym=5
 oplot, [spec1[rm-20,0], 100], psym=5
 print, N
 return, [lm+20,rm-20]

end

function refine_background, spec1,ten, NODES
 sz=size(nodes)
 st=sz[1]
 sz=size(spec1)
 N=sz[1]
 bcgr=spline(nodes[0:st-1,0],nodes[0:st-1,1],spec1(0:N-1,0), ten[0])
 return, bcgr
end

;-----
function fit_background1, spec1, in, ten, NODES
 sz=size(spec1)
 N=sz[1]
 st=long(N/in[0])
 nodes=fltarr(st,2)
 for i=0, st-1 do $
 begin
   ma=min(spec1[i*in:(i+1)*in-1,1],j)
   nodes[i,0]=spec1[i*in+j,0]
   nodes[i,1]=ma
 end

 if not(nodes[0,0] eq spec1[0,0]) then $
 NODES=[transpose([spec1[0,0],spec1[0,1]]),$
        transpose([spec1[5,0],spec1[5,1]]),$
        NODES]

 st=n_elements(nodes)/2

 if not(nodes[st-1,0] eq spec1[N-1,0]) then $
 NODES=[NODES,$
        transpose([spec1[N-5,0],spec1[N-5,1]]),$
        transpose([spec1[N-1,0],spec1[N-1,1]])]

 st=n_elements(nodes)/2

 bcgr=spline(nodes[0:st-1,0],nodes[0:st-1,1],spec1(0:N-1,0), ten[0])
 return, bcgr
end

;-----

function symmetry_CODE, sym
; Symmetry codes
; 0  - triclinic
; 11 - monoclinic a
; 12 - monoclinic b
; 13 - monoclinic c
; 2  - orthorhombic
; 3  - tetragonal
; 4  - hexagonal
; 5  - cubic


        if sym eq 0 then re=5
        if sym eq 1 then re=3
        if sym eq 2 then re=2
        if sym eq 3 then re=4
        if sym eq 4 then re=41
        if sym eq 5 then re=12
        if sym eq 6 then re=0
Return, re

end

pro plot_spectrum,spec, nrefs, refs, tth1, tth2, tth3, draw, sens, st
  wset, draw
  sz=size(spec)
  sz=sz[1]
  if st eq 1 then $
  plot, spec[0:sz-1,0], spec[0:sz-1,1] else $
  plot, spec[0:sz-1,0], spec[0:sz-1,1], psym=4, symsize=1.0

  if sens[0] eq 1 then plot_reference, spec, tth1, draw, 1
  if sens[1] eq 1 then plot_reference, spec, tth2, draw, 2
  if sens[2] eq 1 then plot_reference, spec, tth3, draw, 3
end

;-----------------------------------------------------------


function symmetry_SEL, sym
; Symmetry codes
; 0  - triclinic
; 11 - monoclinic a
; 12 - monoclinic b
; 13 - monoclinic c
; 2  - orthorhombic
; 3  - tetragonal
; 4  - hexagonal
; 5  - cubic

        if sym eq 'CUBIC'        then re=0
        if sym eq 'TETRAGONAL'      then re=1
        if sym eq 'ORTHORHOMBIC'    then re=2
        if sym eq 'HEXAGONAL'    then re=3
        if sym eq 'RHOMBOHEDRAL'    then re=4
        if sym eq 'MONOCLINIC'      then re=5
        if sym eq 'TRICLINIC'    then re=6

;        if sym eq 'CUBIC'         then re=5
;        if sym eq 'TETRAGONAL'        then re=3
;        if sym eq 'ORTHORHOMBIC'   then re=2
;        if sym eq 'HEXAGONAL'      then re=4
;        if sym eq 'RHOMBOHEDRAL'   then re=41
;        if sym eq 'MONOCLINIC'        then re=12
;        if sym eq 'TRICLINIC'      then re=0
return, re

end

pro plot_spectrum,spec, nrefs, refs, tth1, tth2, tth3, draw, sens, st, op, col, zpi, phs, nphs, sel

  col=5
  case col of
   1: color='FFFFFF'XL ; white
   2: color='FF00FF'XL ; magenta
   3: color='AAAACC'XL ; gold
   4: color='112233'XL ; orchid
   5: color='730000'XL ; navy
  end
  if n_elements(sens) eq 3 then sens = 0.0
  wset, draw
  sz=size(spec)
  sz=sz[1]
  ;!y.range=[min(spec[0:sz-2,1]), max(spec[0:sz-2,1])]
  !y.range=[-0.1*max(spec[0:sz-2,1]), max(spec[0:sz-2,1])]
  ;sens=-0.1*max(spec[0:sz-2,1])
  if op eq 0 then $
  begin
   if st eq 1 then $
   plot, spec[0:sz-2,0], spec[0:sz-2,1], color=color, YRANGE=[sens,max(spec[0:sz-2,1])] else $
   plot, spec[0:sz-2,0], spec[0:sz-2,1], psym=4, symsize=1.0, color=color, YRANGE=[sens,max(spec[0:sz-2,1])]
  endif else $
  begin
   if st eq 1 then $
   oplot, spec[0:sz-2,0], spec[0:sz-2,1], color=color, YRANGE=[sens,max(spec[0:sz-2,1])] else $
   oplot, spec[0:sz-2,0], spec[0:sz-2,1], psym=4, symsize=1.0, color=color, YRANGE=[sens,max(spec[0:sz-2,1])]
  endelse

  plot_all_references, zpi, phs, draw, nphs, sel, spec
  ;plot_reference1, spec, tth, draw, 1
end

;-----------------------------------------------------------

pro plot_all_references, zpi, phs, draw, nphs, sel, spec
  for i=0, nphs-1 do  $
  begin
  if n_params() le 4 then  plot_reference, zpi, phs, draw, i, nphs else $
  if n_params() eq 5 then  plot_reference, zpi, phs, draw, i, nphs, sel else $
  if n_params() eq 6 then  plot_reference, zpi, phs, draw, i, nphs, sel, spec
  endfor
end

pro plot_all_references_1, zpi, phs, draw, nphs
  for i=0, nphs-1 do plot_reference_1, zpi, phs, draw, i, nphs
end

pro plot_reference, zpi, phs, draw, N, nphs, sel, spc

@COMMON_data

  wset, draw
  if n_params() lt 7 then $
  begin
   spc=zpi->get_spectrum(0)
   ran=zpi->get_xrange()
   ;rany=zpi->get_yrange()
  endif
  na=n_elements(spc)/2
  sz=size(spc)
  sz=sz[1]
  if n_params() eq 7 then ran=[0,sz-1]
  if ran[1] gt sz then ran[1]=sz-1
  if ran[0] gt sz then ran[0]=sz-1
  xs=[spc[ran[0],0],spc[ran[1],0]]
  if n_params() lt 7 then zpi->set_xrange, ran
  m=max(spc[ran[0]:ran[1],1])
  m0=min(spc[ran[0]:ran[1],1])
  device, decomposed=1
  CASE n OF
    0:COLOR='0f5f00'XL
    1:COLOR='0000ff'XL
    2:COLOR='af0000'XL
    3:COLOR='0f9fcc'XL
    4:COLOR='000000'XL
    5:COLOR='ff00bb'XL
    6:COLOR='af9900'XL
    7:COLOR='0f9977'XL
    8:COLOR='9977ff'XL
    9:COLOR='33445a'XL
  ELSE:COLOR='000000'XL
  ENDCASE

  for i=0, phs[N].npks-1 do $ ; numbers peaks
  begin
    if phs[n].tth[i,0] ge xs[0] and phs[n].tth[i,0] le xs[1] then $
    begin
     hkl=string(phs[n].tth[i,2], format='(I2)')+string(phs[n].tth[i,3], format='(I2)')+string(phs[n].tth[i,4], format='(I2)')
     plots, phs[n].tth[i,0], m0, color=COLOR, /data
     plots, phs[n].tth[i,0], m0+phs[n].scl*m*phs[n].tth[i,1]/100.0, /continue, color=COLOR, /data
;     xyouts, phs[n].tth[i,0],-m*0.1 , hkl, /data, alignment=0.5, color=color, orientation=90.
     xyouts, phs[n].tth[i,0],-m*0.1 , hkl, /data, alignment=0.5, color=color, orientation=90.
    end
  endfor
  if n_params() ge 6 then  $
  begin
     hkl=string(phs[n].tth[sel,2], format='(I2)')+string(phs[n].tth[sel,3], format='(I2)')+string(phs[n].tth[sel,4], format='(I2)')
     if get_phase_selected() eq N then $
     xyouts, phs[n].tth[sel,0],-m*0.1 , hkl, /data, alignment=0.5, COLOR='FF0000'XL, orientation=90.; overlay spectra
  endif


  ;RESOLVE_ROUTINE, "check_show_phase_legend", /IS_FUNCTION [, /COMPILE_FULL_FILE ] [, /EITHER | , /IS_FUNCTION] [, /NO_RECOMPILE]

  leg=check_show_phase_legend()
  if leg eq 1 then $
     xyouts, 100, 380-15*(n), refs[n], /device, alignment=0.0,color=color; overlay spectra


end

;---------------------------------------------
pro plot_reference_1, zpi, phs, draw, N, nphs ; this one is for the printer

@COMMON_data


  spc=zpi->get_spectrum(0)
  m=max(spc[0:n_elements(spc)/2-1,1])
  ;device, decomposed=1
  CASE n OF
    0:COLOR='0000FF'XL
    1:COLOR='00BBFF'XL
    2:COLOR='FFFF00'XL
  ELSE:COLOR='000000'XL
  ENDCASE

  for i=0, phs[N].npks-1 do $ ; numbers peaks
  begin
    plots, phs[n].tth[i,0], 0.0, color=COLOR
    plots, phs[n].tth[i,0], phs[n].scl*m*phs[n].tth[i,1]/100.0, /continue, color=COLOR
  endfor

  leg=check_show_phase_legend()
  if leg eq 1 then $
     xyouts, 100, 400-15*(n), refs[n], /device, alignment=0.0,color=color; overlay spectra

end

;---------------------------------------------

function calc_peaks, wavel, p, fn, abc, sym,j, file, dir, npks, xrange

len=strlen(dir)
len1=strlen(file)
fn=strmid(file,len,len1-len-6)+'_'+strcompress(string(p,format='(F6.2)'), /remove_all)+'GPa'
if file ne '' then $
begin
 ;j -> read_file, file
 j -> compute_d, p[0]
 r = j-> get_reflections_PD (xrange, wavel)
 tth=fltarr(n_elements(r), 5)
 npks=n_elements(r)
 sz=size(r)
 if npks eq 1 and sz[2] eq 1 then npks=0
 if npks gt 0 then for i=0,npks-1 do begin
  print, r[i].d, r[i].inten, r[i].h, r[i].k, r[i].l
  tth[i,0]=2.0*asin(wavel/(2.0*r[i].d))*!radeg
  tth[i,1]=r[i].inten
  tth[i,2]=r[i].h
  tth[i,3]=r[i].k
  tth[i,4]=r[i].l
 endfor
 sym=J->get_symmetry()
 j->calculate_abc, p[0]
 abc=j->get_lp()
endif

return, tth
end

;----------------------------------------------

function read_data_from_chi, fn
  data=fltarr(5000,2)
  if fn ne '' then $
  begin
   a1=0.0
   a2=0.0
   al=''
   ON_IOERROR, ret
   free_lun, 2
   openr,2, fn
   for i=0, 4 do readf,2, al
   k=0
   while not eof(2) do $
   begin
     readf,2, a1, a2
     data[k,0]=a1
     data[k,1]=a2
     k=k+1
   endwhile
   close, 2
   free_lun, 2
   if k gt 0 then data=data[0:k-1,0:1]
  endif
  ret: return, data
end

;----------------------------------------------

pro write_data_to_chi, fn, data
  ON_IOERROR, BAD
  MESSAGE, /RESET
  if fn ne '' then $
  begin
   a1=0.0
   a2=0.0
   al=''
   sz=size(data)
   sz=sz[1]
   free_lun, 2
   openw,2, fn
   for i=0, 4 do printf,2
   for i=0, sz-1 do printf,2, data[i,0], data[i,1], format='(F15.6,F15.6)'
   close, 2
   free_lun, 2
  endif
  BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)
end

;  ON_IOERROR, BAD
;  MESSAGE, /RESET
;  BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)


;----------------------------------

function generate_fname, res, extno
 return,res.base+string(res.seq,format='(I03)')+res.ext
end

;----------------------------------
function generate_chiname, res, extno
common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
  if extno gt 0 then return,destdir+res.base0+string(extno,format='(I03)')+'.chi' else $
                     return,destdir+res.base0+string(res.seq,format='(I03)')+'.chi'
end

;-----------------------------------
pro flush_the_buffer, un
  printf, un, 'blablabla'
  al=''
  while al ne 'MENU CHOICE (GRAPHICAL INPUT):blablabla' do $
  begin
   readf, un, al
   print, al
   al=strmid(al,0,39)
  end
end

;--------------------------------------

function find_series_start, res
   found=1
   res1=res
   while res1.seq ge 0 and found eq 1 do $
   begin
   if res1.seq ge 1 then $
   begin
    res1.seq=res1.seq-1
    fn1=generate_fname(res1, 3)
    r=file_info(fn1)
    if r.exists eq 1 then found=1 else found=0
   endif else found=0
   endwhile
   if found eq 0 then return,res1.seq+1 else return,res1.seq
end
;--------------------------------------
function find_series_end, res
   found=1
   res1=res
   while found eq 1 do $
   begin
   if res1.seq ge 1 then $
   begin
    res1.seq=res1.seq+1
    fn1=generate_fname(res1, 3)
    r=file_info(fn1)
    if r.exists eq 1 then found=1 else found=0
   endif else found=0
   endwhile
   if found eq 0 then return,res1.seq-1 else return,res1.seq
end
;------------------------------------------
function analyse_fname, st, extno
 ; extno is number of digits for the extension number
  res={base:'',seq:0L,ext:'',path:'',base0:''}
  po1=strpos(st,'.',/reverse_search)
  po2=strpos(st,'\',/reverse_search)
  ln=strlen(st)
  ext=strmid(st, po1,ln-po1)
  path=strmid(st, 0,po2+1)
  seq=strmid(st, po1-extno,extno)
  seq=Long(seq)
  if !error_state.code ne 0 then $
  begin
    seq=0
    re=dialog_message('No image # detected in file name')
    message, /reset
  end
  base=strmid(st, 0,po1-extno)
  base0=strmid(st, po2+1, strlen(base)-strlen(path))
  res.base=base
  res.base0=base0
  res.path=path
  res.seq=seq
  res.ext=ext
  return, res
end

;----------------------------------
FUNCTION READ_CAL_FROM_log, FN, CAL
  LA=''
  FREE_LUN, 2
  OPENR, 2, FN
  WHILE NOT EOF(2) DO $
  BEGIN
   READF,2, LA
   AL27=STRMID(LA, 0, 27)
   AL43=STRMID(LA, 0, 43)
   AL26=STRMID(LA, 0, 26)
   AL41=STRMID(LA, 0, 41)
   AL26=STRMID(LA, 0, 26)
   AL13=STRMID(LA, 0, 26)
   LN=STRLEN(LA)
   IF AL27 EQ 'INFO: Refined Beam centre =' THEN $
   BEGIN
     AN=STRMID(LA, 28, LN-27)
     IF STRMID(AN, 25,8) EQ '(pixels)' THEN $
     BEGIN
      BX=FLOAT(STRMID(AN, 0, 12))
      By=FLOAT(STRMID(AN, 13, 12))
     ENDIF
   END

   IF AL43 EQ 'INFO: Refined sample to detector distance =' THEN $
   BEGIN
     AN=STRMID(LA, 44, LN-43)
     dist=FLOAT(STRMID(AN, 0, 12))
   END
   IF AL26 EQ 'INFO: Refined wavelength =' THEN $
   BEGIN
     AN=STRMID(LA, 27, LN-26)
     WAVE=FLOAT(STRMID(AN, 0, 12))
   END
   IF AL41 EQ 'INFO: Refined tilt plane rotation angle =' THEN $
   BEGIN
     AN=STRMID(LA, 42, LN-41)
     TILT=FLOAT(STRMID(AN, 0, 12))
   END
   IF AL26 EQ 'INFO: Refined tilt angle =' THEN $
   BEGIN
     AN=STRMID(LA, 27, LN-26)
     ANGL=FLOAT(STRMID(AN, 0, 12))
   END

  ENDWHILE
  PRINT, BX, BY, DIST, WAVE, TILT, ANGL
  CLOSE, 2
  FREE_LUN, 2

 cal.dist=DIST
 cal.wavel=WAVE
 cal.xbeam=BX
 cal.ybeam=BY
 cal.tilt=TILT
 cal.angle=ANGL

  RETURN, CAL

END


pro save_cal, fn, cal
ON_IOERROR, BAD
MESSAGE, /RESET
if fn ne '' then $
begin
 free_lun,2
 openw, 2, fn
 PRINTF, 2,  cal.xpix
 PRINTF, 2,  cal.ypix
 PRINTF, 2,  cal.dist
 PRINTF, 2,  cal.wavel
 PRINTF, 2,  cal.xbeam
 PRINTF, 2,  cal.ybeam
 PRINTF, 2,  cal.tilt
 PRINTF, 2,  cal.angle
 close, 2
endif
BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)
end

;----------------------
function load_cal, fn, cal
if fn ne '' then $
begin
 a=0.0
 free_lun,2
 openr, 2, fn
 readF, 2,aa
   cal.xpix=aa
 readF, 2, aa
  cal.ypix=aa
 readF, 2,  aa
 cal.dist=aa
 readF, 2,  aa
 cal.wavel=aa
 readF, 2,  aa
 cal.xbeam=aa
 readF, 2,  aa
 cal.ybeam=aa
 readF, 2,  aa
 cal.tilt=aa
 readF, 2,  aa
 cal.angle=aa
 close, 2
endif
return, cal
end
;----------------------


;----------------------

pro read_all_output, un
  al=''
  while al ne 'MENU CHOICE (GRAPHICAL INPUT):Integrate' do $
  begin
   readf, un, al
   print, al
   al=strmid(al,0,39)
  end
end

;--------------------------




;----------------------------------
pro load_mask, un, fni

 PRINTF, UN, 'mask'
 PRINTF, UN,  'load mask'
 PRINTF, UN,  fni
 PRINTF, UN,  'exit'

end
;----------------------------------
pro clear_mask, un

 PRINTF, UN, 'mask'
 PRINTF, UN,  'clear'
 PRINTF, UN,  'exit'

end
;----------------------------------

pro integrate, un
; assuming the program is in powder menu
 al=''
 PRINTF, UN, 'Integrate'
 PRINTF, UN,  'o.k.'
 PRINTF, UN,  'o.k.'
end

;----------------------------------

pro SAVE_CHI, un, FN1
; assuming the program is in powder menu
 al=''
 PRINTF, UN, 'OUTPUT'
 PRINTF, UN,  'CHI'
 PRINTF, UN,  'FILE'
 PRINTF, UN,  FN1
 PRINTF, UN,  'O.K.'
end

;----------------------------------

pro exit_from_fit2d, un
 PRINTF, UN, 'exit'
 PRINTF, UN, 'exit'
 PRINTF, UN,  'yes'
 free_lun, un
end
;----------------------------------

pro set_array_dims, un, x_size, y_size
 PRINTF, UN, 'Keyboard'
 PRINTF, UN, 'dimensions'
 PRINTF, UN,  x_size
 PRINTF, UN,  y_size
 PRINTF, UN, 'yes'
 PRINTF, UN, 'no'
 PRINTF, UN, 'exit'

end

;-----------------------------------

pro open_file, un, fn, cal
common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user

; assuming the interface it in the main menu
 PRINTF, UN, 'POWDER diffraction'
 PRINTF, UN, 'INPUT '
 PRINTF, UN, fn
 PRINTF, UN, 'o.k.'
 PRINTF, UN, 'o.k.'
 PRINTF, UN, 'options'
 PRINTF, UN, 'colours'
 PRINTF, UN, 'inverse'
 PRINTF, UN, 'exit'
 PRINTF, UN, 'exit'
 al=''
 readf, un, al
 readf, un, al
 readf, un, al
 readf, un, al
 readf, un, al
 readf, un, al
 readf, un, al
 readf, un, al

 cal=get_calibration(un, cal)
 display_cal, cal
end

pro run_fit2d
cal={xpix  : 70.0,$
ypix  : 70.0,$
dist  : 320.0,$
wavel :   0.7,$
xbeam : 250.0,$
ybeam : 250.0,$
tilt  :   1.0,$
angle :   2.0}

 AL=''
 spawn, fit2dexefile+" -com", UNIT=UN
 PRINTF, UN, 'I ACCEPT'
 ;read_all_output, un
 set_array_dims, un, 2048, 2048
 fn=Dialog_pickfile(/read, filter=['*.tif', '*.tiff'], path=datadir)
 open_file, un, fn, cal
 cal=get_calibration(un, cal)
 set_calibration, un, cal
 fn=Dialog_pickfile(/write, filter='*.cal', path=datadir)
 save_cal, fn, cal
 exit_from_fit2d, un
end

pro run_fit2d
end