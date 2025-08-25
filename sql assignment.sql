create table department
(
departmentId int primary key,
departmentname varchar(50) not null unique)

-- insert  data of departmentid, depaartmentname 

insert into department(departmentId,departmentname)
select 1,'CSE'union all
select 2,'ECE' union all
select 3,'ME'union all
select 4,'EEE'union all
select 5,'AIDS'union all
SELECT 6,'CIVIL' UNION
SELECT 7,'CSAI'
select * from department

-- create a table with appropriate constraints id,name age>=17 departmentid (int,foregin key departmets.departmentid)


create table Student
(studentID 
int primary key,
name varchar(50) not null,
age int check(age>=17),
departmentId int foreign key references department(departmentId))
select * from student

--insert  vales studentid, name, age, departmentid 
insert into student
(studentID,name,age,departmentId)
select 11,'rupz',21,1 union all
select 12,'shiju',23,2 union all
select 13,'dhoni',17, 3union all
select 14,'virat',27, 4union all
select 15,'Rakesh',30 ,5 union all
select 16,'rahul',26,5 union all
select 17,'abd',28,4 union all
select 18,'rohith',21,3 union all
select 19,'vaibhav',19 ,2 union
select 20,'bhuvaneswar',24,1

-- create courses tabel with appropriate constraints id,name,departmentname 
create table courses
(courseID int primary key,
coursename varchar(50) not null,
DepartmentID int foreign key references department(departmentId))

-- insert values id, name, departmentid 
insert into courses
(courseID,coursename,DepartmentId)
select 21,'operating system',1 union all
select 22,'computer organization',1 union all
select 23,'VLSI design',2 union all
select 24,'signals and systems',2 union all
select 25,'machines and engines',3 union all
select 26,'Mechatronics',3 union all
select 27,'electrical enfineering',4 union all
select 29,'Ac machines',4 union all
select 30,'devops',5 union all
select 31,'CI/CD',5 union all
select 32,'strength of materials',6 union all
select 33,'concrete technology',6 union all
select 34,'AI ',7 union 
select 35,'prompt engineering',7 

select * from courses

--Display all students whose age is greater than 20.
select * from student where age>20

--Display all courses of the "Computer Science" department.
select courses.*,department.departmentname
from courses inner join  department on courses.departmentid=department.departmentid
where departmentname='cse'and coursename like '%computer%'
 
--Display all students who belong to the "Electronics" department.
select courses.*,department.departmentname
from courses inner join department on courses.departmentid=department.departmentid
where departmentname='ece'

--Display students whose age is between 18 and 22.
select * from student where age between 18 and 22

--INNER JOIN Students with Departments (to show student names with their department names).
select department.departmentid,student.name 
from student inner join department 
on student.departmentid=department.departmentid

--LEFT JOIN Courses with Departments (to show all courses, even if some department does not exist
select courses.coursename,department.departmentname
from courses left join department 
on courses.departmentid=department.departmentid

--RIGHT JOIN Students with Courses (to show all courses, even if no student has enrolled in them).
select name,coursename 
from student right join courses 
on courses.departmentid=student.depart
