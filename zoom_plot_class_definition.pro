;-----------------------------------------------------------------------------

pro zoom_draw_event_handler, WID_BASE_0, WID_DRAW_0,draw

@COMMON_data

common phases, phs, nphs
common zoomob, zpi, zoo
COMMON BOX_COORDS, X1,X2,Y1,Y2, SEL1, SEL2, LISTEN,Xa1,Xa2,Ya1,Ya2, ox, oy

; Sel1 is the selection status variable it equals 1 when dragging the rectangle

    wset, draw
    xb1=0
    yb1=0

    cursor, x, y, /device, /CHANGE


    DEVICE, SET_GRAPHICS_FUNCTION = 6
    if zoo eq 1 and (x le 2 or y le 2 or x ge 770 or y ge 440 ) then $
    begin
       Widget_Control, WID_DRAW_0, sensitive=0
       zoo=0
       sel1=0
       wait, 0.3

        zpi->plot
        plot_all_references, zpi, phs, draw, nphs

       Widget_Control, WID_DRAW_0, sensitive=1
       DEVICE, SET_GRAPHICS_FUNCTION=3
    end

    IF !MOUSE.button eq 1 AND SEL1 EQ 0 and zoo eq 1 THEN $
    BEGIN
       X1=X
       Y1=Y
       ox=x1
       oy=y1
       SEL1=1
       cursor, xa1, ya1, /data, /NOWAIT
       cursor, x, y, 4
       cursor, x, y, /device, /CHANGE
       xb1=x
       yb1=y
    END ELSE IF !MOUSE.button eq 1 AND SEL1 EQ 1 AND not ((X eq Xb1) or (Y eq Yb1)) and zoo eq 1 THEN $ ; adjust range - zoom in
    BEGIN
       X2=X
       Y2=Y
       SEL1=0
       while !MOUSE.button eq 1 do $
       begin
        cursor, xa2, ya2, /data, /NOWAIT
       end
       Widget_Control, WID_BASE_0, /SHOW
       cursor, xa2, ya2, /data, /NOWAIT
       zp=zpi->get()
       zpi->set, $
           zp.wid,$
           zp.n ,$
           zp.np,$
           zp.x,$
           zp.y,$
           zp.xrange,$
           max([ya1,ya2]),$
           min([ya1,ya2]),$
           zp.mlt[0:zp.n-1],$
           zp.add[0:zp.n-1]

        zpi->adjust_range, [min([xa1,xa2]),max([xa1,xa2])]
        cursor, x, y, /device, /CHANGE


        for i=0, nphs-1 do $
        begin
           phs[i].tth=calc_peaks(lambda(), phs[i].p,f1, abc, sym,phs[i].j, file1[i], dir1[i],npks, zpi->tth_range(peakfit_window())) ; ****
           phs[i].NPKS=npks
        end
        plot_all_references, zpi, phs, draw, nphs
        if nphs gt 0 then print_dsp, phs[nphs-1].tth, phs[nphs-1].NPKS, phs[nphs-1].excl

        wait, 0.5


    ENDif else if !MOUSE.button eq 2 and zoo eq 1 then $ ; Middle button - maximize range
    begin
      zpi->maximize_range

      wv=lambda()
      for i=0, nphs-1 do $
      begin
        phs[i].tth=calc_peaks(wv, phs[i].p,f1, abc, sym,phs[i].j, file1[i], dir1[i],npks, zpi->tth_range(peakfit_window())) ; ****
        phs[i].NPKS=npks
      end
      plot_all_references, zpi, phs, draw, nphs
      if nphs gt 0 then print_dsp, phs[nphs-1].tth, phs[nphs-1].NPKS, phs[nphs-1].excl
      SEL1=0


    ENDif else if !MOUSE.button eq 4 and zoo eq 1 then $ ; Exit zoom moded
    begin
       Widget_Control, WID_DRAW_0, sensitive=0
       sel=0
       sel1=0
       zoo=0

       zpi->plot
       plot_all_references, zpi, phs, draw, nphs

       wait, 0.3
       Widget_Control, WID_DRAW_0, sensitive=1
       DEVICE, SET_GRAPHICS_FUNCTION=3
    ENDIF ELSE IF SEL1  eq 1 and zoo eq 1 THEN $
    BEGIN
        ;zpi->plot
        if not ((x1 eq x) and (y1 eq y)) then $
        begin
         draw_box, X1, Y1, ox, oy, draw, 'FFFFFF'XL
         ox=x
         oy=y
         draw_box, X1, Y1, x, y, draw, 'FFFFFF'XL
        end
      endif

