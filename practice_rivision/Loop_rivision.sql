declare
number1 number:=&number1;
i number;
begin
for i in 0..number1
loop
if mod(i,2)=0 then
dbms_output.put_line(i);
end if;
end loop;
end;
/

declare
sum_value number :=0;
i number:=0;
begin 
loop
sum_value:= (sum_value+i);
i:=i+1;
exit when i>5;
end loop;
dbms_output.put_line(sum_value);
end;
/

-- composite variable
declare
type e_name_type is table of varchar2(10);
e_name e_name_type;
begin
select name bulk collect into e_name from employee;
for i in e_name.first .. e_name.last
loop
dbms_output.put_line(e_name(i));
end loop;
end;
/
select * from employee;

DECLARE
  TYPE e_data_type IS TABLE OF employee%ROWTYPE;
  e_data e_data_type;  

BEGIN
  SELECT *
    BULK COLLECT INTO e_data
  FROM employee;
    FOR i IN e_data.FIRST .. e_data.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE(
        'Name: '   || e_data(i).name
        || ', ID: ' || e_data(i).id
        || ', Sal: '|| e_data(i).salary
      );
    END LOOP;
END;
/

