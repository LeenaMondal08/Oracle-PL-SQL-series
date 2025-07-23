CREATE OR REPLACE PACKAGE pakg_rivision
as
PROCEDURE proc_pak(name in varchar2);
FUNCTION func_pak( name in varchar2)
return varchar2;
end;
/
create or replace package body pakg_rivision
as
procedure proc_pak(name in varchar2)
as
begin
dbms_output.put_line(name);
end proc_pak;

function func_pak(name in varchar2)
return varchar2
as
v_name varchar2(20);
begin 
v_name:='hello '||name;
return v_name;
end func_pak;
end pakg_rivision;
/

exec pakg_rivision.proc_pak('leena');
select pakg_rivision.func_pak('moina') from dual;


-- function overloading
create or replace package pack_func_overload 
as
function add_sum(a in number,b in number)
return number;
function add_sum(a in number ,b in number , c in number)
return number;
end pack_func_overload;
/

create or replace package body pack_func_overload 
as
function add_sum(a in number , b in number)
return number 
as
res number;
begin
res := a+b;
return res;
end;

function add_sum(a in number , b in number, c in number)
return number 
as 
res number;
begin
res:=a+b+c;
return res;
end;
end pack_func_overload ;
/

select pack_func_overload.add_sum(1,3) from dual;
select pack_func_overload.add_sum(1,3,5) from dual;
-- package sepcification/ declaration ispublic 
--pacakge body is totally private

---- tranjuction

create table company(
c_id number primary key,
c_name varchar2(10),
c_depaartment varchar2(20),
c_adress varchar2(20)
);
desc company;
alter table company modify c_adress varchar2(20);
insert into company values(1,'infosys','it','kolkata');
insert into company values(2,'ibm','product_base','bangalore');
insert into company values(3,'wipro','service','kolkata');
insert into company values(4,'tcs','consultant','kerala');
insert into company values(5,'deloitte','big4','hydrabad');
insert into company values(6,'cognizent','it','pune');
insert into company values(7,'icra','stratup','kolkata');
insert into company values(8,'capgimini','it','bangalore');

select * from company;
delete from company where c_id=3;
commit;
rollback;

delete from company where c_id=2;
savepoint a;
delete from company where c_id=5;
savepoint b;
rollback to b;
select * from company;

--concept of child tranjuction
insert into company values(13,'agnic','stratup','kolkata');
insert into company values(34,'ginesys','mnc','pune');
declare
PRAGMA AUTONOMOUS_TRANSACTION;
begin
insert into company values(10,'trpglobal','product','london');
insert into company values(11,'accenture','mnc','delhi');
commit;
end;
insert into company values(12,'codeclouds','stratup','kolkata');
rollback;


select * from company;



