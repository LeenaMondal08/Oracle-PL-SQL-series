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







