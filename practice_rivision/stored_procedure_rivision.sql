create or replace procedure proce_rivision 
as
e_name employee.name%type;
begin
select name into e_name from employee where id=1;
dbms_output.put_line(e_name);
end;

exec proce_rivision;

-- in parameter 
create or replace procedure proc_rivi_in(id_no in number)
as
emp_name employee.name%type;
begin
select name into emp_name from employee where id=id_no;
dbms_output.put_line(emp_name);
end;
/
exec proc_rivi_in(2);

-- inout parameter

create or replace procedure proc_rivi_in_out(id_no in number, e_name out varchar2, e_salary out number)
as
begin
select name ,salary into e_name,e_salary from employee where id = id_no;
end;
/
declare
e_name employee.name%type;
e_salary employee.salary%type;
begin
proc_rivi_in_out(3,e_name,e_salary);
dbms_output.put_line('Name: ' || e_name);
dbms_output.put_line('Department: ' || e_salary);
end;
/

-- procedure with cursor
create or replace procedure proc_cursor(e_rec out employee%rowtype)
as
cursor c1 is select * from employee;
begin
open c1;
loop
fetch c1 into e_rec;
exit when c1%notfound;
dbms_output.put_line(e_rec.name || ' '||e_rec.salary);
end loop;
close c1;
end;
/
declare 
e_rec employee%rowtype;
begin
proc_cursor(e_rec);
end;
/