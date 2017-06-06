--as system admin 

--1)
---Insert A school into the database given all the info about it
create proc insertIntoSchools @name varchar(30),@phone varchar(13),@type varchar(13) ,@language varchar(20),@g_info varchar(200),@address varchar(40) , @email varchar(30),@mission varchar(400),@vision varchar(400),@fees int
as
insert into Schools values ( @name, @phone, @type, @language, @g_info, @address, @email,@mission, @vision, @fees)

go 
--2)
--Insert a course into the database given all relevant info 
create proc insertIntoCourses @cd varchar(10) ,@name varchar(20),@level varchar(20),@grd int , @desc varchar(1000),@prereqcode varchar(10)
as
insert into Courses values (@cd,@name,@grd,@desc)
begin if @prereqcode is not null
  insert into Courses_IsPrerequisite_Courses values(@prereqcode,@cd)
 end
go
---Assign Course 1 as a prerequisite to Course 2
create proc addprereq @course1 varchar(10),@course2 varchar(10)
as
insert into Courses_IsPrerequisite_Courses values(@course1 , @course2) 
go

--3)
--Adding an administrator to a certin school 
 create proc addAdmins @SSN varchar(30),@first varchar(30),@middle_name varchar(30),@last_name varchar(30) ,@birthdate datetime ,@address varchar(100) ,@mail varchar(30),@user_name varchar(30) , @password varchar(30) ,@gender varchar(6),@school_name varchar(30)
 as 
 begin 
 declare @school_id int
 select  @school_id=s.school_id from Schools s where s.school_name = @school_name
 
 
insert into Employees values (@SSN, @first,@middle_name,@last_name,@gender,@address,@birthdate,@mail,@school_id)
 if exists (select * from Schools s1
 where s1.school_id = @school_id and ((s1.school_type= 'International') or (s1.school_type= 'international'))
)
begin 
insert into Administrators values (@SSN,@user_name ,@password,5000)
end
else if(exists (select * from Schools s1
 where s1.school_id = @school_id and (s1.school_type= 'National' or s1.school_type= 'national')
))
begin
insert into Administrators values ( @SSN,@user_name,@password ,3000)
end
end
go

--4)
--Delete a school without deleting any of its employees, we only set their usernaem\password to null
create Proc delete_Schools @s_name varchar(30)
as   
begin
declare @school_id int
select @school_id= school_id from Schools
where school_name = @s_name


delete from Teachers 
where exists
( select * from  Teachers t inner join Employees e on t.SSN = e.SSN and e.school_id = @school_id and Teachers.SSN = t.SSN )
delete from Administrators
where exists( select * from  Administrators a inner join Employees e on a.SSN = e.SSN and e.school_id = @school_id and a.SSN = Administrators.SSN 
)

begin
delete from Schools
where school_name = @s_name
end

end
go


--AS system User
--1)
--Searching for all info regarding a specific school using the school name 
create proc Search_for_school_by_name @s_name varchar(30)
as
select *from Schools
where school_name = @s_name
go
--Searching for all info regarding a specific school using the school address
create proc Search_for_school_by_address @s_address varchar(100)
as
select *from Schools
where school_address = @s_address
go
--Searching for all info regarding a specific school using the school type
create proc Search_for_school_by_type @type varchar(13)
as
select *from Schools
where school_type= @type
go




--Auxillairy tables, only created to help with queries 
create table high(
school_level varchar(30),
)
insert into high values('High School')

create table mid(
school_level varchar(30),
)
insert into mid values('Middle School')

create table ele(
school_level varchar(30),
)
insert into ele values('Elementary School')
go
--2)
--view a list of schools categorized by their level
create proc categorise_by_level
as
begin

select * into temp 
from High_Schools,high 
insert into temp
select  * 
 from Middle_Schools,mid

 insert into temp
select school_id,school_level 
 from Elementary_Schools,ele

select temp.school_level, s.* from temp inner join Schools s
on s.school_id= temp.school_id
drop  table temp
end
go

--3)
create proc view_reviews
@school_name varchar(30)
as
begin
begin
select  p.content as 'Reviews'
from Schools s, Parent_Reviews_School p 
where s.school_name  = @school_name  and s.school_id = p.school_id
end
end
go
create proc view_teachers
@school_name varchar(30)
as
begin
begin
select *
from Schools s
where s.school_name = @school_name
end
begin
select e.first_name +' '+ e.middle_name+' '+ e.last_name as 'Teacher name'
from Teachers T,Employees e, Schools s
where T.SSN = e.SSN and e.school_id = s.school_id and s.school_name = @school_name
end
end
go


--As a parent
--1) Sign up by providing my name (first name and last name), contact email, mobile number(s), address, home phone number, a unique username and password.
create proc register_a_parent @f_name varchar(30), @l_name varchar(30), @email varchar(50), @home_num varchar(12), @phone_num varchar(13), @address varchar(100), @username varchar(30), @passward varchar(30)
as
insert into Parents values (@username,@passward,@f_name,@l_name,@email,@home_num,@address)
insert into Parent_Phone_Numbers values(@phone_num,@username)  