end

;-----------------------------------------------------------------------------

pro draw_box, box00x, box00y, x, y, WID_DRAW_0, col
                 center=[241,241]
                 wset, WID_DRAW_0
                 PLOTS, box00x, box00y, /DEVICE, color=col
                 PLOTS, box00x, y,      /CONTINUE, /DEVICE, color=col, linestyle=2
                 PLOTS, x, y,           /CONTINUE, /DEVICE, color=col, linestyle=2
                 PLOTS, x, box00y,      /CONTINUE, /DEVICE, color=col, linestyle=2
                 PLOTS, box00x, box00y, /CONTINUE, /DEVICE, color=col, linestyle=2
end

;-------------------------------------------
function zoom_plot_class::tth_range, wind
 a0=self.x[self.xrange[0]+wind+1]
 a1=self.x[self.xrange[1]-wind-1]
 if a1 eq 0 then a1=self.x[self.xrange[1]-1]
 return, [a0,a1]
end
;-------------------------------------------
function zoom_plot_class::tth_range0
 a0=self.x[self.xrange[0]]
 a1=self.x[self.xrange[1]]
 if a1 eq 0 then a1=self.x[self.xrange[1]]
 return, [a0,a1]
end

function zoom_plot_class::get_xrange
 return, self.xrange
end


pro zoom_plot_class::set_xrange, xr
 self.xrange=xr
end

function zoom_plot_class::get_spectrum, n
 ret=fltarr(self.np[n],2)
 ret[0:self.np[n]-1,0]=self.x[0:self.np[n]-1,n]
 ret[0:self.np[n]-1,1]=self.y[0:self.np[n]-1,n]
 return, ret
end
;-------------------------------------------
pro zoom_plot_class::add_spectrum_0b, spc, la

       sz=size(spc)
       sz=sz[1]

       if self.n eq 0 then self.n =1
       self.wv[0] =la
       self.np[0]  = sz
       self.x[0:sz-1,0]           = spc[0:sz-1,0]
       self.d[0:sz-1,0]           = la[0]/(2.0*sin(spc[0:sz-1,0]/!radeg/2.0))
       self.y[0:sz-1,0]  = spc[0:sz-1,1]
       self->maximize_range_y
       ;self->maximize_range

end;-------------------------------------------
pro zoom_plot_class::add_spectrum_0, spc, la

       sz=size(spc)
       sz=sz[1]

       if self.n eq 0 then self.n =1
       self.wv[0] =la
       self.np[0]  = sz
       self.x[0:sz-1,0]           = spc[0:sz-1,0]
       self.d[0:sz-1,0]           = la[0]/(2.0*sin(spc[0:sz-1,0]/!radeg/2.0))
       self.y[0:sz-1,0]  = spc[0:sz-1,1]
       self->maximize_range_y
       self->maximize_range

