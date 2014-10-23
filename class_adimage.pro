; Last modification

;------------------------------------

pro write_data_to_chi, fn, data
  ON_IOERROR, BAD
  MESSAGE, /RESET
  if fn ne '' then $
  begin
   a1=0.0
   a2=0.0
   al=''
   sz=size(data)
   sz=sz[2]
   free_lun, 2
   openw,2, fn
   for i=0, 4 do printf,2
   for i=0, sz-1 do printf,2, data[0,i], data[1,i], format='(F15.6,F15.6)'
   close, 2
   free_lun, 2
  endif
  BAD:  if !ERROR_STATE.code ne 0 then re=dialog_message(!ERR_STRING)
end
;------------------------------------
function read_data_from_chi, fn
  data=fltarr(5000,2)
  if fn ne '' then $
  begin
   a1=0.0
   a2=0.0
   al=''
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
   data=data[0:k-1,0:1]
  endif
  return, data
end
;------------------------------------

function settings_text, oimage
; Prepares text from the file settings window based on the content of the oimage.sts property
im=oimage->get_object()

text=''
text=[text,'----------------------------']
text=[text,'Name           '+im.sts.name ]
text=[text,'Gonio          '+string(im.sts.gonio[3])+string(im.sts.gonio[4])]
text=[text,'Rot. axis      '+string(im.sts.rot_ax) ]
text=[text,'Rot. range     '+string(im.sts.rot_range)]
text=[text,'Absorber       '+string(im.sts.abs_mat )  ]
text=[text,'Exposure time  '+string(im.sts.exptime)]
text=[text,'----------------------------']

return, text

end

;--------------------------------------------

pro adimage_CLASS::change_detector_format, new_format

self.sts.det_format=new_format

end

;--------------------------------------------

function adimage_CLASS::get_object

COMMON ad_image_CLASS_Reference, adimage

  adimage.sts       = self.sts
  adimage.img       = self.img

  return, adimage

end
;--------------------------------------------

pro adimage_CLASS::copy, oi

  im=self->get_object()
  oi->set_object, im

end


pro adimage_CLASS::divide, im

sz=size(self.img)

for i=0, sz[1]-1 do $
for j=0, sz[1]-1 do $
  if im.img[i,j] gt 0 then self.img[i,j]=1000*self.img[i,j]/im.img[i,j] else self.img[i,j]=1000

end
;--------------------------------------------

pro adimage_CLASS::set_object, adimage

  self.img       = adimage.img
  self.sts       = adimage.sts

end

;--------------------------------------------

function adimage_CLASS::settings_file_exists

  COMMON ad_image_CLASS_Reference, adimage

  self.sts.name = STRCOMPRESS(self.sts.name, /REMOVE_ALL)
  Len=STRLEN(self.sts.name)
  fname = STRMID(self.sts.name, 0, Len)+'.sts'

  Result=File_info(fname)

  Return, Result.exists

end;--------------------------------------------


;----------------------------------------------


pro adimage_CLASS::read_settings, fname

  COMMON ad_image_CLASS_Reference, adimage
  COMMON adimage_settings_CLASS_reference, ims


   self.sts.name = STRCOMPRESS(self.sts.name, /REMOVE_ALL)
   Len=STRLEN(self.sts.name)
   fname = STRMID(self.sts.name, 0, Len)+'.sts'
   ims.name=STRING(ims.name, FORMAT = '(A50)')
  FREE_LUN, 2
  OPENR, 2, fname
  READU, 2,ims
  CLOSE, 2
  FREE_LUN, 2
  ims.name = STRCOMPRESS(ims.name, /REMOVE_ALL)
  self.sts=ims

end

;--------------------------------------------

