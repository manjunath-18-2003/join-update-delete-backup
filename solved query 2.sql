

---create table students --

create table students2
(
studentid int primary key identity (1,1),
firstname varchar(50) not null,
lastname varchar(50) not null,
dob date not null,
gender char(1)check (gender in ('male','female')),
marks int check (marks between 0 and 100),
admissiondate datetime default getdate())


----insert 7 values (firstname,lastname,dob,marks)
insert into students2
(firstname,lastname, DOB,marks )
select 'dhruva','sarja','12-may-2011',82 union all
select 'darshan','dboss','11-jun-2013',91 union all
select 'kiccha','sudeep','22-jan-2019',89 union all
select 'actor ','prabhas','19-dec-2015',78 union all
select 'allu','arjun','28-may-2012',56 union all
select 'puneeth','rajkumar','14-feb-2021',55 union all
select 'shiva','rajkumar','30-mar-2022',49 


---create backup table and copy values

select  * into students2_backup
from students2

select * from students2

---Display students’ age in years using DOB.

select 
 firstname,lastname,datediff(year,dob,getdate()) as age
 from students2


 --Extract year and month from AdmissionDate.

 select  
 firstname,lastname ,year(admissiondate) as admissionyear,
 month(admissiondate) as admissionmonth
 from students2

 --Display students admitted in the last 30 days.

select * from students2
where admissiondate >= dateadd(day,-30,getdate())


---find hights and lowest marks and average marks 
select
max(marks) as hightestmarks,
min(marks) as lowestmarks,
avg(marks) as averagemarks
from students2

----count total numbers of male and female students 

select 
gender,count(*) as total
from students2
group by gender 


---find the number of studend born after 2000
select count(*) as studentsborn2000
from students2
where dob>'2000-12-31'

