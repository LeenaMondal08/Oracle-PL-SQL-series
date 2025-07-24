create table employees(
e_id number primary key,
e_name varchar2(20),
salary number(6,2)
);

insert into employees values(1,'leena mondal',4567.89);
insert into employees values(2,'priti manna',4267.90);
insert into employees values(3,'sayak doloi',4341.00);
select * from employees;

drop table salary_audit;

CREATE TABLE salary_audit (
    e_id           NUMBER,
    old_salary     NUMBER(6,2),
    new_salary     NUMBER(6,2),
    changed_by     VARCHAR2(10),
    date_of_change DATE
);
select * from salary_audit;

create or replace trigger salary_audit_trigger
before update of salary on employees
for each row
begin
if :old.salary != :new.salary then
insert into salary_audit(e_id,old_salary,new_salary,changed_by,date_of_change) values(:old.e_id,:old.salary,:new.salary,user,sysdate);
end if;
end;
/


UPDATE employees SET salary = 4530 WHERE e_id = 2;
commit;
select * from salary_audit;
-- instead of view 

CREATE TABLE departments_table (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

INSERT INTO departments_table VALUES (1, 'HR');
INSERT INTO departments_table VALUES (2, 'Finance');
SELECT * FROM departments_table;

CREATE TABLE employees_table (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    dept_id NUMBER REFERENCES departments_table(dept_id)
);

INSERT INTO employees_table VALUES (101, 'Alice', 1);
INSERT INTO employees_table VALUES (102, 'Bob', 2);
SELECT * FROM employees_table;

CREATE VIEW emp_dept_view AS
SELECT e.emp_id,e.emp_name,d.dept_name FROM employees_table e 
JOIN departments_table d ON e.dept_id=d.dept_id;
SELECT * FROM emp_dept_view;

CREATE OR REPLACE TRIGGER trigg_empt_dept 
INSTEAD OF UPDATE ON emp_dept_view 
BEGIN
UPDATE employees_table set emp_name=:new.emp_name where emp_id=:old.emp_id;
END;
/

UPDATE emp_dept_view SET emp_name='charline' where emp_id=101;
SELECT * FROM emp_dept_view;
select * from employees_table;