pro adimage_CLASS::write_settings

  COMMON ad_image_CLASS_Reference, adimage
  COMMON adimage_settings_CLASS_reference, ims

  self.sts.name = STRCOMPRESS(self.sts.name, /REMOVE_ALL)
  Len=STRLEN(self.sts.name)
  fname = STRMID(self.sts.name, 0, Len)+'.sts'
  self.sts.name=STRING(self.sts.name, FORMAT = '(A50)')

  ims=self.sts

  FREE_LUN, 2
  OPENW, 2, fname

  WRITEU, 2,ims

  CLOSE, 2
  FREE_LUN, 2

end
;--------------------------------------------



function adimage_CLASS::get_zoomin, XY, bs
  return, self.img[XY[0]-bs[0]:XY[0]+bs[0],XY[1]-bs[1]:XY[1]+bs[1]]
end
;--------------------------------------------

pro adimage_CLASS::load_image, fname, oadetector, sett

     common errors, error
     COMMON class_adetector_reference, ad
     error=0
     revX=0
     revY=0
     revT=0
     sett=0

     Result = FILE_INFO(fname)
     if result.exists eq 1 then $
     begin

;     self.sts.adet.dist=247.587
;     self.sts.adet.beamx=1033.38
;     self.sts.adet.beamy=1017.68
;     self.sts.adet.omega0=0.0
;     self.sts.adet.ttheta0=0.0
;     self.sts.adet.psizex=0.079
;     self.sts.adet.psizey=0.079

;     self.sts.adet.nopixx=2048
;     self.sts.adet.nopixy=2048
;     self.sts.adet.angle=0.0
;     self.sts.adet.tiltom=0.0
;     self.sts.adet.tiltch=0.0
;     oadetector->set_object, self.sts.adet

    ; dettype is detector type
    ; 1 = MARCCD
    ; 2 = Bruker / SMART
    ; 3 = Bruker / Roper
    ; 4 = MARCCD / tiff
    ; 5 = MAR345

    dettype=self.sts.det_format ; MarCCD
    ;dettype=2

    ;COMMON reversals, WID_BUTTON_revX, WID_BUTTON_revY,WID_BUTTON_revT
    ;revX=WIDGET_INFO(WID_BUTTON_revX, /BUTTON_SET)
    ;revY=WIDGET_INFO(WID_BUTTON_revY, /BUTTON_SET)
    ;revT=WIDGET_INFO(WID_BUTTON_revT, /BUTTON_SET)

    case dettype of

    5: begin
          READ_mar345,fname, image1, header
          self.img=reverse(image1, 2)
          sz=size(image1)
          self.sts.adet.nopixx=sz[1]
          self.sts.adet.nopixY=sz[2]
       end
    4: begin

;----------- Start MARCCD Detector / tiff -----------------------------------

                image1 = READ_tiff (fname)
                if revX eq 1 then image1=reverse(image1,1)
                if revY eq 1 then image1=reverse(image1,2)
                if revT eq 1 then image1=transpose(image1)
                image1=(reverse(image1,2))
                imSize=SIZE(image1)
                ;image=long(image1)

                ;long(self.sts.adet.nopixy/imSize[2])
                self.img[0:imSize[1]-1,0:imSize[2]-1]=image1

                ;  Read settings file
                sett=0
                if sett eq 1 then $
                begin
                 self.sts.name=fname
                 Result=self->settings_file_exists()
                 if result eq 1 then self->read_settings, fname else  self->write_settings
                 tx=settings_text(self)
                 si=size(tx)
                 for i=0, si[1]-1 do print, tx[i]
                end
                self.sts.adet.nopixx=imsize[1]
                self.sts.adet.nopixY=imsize[2]
                self.sts.binning=ROUND(ad.nopixx/imsize[1])

;------------ End MARCCD detector ------------------------------------
   end


    1: begin

;----------- Start MARCCD Detector -----------------------------------

                FREE_LUN, 2
                OPENR, 2, fname
                image1= bytarr(1024,1024)
                image = lonarr(1024,1024)
                image1 = READ_BINARY (2 ,$
                DATA_DIMS=[1024, 1024], DATA_TYPE=2, ENDIAN='big', DATA_START=4096)
                imSize=SIZE(image1)
                image=long(image1)
                CLOSE, 2