go


create proc add_phone_number @username varchar(30), @phone_number varchar(13)
as
insert into Parent_Phone_Numbers values(@phone_number,@username)
go



--2)Apply for my children in any school. For each child I should provide his/her social security number(SSN), name, birthdate, and gender.
create proc register_a_child @name varchar(20), @ssn int, @b_date datetime, @gender varchar(6),@parent varchar(30)
as
insert into Children values(@ssn,@gender,@name,@b_date,@parent)
go

create proc apply_for_my_child @username varchar(30),@ssn int, @school_name varchar(30)
as
if exists (
select *
from Children c
where c.SSN=@ssn and c.parent = @username)
begin
declare @school_id int
select @school_id = s.school_id
from Schools s
where s.school_name = @school_name
insert into Children_Applied_for_Schools values (@ssn,@school_id,null) 
end
go

--3)View a list of schools that accepted my children categorized by child.
create proc view_schools_accepted_children @username varchar(30) 
as
select c.name,s.school_name
from Parents p,Children c,Children_Applied_for_Schools a,Schools s
where p.p_username = @username and
      p.p_username = c.parent and
      c.SSN = a.ssn and
	  a.school_id = s.school_id and
	  a.is_accepted = 1
order by c.name
go

--4)Choose one of the schools that accepted my child to enroll him/her.
create proc enroll_my_child @School_name varchar(30), @username varchar(30), @name varchar(20), @flag int output
as
begin
if exists ( select *
from Schools s, Children_Applied_for_Schools a, Children c
where a.ssn = c.SSN and
      s.school_name = @School_name and
	  s.school_id = a.school_id and
	  c.parent = @username and
	  c.name = @name and
	  a.is_accepted = 1
) 
begin
set @flag = 1;
declare @school int
select @school=s1.school_id
from Schools s1
where s1.school_name = @School_name

declare @ssn int
select @ssn = c.SSN
from Children c
where c.name = @name and c.parent = @username
insert into Students values(@ssn,null,null,@school)
end
else
set @flag = 0;
end
go

--5)View reports written about my children by their teachers.
create proc view_reports @username varchar(30)
as
select r.id,c.name,m.comment,e.first_name+' '+e.last_name as 'Teacher', m.timedate as 'issuing date'
from Children c,Students s, Monthly_reports m, Employees e, Teachers t, Reports r
where 
      c.parent = @username and
	  c.SSN = s.SSN and
	  s.SSN = m.student and
	  m.teacher = e.SSN and
	  e.SSN = t.SSN and 
	  r.student = m.student and
	  r.teacher = m.teacher and
	  r.timedate = m.timedate
order by c.name
go

--6)Reply to reports written about my children by their teachers.
create proc reply_to_reports @reply varchar(200), @Id int,@username varchar(30)
as
begin
declare @teacher_ssn varchar(30)
declare @timedate datetime
declare @ssn int
select @teacher_ssn = r.teacher, @timedate = r.timedate,@ssn = r.student
from Reports r
where @Id = r.id

insert into Parent_Replies_on_Monthly_report values(@username,@teacher_ssn,@ssn,@timedate,@reply)
end
go
--7)View a list of all schools of all my children ordered by its name.
create proc view_schools_of_my_children @username varchar(30)
as
select distinct sc.school_name 
from Parents p, Children c, Students s, Schools sc
where p.p_username = @username and
      p.p_username = c.parent and
	  c.SSN = s.SSN and
	  sc.school_id = s.school_id
	  order by sc.school_name
	  go
	 
	  go
--8)View the announcements posted within the past 10 days about a school if one of my children is enrolled in it.
create proc view_announcements @username varchar(30), @school varchar(30)
as
begin
if exists( select *
from Children c inner join Students s on c.SSN = s.SSN inner join Schools sc on s.school_id = sc.school_id
where c.parent = @username and
      sc.school_name =@school)
	  begin
	
	  select a.announcment_type, a.announcement_description,a.time_date
	  from Schools sc inner join Employees e on (sc.school_name = @school and sc.school_id = e.school_id) inner join Announcements a on a.administrator = e.SSN
	
	  where
	  a.time_date >= dateadd (day,-11,CURRENT_timestamp )
	  end
end
go



--9)Rate any teacher that teaches my children.
create proc rate_teacher @username varchar(30), @teacher varchar(30), @rate int
as
begin
begin
declare @teacher_ssn varchar(30)
select @teacher_ssn = t.SSN
from Teachers t
where t.t_username = @teacher
end
if exists ( select *
from Children c, Students_taught_Courses_by_Teachers t
where c.parent = @username and 
      c.SSN = t.student and
	  t.teacher = @teacher_ssn)
	  begin
insert into Parent_Rates_Teacher values(@username,@teacher_ssn,@rate)
end
end
go


