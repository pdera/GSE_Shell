;---------------------------------------------------

function read_users
 fi='users.txt'
 a=''
 free_lun, 2
 openr, 2, fi
 users=''
 n=0
 while not eof(2) do $
 begin
  readf, 2, a
  if n eq 0 then users=a else users=[users,a]
  n=n+1
 end
 close, 2
 free_lun, 2
 return, users
end
;---------------------------------------------------

pro WID_user_L_event, ev

COMMON WID_User_common, WID_DROPLIST_0, WID_TEXT_0, WID_BUTTON_0, WID_BUTTON_1
common filesetup, opencalfile, maskscriptfile, exmaskscriptfile,cakescriptfile, calibratescriptfile, fit2dexefile, datadir, jcpdsdir, destdir, wave, user

 WIDGET_CONTROl, ev.id, GET_UVALUE=uv
 case uv of
'droplist': $
  begin
     re=WIDGET_INFO(wid_droplist_0, /droplist_select)
     if re gt -1 then user=re
  end
'new user':$
begin
  widget_control, wid_text_0, get_value=name
  if name ne '' then $
  begin
   list=read_users()
   list=[list,name]
   fi='users.txt'
   free_lun,3
   openw, 3, fi
   for i=0, n_elements(list)-1 do printf, 3, list[i]
   close, 3
   free_lun,3
   WIDGET_CONTROL, WID_DROPLIST_0, SET_VALUE=list
   WIDGET_CONTROL, WID_DROPLIST_0, SET_droplist_select=n_elements(list)-1
   user=n_elements(list)-1
   file_copy, 'fit2d_shell_setup.txt', 'fit2d_shell_setup_'+string(user,format='(I03)')+'.txt'
  end
end
'start program': WIDGET_CONTROl, ev.top, /destroy
 else:
 endcase

end

;---------------------------------------------------

pro WID_user_aux
COMMON WID_User_common

WIDGET_CONTROL, WID_DROPLIST_0, SET_UVALUE='droplist'
WIDGET_CONTROL, WID_TEXT_0,  SET_UVALUE=''
WIDGET_CONTROL, WID_TEXT_0,  EDITABLE=1
WIDGET_CONTROL, WID_BUTTON_0,  SET_UVALUE='new user'
WIDGET_CONTROL, WID_BUTTON_1,  SET_UVALUE='start program'
users=read_users()
WIDGET_CONTROL, WID_DROPLIST_0, SET_VALUE=users

end

;---------------------------------------------------
