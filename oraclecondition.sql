--If statement
declare 
a boolean:=false;
begin
if a then
dbms_output.put_line('condition is true');
else 
dbms_output.put_line('condition is false');
end if;
end;

declare 
a number(2):=10;
b number(2):=34;
begin
if a>b then
dbms_output.put_line(a||'is greater than '||b);
else 
dbms_output.put_line(b||'is greater than '||a);
end if;
end;

select * from student1;
declare
s_age number(2);
begin
select max(age) into s_age from student1;
dbms_output.put_line(s_age);
if s_age<50 then
delete from student1 where age=s_age;
end if;
end;
rollback;



insert into student1 values(3,'priyanka',30);
insert into student1 values(4,'sayan',51);


--case statement
declare
s_age number(2);
s_roll number(2):=&s_roll;
begin
select age into s_age from student1 where roll=s_roll;
dbms_output.put_line(s_age);
case 
when s_age>50 then
dbms_output.put_line('greater than 50');
else
dbms_output.put_line('less than 50');
end case;
end;

