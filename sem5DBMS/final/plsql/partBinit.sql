create table branch(
code varchar(5) primary key,
name varchar(10),
assets int);

create table customer(
ssn int primary key,
custname varchar(10),
place varchar(10));

create table account(
accno varchar(5),
ssn int,
code varchar(5),
balance int,
primary key(accno),
foreign key(ssn) references customer(ssn) on delete cascade,
foreign key(code) references branch(code) on delete cascade
);

insert into branch values('&code','&name',&assets);
insert into customer values(&ssn,'&custname','&place');
insert into account values('&accno','&ssn','&code',&balance);

