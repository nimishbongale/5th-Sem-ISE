create or replace PROCEDURE name(n in number,fact out number) is
i number;
Begin
    fact:=1;
    for i in 1..n loop
     fact:=fact*i;
    end loop;
end name;

/
