create table susoma(
id varchar2(5),
name varchar(2),
dept varchar2(10),
age int
);
-- we cant not use ddl within static/plsql
/*begin 
drop table susoma;
end;
/
*/
--use execuse immediate
begin
execute immediate 'drop table susoma';
end;
/
desc susoma;

create table stu(
id_card number);

create table brainware (
category_of_clg varchar2(10)
);

-- cfeating backup table
create table back_up as select * from stu;
create table back_up1 as select * from brainware;
-- to see the details of all backup table
select * from all_tables where owner='system' and table_name='%bkp%';

-- now want to drop pl/sql table 
begin
for rec in (select * from all_tables where owner='system' and table_name like '%bkp%';)
loop 
execute immediate 'drop table'||'rec.table_name';
end loop;
end;
/
-- by using the procedure
create or replace procedure proc_drop(table_name varchar)
is 
begin
EXECUTE IMMEDIATE 'DROP TABLE ' || table_name || '"';
end;
/
begin
proc_drop('stu');
end;

--update a table name by passing the value through procedure

CREATE OR REPLACE PROCEDURE up_data(
    t_name   VARCHAR2,
    p_colum  VARCHAR2,
    id_num   NUMBER
)
IS
    sql_stmt VARCHAR2(1000);
BEGIN
    sql_stmt := 'UPDATE ' || t_name || 
                ' SET ' || p_colum || ' = :1 WHERE roll = :2';

    EXECUTE IMMEDIATE sql_stmt USING 'barsha', id_num;
END;
/