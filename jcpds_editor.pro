pro JCPDS_editor, fil, leader, la
 COMMON JCPDS_editor_objects, ja, dest
 if n_params() eq 0 then fil=''
 jcpds__define
 if obj_valid(ja) eq 0 then $
 begin
   j = obj_new('jcpds')
   dest=1
 endif else $
 begin
   fil='Use existing object'
   dest=0
 endelse

 if n_params() eq 2 then WID_JCPDS_editor, fil, leader else $
 if n_params() lt 2 then  WID_JCPDS_editor, fil else $
 if n_params() eq 3 then WID_JCPDS_editor, fil, leader, la
end