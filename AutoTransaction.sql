select * from student1;
-- update one row;
update student1 set name='sandip' where roll=4;
rollback;

update student1 set name='barnali' where roll=3;
commit;
update student1 set name='leena' where roll=3;


create table cloths(
id number,
c_name varchar2(100),
color varchar2(100)
);

insert into cloths values(1,'saree','blue');
insert into cloths values(2,'jeans','black');
insert into cloths values(3,'shirt','meroon');
insert into cloths values(4,'kurti','whi');
insert into cloths values(5,'skirt','black');

select * from cloths;

commit;
delete from cloths where id=5;
commit;
rollback;
-- save ponits
insert into cloths values(5,'skirt','black');
savepoint a

insert into cloths values(6,'top','red');
savepoint b
rollback to a

--child transaction
create table leena(
sub varchar2(10)
);
commit;

alter table leena modify sub number;

desc leena;
select * from leena;
insert into leena values(1);
insert into leena values(2);
declare 
PRAGMA AUTONOMOUS_TRANSACTION;
begin
for i in 3 ..5
loop
insert into leena values(i);
end loop;
commit;
end;
 rollback;
 select * from leena;
