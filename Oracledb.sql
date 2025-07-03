declare
num1 number(10);
num2 number(10);
begin
num1:=10;
num2:=12;
dbms_output.put_line('addition of two number '|| (num1+num2));
end;
/
declare
num1 number(10,2):=10.0;
num2 number(10,2):=30.4;
resul number(10,2);
begin
resul:=(num1+num2);
dbms_output.put_line('addition of two number '|| resul);
end;
/

declare
num1 number(10,2):=&num1;
num2 number(10,2):=&num2;
resul number(10,2);
begin
resul:=(num1+num2);
dbms_output.put_line('addition of two number '|| resul);
end;
/

declare
num1 number(10,2):=10;
num2 number(10,2):=12;
resul number(10,2);
begin
num1:=4;
num2:=5;
resul:=(num1+num2);
dbms_output.put_line('addition of two number '|| resul);
end;
/
declare
num1 number(10,2):=6;
begin
num1:=9;
dbms_output.put_line(num1);
end;
/

declare
num1 constant number(10,2):=6;
begin
num1:=9;
dbms_output.put_line(num1);
end;
/

declare
num1 constant number(10,2):=0;
num2 number(10,2):=0;
begin
num2:=null;
dbms_output.put_line('addtion '||(num1+num2));
end;
/