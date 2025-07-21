begin 
dbms_output.put_line('welcome to pl/sql practice revision');
end;
/
declare
v_res number(5);
v_num1 number(5);
v_num2 number(2);
begin
v_num1:=&v_num1;
v_num2:=10;
v_res:=v_num1+v_num2;
dbms_output.put_line('addition is :'||v_res);
end;
/

--- data fetching from table
create table order1(
o_id number primary key,
o_item varchar2(10),
o_count number(10)
);
desc order1;

insert into order1 values(1,'shirt',5);
insert into order1 values(2,'top',3);
insert into order1 values(3,'saree',8);

select * from order1;

declare
order_count order1.o_count%type;
begin
select o_count into order_count from order1 where o_id=3;
dbms_output.put_line(order_count);
end;
/
-- entire record  fetch 
declare 
v_data order1%rowtype;
begin
select * into v_data from order1 where o_id=2;
dbms_output.put_line(v_data.o_id||' '||v_data.o_item||' '||v_data.o_count);
end;
/

create table order2 as select * from order1;
select * from order2;

declare
order2_data order2.o_item%type;
begin
insert into order2 values(4,'panjabi',6);
select o_item into order2_data from order2 where o_id=3;
dbms_output.put_line(order2_data);
end;
/
alter table order2 modify o_id number(10) primary key;
delete from order2 where o_id=4;
select * from order2;
drop table order2;
select * from order2;

select * from order1;
