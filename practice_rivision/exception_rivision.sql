select * from order1;
declare
order_item order1.o_item%type;
begin
select o_item into order_item from order1 where o_id=&o_id;
dbms_output.put_line(order_item);
exception
when no_data_found then
dbms_output.put_line('there is no data');
when too_many_rows then
dbms_output.put_line('many rows are return');
when others then
dbms_output.put_line('exception occurs');
end;
/

--name exception
DECLARE
  v_name VARCHAR2(10);
  v_name_ex EXCEPTION;
  PRAGMA EXCEPTION_INIT(v_name_ex, -987); 
BEGIN
  v_name := 567/0; 
  DBMS_OUTPUT.PUT_LINE(v_name);
EXCEPTION
  WHEN v_name_ex THEN
    DBMS_OUTPUT.PUT_LINE('Exception handled');
END;
/

--user defined exception
declare
v_salary number:=-678;
invalid_number exception;
begin
if v_salary<0 then
raise invalid_number;
end if;
dbms_output.put_line('salary: '||v_salary);
exception
when invalid_number then
dbms_output.put_line('salary can not be negetive');
end;
/



