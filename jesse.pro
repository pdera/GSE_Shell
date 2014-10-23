function file_name_from_series, rootname, seq, nod
case nod of
3: file=rootname+string(seq,format='(I03)')+'.chi'
4: file=rootname+string(seq,format='(I04)')+'.chi'
5: file=rootname+string(seq,format='(I05)')+'.chi'
else:
endcase

return,file
end


;--------------------------------------------


function range_of_files, rootname, seq, nod


s1=long(seq)

case nod of

3: begin
file=rootname+string(seq,format='(I03)')+'.chi'
re=file_info(file)

while re.exists eq 1 do $
begin
s1=s1+1
file=rootname+string(s1,format='(I03)')+'.chi'
re=file_info(file)
endwhile

s2=long(seq)
file=rootname+string(seq,format='(I03)')+'.chi'
re=file_info(file)

while re.exists eq 1 do $
begin
s2=s2-1
file=rootname+string(s2,format='(I03)')+'.chi'
re=file_info(file)
endwhile
end

4: begin
file=rootname+string(seq,format='(I04)')+'.chi'
re=file_info(file)

while re.exists eq 1 do $
begin
s1=s1+1
file=rootname+string(s1,format='(I04)')+'.chi'
re=file_info(file)
endwhile

s2=long(seq)
file=rootname+string(seq,format='(I04)')+'.chi'
re=file_info(file)

while re.exists eq 1 do $
begin
s2=s2-1
file=rootname+string(s2,format='(I04)')+'.chi'
re=file_info(file)
endwhile
end

5: begin
file=rootname+string(seq,format='(I05)')+'.chi'
re=file_info(file)

while re.exists eq 1 do $
begin
s1=s1+1
file=rootname+string(s1,format='(I05)')+'.chi'
re=file_info(file)
endwhile

s2=long(seq)
file=rootname+string(seq,format='(I05)')+'.chi'
re=file_info(file)

while re.exists eq 1 do $
begin
s2=s2-1
file=rootname+string(s2,format='(I05)')+'.chi'
re=file_info(file)
endwhile
end
else:
endcase
s2=s2+1
s1=s1-1

;print, 'File series: ',s2, s1, s1-s2+1
return, [s2,s1]

end


;--------------------------------------


pro Jesse, filename,rootname,s,no_of_dig


 filename = dialog_pickfile(/read, filter='*.chi', path='E:\StasRampChi', get_path=pt)
 if filename ne '' then $
 begin
   print, filename
   lf=strlen(filename)
   rootname=strmid(filename, 0, lf-no_of_dig-4)
   seqnum=strmid(filename, lf-no_of_dig-4,no_of_dig)
   print, 'File range: ', range_of_files(rootname, seqnum, no_of_dig)
   s=range_of_files(rootname, seqnum, no_of_dig)

 endif else print, 'No file selected'

end