;------------ End MARCCD detector ------------------------------------
   end

2: begin

;------------ Start Bruker CCD Detector ------------------------------

                FREE_LUN, 2
                OPENR, 2, fname
                self.sts.name=fname
                image1= bytarr(512,512)
                image = lonarr(512,512)
                image1 = READ_BINARY (2 ,$
                DATA_DIMS=[512, 512], DATA_TYPE=1, ENDIAN='big', DATA_START=8192)
                imSize=SIZE(image1)
                image=long(image1)
                im=''
                if not eof(2) then readf, 2, im
                CLOSE, 2

                ; --- read overload table and apply correction -------

                count=0
                while strlen(im) gt 0 do begin
                 im1=long(strmid(im,0,9))
                 im2=long(strmid(im,9,7))
                 yp=im2/512
                 xp=im2-yp*512
                 image[xp,yp]=im1
                 im=strmid(im,16)
                 count=count+1
                endwhile
                print,"Number of pixels over 255", count
                self.img=rotate(image,7)
                mud:

end

;----------------------------------

    3: begin

       READ_PRINCETON, fname, imag, header=header, x_cal=x_cal
       self.sts.name=fname
       Result=self->settings_file_exists()

       ; line below excluded because of change of img.sts definition

       if result eq 1 then self->read_settings, fname else  self->write_settings

       ;self.sts.gonio[1]=self.sts.gonio[1]
       bin=size(imag)


       self.sts.name=fname
       ;self.sts.binning=4;
       self.sts.binning=long(self.sts.adet.nopixy/bin[2])

       self.img[0:long(self.sts.adet.nopixx/self.sts.binning)-1,0:long(self.sts.adet.nopixy/self.sts.binning)-1]=reverse(imag,2)


       ;[0:long(self.sts.adet.nopixy/self.sts.binning)-1,0:long(self.sts.adet.nopixx/self.sts.binning)-1]=reverse(transpose(imag),1)

end
endcase

     endif else $
     begin
       imag = lonarr(self.sts.adet.nopixx,self.sts.adet.nopixy)
       Print, 'File does not exist '
       error=1
     endelse
   ;common baseimg, TImage
   ;WIDGET_CONTROL, TImage, BASE_SET_TITLE=fname


end

pro adimage_CLASS::append_image, fname, oadetector, sett

     common errors, error
     COMMON class_adetector_reference, ad
     error=0
     revX=0
     revY=0
     revT=0
     sett=0

     Result = FILE_INFO(fname)
     if result.exists eq 1 then $
     begin
      ima=self.img
;     self.sts.adet.dist=247.587
;     self.sts.adet.beamx=1033.38
;     self.sts.adet.beamy=1017.68
;     self.sts.adet.omega0=0.0
;     self.sts.adet.ttheta0=0.0
;     self.sts.adet.psizex=0.079
;     self.sts.adet.psizey=0.079

;     self.sts.adet.nopixx=2048
;     self.sts.adet.nopixy=2048
;     self.sts.adet.angle=0.0
;     self.sts.adet.tiltom=0.0
;     self.sts.adet.tiltch=0.0
;     oadetector->set_object, self.sts.adet

    ; dettype is detector type
    ; 1 = MARCCD
    ; 2 = Bruker / SMART
    ; 3 = Bruker / Roper
    ; 4 = MARCCD / tiff
    ; 5 = MAR345

    dettype=self.sts.det_format ; MarCCD
    dettype=2

    ;COMMON reversals, WID_BUTTON_revX, WID_BUTTON_revY,WID_BUTTON_revT
    ;revX=WIDGET_INFO(WID_BUTTON_revX, /BUTTON_SET)
    ;revY=WIDGET_INFO(WID_BUTTON_revY, /BUTTON_SET)
    ;revT=WIDGET_INFO(WID_BUTTON_revT, /BUTTON_SET)

    case dettype of

    5: begin
          READ_mar345,fname, image1, header
          self.img=reverse(image1, 2)
          sz=size(image1)
          self.sts.adet.nopixx=sz[1]
          self.sts.adet.nopixY=sz[2]
       end
    4: begin

