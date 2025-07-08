-- ref cursor
select * from employee;
-- weak ref cursor;
declare 
type c_type is  ref cursor;
ref_c1 c_type;
e_name varchar(10);
s_name varchar(10);

begin 
dbms_output.put_line('department');
open ref_c1 for select name from employee;
loop
fetch ref_c1 into e_name;
exit when ref_c1%notfound;
dbms_output.put_line(e_name);
end loop;
close ref_c1;

dbms_output.put_line('student');
open ref_c1 for select name from student1;
loop
fetch ref_c1 into s_name;
exit when ref_c1%notfound;
dbms_output.put_line(s_name);
end loop;
close ref_c1;
end;
/
-- strong ref cursor
declare 
type c_type is  ref cursor return employee%rowtype;
ref_c1 c_type;
e_details employee%rowtype;

begin 
dbms_output.put_line('employee details');
open ref_c1 for select * from employee;
loop
fetch ref_c1 into e_details;
exit when ref_c1%notfound;
dbms_output.put_line(e_details.name || e_details.salary);
end loop;
close ref_c1;
end;