--10)Write reviews about my children’s school(s).
create proc write_review @username varchar(30), @school_name varchar(30), @review varchar(200)
as
begin
if exists (
select *
from Children c,Students s, Schools sc
where c.parent = @username and
       c.SSN = s.SSN and
	   s.school_id = sc.school_id and 
	   sc.school_name = @school_name)
begin
declare @school int
select @school = sc.school_id 
from Children c, Students s, Schools sc
where c.parent=@username and
      c.SSN = s.SSN and
	  s.school_id = sc.school_id
	  
	 insert into Parent_Reviews_School values (@username,@school,@review)  
end
end
go

--11)Delete a review that i have written.
create proc delete_a_review @username varchar(30), @school_name varchar(30)
as
begin

if exists(
select*
from Schools s, Parent_Reviews_School p
where
s.school_name = @school_name and
s.school_id = p.school_id and
p.username = @username)
begin 
declare @school_id varchar(30)
select @school_id = s.school_id
from Schools s
where s.school_name = @school_name
delete from Parent_Reviews_School where username=@username and school_id = @school_id
end
end
go


--12)View the overall rating of a teacher.
create proc view_rating  @teacher varchar(30), @Rate int output
as
begin 
declare @teacher_ssn varchar(30)
select @teacher_ssn = t.SSN
from Teachers t
where t.t_username = @teacher
set @Rate = 0
if exists (select*
from Parent_Rates_Teacher p
where p.teacher = @teacher_ssn)
begin
select  @Rate =AVG(p.rating) 
from Parent_Rates_Teacher p
where p.teacher = @teacher_ssn
end
end
go

--13)View the top 10 schools with the highest number of reviews.
create proc view_top_10_reviewed_schools @username varchar(30) 
as
begin
select s.school_id into temp4
from Schools s
except
select s.school_id 
from Children c, Students s, Schools sc
where c.parent = @username and
      s.SSN = c.SSN and
	  sc.school_id =s.school_id 

select sc.school_name, count(*) as'Number of reviews' into temp2  
from Parent_Reviews_School p, temp4 s, Schools sc
where p.school_id = s.school_id and
      sc.school_id = s.school_id
group by s.school_id, sc.school_name

select top 10 s.school_name, p.[Number of reviews]
from Schools s, temp2 p
where s.school_name = p.school_name 
order by p.[Number of reviews] desc
drop table temp2
drop table temp4
end 

go
--View the top 10 schools with the highest number of enrolled student.
create proc view_top_10_schools @username varchar(30) 
as
begin
select s.school_id into temp5
from Schools s
except
select s.school_id 
from Children c inner join  Students s on s.SSN = c.SSN inner join Schools sc on  sc.school_id =s.school_id 
where c.parent = @username 
       	
select sc.school_name, count(*) as'Number of Students' into temp6 
from Students p, temp5 s, Schools sc
where p.school_id = s.school_id and
      sc.school_id = s.school_id
group by s.school_id, sc.school_name

select top 10 s.school_name, p.[Number of Students]
from Schools s, temp6 p
where s.school_name = p.school_name 
order by p.[Number of Students] desc
drop table temp5
drop table temp6 
end
go

--14)
--Find the international school which has a reputation higher than all national schools
create proc get_high_reputation_international_schools
as
begin
select s.school_id,count(*) as 'cnt' into tmp
from Schools s,Parent_Reviews_School r
where s.school_id=r.school_id and s.school_type='national'
group by s.school_id

declare @max_national_level int
select @max_national_level=max(cnt)
from tmp

drop table tmp

select s2.*,count(*) as 'number of reviews'
from Schools s2,Parent_Reviews_School r2
where s2.school_id=r2.school_id and s2.school_type='International'
group by s2.school_id,s2.school_name,s2.phone_num,s2.school_type,s2.main_language,s2.general_information,s2.school_address,s2.email,s2.mission,s2.vision,s2.fees
having count(*)>@max_national_level

end
--//////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
go
/*create proc view_teachers_of_my_Children_with_their_ratings @username varchar(30)
as
begin
select c.name , t.t_username,t.
from Children c inner join Students_taught_Courses_by_Teachers s on  c.SSN =s.student and c.parent =@username inner join Teachers t on t.SSN = s.teacher inner join Parent_Rates_Teacher p on p.teacher = s.teacher   
end
go
drop proc view_teachers_of_my_Children
exec view_teachers_of_my_Children_with_their_ratings 'Abdel-Rahman.ElSaid'*/
go
create proc view_teachers_of_my_children @username varchar(30)
as
begin
select c.name , t.t_username
from Children c inner join Students_taught_Courses_by_Teachers s on  c.SSN =s.student and c.parent =@username inner join Teachers t on t.SSN = s.teacher 
end
go

create proc view_my_reviews @username varchar(30)
as
begin
select s.school_name,p.content as 'Review'
from Parent_Reviews_School p inner join Schools s on s.school_id = p.school_id 
where p.username = @username
end
go

