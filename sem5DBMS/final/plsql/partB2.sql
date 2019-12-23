SET SERVEROUTPUT ON

BEGIN
UPDATE EMPLOYEE_DETAIL
SET SALARY = salary+(salary * 0.15)
WHERE DEPTNO = 10 
dbms_output.put_line(TO_Char(SQL%ROWCOUNT)||'employees affected.');

END;
/
