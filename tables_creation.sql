create table Schools(
school_id int primary key identity,
school_name varchar(30),
phone_num varchar(13),
school_type varchar(13),                             --could be bit
main_language varchar(20),
general_information varchar(200),
school_address varchar(100),
email varchar(30) unique,
mission varchar(400),
vision varchar(400),
fees int

)
create table High_Schools(
school_id int primary key foreign key references Schools(school_id) on delete cascade on update cascade,
)

create table Clubs (
name varchar(20),
school_id int foreign key references High_Schools on delete cascade on update cascade,
purpose varchar(400)
primary key(school_id,name)
)
create table Middle_Schools(
school_id int primary key foreign key references Schools(school_id) on delete cascade on update cascade,
)
create table Elementary_Schools(
school_id int primary key foreign key references Schools(school_id) on delete cascade on update cascade,
list_of_supplies varchar(1000),
)

create table Parents(
p_username varchar(30) primary key ,
e_password varchar(30),
first_name varchar(30),
last_name varchar(30),
email varchar(50) unique,
home_number varchar(12) unique,
home_address varchar(60))


create table Children(
SSN int primary key ,
gender varchar(6),
name varchar(20),
birthdate date,
age  as (year(current_timestamp)-year(birthdate)) ,
parent varchar(30) foreign key references Parents on update cascade on delete set null 
)

create table Parent_Phone_Numbers(
phone_num varchar(13) primary key,
parent varchar(30) references Parents on update cascade on delete cascade);


create table Students(
SSN int primary key foreign key references Children on delete cascade on update cascade  ,
s_username varchar(30) ,
s_password varchar(30),
school_id int foreign key references Schools on update set null on delete set null,
)


create table Courses (
code varchar(10) primary key,
name varchar(20),
grade int ,
course_description varchar(1000)
)

create table Employees(
SSN varchar(30) primary key,
first_name varchar(30),
middle_name varchar(30),
last_name varchar(30),
gender varchar(6) not null,
e_address varchar(100),
birthdate date,
email varchar(30) unique,
school_id int foreign key references Schools on delete set null on update cascade
) 


--Constraints always cause an error
create table Teachers (
SSN varchar(30) primary key foreign key references Employees on delete cascade on update cascade,
t_username varchar(30) unique,
t_password varchar(30),
years_of_experience int,
is_supervisor as (case when years_of_experience>15 then 1 else 0 end), 
salary as years_of_experience*500,
supervisor varchar(30) foreign key references Teachers ,

)

create table Administrators(
SSN varchar(30) primary key foreign key references Employees on delete cascade on update cascade,
a_username varchar(30) unique,
a_password varchar(30),
salary int,
)


create table Announcements(
announcment_id int identity,
time_date datetime,
announcment_type varchar(20),
title varchar(30),
announcement_description varchar(500),
primary key(announcment_id,time_date),
administrator varchar(30) default 'Admin' foreign key references Administrators on delete set default on update cascade
)

create table Assignments(
assignment_num int identity,
course varchar(10) foreign key references Courses on delete cascade on update cascade,
due_date datetime,
post_date datetime,
content varchar(500),
teacher varchar(30) default 'System' foreign key references Teachers on delete set default on update cascade
primary key(course,assignment_num)
)


create table Activities (
admin_ssn varchar (30) default 'Admin' foreign key references Administrators on delete set default ,
teacher_ssn varchar (30) foreign key references Teachers on update cascade,
timedate datetime ,
activity_type varchar(20),
activity_location varchar(30),
equipment varchar(20),
primary key(admin_ssn,teacher_ssn,timedate)
)

create table Solved_assignments(
student int foreign key references Students  on delete cascade on update cascade,
course varchar(10) ,
assignment_num int ,
posted_at datetime,
score varchar(5),
is_marked bit,
content varchar(500),
foreign key(course,assignment_num) references Assignments on update no action  on delete no action ,
primary key (student,course,assignment_num,posted_at)
)


create table Questions(
student int foreign key references Students ,
course varchar(10) foreign key references Courses on delete cascade on update cascade,
question_num int identity,
content varchar(500),
primary key(student,course,question_num)
)

create table Answers(
student int ,
course varchar(10),
content varchar(500),
teacher varchar(30),
question_num int,
primary key(student,course,question_num),
foreign key(student,course,question_num) references Questions on delete cascade on update cascade,
foreign key(teacher) references Teachers on delete set null on update cascade
)

create table Children_Applied_for_Schools
(
ssn int foreign key references Children on update cascade,
school_id int  foreign key references Schools on update cascade , 
is_accepted bit,
)

create table Monthly_reports(
student int,
teacher varchar(30),
timedate datetime,
comment varchar(500),
primary key(student, teacher, timedate),
foreign key(student) references Students on delete cascade,
foreign key(teacher) references Teachers ,
)

create table Students_Joins_Clubs (
ssn int foreign key references Students ,
school_id int,
club_name varchar(20),
primary key(ssn,school_id,club_name),
foreign key(school_id,club_name) references Clubs(school_id,name) on delete cascade on update cascade,
)

create table Parent_Reviews_School (
username varchar(30) foreign key references Parents on update cascade,
school_id int foreign key references Schools on delete cascade on update cascade,
content varchar(200),

primary key(username,school_id),

)

create table Parent_Replies_on_Monthly_report(
parent varchar(30) foreign key references Parents on delete cascade on update cascade,
teacher varchar(30) ,
ssn int ,
report_timedate datetime ,
foreign key(ssn,teacher,report_timedate) references Monthly_reports on delete cascade on update cascade,
content varchar(200),

primary key(teacher,ssn,report_timedate),
)

create table Parent_Rates_Teacher(
parent varchar(30)  foreign key references Parents on delete cascade on update cascade,
teacher varchar(30)  foreign key references Teachers on delete cascade on update cascade,
rating int ,
primary key(parent,teacher),
)

create table Student_Participates_in_Activities (
student int foreign key references Students on delete cascade on update cascade,
adminstrator varchar(30),
teacher varchar(30),
timedate datetime,
primary key(student,adminstrator,teacher,timedate),
foreign key (adminstrator,teacher,timedate) references Activities(admin_ssn,teacher_ssn,timedate) ,
)

create table Courses_IsPrerequisite_Courses(
course1 varchar(10) foreign key references Courses on delete cascade on update cascade,
course2 varchar(10) foreign key references Courses ,
primary key(course1,course2),
)
--ASk Ghada About Constraints

create table Students_taught_Courses_by_Teachers(
student int foreign key references Students on delete cascade on update cascade,
course varchar(10) foreign key references Courses ,
teacher varchar(30) foreign key references Teachers,
primary key(student,course)
)


go
create view Students_With_Grade as 
select s.* ,Grade = c.age-5 from Children c inner join Students s
on c.SSN = s.SSN
go