;----------- Start MARCCD Detector / tiff -----------------------------------

                image1 = READ_tiff (fname)
                if revX eq 1 then image1=reverse(image1,1)
                if revY eq 1 then image1=reverse(image1,2)
                if revT eq 1 then image1=transpose(image1)
                image1=(reverse(image1,2))
                imSize=SIZE(image1)
                ;image=long(image1)

                ;long(self.sts.adet.nopixy/imSize[2])
                self.img[0:imSize[1]-1,0:imSize[2]-1]=image1

                ;  Read settings file
                if sett eq 1 then $
                begin
                 self.sts.name=fname
                 Result=self->settings_file_exists()
                 if result eq 1 then self->read_settings, fname else  self->write_settings
                 tx=settings_text(self)
                 si=size(tx)
                 for i=0, si[1]-1 do print, tx[i]
                end
                self.sts.adet.nopixx=imsize[1]
                self.sts.adet.nopixY=imsize[2]
                self.sts.binning=ROUND(ad.nopixx/imsize[1])

;------------ End MARCCD detector ------------------------------------
   end


    1: begin

;----------- Start MARCCD Detector -----------------------------------

                FREE_LUN, 2
                OPENR, 2, fname
                image1= bytarr(1024,1024)
                image = lonarr(1024,1024)
                image1 = READ_BINARY (2 ,$
                DATA_DIMS=[1024, 1024], DATA_TYPE=2, ENDIAN='big', DATA_START=4096)
                imSize=SIZE(image1)
                image=long(image1)
                CLOSE, 2

;------------ End MARCCD detector ------------------------------------
   end

2: begin

;------------ Start Bruker CCD Detector ------------------------------

                FREE_LUN, 2
                OPENR, 2, fname
                self.sts.name=fname
                image1= bytarr(512,512)
                image = lonarr(512,512)
                image1 = READ_BINARY (2 ,$
                DATA_DIMS=[512, 512], DATA_TYPE=1, ENDIAN='big', DATA_START=8192)
                imSize=SIZE(image1)
                image=long(image1)
                im=''
                if not eof(2) then readf, 2, im
                CLOSE, 2

                ; --- read overload table and apply correction -------

                count=0
                while strlen(im) gt 0 do begin
                 im1=long(strmid(im,0,9))
                 im2=long(strmid(im,9,7))
                 yp=im2/512
                 xp=im2-yp*512
                 image[xp,yp]=im1
                 im=strmid(im,16)
                 count=count+1
                endwhile
                print,"Number of pixels over 255", count
                self.img=image
                mud:

end

;----------------------------------

    3: begin

       READ_PRINCETON, fname, imag, header=header, x_cal=x_cal
       self.sts.name=fname
       Result=self->settings_file_exists()

       ; line below excluded because of change of img.sts definition

       if result eq 1 then self->read_settings, fname else  self->write_settings

       ;self.sts.gonio[1]=self.sts.gonio[1]
       bin=size(imag)


       self.sts.name=fname
       ;self.sts.binning=4;
       self.sts.binning=long(self.sts.adet.nopixy/bin[2])

       self.img[0:long(self.sts.adet.nopixx/self.sts.binning)-1,0:long(self.sts.adet.nopixy/self.sts.binning)-1]=reverse(imag,2)


       ;[0:long(self.sts.adet.nopixy/self.sts.binning)-1,0:long(self.sts.adet.nopixx/self.sts.binning)-1]=reverse(transpose(imag),1)