Create View Reports as

SELECT ROW_NUMBER() OVER( ORDER BY student ) AS id, student  , teacher, timedate
FROM(
    Select student,teacher,timedate  From Monthly_reports
   ) AS MyReports
GO
create proc check_usernameS @username varchar(30), @password varchar(30), @response int output
as
begin
set @response = 0
if exists(
select*
from Students s
where s.s_password =@password and s.s_username=@username)
begin
set @response = 1
end
end

go
create proc check_usernameT @username varchar(30), @password varchar(30), @response int output
as
begin
set @response = 0
if exists(
select*
from Teachers t
where t.t_username =@username and t.t_password=@password)
begin
set @response = 1
end
end

go
create proc check_usernameP @username varchar(30), @password varchar(30), @response int output
as
begin
set @response = 0
if exists(
select*
from Parents p
where p.e_password =@password and p.p_username=@username)
begin
set @response = 1
end
end
go

create proc view_announcments @school varchar(30)
as
begin 
select an.announcement_description,an.announcment_type,an.title,an.time_date
from Schools s inner join Employees e on e.school_id = s.school_id and s.school_name=@school inner join Administrators a on a.SSN = e.SSN inner join Announcements an on a.SSN = an.administrator 
end


--AS an administrator
--1)View and verify teachers who signed up as employees of the school I am responsible of.
go
create proc view_teachers_who_signed_up @username varchar(30)
as
begin
declare @id int
select @id=s.school_id
from Administrators a inner join Employees e on a.a_username = @username and a.SSN = e.SSN inner join Schools s on s.school_id = e.school_id 

select e.SSN, e.first_name +' '+ e.middle_name + ' ' + e.last_name as 'Name'
from  Employees e inner join Schools s on s.school_id = @id and s.school_id = e.school_id 
where not exists(
select * 
from Teachers tt inner join Employees e1 on e1.SSN = tt.SSN inner join Schools s1 on s1.school_id = @id
where tt.SSN = e.SSN
) and not exists(
select * 
from Administrators aa inner join Employees e2 on e2.SSN = aa.SSN inner join Schools s2 on s2.school_id = @id
where aa.SSN = e.SSN
)
end
go

-- assign to teachers a unique username and password.
create proc assign_username_to_teachers @username varchar(30), @ssn varchar(30), @t_username varchar(30), @password varchar(30), @years_of_exp int
as
begin
declare @id int
select @id=s.school_id
from Administrators a inner join Employees e on a.a_username = @username and a.SSN = e.SSN inner join Schools s on s.school_id = e.school_id 

insert into Teachers values(@ssn,@t_username,@password,@years_of_exp,null)
end
go


--2)View and verify students who enrolled to the school I am responsible of.
create proc view_students_enrolled_in_my_school @username varchar(30)
as
begin
select s.SSN,c.name+' '+p.first_name+' '+p.last_name as 'Name'
from Students s inner join Employees e on s.school_id = e.school_id inner join Administrators a on a.a_username =@username and a.SSN = e.SSN inner join Children c on c.SSN = s.SSN inner join Parents p on p.p_username = c.parent
where s.s_username is null and s.s_password is null
end
go

--assign to students a unique username and password.
create proc assign_username_to_a_student @username varchar(30),@ssn int, @student_username varchar(30), @password varchar(30)
as
begin 
if exists (
select *
from Students s inner join Employees e on s.school_id = e.school_id and s.SSN=@ssn inner join Administrators a on a.a_username =@username and a.SSN = e.SSN 
where s.s_username is null and s.s_password is null
)
begin 
update Students
set s_username=@student_username, s_password=@password
where SSN = @ssn
end
end
go



--3)Add other admins to the school I am working in.
create proc add_admins_to_my_school @username varchar(30),@ssn varchar(30), @f_name varchar(30),@m_name varchar(30), @l_name varchar(30), @b_date datetime, @address varchar(100), @gender varchar(6), @email varchar(30), @emp_username varchar(30), @password varchar(30)
as
begin 
if exists (select*
from Administrators a inner join Employees e on a.a_username = @username and a.SSN=e.SSN)
begin
declare @school_id int
select @school_id = s.school_id
from Schools s inner join Employees e on s.school_id = e.school_id inner join Administrators a on a.SSN= e.SSN and a.a_username= @username
print @school_id
insert into Employees values(@ssn,@f_name,@m_name,@l_name,@gender,@address,@b_date,@email,@school_id)
if exists (select*
from Schools s
where s.school_id = @school_id
and   (s.school_type ='international' or s.school_type = 'International'))
begin
insert into Administrators values (@ssn,@emp_username,@password,5000)
end
else
insert into Administrators values (@ssn,@emp_username,@password,3000)
end
end
go

--4) Delete employees from the system.
create proc delete_employee @username varchar(30),@emp_username varchar(30)
as
begin
declare @ssn varchar(30)

