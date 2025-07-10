create table bulk_table(id number);
create table bulk_bind(id number);

begin 
for i in 1..10
loop
insert into bulk_table values(i);
end loop;
end;
/
select * from bulk_table;

-- do the same by susing the bulk collect

declare
type t_type is table of bulk_table%rowtype;
vt t_type;--- vt->collection table
begin
select * bulk collect into vt from bulk_table;
forall i in 1..vt.count
insert into bulk_bind values vt(i); --data of bulk_table is stored into bulk_bind table at once not onebyone
commit;
end;
/

select * from bulk_bind;

--fetching the name of employee using bulk collect
select * from employee;

declare
type emp_t is table of employee%rowtype;
bulk_emp emp_t;
begin
select * bulk collect into bulk_emp from employee;
dbms_output.put_line('total_count: '||bulk_emp.count);
for i in 1..bulk_emp.count
loop
dbms_output.put_line(bulk_emp(i).name);
end loop;
end;
/
--- set the limit
declare
c_limit constant pls_integer default 3;
cursor c1 is select * from employee;
type emp1_t is table of employee%rowtype index by BINARY_INTEGER;
b_emp emp1_t;
begin 
open c1;
loop
fetch c1 bulk collect into b_emp limit c_limit;
exit when b_emp.count=0;
dbms_output.put_line('receive :'||b_emp.count);
for idx in 1..b_emp.count
loop
dbms_output.put_line(b_emp(idx).id || b_emp(idx).name);
end loop;
end loop;
close c1;
end;
/