end
endcase
     self.img=self.img+ima
     endif else $
     begin
       imag = lonarr(self.sts.adet.nopixx,self.sts.adet.nopixy)
       Print, 'File does not exist '
       error=1
     endelse
   ;common baseimg, TImage
   ;WIDGET_CONTROL, TImage, BASE_SET_TITLE=fname


end

;-----------------------------------------------------
;-----------------------------------------------------

function adimage_CLASS::peak_match, optable1, box
  pt=optable1->get_object()
  sum=0.0
  sum1=0.0
  for i=0, pt.peakno do $
  begin

     if pt.peaks[i].detXY[0] gt box and pt.peaks[i].detXY[0] lt self.sts.adet.nopixx-box and $
        pt.peaks[i].detXY[1] gt box and pt.peaks[i].detXY[1] lt self.sts.adet.nopixy-box then $
     begin
        sum1=0.0
        for x=-box, box do $
          for y=-box, box do $
            sum1=sum1+self.img[pt.peaks[i].detXY[0]+x,pt.peaks[i].detXY[1]+y]
        sum1=sum1/((2*box+1)*(2*box+1))
     end
     sum=sum+sum1
  endfor
  return, sum
end


function create_transform, tth, nbins, img
 re=n_elements(img)
 ref=reform(img,re)
 tran=intarr(nbins,re)
 rtth=tth[1]-tth[0]
 dtth=rtth/nbins
 for i=0, re-1 do if long((ref[i]-tth[0])/dtth)+1 le nbins-1 then tran[long((ref[i]-tth[0])/dtth)+1,i]=1
 return, tran
end

;--------------------------------------------
function adimage_CLASS::create_tth_array, adt, tth,nbins
 rtth=tth[1]-tth[0]
 dtth=rtth/nbins
 gonio=fltarr(6)
 ad=adt->get_object()
 tth_img=lonarr(adt.nopixx,adt.nopixy)
 for i=0, ad.nopixx-1 do $
 begin
   for j=0, ad.nopixy-1 do $
   begin
     if sqrt(i^2+j^2) lt adt.nopixx/2. then $
     begin
       tth=adt->calculate_tth_from_pixels([i,j], gonio)
       tth_img[i,j]=long((tth-tth[0])/dtth)+1
     endif else tth_img[i,j]=0
   endfor
   update_progress, float(i)/float(adt.nopixx-1)
   endfor
   return, tth_img
end
;--------------------------------------------

function adimage_CLASS::integrate2, adt,  tth, nbins, tth_img
 ad=adt->get_object()
 gonio=fltarr(6)
 spcx=fltarr(nbins)
 spcy=fltarr(nbins)
 npo=fltarr(nbins)
 rtth=tth[1]-tth[0]
 dtth=rtth/nbins
 gonio=fltarr(6)
 for i=0, nbins-1 do spcx[i]=tth[0]+i*dtth
 for i=0, adt.nopixx-1 do $
 begin
   for j=0, adt.nopixy-1 do $
   begin
     if sqrt(i^2+j^2) lt adt.nopixx/2. then $
     begin
         bin=tth_img[i,j]
         spcy[bin]=spcy[bin]+self.img[i,j]
         npo[bin]=npo[bin]+1
     endif
   endfor
   update_progress, float(i)/float(adt.nopixx-1)
   endfor
   for i=0, nbins-1 do spcy[i]=spcy[i]/npo[i]
   spcy[0]=spcy[1]
   return, [[spcx],[spcy]]
end

;--------------------------------------------
; Performs 2theta integration of the image

;--------------------------------------------

