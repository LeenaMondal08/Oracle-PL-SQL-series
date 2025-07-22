---curson
select * from order1;
declare 
cursor c1 is select o_item from order1;
order_item order1.o_item%type;
begin
open c1;
loop
fetch c1 into order_item;
exit when c1%notfound;
dbms_output.put_line(order_item);
end loop;
close c1;
end;
/

-- value fetch for multiple colum;
declare
cursor c1 is select * from order1;
rec order1%rowtype;
begin
open c1;
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line(rec.o_id||' '||rec.o_item||' '||rec.o_count);
end loop;
close c1;
end;
/
-- for cursor
--here rec is just indicating the each value in cursor

declare
cursor c1 is select * from order1;
begin
for rec in c1
loop
dbms_output.put_line(rec.o_id||' '||rec.o_item||' '||rec.o_count);
end loop;
end;
/
-- parameter cursor 
select * from retail_sales where rownum <=10;

declare 
cursor c1(gender_g retail_sales.gender%type) is select total_sale from retail_sales where gender=gender_g;
-- we will pass the value of gender_g through parameter
total_sale_count retail_sales.total_sale%type;
begin 
open c1('male');
loop
fetch c1 into total_sale_count;
exit when c1%rowcount>5;
dbms_output.put_line(total_sale_count);
end loop;
close c1;

open c1('female');
loop
fetch c1 into total_sale_count;
exit when c1%rowcount>3;
dbms_output.put_line(total_sale_count);
end loop;
close c1;
end ;
/

-- ref cursor
--strong ref cursor 
declare
type c_ref_type is ref cursor return employee%rowtype;
c_strong c_ref_type;
emp_details employee%rowtype;
order_details order1%rowtype;
begin
open c_strong for select * from employee;
loop
fetch c_strong into emp_details;
exit when c_strong%notfound;
dbms_output.put_line(emp_details.id||' '||emp_details.name||' '||emp_details.salary);
end loop;
close c_strong;
end;
/

--week cursor
declare
type c_ref_type is ref cursor ;
c_week c_ref_type;
emp_details employee%rowtype;
order_details order1%rowtype;
begin
open c_week for select * from employee;
loop
fetch c_week into emp_details;
exit when c_week%notfound;
dbms_output.put_line(emp_details.id||' '||emp_details.name||' '||emp_details.salary);
end loop;
close c_week;

open c_week for select * from order1;
loop
fetch c_week into order_details;
exit when c_week%notfound;
dbms_output.put_line(order_details.o_id||' '||order_details.o_item||' '||order_details.o_count);
end loop;
close c_week;

end;
/4
--select * from order1;




