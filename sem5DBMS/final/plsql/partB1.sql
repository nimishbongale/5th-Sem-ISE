SET SERVEROUTPUT ON
DECLARE
c_code branch.code %type ;
c_name branch.name %type ;
c_assets branch.assets %type ;
CURSOR c1
IS SELECT code ,name,assets
FROM branch;

c_ssn customer.ssn %type ;
c_custname customer.custname %type ;
c_place customer.place %type ;
CURSOR c2
IS SELECT ssn,custname,place
FROM customer;

c_accno account.accno %type ;
v_ssn account.ssn %type ;
v_code account.code %type ;
c_balance account.balance %type ;
CURSOR c3
IS SELECT accno,ssn,code,balance
FROM account;

BEGIN
dbms_output.put_line('-------------BRANCH-------------');
OPEN c1;
LOOP
FETCH c1 INTO c_code, c_name, c_assets;
EXIT WHEN c1 %notfound;
dbms_output.put_line(c_code||'   '||c_name||'    '||c_assets);
END LOOP;
CLOSE c1;
dbms_output.put_line('-------------CUSTOMER-------------');
OPEN c2;
LOOP
FETCH c2 INTO c_ssn, c_custname, c_place;
EXIT WHEN c2 %notfound;
dbms_output.put_line(c_ssn||'   '||c_custname||'    '||c_place);
END LOOP;
CLOSE c2;
dbms_output.put_line('------------ACCOUNT--------------');
OPEN c3;
LOOP
FETCH c3 INTO c_accno, v_ssn, v_code,c_balance;
EXIT WHEN c3 %notfound;
dbms_output.put_line(c_accno||'   '||v_ssn||'    '||v_code||'    '||c_balance);
END LOOP;
CLOSE c3;

END;
/
