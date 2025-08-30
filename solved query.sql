create table students1(
studentid int primary key identity (1,1) ,
firstname varchar (50) not null,
lastname varchar (100) not null,
email varchar (100) unique,
age int check(age>=18),
course varchar (50)  default ('general'),
admissiondate date not null)
select * from students1

insert into students1
(firstname,lastname,email,age,course,admissiondate)
values('rupa','shree','rupz2261@gmail.com',22,'ISE','2019-7-14'),
('sneha','lella','sneha2261@gmail.com',24,'CSE','2018-8-2'),
('netra','vathi','netra@gmail.com',25,'AI','2012-7-12'),
('basavaraj','irrpa','basavaraj2261@gmail.com',26,'EEE','2014-2-3'),
('ganga','amma','ganga2261@gmail.com',27,'ME','2016-3-13')

alter table students1
add  phonenumber  varchar(15)

update students1 
set age=30
where studentid=2

select * into students1_backup
from students1

select * from students1_backup 

update students1
set phonenumber =9066211600


select * from students1


select * from students1
where course='cloud computing'


alter table students1_backup
add phonenumber varchar(20)