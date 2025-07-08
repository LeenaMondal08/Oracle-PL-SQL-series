--exception
declare 
v_number number;
begin
v_number:=100/0;
end;

--exception handled
declare 
v_number number;
begin
v_number:=100/0;
exception
when zero_divide then
dbms_output.put_line('zero division exception accure');
end;
--exception occure when try to fetch data from a particular table
declare 
v_salary employee.salary%type;
begin
select salary into v_salary from employee where id=50;
dbms_output.put_line('salary: '||v_salary);
exception
when no_data_found then
dbms_output.put_line('no data for this employee');
when too_many_rows then
dbms_output.put_line('many rows returns');
end;
--value error
declare
value1 number(3);
begin
value1:=78526;
exception 
when value_error then
dbms_output.put_line('chaek the value');
end;
/
--unname exception
declare 
v_salary number;
salary_limit exception;
pragma exception_init (salary_limit,-675);
begin
v_salary:=1000/0;
exception
when salary_limit then
dbms_output.put_line('salary ammount is too high');
end;
/

--user defined exception
create table exp1(e_id number primary key,
name varchar2(10)
);
create or replace procedure proc_exp(emp_id in number, emp_name varchar2)
is
begin
insert into exp1 values(emp_id,emp_name);
commit;
exception
when dup_val_on_index then
raise_application_error (-2001,'duplicate records are not allowed');
when others then
raise_application_error (-200,'duplicate records are not allowed');
end;
/
exec proc_exp(1000,'mongal');
select * from exp1;

--another example to raise an exception
select * from employee;
create or replace procedure exp_proc_emp1(e_id in number, e_name in varchar2)
is 
invalid_exception_id exception;
begin
if (e_id>100) then
raise invalid_exception_id;
else
insert into employee(id,name) values(e_id,e_name);
end if;
exception
when invalid_exception_id then
raise_application_error(-786,'invalid employee id');
end;
/
EXEC exp_proc_emp1(167, 'priyanka');



















