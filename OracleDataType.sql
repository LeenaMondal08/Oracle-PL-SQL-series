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

--collection data type
--varray
declare 
type v_array_type is varray(4) of varchar2(40);
v_color v_array_type:=v_array_type(null,null,null,null);
begin
v_color(1):='red';
v_color(2):='blue';
v_color(3):='black';
v_color(4):='whilte';
dbms_output.put_line(v_color(4));
dbms_output.put_line(v_color(1));
dbms_output.put_line(v_color.limit);
dbms_output.put_line(v_color.count);
dbms_output.put_line(v_color.first);
dbms_output.put_line(v_color.last);
dbms_output.put_line(v_color.prior(3));
dbms_output.put_line(v_color.next(3));
--v_color.extend();
dbms_output.put_line(v_color.count);
dbms_output.put_line(v_color.next(3));
v_color.trim();
dbms_output.put_line(v_color.count);
end;
/

--nested array
declare 
type v_nested_array_type is table of varchar2(40);
v_color_nested v_nested_array_type:=v_nested_array_type(null,null,null,null);
begin
v_color_nested(1):='red';
v_color_nested(2):='blue';
v_color_nested(3):='black';
v_color_nested(4):='whilte';
dbms_output.put_line(v_color_nested(3));
dbms_output.put_line('limit: '||v_color_nested.limit);
v_color_nested.delete(2);
--dbms_output.put_line('element 2 is :'||v_color_nested(2));---error arise no data found
dbms_output.put_line(v_color_nested.count);
--.exists(indx) -- use for cheaking wheather a vlue is present on the table or not?
if v_color_nested.exists(2) then
dbms_output.put_line(v_color_nested(2));
else
dbms_output.put_line('data not found');
end if;
end;
/
