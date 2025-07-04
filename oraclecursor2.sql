--cursor for lopp
declare
cursor c1 is select roll,name from student1;
begin
for i in c1
loop
dbms_output.put_line(i.roll||' '||i.name);
exit when c1%notfound;
end loop;
end;

select * from student1;
update student1 set age=45 where name='ruma';
update student1 set age=56 where roll=4;

-- cursor parameter
declare 
cursor c1(age_value number) is select name from student1 where age=age_value;
s_name varchar(10);
begin
dbms_output.put_line('value for c1=45');
open c1(45);
loop
fetch c1 into s_name;
exit when c1%notfound;
dbms_output.put_line(s_name);
end loop;
close c1;

dbms_output.put_line('value for c1=56');
open c1(56);
loop
fetch c1 into s_name;
exit when c1%notfound;
dbms_output.put_line(s_name);
end loop;
close c1;
end;
/

create table employee (
id number(10) primary key,
name varchar2(10),
salary number(10,2),
city varchar(10)
);
insert into employee values(1,'dripti',6784,'kolkata');
insert into employee values(2,'sayak',5684,'behala');
insert into employee values(3,'piyali',6348,'goura');
insert into employee values(4,'moumita',2894,'kolkata');
insert into employee values(5,'dripti',5004,'sonamui');
select * from employee;

-- multipale table
declare 
cursor c1 is select salary from employee;
cursor c2 is select roll from student1;
e_salary number(10);
s_roll number(2);
begin
open c1;
loop 
fetch c1 into e_salary;
exit when c1%found;
dbms_output.put_line(e_salary);
end loop;
close c1;

open c2;
loop 
fetch c2 into s_roll;
exit when c2%found;
dbms_output.put_line(s_roll);
end loop;
close c2;
end;
/




