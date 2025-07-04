--simple loop
declare
c number:=0;
begin
loop
dbms_output.put_line('hello'||c);
c:=c+1;
exit when c=5;
end loop;
end;

--print even number
declare
number1 number:=&number1;
i number:=1;
begin
loop
if mod(i,2)=0 then
dbms_output.put_line('even'|| i);
i:=i+1;
else
i:=i+1;
end if;
exit when i>number1;
end loop;
end;
/

--while loop

declare
c number:=0;
begin
while(c<5)
loop
dbms_output.put_line(c);
c:=c+1;
end loop;
end;
/

-- for loop

declare
c number;
begin
for c in  1..5
loop
dbms_output.put_line(c);
end loop;
end;
/

declare
c number;
begin
for c in  1..5
loop
dbms_output.put_line(c);
end loop;
end;
/
declare
c number;
begin
for c in reverse 1..5
loop
dbms_output.put_line(c);
end loop;
end;
/