end;-------------------------------------------
pro zoom_plot_class::add_spectrum_0a, spc, la

       sz=size(spc)
       sz=sz[1]

       if self.n eq 0 then self.n =1
       self.wv[0] =la
       self.np[0]  = sz
       self.x[0:sz-1,0]           = spc[0:sz-1,0]
       self.d[0:sz-1,0]           = la[0]/(2.0*sin(spc[0:sz-1,0]/!radeg/2.0))
       self.y[0:sz-1,0]  = spc[0:sz-1,1]

      if self.xrange[1] gt sz then self.xrange[1]=sz-1
      if self.xrange[0] gt sz then self.xrange[0]=sz-1

       self->plot


       ;self->maximize_range_y
       ;self->maximize_range

end;-------------------------------------------
pro zoom_plot_class::add_spectrum, spc

           sz=size(spc)
           sz=sz[1]

           self.n           = self.n+1
           self.np[self.n-1]  = sz
           self.mlt[self.n-1] = 1.0
           self.add[self.n-1] = 0.0
           self.x[0:sz-1,self.n-1]           = spc[0:sz-1,0]
           self.y[0:sz-1,self.n-1]  = spc[0:sz-1,1]
           ;self.xrange      = [0,sz-1]
           self->maximize_range

end
;-------------------------------------------
pro zoom_plot_class::undo_background
          if self.np[10] gt 0 and $
             self.np[10] eq self.np[0] then $
             begin
                self.y[0:self.np[0]-1,0] = self.y[0:self.np[0]-1,0]+self.y[0:self.np[0]-1,10]
                self->maximize_range
                self.np[10]=0
             end


end;-------------------------------------------;-------------------------------------------
pro zoom_plot_class::save_spectrum, spc, k

           sz=size(spc)
           sz=sz[1]
           self.np[k]  = sz
           self.mlt[k] = 1.0
           self.add[k] = 0.0
           self.x[0:sz-1,k] = spc[0:sz-1,0]
           self.y[0:sz-1,k] = spc[0:sz-1,1]

end;-------------------------------------------
pro zoom_plot_class::insert_spectrum, spc, k, noma

           sz=size(spc)
           sz=sz[1]
          self.n           = self.n+1
           if self.n gt 1 then $
           for i=k+1, self.n do $
           begin
            self.np[i]  = self.np[i-1]
            self.mlt[i] = self.mlt[i-1]
            self.add[i] = self.add[i-1]
            self.x[0:9999,i] = self.x[0:9999,i-1]
            self.y[0:9999,i] = self.y[0:9999,i-1]
           end

           self.np[k]  = sz
           self.mlt[k] = 1.0
           self.add[k] = 0.0
           self.x[0:sz-1,k]  = spc[0:sz-1,0]
           self.y[0:sz-1,k]  = spc[0:sz-1,1]

  if n_params() eq 2 then self->maximize_range else self->plot

end;-------------------------------------------
pro zoom_plot_class::replace_spectrum, spc, k, noma

          sz=size(spc)
          sz=sz[1]

          self.np[k]  = sz
          self.x[0:sz-1,k]  = spc[0:sz-1,0]
          self.y[0:sz-1,k]  = spc[0:sz-1,1]

  if n_params() eq 2 then self->maximize_range else self->plot

end
;-------------------------------------------
pro zoom_plot_class::delete_overlay, k, maxim

if k le self.n-1 then for i=k, self.n-2 do $
begin
           self.np[i]  = self.np[i+1]
           self.x[0:self.np[i],i] = self.x[0:self.np[i],i+1]
           self.y[0:self.np[i],i] = self.y[0:self.np[i],i+1]
endfor
self.np[self.n-1]=0
self.n = self.n-1
if maxim eq 1 then self->maximize_range_y else self->plot

end
;-------------------------------------------
pro zoom_plot_class::delete_overlays
           ;if self.n gt 1 then $
  self.n           = 1
  self->maximize_range_y

end
;-------------------------------------------
pro zoom_plot_class::add_spectrum_1, spc, la