select @ssn = e.SSN
from Employees e inner join Administrators a on a.a_username = @emp_username and e.SSN = a.SSN

select @ssn = e.SSN
from Employees e inner join Teachers t on t.t_username = @emp_username and e.SSN = t.SSN

 
if exists (
select*
from Employees e inner join Administrators a on  a.a_username = @username and a.SSN = e.SSN inner join Employees ee on ee.SSN = @ssn and e.school_id=ee.school_id)
begin
if exists (
select *
from Teachers t
where t.t_username = @emp_username)
begin
delete from Teachers
where t_username = @emp_username 
end
else
begin
delete from Administrators 
where a_username = @emp_username
end
end
end
go

--Delete students from the system.
create proc delete_student @username varchar(30),@SSN int
as
begin
if exists ( select*
from Administrators a inner join Employees e on a.a_username = @username and a.SSN = e.SSN inner join Schools sc on e.school_id = sc.school_id inner join Students s on sc.school_id = s.school_id and s.SSN = @SSN)
begin
update Students
set s_username = null,s_password = null, school_id = null
where SSN = @SSN
end
end
go


--5)Edit the information of the school I am working in.
create proc edit_my_school_info @username varchar(30), @school_name varchar(30),@phone_num varchar(13),@school_type varchar(13),@main_language varchar(20),@general_information varchar(200),@school_address varchar(100),@email varchar(30),@mission varchar(400),@vision varchar(400),@fees int
as
begin 
if exists(select*
from Administrators a
where a.a_username = @username)
begin
declare @school_id int
select @school_id = s.school_id
from Schools s inner join Employees e on   e.school_id = s.school_id inner join Administrators a on e.SSN=a.SSN and a.a_username = @username

update Schools 
set school_name = @school_name, phone_num = @phone_num, school_type = @school_type, main_language = @main_language, general_information = @general_information, school_address = @school_address, email = @email,mission=@mission,vision=@vision,fees=@fees
where school_id = @school_id
end
end
go


--6)Post announcements.
create proc post_announcements @username varchar(30) ,@time_date datetime,@announcment_type varchar(20),@title varchar(30),@announcement_description varchar(300)
as
begin 
if exists(select *
from Administrators a
where a.a_username = @username)
begin
declare @ssn varchar(30)
select @ssn=e.SSN
from Administrators a inner join Employees e on a.SSN = e.SSN
where a.a_username = @username
insert into Announcements values (@time_date,@announcment_type,@title,@announcement_description,@ssn)
end
end
 
go

 --7)
 --create activities and assign every activity to certin teacher 
 create proc create_and_assign_activities @admin varchar(30),@teacher varchar(30),@current_time datetime,@type varchar(20),@location varchar(30),@equipment varchar(20)
 as
 declare @admin_ssn varchar(30)
 declare @teacher_ssn varchar(30)
 select @admin_ssn =a. SSN from Administrators a inner join Employees e on a.SSN= e.SSN
 where a.a_username = @admin
 select @teacher_ssn =t. SSN from Teachers t inner join Employees e on t.SSN= e.SSN
 where t.t_username= @teacher

 insert into Activities values(@admin_ssn,@teacher_ssn,@current_time,@type,@location,@equipment)
 go

 --8)
 --change teacher assigned to certin activity
 create proc change_the_teacher_of_an_activity @new_teacher varchar(30),@old_teacher varchar(30),@activity_time datetime,@admin varchar(30)
 as
declare @new_teacher_ssn varchar(30),@old_teacher_ssn varchar(30),@admin_ssn varchar(30)
select @old_teacher_ssn =t. SSN from Teachers t inner join Employees e on t.SSN= e.SSN
 where t.t_username= @old_teacher
 select @new_teacher_ssn =t. SSN from Teachers t inner join Employees e on t.SSN= e.SSN
 where t.t_username= @new_teacher
 select @admin_ssn =a. SSN from Administrators a inner join Employees e on a.SSN= e.SSN
 where a.a_username = @admin

 update Activities set teacher_ssn= @new_teacher_ssn
 where 
 teacher_ssn = @old_teacher_ssn and admin_ssn=@admin_ssn and timedate = @activity_time

 go
