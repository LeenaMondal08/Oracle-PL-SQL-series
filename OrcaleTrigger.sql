--creating a backup table of Student1
select * from student1;
create table student1_backup as select * from student1;
select * from student1_backup;
alter table student1_backup add date_of_delele date;
alter table student1_backup add who_delete varchar2(10);

-- creating a trigger before delete any record from student1 table
create trigger student1_trigger
before delete 
on student1
for each row
begin
insert into student1_backup values(:old.roll,:old.name,:old.age,sysdate,user);
end;

delete from student1 where roll=2;
select * from student1;

select * from student1_backup;
-- another example
select * from employee;
create table employee_backup as select * from employee;
select * from employee_backup;
alter table employee_backup add incr_ratio number(2,2);
alter table employee_backup modify incr_ratio number(3,2);

CREATE OR REPLACE TRIGGER employee_tri
AFTER INSERT 
ON employee
FOR EACH ROW
DECLARE
  incr NUMBER(3,2);
BEGIN
  IF :NEW.salary > 5000 THEN
    incr := 0.1;
  ELSE
    incr := 0.3;
  END IF;

  INSERT INTO employee_backup(id,name,salary,incr_ratio)
  VALUES (:NEW.id, :NEW.name, :NEW.salary, incr);
END;
/
select * from employee_backup;
INSERT INTO employee (id, name, salary) VALUES (15, 'Bob', 4000);


select * from employee_backup;






