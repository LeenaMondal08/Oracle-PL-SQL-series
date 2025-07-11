-- example of the return satement in procedure
create or replace procedure proc_return
as
begin
dbms_output.put_line('welcome to procedure');
return;
dbms_output.put_line('welcome to pl/sql'); -- does not executed
end;
/
EXEC proc_return;

-- retrun in function
create or replace function wel
return varchar2
as 
begin
return 'welcome to kolkata';
end;
/
select wel from dual;

--can we dml in function?
create or replace function cheak_ddl
return varchar2
as
begin
update employee set salary=6785 where id=5;
end;
/
--succesfully compiled
select cheak_ddl from dual; --> throw error 
-- we cant notuse ddl or dml statement within thw function
-- whats the solution? we can use by autonomus transaction
select * from employee;

create or replace function emp_up
return varchar2
as
pragma autonomous_transaction;
begin
update employee set salary=6785 where id=5;
return 'leene';
commit;
end;
/
-- now call the function
BEGIN
  DBMS_OUTPUT.PUT_LINE(emp_up);
END;
/
select * from employee;

--