--9)
 --Assign teachers to courses taught in my school based on the level
 create proc assign_teachers_to_courses @teacher_un varchar(30),@course varchar(10)
 as
 begin
 declare @course_grade int,@school_id int,@teacher_ssn varchar(30)
 select @teacher_ssn = SSN  from Teachers 
 where t_username =@teacher_un
 select @course_grade = grade from Courses
 where code = @course
 select @school_id = school_id from Employees
 where  SSN = @teacher_ssn
 if(@course_grade between 1 and 6) and exists (select * from Elementary_Schools where school_id = @school_id)
 update Students_taught_Courses_by_Teachers set teacher = @teacher_ssn where @course = course and student in (
 select SSN from Students_With_Grade where Grade = @course_grade and school_id = @school_id 
 ) 
 else if (@course_grade between 7 and 9) and exists(select * from Middle_Schools  where school_id  = @school_id)
 update Students_taught_Courses_by_Teachers set teacher = @teacher_ssn where @course = course and student in (
 select SSN from Students_With_Grade where Grade = @course_grade and school_id = @school_id 
 )
 else if(exists (select * from High_Schools where school_id =@school_id))
 update Students_taught_Courses_by_Teachers set teacher = @teacher_ssn where @course = course and student in (
 select SSN from Students_With_Grade where Grade = @course_grade and school_id = @school_id) 
 end
 go
 --10)
 --assign supervisors to other teachers
 create proc assign_supervisor @supervisor varchar(30),@teacher varchar(30)
 as 
 begin
 declare @is_sup bit
 declare @super_ssn varchar(30) ,@teacher_ssn varchar(30)
 select @super_ssn = SSN from Teachers
 where t_username = @supervisor
 select @teacher_ssn = SSN from Teachers
 where t_username = @teacher
 
 select @is_sup = is_supervisor from Teachers
 where SSN = @super_ssn 
 if @is_sup =1
 begin
 
 update Teachers set supervisor = @super_ssn
 where SSN =@teacher_ssn

 end
 end
 go
 --11)
 --accept an application by a parent
 create proc accept_application @parent varchar(30), @admin_username varchar(30),@child_first_name varchar(20)
 as
 begin 
 declare @my_school_id int,@admin_ssn varchar(30)
 select @admin_ssn = SSN from Administrators where a_username = @admin_username 
 select @my_school_id = school_id from Employees
 where SSN = @admin_ssn
declare @child_ssn int
 select @child_ssn = SSN from Children
 where parent = @parent and name = @child_first_name
 update Children_Applied_for_Schools set is_accepted = 1
 where ssn = @child_ssn and school_id = @my_school_id
 end
 go

--reject an application by a parent
 create proc reject_application @parent varchar(30), @admin_username varchar(30),@child_first_name varchar(20)
 as
 declare @my_school_id int,@admin_ssn varchar(30)
 select @admin_ssn = SSN from Administrators where a_username = @admin_username 
 select @my_school_id = school_id from Employees
 where SSN = @admin_ssn
 declare @child_ssn int
 select @child_ssn = SSN from Children
 where parent = @parent and name = @child_first_name
 update Children_Applied_for_Schools set is_accepted = 0
 where ssn = @child_ssn and school_id = @my_school_id
 go


 --As a Teacher
 --AS a teacher

--1)
--Sign Up
create proc sign_up_teacher @ssn varchar(30), @f_name varchar(30),@m_name varchar(30),@l_name varchar(30),@gender varchar(6),@e_address varchar(100),@bithdate date,@e_mail varchar(30),@school_name varchar(30)
as
declare @school_id int
select @school_id = school_id from Schools
where school_name  = @school_name

insert into Employees values (@ssn,@f_name,@m_name,@l_name,@gender,@e_address,@bithdate,@e_mail,@school_id)
go

--2)
--get courses taught by a certin teacher
create proc get_courses_taught_by_a_teacher @user_name varchar(30)
as
begin

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@user_name



select c.*,high.school_level into temp2 from Courses c,Students_taught_Courses_by_Teachers sct,high
where c.code = sct.course and @t_ssn = sct.teacher and c.grade between 10 and 12
order by c.grade

insert into temp2
select c1.*,mid.* from Courses c1,Students_taught_Courses_by_Teachers sct1,mid
where c1.code = sct1.course and @t_ssn = sct1.teacher and c1.grade between 7 and 9
order by c1.grade

insert into temp2 
select c2.*,ele.* from Courses c2,Students_taught_Courses_by_Teachers sct2,ele
where c2.code = sct2.course and @t_ssn = sct2.teacher and c2.grade between 1 and 6

select * from temp2
drop table temp2

end
go
--3)
--Post an assignment
create proc post_assignment @code varchar(10), @due_date datetime ,@post_date datetime,@content varchar(500),@user_name varchar(30)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@user_name

insert into Assignments values (@code,@due_date,@post_date,@content,@t_ssn)
go

--4)
--solved Assignments for all the assignments a certin teacher has posted ordered by id s 
create proc solution_for_a_certin_teacher @user_name varchar(30), @code varchar(10)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@user_name

select st.s_username, sa.* from Solved_assignments sa,Assignments a,Students st
where sa.course = a.course and sa.assignment_num = a.assignment_num and a.teacher = @t_ssn and st.SSN = sa.student and sa.course = @code
order by st.s_username
go


--solved assignments for certin assignment
create proc solution_for_certin_assignment @teacher varchar(30),@course varchar(10),@assign_num int
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher

