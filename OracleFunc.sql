--fetching total number of record from student database
select * from student1;
create or replace function f_count
return number 
is
s_count number;
begin 
select count(*) into s_count from student1;
return s_count;
end;
/
select f_count() from dual;

--passing parameter within function

create or replace function f_name(fu_name in varchar2)
return varchar2
is
s_name varchar2(10);
begin
s_name:='hello'||fu_name;
return fu_name;
end;
/
select f_name('leena') from dual;

-- calculating the salary hike
create or replace function sal(e_id in number)
return number
is
e_salary number(10);
new_salary number(10);
begin
select salary into e_salary from employee where id=e_id;
if(e_salary<5000) then 
new_salary:=e_salary+(e_salary*0.2);
else
new_salary:=e_salary+(e_salary*0.2);
end if;
return new_salary;
end;
/

select sal(e_id) from dual;
select id,name,salary,sal(id) new_sal from employee;
select * from employee;

create table employee_info(
id number(2) primary key,
name varchar(10)
);
insert into employee_info values(1,'animesh');
insert into employee_info values(2,'mrinmoy');
insert into employee_info values(3,'aima');
insert into employee_info values(4,'palas');
select * from employee_info;

create table address(
a_id number(2) primary key,
id number(2) references employee(id),
city varchar2(20),
state varchar(20)
);
alter address modify id number(2) references employee_info(id);
desc address;
alter table address modify a_id varchar(5);
insert into address values('a_01',1,'kolkata','wb');
insert into address values('a_02',2,'delhi','up');
insert into address values('a_03',3,'bangalore','maharastra');
insert into address values('a_04',4,'haldia','wb');
insert into address values('a_05',5,'patna','bihar');
select * from address;

--create a function to get complete details

create or replace function get_all_details(em_id in number)
return varchar2
is
emp_details varchar(200);
begin
select e.id||e.name||a.a_id||a.city||a.sate into emp_details from employee_info e,adress a where e.id=em_id and e.id=a.a_id;
return (emp_details);
end;
/
select get_all_details(3) from dual;