sz=size(spc)
sz=sz[1]
           self.n           = 2
           self.wv =la
           self.np[self.n-1]  = sz
           self.x[0:sz-1,self.n-1]           = spc[0:sz-1,0]
           self.d[0:sz-1,self.n-1]           = la/(2.0*sin(spc[0:sz-1,0]/!radeg/2.0))
           self.y[0:sz-1,self.n-1]  = spc[0:sz-1,1]
           ;self.xrange      = [0,sz-1]
  self->maximize_range

end


;------------------------------------
pro zoom_plot_class::swap_spectra,i,j
; swaps spectra i and j
  ax=self.x[0:9999,i]
  ay=self.y[0:9999,i]
  aD=self.D[0:9999,i]
  an=self.np[i]
  self.x[0:9999,i]=self.x[0:9999,j]
  self.y[0:9999,i]=self.y[0:9999,j]
  self.D[0:9999,i]=self.D[0:9999,j]
  self.np[i]=self.np[j]
  self.x[0:9999,j]=ax
  self.y[0:9999,j]=ay
  self.D[0:9999,j]=aD
  self.np[j]=an

end

;-------------------------------------------
pro zoom_plot_class::spectrum_subtract, mltp, shi
; subtracts spectrum 1 from spectrum 0
  if n_params() eq 0 then $
  begin
    mltp=1.0
    shi=0.0
  end
  self.y[0:self.np[0],0]=self.y[0:self.np[0],0]-(self.y[0:self.np[0],1]+shi)*mltp
end
;-------------------------------------------
pro zoom_plot_class::spectrum_add, mltp, shi
; adds spectrum 1 to spectrum 0
  if n_params() eq 0 then $
  begin
    mltp=1.0
    shi=0.0
  end
  self.y[0:self.np[0],0]=self.y[0:self.np[0],0]+self.y[0:self.np[0],1]
end
;-------------------------------------------

pro zoom_plot_class::set, WID_DRAW_0, n, np, x, ys, xr, ym, ymi, mlt, add

           self.wid         = WID_DRAW_0
           self.n           = n
           self.np          = np
           for i=0, n-1 do $
           begin
            self.x[0:np[i]-1,i]  = x[0:np[i]-1,i]
            self.y[0:np[i]-1,i]  = ys[0:np[i]-1,i]
           end
           self.xrange      = xr
           self.ymax        = ym
           self.ymin        = ymi
           self.color  = ['000000'XL,'FF00FF'XL,'FFFF00'XL,'7FABFF'XL,'00FF00'XL,'0000FF'XL,'FF0000'XL,'730000'XL,'00BBFF'XL,'7F7FFF'XL,'93DB70'XL]
           self.psym   = [1,2,4,5,6,7,1,2,4,5]
           self.psize  = [0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5]
           self.mlt  = mlt
           self.add = add


end

;-------------------------------
pro zoom_plot_class::maximize_range
  y=self.y
  self.ymax=0
  self.ymin=1000000
  for i=0, self.n-1 do $
  y[0:self.np[i]-1,i]=self.mlt[i]*self.y[0:self.np[i]-1,i]+self.add[i]
  for i=0, self.n-1 do $
  begin
   ymin=min(y[0:self.np[i]-1,i])
   ymax=max(y[0:self.np[i]-1,i])
   if self.ymin gt ymin then self.ymin=ymin
   if self.ymax lt ymax then self.ymax=ymax
  end
  self.xrange=[0,self.np[0]-1]
  self->plot
end

;-------------------------------
pro zoom_plot_class::maximize_range_
; xrange refers to index limits for display
  y=self.y
  self.ymax=0
  self.ymin=1000000
  for i=0, self.n-1 do $
  y[0:self.np[i]-1,i]=self.mlt[i]*self.y[0:self.np[i]-1,i]+self.add[i]
  for i=0, self.n-1 do $
  begin
   ymin=min(y[0:self.np[i]-1,0:self.n-1])
   ymax=max(y[0:self.np[i]-1,0:self.n-1])
   if self.ymin gt ymin then self.ymin=ymin
   if self.ymax lt ymax then self.ymax=ymax
  end
  self.xrange=[0,max(self.np[0:self.n-1])-2]

  self->plot