select st.s_username, sa.* from Solved_assignments sa,Students st,Assignments a
where sa.assignment_num = @assign_num and sa.course = @course and a.teacher = @t_ssn and st.SSN = sa.student and sa.course = a.course and sa.assignment_num = a.assignment_num 
order by st.s_username
go

--5)
--grade a student's assignment by his\her user name 
create proc grade_assignment @st_username varchar(30),@teacher varchar(30),@course varchar(10),@assign_num int, @grade varchar(5)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher


begin
declare @studentSSN int
select  @studentSSN = SSN from Students
where  s_username = @st_username
--making sure that the teacher who posted the assignment is the same one trying to grade the solution
if(exists(select *from  Students_taught_Courses_by_Teachers where student =@studentSSN and teacher = @t_ssn and course = @course ))
update Solved_assignments   
set score = @grade , is_marked =1
where student = @studentSSN and assignment_num = @assign_num and course = @course
end
go

--6)
--Delete an assignment 


create proc delete_assignment @course varchar(10),@assign_num int,@teacher_trying_to_delete varchar(30)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher_trying_to_delete


delete  from Assignments
where assignment_num=@assign_num and teacher = @t_ssn and course =@course
go

--7)
--Write Monthly Reports about students I teach
create proc post_monthly_report @teacher varchar(30),@student_username varchar(30),@current_time datetime,@content varchar(500)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher

declare @st_ssn int
select @st_ssn  = SSN from Students
where s_username = @student_username

if exists (select * from Students_taught_Courses_by_Teachers
where @st_ssn= student and @t_ssn = teacher )

begin 
insert into Monthly_reports values (@st_ssn,@t_ssn,@current_time,@content)
end
go

--8)
--View Questions about courses that a certin teacher teaches
create proc view_questions_about_my_courses @teacher varchar(30), @code varchar(10)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t  
where t.t_username=@teacher 


select distinct q.*,s.s_username from Questions q,Students_taught_Courses_by_Teachers sct,Students s
where sct.teacher = @t_ssn and s.SSN = q.student and q.course = @code
go
 
 --9)
 --Answer Questions about courses I-as a teacher- teach
create proc answer_question @teacher varchar(30),@st_username varchar(30),@course varchar(10),@question_num int,@content varchar(500)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher


declare @st_ssn int
select  @st_ssn=SSN from Students s 
where 
s.s_username =@st_username
insert into Answers values (@st_ssn,@course,@content,@t_ssn,@question_num)
go

--10)
--view list of students i teach categorized by grade ordered by first, last names
create proc view_my_students @teacher varchar(30)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher


select s.s_username,s.SSN ,c.name ,p.first_name,s.Grade from Students_taught_Courses_by_Teachers sct,Students_With_Grade s,Children c,Parents p
where sct.teacher =@t_ssn and sct.student = s.SSN and c.SSN = s.SSN and c.parent = p.p_username
group by s.Grade,s.s_username,c.name,p.first_name,s.SSN
order by c.name,p.first_name
go

--11)
--Students who did not join any activity
create proc view_lonely_students @username varchar(30)
as
declare @id int
select @id = s.school_id 
from Teachers t inner join Employees e on t.SSN = e.SSN and t.t_username=@username inner join Schools s on s.school_id = e.school_id
print @id
 select s_username,SSN from Students s
 where s.school_id = @id
and not exists(
select*
from Student_Participates_in_Activities s1 inner join Students s2 on s1.student = s2.SSN 
where s2.s_username = s.s_username)
 go

--12) 
 --Student who has joined maximum number of clubs
 --if there are multiple students who have joined equal number clubs it will display all of them 
 create proc popular_student @username varchar(30)
 as
 declare @id int
 select @id = s.school_id
 from Teachers t inner join Employees e on t.t_username=@username and e.SSN = t.SSN inner join Schools s on s.school_id = e.school_id
  
 select  s.ssn,s1.s_username ,COUNT(*) as 'club_count' into temp3 from  Students_Joins_Clubs s inner join Students s1 on s1.SSN = s.ssn and s1.school_id = @id
 group by s.ssn,s1.s_username

 declare @max_n int
 select @max_n  =max(club_count) from temp3
 
 select t.ssn,t.s_username  from temp3 t
 where club_count = @max_n 
 drop table temp3
 go


 --As an enrolled Student
------------------------
--1)
--Update my account information except for the username
create proc update_account @ssn int ,@new_password varchar(30)
as
begin
update Students
set s_password=@new_password
where SSN=@ssn
end
go

----------------------------------------------

go
----------------------------------------------

--2)
--View a list of courses’ names assigned to me based on my grade ordered by name
create proc show_courses @ssn int
as
select c.name,c.code
from Students_taught_Courses_by_Teachers r,Courses c
where r.student=@ssn and r.course=c.code
order by c.name

go


go
----------------------------------------------

--3)
--Post questions I have about a certain course
create proc post_question @ssn int ,@course varchar(10),@content varchar(500)
as
insert into Questions
values (@ssn,@course,@content)

go

----------------------------------------------