function adimage_CLASS::integrate, adt, nbins, tth
 spcy=fltarr(nbins)
 npo=lonarr(nbins)
 spcx=fltarr(nbins)
 rtth=tth[1]-tth[0]
 dtth=rtth/nbins
 ad=adt->get_object()
 gonio=fltarr(6)
 for i=0, nbins-1 do spcx[i]=tth[0]+i*dtth

 for i=0, adt.nopixx-1 do $
 begin
   for j=0, adt.nopixy-1 do $
   begin
     ;if sqrt((i-adt.nopixx/2)^2+(j-adt.nopixy/2)^2) lt adt.nopixx/2. then $ ; do only the inner circle
     begin
       tt=adt->calculate_tth_from_pixels([i,j], gonio)
       bin=long((tt-tth[0])/dtth)+1
       if bin le nbins-1 and bin ge 0 then $
       begin
         npo[bin]=npo[bin]+1
         spcy[bin]=spcy[bin]+self.img[i,j]
       endif
     end
   endfor
   update_progress, float(i)/float(adt.nopixx-1)
   endfor
   for i=0, nbins-1 do spcy[i]=spcy[i]/npo[i]
   window
   plot, spcx, spcy
   return, [[spcx],[spcy]]
end

;--------------------------------------------
function integ_fom,X, Y, P
COMMON Myimage,Myimg, Myadt
; p[0] = dist
; p[1] = beamx
; p[2] = beamy
; p[3] = tiltom
; p[4] = tiltchi
; p[5] = scale
; X and Y are tth and int of integrated spectrum at 0 deg ttheta

 ad=Myadt->get_object()

 psize=[double(ad.psizeX),double(ad.psizeY)]
 nopix=[Long(ad.nopixX),Long(ad.nopixY)]
 spcxy=dblarr(2,100)
 npo=lonarr(100)
 ttha=dblarr(2)
 ttha=[double(14.),double(16.)]
 nbinsa=Long(100)
 kath=[0,0];read_kappa_and_ttheta()


 common Rota, Mtx
 GenerateR, 3,ad.tiltch
 omt=Mtx
 GenerateR, 1,ad.tiltom
 cht=Mtx
 icht=invert(cht)
 tiltmtx=icht##omt##cht
 tiltmtx1=dblarr(3,3)
 for i=0, 2 do for j=0, 2 do tiltmtx1[i,j]=double(tiltmtx[i,j])


 mydll='C:\Program Files\Borland\Delphi7\Projects\AD_image8.dll'
 status=call_external(mydll, 'IDL_integrate_image_tth', Myimg, Double(P[0]), [Double(ad.beamx),Double(ad.beamy)], nopix, tiltMtx1, psize, nbinsa, ttha, spcxy, npo,double(kath[1]), /unload)
 return, (P[1]*spcxy[1,0:99])
end

;--------------------------------------------
pro adimage_CLASS::optimize_calibration, adt, Spe
COMMON Myimage,Myimg, Myadt
 Myimg=self.img
 Myadt=adt
 sz=size(Spe)
 sz=sz[2]
 ad=adt->get_object()

  parinfo = replicate({value:0.D, fixed:0, limited:[0,0], $
                       limits:[0.D,0],step:0D}, 2)
  parinfo[0].fixed = 0
  parinfo[0].step = 0.0001
  parinfo[0].limited(1) = 1
  parinfo[0].limits(1)  = 119
  parinfo[1].limited(1) = 1
  parinfo[1].limits(1)  = 3.0D
  parinfo[*].value = [118.0, 1.37]


 X=Spe[0,0:sz-1]
 Y=Spe[1,0:sz-1]
 err=fltarr(sz)
 for i=0, sz-1 do err[i]=0.0
 p0 = [118.0, 1.4]
 fa = {X:x, Y:x,Z:y, ERR:err}

 p = MPFIT2DFUN('integ_fom', X,X,Y,X,p0,parinfo=parinfo,ERRMSG=errmsg,PERROR=perror)
 print, 'finished optimization'
 print, errmsg
 print, p
 print, perror


