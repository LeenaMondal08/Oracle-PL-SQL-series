--
select * from student1;
insert into student1 values(3,'sayan',56);
commit;
--normat fetch
declare
s_name varchar(10);
begin
select name into s_name from student1 where roll=1;
dbms_output.put_line(s_name);
end;

--handaling exception when try to fetch muti record
declare
s_name varchar(10);
begin
--select name into s_name from student1 where roll=9;
select name into s_name from student1;
dbms_output.put_line(s_name);
exception
when no_data_found then
dbms_output.put_line('no data found');
when too_many_rows then
dbms_output.put_line('multiple record');
end;


--composite variable
declare
type s_name_type is table of varchar(10);
s_name s_name_type:=s_name_type();
type s_roll_type is  table of number(2);
s_roll s_roll_type:=s_roll_type();
begin
select name,roll bulk collect into s_name,s_roll from student1 where age>20;
for i in s_name.first..s_name.last
loop
dbms_output.put_line(s_name(i)||s_roll(i));
end loop;
end;

--cursor implicit
begin
update student1 set age=65 where roll=&roll;
if sql%notfound then
dbms_output.put_line('no rows updated');
else
dbms_output.put_line(sql%rowcount||'  rows updated');
end if;
end;
select * from student1;


--explicit coursor
declare 
s_name student1.name%type;
cursor c1 is select name from student1;
begin
open c1;
fetch c1 into s_name;
dbms_output.put_line(s_name);
fetch c1 into s_name;
dbms_output.put_line(s_name);
close c1;
end;
/

-- by using loop

declare 
s_name student1.name%type;
cursor c1 is select name from student1;
begin
open c1;
loop
fetch c1 into s_name;
exit when c1%notfound;
dbms_output.put_line(s_name);
end loop;
close c1;
end;
/

-- multiple column fetch
declare 
cursor c1 is select name,age from student1 order by age desc;
s_name student1.name%type;
s_age student1.name%type;
begin
open c1;
loop
fetch c1 into s_name,s_age;
exit when (c1%rowcount>3) or (c1%notfound);
dbms_output.put_line(s_name||' '||s_age);
end loop;
close c1;
end;
/
