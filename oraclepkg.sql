--packg specification
create or replace package pkg_1 is
procedure pc(p_name in varchar2);
function hello_function(p_name in varchar2)
return varchar2;
end pkg_1;
--pckg body
create or replace package body pkg_1 is 
procedure pc(p_name in varchar2)
as
begin
dbms_output.put_line('hello'||p_name);
end pc;
function hello_function(p_name in varchar2)
return varchar2
as
v_result varchar2(100);
begin
v_result:='hello'||p_name;
return v_result;
end hello_function;
end pkg_1;
/
execute pkg_1.pc('leena');
execute pkg_1.p('sayan');

--overloading problem solve by package
create or replace package pkg_2
as
function f_add(a in number,b in number)
return varchar2 ;
function f_add(a in number ,b in number,c in number)
return varchar2;
end pkg_2;
/
create or replace package body pkg_2
as
function f_add(a in number, b in number)
return varchar2
is
v_sum varchar2(30);
begin
v_sum:=to_char(a+b);
    DBMS_OUTPUT.PUT_LINE('Addition value is: ' || v_sum);
    return v_sum;
end;
function f_add(a in number,b in number, c in number)
return varchar2
is
v_result varchar2(20);
begin
v_result:=to_char(a+b+c);
dbms_output.put_line('addition value is: '||v_result);
return v_result;
end;
end pkg_2;
/
select pkg_2.f_add(5,7) from dual;
select pkg_2.f_add(4,6,7) from dual;

-- forward reference
declare 
procedure pcd1 as
begin
dbms_output.put_line('this is proce 1');
end;
procedure pcd2 as
begin
pcd1;
dbms_output.put_line('this is proc 2');
end;
begin
--pcd1;
pcd2;
end;
/
--call pcd2 in pcd 1
declare 
procedure pcd2;
procedure pcd1 as
begin
pcd2;
dbms_output.put_line('this is proce 1');
end;
procedure pcd2 as
begin
dbms_output.put_line('this is proc 2');
end;
begin
pcd1;
end;
/


