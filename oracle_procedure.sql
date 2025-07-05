-- simple stored procedure (static)
create or replace procedure greetings
as 
begin
dbms_output.put_line('hello leena');
end;
/

exec greetings;

--procedure with parameter

-- in parameter
create or replace procedure p1(name in varchar2)
as
begin
dbms_output.put_line('name is '|| name);
end;
/
exec p1('leena');

-- outer parameter
create procedure p2(a in number,b in number, total out number)
as
begin
total:=a+b;
end;
/

declare 
x number;
begin
total(7,8,x);
dbms_output.put_line(total);
end;
/

-- to solve above issue

create or replace procedure p3(a in number, b in number)
as
sum_value number;
begin
sum_value:=a+b;
dbms_output.put_line(sum_value);
end;
/
exec p3(3,6);

--in out variable
create or replace procedure p5(a in out number)
as
num1 number:=6;
begin
a:=a*5;
dbms_output.put_line(a);
end;
/

DECLARE
  a NUMBER;
BEGIN
a:=6;
p5(a);
END;
/