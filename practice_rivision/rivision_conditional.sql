declare
marks number(4,2):=&marks;
begin
if marks>=90 then
dbms_output.put_line('excellent');
elsif marks>=80 and marks<90 then
dbms_output.put_line('very good');
elsif marks>=70 and marks<80 then
dbms_output.put_line('good');
else
dbms_output.put_line('try to improve');
end if;
end;
/

select * from order1;

declare 
count_data order1.o_count%type;
begin
select max(o_count) into count_data from order1;
dbms_output.put_line('max number is '||count_data);
if count_data<5 then
dbms_output.put_line('try to improve sell');
else
dbms_output.put_line('good job, keep improving');
end if;
end;
/

select * from employee;

declare 
v_salary employee.salary%type;
begin
select salary into v_salary from employee where id=4;
case 
when v_salary>=5000 then
dbms_output.put_line('salary is more than 5000');
when v_salary>=4000 and v_salary<5000 then
dbms_output.put_line('salary is more than 4000');
when v_salary>=3000 and v_salary<4000 then
dbms_output.put_line('salary is more than 3000');
else 
dbms_output.put_line('incremen the salary');
end case;
end;
/
