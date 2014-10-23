pro WID_MAR345_commons

COMMON WID_MAR345_elements,$
 WID_BUTTON_0, $
 WID_BUTTON_1, $
 WID_BUTTON_2, $
 WID_DRAW_0


end

;--------------------------------------

;--------------------------------------


pro WID_MAR345_L_event, ev
common datas, data, data1,oadetector,opt,oimage

COMMON WID_MAR345_elements

 WIDGET_CONTROL, ev.id, GET_UVALUE=uv
 case uv of
 'Open':$
 begin
  fn=dialog_pickfile(/read, filter='*.mar3450', path='T:\dac_user\2007\BMD_2007-2\Lauren')
  if fn ne '' then $
  read_mar345, fn, data, header
  data1=congrid(data, 1024,1024)
  oimage->load_image, fn,oadetector
  wset, WID_DRAW_0
  tv, data1
 end
 'Colors':$
 begin
   xloadct,GROUP=ev.top, /MODAL
   wset, WID_DRAW_0
   tv, data1
 end
 'Close':WIDGET_CONTROL, ev.top, /destroy
 else:
 endcase

end

;--------------------------------------

pro WID_MAR345_aux

COMMON WID_MAR345_elements
 WIDGET_CONTROL, WID_BUTTON_0, SET_UVALUE='Close'
 WIDGET_CONTROL, WID_BUTTON_1, SET_UVALUE='Open'
 WIDGET_CONTROL, WID_BUTTON_2, SET_UVALUE='Colors'
 WIDGET_CONTROL, WID_DRAW_0, SET_UVALUE=''
 WIDGET_CONTROL, WID_DRAW_0, GET_VALUE=WID_DRAW_0
end