go
----------------------------------------------

--4)
--View all questions asked by other students on a certain course along with their answers.
create proc view_all_Questions @course varchar(10)
as
select q.content as 'question', a.content as 'answer'
from Questions q left outer join Answers a
on q.question_num=a.question_num and a.course=q.course and q.student=a.student 
where q.course=@course

go



----------------------------------------------

go
----------------------------------------------
--5)
--View the assignments posted for the courses I take
create proc view_my_assignments @ssn int ,@course varchar(10)
as
select a.* 
from Students_taught_Courses_by_Teachers t,Assignments a
where t.student=@ssn and t.course=a.course and a.course=@course

go

----------------------------------------------


go
----------------------------------------------
--6)
--Solve assignments posted for courses I take.
create proc solve_assignment @ssn int ,@ass_num int ,@course varchar(10), @solution_time datetime ,@content varchar(500)
as
insert into Solved_assignments values(@ssn,@course,@ass_num,@solution_time,null,0,@content)

go

----------------------------------------------


go
----------------------------------------------

--7)
--View the grade of the assignments I solved per course.
create proc view_assignments_grades @ssn int ,@course varchar(10) 
as
select sol.course,sol.assignment_num,sol.is_marked,sol.score
from Solved_assignments sol
where sol.student=@ssn and sol.course=@course 

go

----------------------------------------------


go
----------------------------------------------

--8)
--View the announcements posted within the past 10 days about the school I am enrolled in
create proc view_mySchool_Announcements @ssn int
as
select a.*
from Announcements a,Employees e,Students s
where s.SSN=@ssn and s.school_id=e.school_id and a.administrator=e.SSN and (year(CURRENT_TIMESTAMP)*365+month(CURRENT_TIMESTAMP)*30+day(CURRENT_TIMESTAMP))-(year(a.time_date)*365+month(a.time_date)*30+day(a.time_date))<=10

go

----------------------------------------------



go
----------------------------------------------

--9)
--View all the information about activities offered by my school, as well as the teacher responsible for it
create proc view_mySchool_Activities @ssn int 
as
select ad.a_username as 'Adminstrator',t.t_username as 'Teacher',a.timedate,a.activity_type,a.activity_location,a.equipment
from Teachers t, Activities a,Employees e,Students s,Administrators ad
where a.admin_ssn=e.SSN and e.school_id=s.school_id and s.SSN=@ssn and a.teacher_ssn=t.SSN and ad.SSN=e.SSN

go


----------------------------------------------

go
----------------------------------------------
--10)
--Apply for activities in my school on the condition that I can not join two activities of the same type on the same date
create proc Apply_for_activity @ssn int ,@admin varchar(30), @teacher varchar(30),@time datetime ,@type varchar(20)
as

declare @t_ssn varchar(30)
select @t_ssn=t.SSN
from Teachers t
where t.t_username=@teacher

declare @a_ssn varchar(30)
select @a_ssn=a.SSN
from Administrators a
where a.a_username=@admin


if(
not exists
(select *
 from Student_Participates_in_Activities p,Activities a 
 where p.student=@ssn and p.adminstrator=a.admin_ssn and p.teacher=a.teacher_ssn and p.timedate=a.timedate and p.timedate=@time and a.activity_type=@type) )
begin
insert into Student_Participates_in_Activities
values(@ssn,@a_ssn,@t_ssn,@time)
end

go

create proc is_HighSchool_Student @ssn int, @flag int output
as
if(exists (select * from High_Schools h , Students s where s.SSN=@ssn and s.school_id=h.school_id))
set @flag=1
else
set @flag=0


go
create proc get_clubs @ssn int
as
select c.name,c.purpose
from Clubs c,Students s
where s.SSN=@ssn and s.school_id=c.school_id
----------------------------------------------
go
----------------------------------------------
--11)
--Join clubs offered by my school, if I am a highschool student
create proc Join_club @ssn int, @club_name varchar(20)
as
declare @school int
select @school=s.school_id from Students s where s.SSN=@ssn

if(exists (
select * from High_Schools h
where h.school_id=@school
))
begin
insert into Students_Joins_Clubs 
values (@ssn,@school,@club_name) 
end

go

----------------------------------------------

go
----------------------------------------------
--12)
--Search in a list of courses that i take by its code
create proc search_for_courses_by_code @ssn int,@course varchar(10)
as
select c.* 
from Students_taught_Courses_by_Teachers t,Courses c
where t.course=@course and t.student=@ssn and t.course=c.code

go

----------------------------------------------

go
----------------------------------------------

--Search in a list of courses that i take by its name
create proc search_for_courses_by_name @ssn int,@course varchar(20)
as
select c.* 
from Students_taught_Courses_by_Teachers t,Courses c
where c.name=@course and t.student=@ssn and t.course=c.code

go

----------------------------------------------
go

create proc get_Student_info @username varchar(30)
as
select * from Students s
where s.s_username=@username
