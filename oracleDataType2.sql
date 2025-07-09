-- associative array
declare 
type associative_type is table of varchar2(20) index by varchar2(20);
v_accociative_array associative_type;
begin
v_accociative_array('color1'):='merron';
v_accociative_array('color2'):='black';
v_accociative_array('color3'):='white';
v_accociative_array('color4'):='blue';
v_accociative_array('color5'):='pink';
v_accociative_array('color6'):='violet';
dbms_output.put_line(v_accociative_array('color3'));
dbms_output.put_line(v_accociative_array.first);
dbms_output.put_line(v_accociative_array.last);
--v_accociative_array.delete() -- delete the all value
v_accociative_array.delete('color4');
dbms_output.put_line(v_accociative_array.count);

end;
/