end
;-----------------------------
pro zoom_plot_class::maximize_range_y
; xrange refers to index limits for display
  y=self.y
  self.ymax=0
  self.ymin=1000
  for i=0, self.n-1 do $
  y[0:self.np[i]-1,i]=self.mlt[i]*self.y[0:self.np[i]-1,i]+self.add[i]
  for i=0, self.n-1 do $
  begin
   ymin=min(y[0:self.np[i]-1,0:self.n-1])
   ymax=max(y[0:self.np[i]-1,0:self.n-1])
   if self.ymin gt ymin then self.ymin=ymin
   if self.ymax lt ymax then self.ymax=ymax
  end
  self->plot
end
;-----------------------------

function find_closest_value, arr, val
sz=size(arr)
sz=sz[1]
arr1=fltarr(sz)
for i=0, sz-1 do arr1[i]=abs(float(arr[i])-val[0])
m=min(arr1,j1)
for i=0, sz-1 do arr1[i]=abs(float(arr[i])-val[1])
m=min(arr1,j2)
if arr[j2] eq 0 then j2=j2-1
return, [j1,j2]
end

;-----------------------------

pro zoom_plot_class::adjust_range, xrange
   ra=find_closest_value(self.x[0:SELF.NP[0]-1], xrange)
   if ra[1] gt ra[0] then self.xrange=ra
   self->plot
end

function zoom_plot_class::get_max_y
  return, max(self.y)
end


function zoom_plot_class::value_at_x, x
  an=find_closest_value(self.x[0:self.np[0],0], [x,0.0])
  return, self.y[an[0],0]
end

;-------------------------------
;-------------------------------
function evaluate_match
end
;-------------------------------
function zoom_plot_class::find_peaks, draw, wind, sep, minI,list
  wset, draw
  wind=wind[0]
  PEAKS=FLTARR(200)
  PEAKSV=FLTARR(200)
  PEAKSC=FLTARR(200)
  PN=0
  for i=0, self.np[0]-wind-1 do $
  begin
    spcx=self.x[i:i+wind-1,0]
    spcy=self.y[i:i+wind-1,0]
    yfit=gaussfit(spcx,spcy,coeff,nterms=4, chisq=ch)
    if self->value_at_x(coeff[1]) gt minI then $
    begin
       if pn gt 0 then $
       begin
        an=find_closest_value(peaks, [coeff[1],0.0])
        if abs(peaks[an[0]]-coeff[1]) gt sep then $
        begin
          peaks[PN]=coeff[1]
          peaksV[PN]=self->value_at_x(coeff[1])
          peaksC[PN]=ch
          PN=PN+1
        endif else $ ; there is already a peak close
        begin
           if self->value_at_x(coeff[1]) gt peaksV[an[0]] then $
           begin
             peaks[an[0]]=coeff[1]
             peaksV[an[0]]=self->value_at_x(coeff[1])
           end
        endelse
       endif else $
       begin
          peaks[PN]=coeff[1]
          peaksV[PN]=self->value_at_x(coeff[1])
          peaksC[PN]=ch
          PN=PN+1
          print, coeff
       endelse

    end
  end

  if PN gt 0 then for i=0, PN-1 do $
  begin
     if i eq 0 then text=string(peaks[i], format='(F8.4)')+'  '+string(peaksV[i], format='(F6.1)') else $
     text=[text,string(peaks[i], format='(F8.4)')+'  '+string(peaksV[i], format='(F6.1)')]
     xyouts, peaks[i], -300.0, '*', /data, alignment=0.5
     print, peaks[i], peaksV[i]
  end
  widget_control, list, set_value=text
return, peaks
end
;-------------------------------
function zoom_plot_class::get_n
 return, self.n
end
;-------------------------------

