
pro read_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
  a=''
  fil='fit2d_shell_setup_'+string(user,format='(I03)')+'.txt'
  free_lun, 2
  openr, 2, fil
  readf, 2, a
  la=strlen(a)
  fit2dexefile=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  jcpdsdir=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  opencalfile=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  calibratescriptfile=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  maskscriptfile=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  exmaskscriptfile=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  cakescriptfile=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  datadir=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  destdir=strmid(a,33,la-33)
  readf, 2, a
  la=strlen(a)
  wave=float(strmid(a,33,la-33))
  close, 2
  free_lun, 2

end

;-----------------------------------------------------------
pro write_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
  a=''
  fil='fit2d_shell_setup_'+string(user,format='(I03)')+'.txt'
  free_lun, 2
  openw, 2, fil
  printf, 2, 'fit2d executable location      ; '+fit2dexefile
  printf, 2, 'jspds card libtary location    ; '+jcpdsdir
  printf, 2, 'calibrate script location      ; '+opencalfile
  printf, 2, 'open with cal script location  ; '+calibratescriptfile
  printf, 2, 'mask script location           ; '+maskscriptfile
  printf, 2, 'exmask script location         ; '+exmaskscriptfile
  printf, 2, 'cake   script location         ; '+cakescriptfile
  printf, 2, 'data directory                 ; '+datadir
  printf, 2, 'destination directory          ; '+destdir
  printf, 2, 'default wavelength             ; '+string(wave, format='(F10.5)')
  close, 2
  free_lun, 2
end
;-----------------------------------------------------------

pro GSE_shell

@COMMON_data

COMMON BOX_COORDS, X1,X2,Y1,Y2, SEL1, SEL2, LISTEN,Xa1,Xa2,Ya1,Ya2, ox, oy
common draw_reference, draw1, draw2, drawi
common zoomob, zpi, zoo
common fit2dstatus, fit2d_online
common phases, phs, nphs

common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
 ;COMMON WID_IMG, drawi, image1
 common BG_nodes, nodes
common timers, image_timer_status
common refa, refg
common function_names, peak_fit_function
;resolve_all
peak_fit_function='PSEUDOVOIGT_PROFILE'
crystallography
peak_profile_functions
image_timer_status=0
zoo=0
p1=0.0
p2=0.0
p3=0.0
file1=STRARR(20)
dir1=STRARR(20)
ovlist=''
LISTEN=0
SEL1=0
SEL2=0
X1=0
X2=0
Y1=0
Y2=0
fn=''
j = obj_new('jcpds')
j1 = obj_new('jcpds')
j2 = obj_new('jcpds')
j3 = obj_new('jcpds')



 Class_adetector
 adetector=obj_new('adetector_class')
 arr1=2048
 arr2=2048
 imt=4
 CLASS_adimage, adetector, imt, arr1, arr2

 ad=adetector->get_object()
 ad.nopixx=arr1
 ad.nopixy=arr2

 adetector->set_object, ad
 image=obj_new('adimage_CLASS')
 image->set_detector_format, imt





nphs=0

ph={tth   :fltarr(500,5),$
    excl  :intarr(500),$
    scl   :1.0,$
    npks  :0L,$
    wv    :0.0,$
    p     :0.0,$
    j     :j,$
    sym   :'',$
    abc   :fltarr(6),$
    err   :fltarr(6),$
    dir   :'',$$
    file  :''}

phs=replicate(ph,20)

ZOOM_plot_Class_Definition
zpi=obj_new('zoom_plot_class')
y=fltarr(360)
x=fltarr(360)

run_fit2d

res={base:'',seq:0L,ext:''}

nsp=0
integrated=0

NREFS=0
sens=[0,0,0]
cal={xpix  : 70.0,$
 ypix  : 70.0,$
 dist  : 320.0,$
 wavel :   0.7,$
 xbeam : 250.0,$
 ybeam : 250.0,$
 tilt  :   1.0,$
 angle :   2.0}
  fit2d_online=0

   user=0
   WID_User_L
   read_setup, opencalfile, maskscriptfile, exmaskscriptfile, cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user
   path=datadir
   WID_fit2d_shell_L


  zpi->set, $
           draw1, $
           0, $
           [1], $
           x, $
           y, $
           [0, 1], $
           max(y), $
           min(y), $
           [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0], $
           fltarr(10)

end

;-------------------------
