select * from employee;
-- fetching data by qurey in procedure
create or replace procedure e_name(e_id in number)
is
e_name varchar(10);
begin 
select name into e_name from employee WHERE id = e_id;

dbms_output.put_line(e_name);
end;
/
exec e_name(2);


-- fetching entire row in store procedure

create or replace procedure s_data(s_age in number,temp out student1%rowtype)
is
begin
select * into temp from student1 where age=s_age;
end;
/
declare
age_no number;
temp student1%rowtype;
begin
age_no:=30;
s_data(age_no,temp);
dbms_output.put_line(temp.roll);
dbms_output.put_line(temp.name);
end;
/
select *from student1;

-- fetching mutltiple records with cursor

create or replace procedure get_employee
is cursor c1 is select name, salary,city from employee where rownum<=3;
e_name varchar2(10);
e_salary number(10);
e_city varchar(10);
begin
open c1;
loop
fetch c1 into e_name,e_salary,e_city;
exit when c1%notfound;
dbms_output.put_line(e_name||' '||e_salary||' '||e_city);
end loop;
close c1;
end;
/
exec get_employee;

