select * from order1;
create or replace function order_func(order_id in number)
return varchar2 
is
order_count number;
order_suggetion varchar2(100);
begin 
select o_count into order_count from order1 where o_id =order_id;
if order_count>=5 then
order_suggetion := 'keep improving';
else
order_suggetion := 'increae the sale ';
 end if;
return order_suggetion;
end;
/

select order_func(3) as suggestion from dual;
--function overloading

create or replace function function_overload(order_id in number)
return varchar2
as 
items varchar2(10);
begin
select o_item into items from order1 where o_id=order_id;
return items;
end;
/
select function_overload(2) from dual;
begin 
dbms_output.put_line(function_overload(3));
dbms_output.put_line(function_overload(1));
end;
/
-- we will see the function overloading wthin the package 
