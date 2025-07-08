select * from student_info;
--insufficiant error
create table student_info_bckup as select * from student_info where 2=3;
select * from student_info_bckup;
--always true
create table student_info_bckup1 as select * from student_info where 1=1;
select * from student_info_bckup1;

--craeting a record
DECLARE
    TYPE stu_type IS RECORD (
        s_name VARCHAR(20),
        s_age NUMBER
    );

    s_rec stu_type;

BEGIN
    s_rec.s_name := 'barnali';
    s_rec.s_age := 56;

    DBMS_OUTPUT.PUT_LINE(s_rec.s_name || ' ' || s_rec.s_age);
END;
/
