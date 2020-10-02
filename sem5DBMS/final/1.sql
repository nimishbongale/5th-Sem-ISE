--sql code-- 


create table employee(ssn varchar(6),name varchar(10),deptno int, primary key(ssn));

create table project(projectno varchar(10),projectarea varchar(20),primary key(projectno));

create table assignedTo(usn varchar(6),projectno varchar(10),foreign key(usn)references employee(ssn),foreign key(projectno)references project(projectno));


insert into employee values('01','abc',10);
insert into employee values('02','xyz',20);
insert into employee values('03','pqr',30);
insert into employee values('04','lmn',40);


insert into project values('100','database');
insert into project values('200','network');
insert into project values('300','android');
                                                                                                                                               
insert into assignedTo values('01','100');
insert into assignedTo values('02','200');
insert into assignedTo values('03','300');
insert into assignedTo values('01','200');

--Displaying tables --                                                                                                                                    --
select * from employee;
 
select * from project;
  
select * from assignedTo;

--retrieving all employess who works on database project--
select ssn from employee where ssn=(select usn from assignedTo where projectno=(select projectno from project where projectarea='database'));

--count of all employees in each department--                                                                                
select count(ssn),deptno from employee group by deptno;
  
--updating project number whose usn is 3--                                                                             
update assignedTo set projectno='200' where usn='03';                                                                                
select * from aassignedTo;
  
  
  --mongodb code-- 
  
db.createCollection("EMPLOYEE")

db.EMPLOYEE.insert({"SSN":4567,"Name":'James',"DeptNo":'XYZ',"ProjectNo":101}) 
db.EMPLOYEE.insert({"SSN":3256, "Name":'Jack',"DeptNo" :'XYZ',"ProjectNo":102})

db.EMPLOYEE.find().pretty()
db.EMPLOYEE.find({"DeptNo":'XYZ'}).pretty()
db.EMPLOYEE.find({"ProjectNo":104}).pretty()