end
;--------------------------------------------
function adimage_CLASS::integrate_dll, adt, nbins, tth

 ad=adt->get_object()

 ;mydll='C:\Program Files\Borland\Delphi7\Projects\AD_image8.dll'
 mydll='AD_image8.dll'
 re=file_info(mydll)
 print, 'DLL library found', re.exists

 beamxy=[double(ad.beamX),double(ad.beamY)]
 tiltmtx=adt->tilt_mtx()
 psize=[double(ad.psizeX),double(ad.psizeY)]
 nopix=[Long(ad.nopixX),Long(ad.nopixY)]
 dist=double(ad.dist)
 spcxy=dblarr(2,nbins)
 npo=lonarr(nbins)
 ttha=dblarr(2)
 ttha=[double(tth[0]),double(tth[1])]
 nbinsa=Long(nbins)
 kath=[0,0];read_kappa_and_ttheta()
 status=call_external(mydll, 'IDL_integrate_image_tth', self.img, DIST, beamxy, nopix, tiltMtx, psize, nbinsa, ttha, spcxy, npo,double(kath[1]), /unload)
 return,spcxy
end
;--------------------------------------------
function adimage_CLASS::integrate_dll_chi, adt, nbins, tth

 ad=adt->get_object()

 ;mydll='C:\Program Files\Borland\Delphi7\Projects\AD_image8.dll'
 mydll='AD_image8.dll'
 re=file_info(mydll)
 print, 'DLL library found', re.exists

 beamxy=[double(ad.beamX),double(ad.beamY)]
 tiltmtx=adt->tilt_mtx()
 psize=[double(ad.psizeX),double(ad.psizeY)]
 nopix=[Long(ad.nopixX),Long(ad.nopixY)]
 dist=double(ad.dist)
 spcxy=dblarr(2,nbins)
 npo=lonarr(nbins)
 ttha=dblarr(2)
 ttha=[double(tth[0]),double(tth[1])]
 nbinsa=Long(nbins)
 kath=[0,0];read_kappa_and_ttheta()
 status=call_external(mydll, 'IDL_integrate_image_chi', self.img, DIST, beamxy, nopix, tiltMtx, psize, nbinsa, ttha, spcxy, npo,double(kath[1]), /unload)
 return,spcxy
end;--------------------------------------------

pro adimage_CLASS::correlate, adt, img2, thr
self.img=self.img<img2.img
 ; for i=0, adt.nopixx-1 do $
 ;   begin
 ;   for j=0, adt.nopixy-1 do $
 ;   begin
 ;     if abs(self.img[i,j]-img2.img[i,j])/min([self.img[i,j],img2.img[i,j]]) lt thr then self.img[i,j]=self.img[i,j]+img2.img[i,j] else $
 ;     self.img[i,j]=min([self.img[i,j],img2.img[i,j]])*2.0
 ;   endfor
 ;   update_progress,(float(i)/float(adt.nopixx-1))
 ;   endfor
end

;--------------------------------------------
function adimage_CLASS::integrate_chi, adt, nbins, chi, tth
 spcy=fltarr(nbins)
 npo=lonarr(nbins)
 spcx=fltarr(nbins)
 rtth=chi[1]-chi[0]
 dtth=rtth/nbins
 ad=adt->get_object()
 gonio=fltarr(6)
 for i=0, nbins-1 do spcx[i]=chi[0]+i*dtth

 for i=0, adt.nopixx-1 do $
 begin
   for j=0, adt.nopixy-1 do $
   begin
     if sqrt(i^2+j^2) lt adt.nopixx/2. then $
     begin
       nu=get_nu_from_pix([i,j],[ad.beamX, ad.beamY])
       ;tt=adt->calculate_tth_from_pixels([i,j], gonio)
       bin=long((nu-chi[0])/dtth)+1
       if bin le nbins-1 and bin ge 0 then $
       begin
         npo[bin]=npo[bin]+1
         spcy[bin]=spcy[bin]+self.img[i,j]
       endif
     endif
   endfor
   print, i
  endfor
  for i=0, nbins-1 do if npo[i] gt 0 then spcy[i]=spcy[i]/npo[i] else spcy[i]=0
  return, [[spcx],[spcy]]