function zoom_plot_class::get
common zp_ob_ref, zp
           zp.wid    =self.wid
           zp.n      =self.n
           zp.np     =self.np
           zp.x      =self.x
           zp.y      =self.y
           zp.xrange =self.xrange
           zp.ymax   =self.ymax
           zp.ymin   =self.ymin
           zp.color  =self.color
           zp.psym   =self.psym
           zp.psize  =self.psize
           zp.mlt    =self.mlt
           zp.add    =self.add
 return,zp

end
;-----------------------------
pro zoom_plot_class::truncate_to_zoom
; truncation should be done separately for each spectrum, they may have diffrent
; stpes and ranges
xr=[self.x[self.xrange[0],0],self.x[self.xrange[1],0]]
  for i=0, self.n-1 do $
  begin
   ra=find_closest_value(self.x[0:SELF.NP[i]-1,i], xr)
   self.np[i]=ra[1]-ra[0]
   self.x[0:self.np[i],i]=self.x[ra[0]:ra[1],i]
   self.y[0:self.np[i],i]=self.y[ra[0]:ra[1],i]
  end
  self.xrange[1]=self.np[0]-1
  self.xrange[0]=0
  self->plot
end
;-----------------------------

pro zoom_plot_class::plot, al

@COMMON_data

  fni=get_principal_spectrum_name()
  if n_params() eq 0 then $
  begin
   wset, self.wid
   DEVICE, SET_GRAPHICS_FUNCTION=3
   device, decomposed=1
  end

  !P.background='FFFFFF'XL
  !P.color='F00000'XL
  !y.range=[self.ymin-self.ymax*.1,self.ymax]
  plot, self.x[self.xrange[0]:self.xrange[1]-1,0], self.mlt[0]*self.y[self.xrange[0]:self.xrange[1]-1,0]+self.add[0], color=self.color[0], XSTYLE=3, thick=1.5
  m=max(SELF.NP[0:9],ma)
  for i=1,self.n-1 do $
  begin
   xr=[self.x[self.xrange[0],0],self.x[self.xrange[1],0]]
   ra=find_closest_value(self.x[0:SELF.NP[i]-1,i], xr)
   oplot, self.x[ra[0]:ra[1]-1,i], self.mlt[i]*self.y[ra[0]:ra[1]-1,i]+self.add[i], color=self.color[i], thick=1.5
  end
  leg=check_show_overlay_legend()
  if leg eq 1 then $
  begin
    xyouts, 730, 380, fni, /device, alignment=1.0, color=self.color[0] ; master spectrum
    if self.n gt 1 then $
    for i=1, self.n-1 do $
    begin
     xyouts, 730, 380-15*(i), ovlist[i-1], /device, alignment=1.0, color=self.color[i] ; overlay spectra
    end
  endif
end

;-------------------------------------------

pro ZOOM_plot_Class_Definition
common zp_ob_ref, zp
 Nel=10 ; number of elements to plot for class init
 N=2 ;  number of spectra

 zp={zoom_plot_class, $
           wid    : '', $
           n      : 0, $
           np     : [10000, 10000,10000,10000,10000,10000,10000,10000,10000,10000,10000], $
           x      : fltarr(10000,11), $
           d      : fltarr(10000,11), $
           y      : fltarr(10000,11), $
           wv     : 0.0, $
           mlt    : [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0], $
           add    : fltarr(11), $
           xrange : [0,0], $
           ymax   : 0.0, $
           ymin   : 0.0, $
           color  : ['000000'XL,'FF00FF'XL,'FFFF00'XL,'7FABFF'XL,'00FF00'XL,'0000FF'XL,'FF0000'XL,'730000'XL,'00BBFF'XL,'7F7FFF'XL,'93DB70'XL,'93DB70'XL], $
           psym   : [1,2,4,5,6,7,1,2,4,5,6], $
           psize  : [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0] $
     }

end