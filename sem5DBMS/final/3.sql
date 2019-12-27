--sql code-- 

create table BOAT
(
  BID varchar(6) NOT NULL,
  BNAME varchar(20),
  COLOUR varchar(10),
  PRIMARY KEY(BID)
);


create table SAILOR
(
  SID varchar(6)NOT NULL,
  SNAME varchar(20),
  AGE varchar(3),
  RATING varchar(2),
  PRIMARY KEY(SID)
);


Create table RESERVES
(
  BID varchar(6),
  SID varchar(6),
  DAY varchar(10),
  FOREIGN KEY(BID) references BOAT(BID) ON DELETE CASCADE,
  FOREIGN KEY(SID) references SAILOR(SID) ON DELETE CASCADE
);


INSERT INTO BOAT VALUES('01', 'ABC', 'RED');
INSERT INTO BOAT VALUES('02', 'XYZ', 'YELLOW');
INSERT INTO BOAT VALUES('03', 'PQR', 'GREEN');
INSERT INTO BOAT VALUES('04', 'LMN', 'BLACK');
INSERT INTO BOAT VALUES('05', 'DEF', 'BLUE');


INSERT INTO SAILOR VALUES('10', 'RAM', '30', '5');
INSERT INTO SAILOR VALUES('20', 'RAVI', '25', '4');
INSERT INTO SAILOR VALUES('30', 'MISHRA', '22', '3');
INSERT INTO SAILOR VALUES('40', 'CHANDRA', '24', '2');
INSERT INTO SAILOR VALUES('50', 'SHIVA', '36', '1');
INSERT INTO SAILOR VALUES('60', 'KRISHNA', '40', '6');


INSERT INTO RESERVES VALUES('01', '20', 'MONDAY');
INSERT INTO RESERVES VALUES('02', '30', 'TUESDAY');
INSERT INTO RESERVES VALUES('03', '50', 'WEDNESDAY');
INSERT INTO RESERVES VALUES('04', '10', 'THURSDAY');
INSERT INTO RESERVES VALUES('05', '20', 'FRIDAY');

SELECT * FROM RESERVES;

SELECT * FROM SAILOR;

SELECT * FROM BOAT;


SELECT BID
FROM RESERVES
WHERE SID IN( SELECT SID
FROM SAILOR
WHERE SNAME='RAM');


SELECT BID, SNAME
FROM RESERVES r join SAILOR s on (r.SID=s.SID);


select bid from reserves group by bid having count(bid)=(select count(sid) from sailor);

SELECT COUNT(BID), SID
FROM RESERVES
GROUP BY SID;


-- mondodb code -- 


Create the collection:db.createCollection("BOATRES")

db.BOATRES.insert({"BID":9988,"BNAME":'ABC',"COLOUR":'Black',"SNAME":'John',"SID":1234,"DAY":'2017-12-25'})
db.BOATRES.insert({"BID":8877,"BNAME":'DEF',"COLOUR":'Black',"SNAME":'Smith',"SID":4567,"DAY":'2017-11-24'})


db.BOATRES.find({"SNAME":'Sucre'}).count()
db.BOATRES.find({"COLOUR":'Black'}).pretty()