end

;--------------------------------------------

function calculate_DS_ring_flat, ttheta, x_beam, y_beam, x_pix, y_pix, R
 vec=fltarr(2)
 vecs=fltarr(360,2)
 for i=0, 359 do $
 begin
   vec=calculate_flatpix_from_angs(i*acos(-1.0)/180.00, ttheta, x_beam, y_beam, x_pix, y_pix, R)
   vecs[i,0]=vec[0]
   vecs[i,1]=vec[1]
 endfor
  return, vecs
end

;--------------------------------------------

function calculate_DS_ring_cyl, ttheta, x_beam, y_beam, x_pix, y_pix, R
 vec=fltarr(2)
 vecs=fltarr(360,2)
 for i=0, 359 do $
 begin
   vec=calculate_cylpix_from_angs(i*acos(-1.0)/180.00, ttheta, x_beam, y_beam, x_pix, y_pix, R)
   vecs[i,0]=vec[0]
   vecs[i,1]=vec[1]
 endfor
  return, vecs
end

;--------------------------------------------

pro plot_pattern
 image=intarr(600,600)
 window, 3, XSIZE=600, YSIZE=600
 vec=fltarr(2)
 vecs=fltarr(360,2)

 vec=calculate_DS_ring_cyl(10.0, 3218.50, 1258.60, 0.1, 0.1, 127.4)
 for i=0,359 do  image[long(vec[i,0]), long(vec[i,1]) ]=255

  tv, image
end

;find_max

pro adimage_CLASS::remove_blind_spots
siz=size(self.img)
sx=siz[1]
sy=siz[2]
for i=0, sx do $
  for j=0, sy do $
  begin
    if detector_edge([i,j]) eq 0  then if self.img[i,j] eq 0 then $
    self.img[i,j]=(self.img[i,j-1]+self.img[i,j+1]+self.img[i-1,j]+self.img[i,j+1])/4.0
  endfor

end


function two_image_correlation, oimage1, oimage2

end

;-------------------------------------------------

pro adimage_CLASS::subtract_bcg, obcg
 bcg=obcg->get_object()
 siz=size(self.img)
 sx=siz[1]
 sy=siz[2]
 for i=0, sx-1 do $
   for j=0, sy-1 do $
     self.img[i,j]=self.img[i,j]-bcg.img[i,j]
end



pro adimage_CLASS::resize_image, arr1,arr2
  b=self.img[0:arr1-1,0:arr2-1]
  self.img=b
  end

;------------------------------------

pro adimage_CLASS::set_detector_format, fm
  self.sts.det_format=fm
end

pro CLASS_adimage, oadetector, imt, arr1, arr2

  ada=oadetector->get_object()

  COMMON ad_image_CLASS_Reference, adimage
  COMMON class_adetector_reference, ad
  COMMON adimage_settings_CLASS_reference, ims

  ims={adimage_settings_CLASS, $
                  name      : '',$
                  gonio     : fltarr(6),         $
                  trans     : fltarr(4),         $
                  adet      : ad,                $
                  det_format: 0,                 $ ; 1=Princeton, 2=Rigaku
                  rot_ax    : 0,                 $
                  rot_range : 0.0,               $
                  abs_mat   : 0,                 $
                  abs_thick : 0.0,               $
                  exptime   : 0.0,               $
                  binning   : 0}

  adimage={adimage_CLASS, $
                  img       : lonarr(arr1,arr2),$;ad.nopixx, ad.nopixy), $; (4112,4096), $ ; 512x512
                  sts       : ims}

  adimage.sts.det_format=imt
  ;adimage.img=adimage.img[0:arr1-1,0:arr2-1]

  ;adimage={adimage_CLASS, $
  ;                img       : lonarr(arr1,arr2),$;ad.nopixx, ad.nopixy), $; (4112,4096), $ ; 512x512
  ;                sts       : ims}

end

;--------------------------------------------
