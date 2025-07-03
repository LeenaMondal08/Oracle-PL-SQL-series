
set serveroutput on;
create table student_info(
roll number(2) primary key,
name varchar(10),
age number(2)
);
insert into student_info values(1,'leena',45);
insert into student_info values(2,'ruma',44);

select * from student_info;


declare
age_info number(2);
begin
select age into age_info from student_info where roll=1;
dbms_output.put_line(age_info);
end;
/

declare
age_info number(2);
name_info varchar(10);
begin
select age,name into age_info ,name_info from student_info where roll=1;
dbms_output.put_line(age_info || name_info);
end;
/