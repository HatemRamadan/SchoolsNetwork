
--Inserting Data

insert Into Schools values('Omar Ibn Elkhatab','02256559884','national','Arabic','Islamic School','Cairo-Ramsees st20 B15 ','omarIbnElkhattab@msn.com','Best Educational System in egypt','Hiring the best of the best',6000)

insert Into Schools values('Future' ,'02236897','national','English','Nice modern School','El-Rehab-Group98-B8','future@hotmail.edu.eg','Improve the Quality of eduaction in Egypt','Science is the best vision',13000)

insert Into Schools values( 'Elkafrway Language School' ,'05724400698','national','English','Very Cosy and respectfull','Damietta District2','elkafrawy@msn.edu.eg','To educate students the best way possible','Do your best',3000)

insert Into Schools values( 'Elshrook','0846302652','International','Arabic','Militiary-based school','ElFayoum,ElFayoum City St56 B189','Fshrouk@gmail.edu.eg','provide Quality Education','Cutting Edge Educational Tech',20000)



insert into High_Schools values (2)
insert into Middle_Schools values (2)
insert into Elementary_Schools values(2,'1-Pen 2-Pencil 3-earaser 4-Sharpener')
insert into High_Schools values (1)
insert into Middle_Schools values (3)
insert into Elementary_Schools values(4,'1-launch Box 2-Pencil 3-earaser 4-Bag')
	
insert Into Employees values( 101,'omar','yasser','kharouba','male','El-Rehab-Group98-B16-App20','1995-11-17','omyasser@gmail.com',1)

insert Into Employees values (102,'hatem','ramdan','abdel-motelb','male','New Cairo-road56-B7-app140','1996-3-11','hatram96@gmail.com',1)

insert Into Employees values( 103,'Mohamed','Ahmed','Abdel-ghafar','male','6th of October city-ELhossary Square-Buiding 15-app2','1996-6-12','mohahm@gmail.com',1)

insert into Employees values (201,'Rana','Ahmed','Adel','Female','ElTagmoa 5,St 90,B12,App20','1976-6-12','ranaad@yahoo.com',2)

insert into Employees values (202,'Mai','AbdelRhman','Alnagdy','Female','ElTagmoa1,St118,B11,App24','1988-6-10','maiahm@gmail.com',2)

insert into Employees values (203,'Muhamed',null,'saeed','male','ElTagmoa5,St90,B16,App22','1985-11-17','muhsd@yahoo.com',2)

insert into Employees values (301,'Muhamed',null,'Ehab','male','Eldokki,St10,B6,App12','1983-11-11','muhamede@yahoo.com',3)

insert into Employees values (302,'Ahmed','Mohammed','Adel','male','Elabbasia,St15,B2,App52','1988-2-29','AhmedAd@hotmail.com',3)

insert into Employees values (303,'Mina',null,'Mikhail','male','ElShorouk,St35,B6,App42','1980-4-15','Mina.Mik@gmail.com',3)

insert into Employees values(401,'Ahmed',null,'Hazem','male','ElTagmoa3,st15,B8,app43','1970-5-16','ahhz70@msn.com',4)

insert into Employees values(402,'Mohamed','Mohamed','Abdel-Gawad','male','Sheraton,st113,B4,app15','1990-10-1','mabdelgwad@gmail.com',4)

insert into Employees values(403,'Afaf','Ali','ElTrabolsy','female','Shobra,st55,B97,app22','1968-5-16','afaftrb0@msn.com',4)

insert into Teachers values( 101,'Omar.Kharouba','omar12345',16,null);
insert into Teachers values (103,'Mohamed.Abdel-ghafar','mohamed12345',2,101);
insert into Administrators values (102,'Hatem.Ramadan','hatem12345',3000)

insert into Teachers values( 201,'Rana.Adel','rana12345',16,null);
insert into Teachers values (202,'Mai.Abdel-Rahman','mai12345',5,201);
insert into Administrators values (203,'Muhamed.Saeed','moh12',3000)

insert into Teachers values( 401,'Ahmed.Hazem','ahmhz1245',21,null);
insert into Teachers values (402,'Muhamed.Abdel-Gawad','gwd96',1,401);
insert into Administrators values (403,'Afaf.Ali','ahmhz1245',5000)


insert into Teachers values( 301,'Muhamed.Ehab','muheh12345',20,null);
insert into Teachers values (302,'Ahmed.Adel','Adel12345',10, 301);
insert into Administrators values (303,'Mina.Mikhail','mina12345',3000);




insert Courses values ('MATH501','Discrete Math',5,'Brief Introduction to the number theory')
insert into Courses values ('AENG2','A-Level English2',2,'Level A2 of English Language')
insert Into Courses values ('SCIV','Science',4,'Digestive System and the natural elements')
insert Into Courses values ('SSVI','Social Studies',6,'pharonic History and basics of geography')
insert into Courses values ('MATH401','Algebra',4,'Basics of Algebra')
insert into Courses values ('SCIII','Science',3,'Basics of science')

insert into Clubs Values ('AYB',1,'Helping the poor and in need in the slums')
insert into Clubs Values ('Inspire',1,'Achieving Atheletic Superiority')
insert into Clubs Values('Bdaya',2,'Charity- oriented club')
insert into Clubs values ('MOIC',2,'Islam Themed Club')


insert into Parents values ('Abdel-Rahman.ElSaid','arrs6958','Abdel-Rahman','Elsaid','elsaid65@gmail.com','02269756523','Imbaba,ElsudanST,b167,app3') 
insert into Parents values ('Mortada.Mansour','srmt77','Mortada','Mansour','mmansour@yahoo.com','0225987623','shobra,elmazalat,b18,app20')
insert into Parents values ('Ahmed.Shobier','leeeeeh','Ahmed','Shobier','shobshy@yahoo.com','02269697242','Elkatamia,st98,b124,app8') 
 insert into Parents values ('Marco.Veratti','pass899','Marco','Veratti','maestro@gmail.com',null,'Diplomats Area,group8,b17')

 insert into Children values (296143673,'male','Ahmed','2004-5-12','Abdel-Rahman.ElSaid')
 insert into Children values (296143773,'female','Salma','2006-8-22','Abdel-Rahman.ElSaid')
 insert into Children values (296145827,'female','Sara','2000-3-15','Ahmed.Shobier')
 insert into Children values (292163976,'male','Amir','2007-5-28','Mortada.Mansour')
 insert into Children values (295189273,'male','Ahmed','2003-2-14','Mortada.Mansour')
 insert into Children values (294017362,'female','Natalia','2005-4-21','Marco.Veratti')


 insert into Children_Applied_for_Schools values (296143673,1,0)
 insert into Children_Applied_for_Schools values (296143673,2,1)
 insert into Children_Applied_for_Schools values (296143673,3,1)

 insert into Children_Applied_for_Schools values (296143773,4,0)
 insert into Children_Applied_for_Schools values (296143773,1,1)

 insert into Children_Applied_for_Schools values (296145827,2,1)

 insert into Children_Applied_for_Schools values (292163976,1,1)
 insert into Children_Applied_for_Schools values (292163976,2,1)
 insert into Children_Applied_for_Schools values (292163976,3,1)
 insert into Children_Applied_for_Schools values (292163976,4,1)

 insert into Children_Applied_for_Schools values (295189273,1,1)
 insert into Children_Applied_for_Schools values (295189273,2,1)
 insert into Children_Applied_for_Schools values (295189273,3,1)
 insert into Children_Applied_for_Schools values (295189273,4,1)

 insert into Children_Applied_for_Schools values (294017362,2,1)

 insert into Students values(296143673,'Ahmed.Elsaid','ahsshh88',3)
 insert into Students values(296143773,'Salma.Elsaid','sels5656',1)
 insert into Students values(296145827,'Sara.Shobier','srashb98756',2)
 insert into Students values(292163976,'Amir.Mortada','mortadabeh:)',3)
 insert into Students values(295189273,'Ahmed.Mortada','mortadabeh:)',3)
 insert into Students values(294017362,'Natalia.Veratti','psgmid5896',2)
 
 insert into Students_Joins_Clubs values (296143773,1,'AYB')
 insert into Students_Joins_Clubs values (296143773,1,'Inspire')
insert into Students_Joins_Clubs values (296145827,2,'MOIC')
insert into Students_Joins_Clubs values (294017362,2,'Bdaya')
insert into Students_Joins_Clubs values (296145827,2,'Bdaya') 

insert into Students_taught_Courses_by_Teachers values(296143773,'MATH501',101)
insert into Students_taught_Courses_by_Teachers values(292163976,'SCIV',301)
insert into Students_taught_Courses_by_Teachers values(294017362,'SSVI',201)


insert into Announcements values('2016-10-11 05:05:05.000','QUIZ','QUIZ 1 TIME','MATH 501 QUIZ 1 next monday',102)
insert into Announcements values('2016-10-11 05:05:05.000','LAB','SCIENCE LAB','EXP 1 next weeek',102)
insert into Announcements values('2016-10-13 05:05:05.000','HOLIDAY','NATIONAL HOLIDAY','Happy New year',102)


insert into Announcements values('2016-11-11 05:05:05.000','QUIZ','QUIZ 1 TIME','MATH 501 QUIZ 1 next thursday',203)
insert into Announcements values('2016-11-12 05:05:05.000','LAB','SCIENCE LAB','EXP 1 next weeek',203)
insert into Announcements values('2016-11-13 05:05:05.000','HOLIDAY','NATIONAL HOLIDAY','Happy New year',203)


insert into Activities values(102,101,'2016-11-11 05:05:05.000','Sport','Play Ground','Ball')
insert into Activities values(102,103,'2016-07-11 05:05:05.000','Sport','Play Ground','Ball')

insert into Assignments values('MATH501','2016-11-11 05:05:05.000','2016-10-11 05:05:05.000','Prove that the square root of 2 is irrational',101)
insert into Assignments values('SCIV','2016-11-07 05:05:05.000','2016-11-01 05:05:05.000','Define The following terms (synthesis - decomposition)',301)


insert into Solved_assignments values(296143773,'MATH501',1,'2016-10-25 05:05:05.000',NULL,0,'since sqrt 2 is not rational then it is irrational')
insert into Solved_assignments values(292163976,'SCIV',2,'2016-11-05 05:05:05.000','78.5%',1,'The process of ...............')


insert into Questions values (296143773,'MATH501','what will be the content of the next lecture, TIA')
insert into Questions values (292163976,'SCIV','When will be the grade of last quiz be on the system')


insert into Answers values (296143773,'MATH501','Number theory',101,1)

insert into Answers values (292163976,'SCIV','Next week',301,2)


insert into Monthly_reports values (294017362,201,'2016-11-11 01:30:00.001','He has to study more at home')

insert into Monthly_reports values (292163976,301,'2016-11-01 01:30:00.001','Your son always comes late to school')

insert into Monthly_reports values (296143773,101,'2016-10-03 01:30:00.001','Such a great student!')


insert into Parent_Reviews_School values ('Abdel-Rahman.ElSaid',3,'Great school')
insert into Parent_Reviews_School values ('Mortada.Mansour',3,'Great school')
insert into Parent_Reviews_School values ('Ahmed.Shobier',2,'Great school')


insert into Parent_Replies_on_Monthly_report values('Marco.Veratti',201,294017362,'2016-11-11 01:30:00.001','Okay')

insert into Parent_Replies_on_Monthly_report values('Mortada.Mansour',301,292163976,'2016-11-01 01:30:00.001','Okay')

insert into Parent_Replies_on_Monthly_report values('Abdel-Rahman.ElSaid',101,296143773,'2016-10-03 01:30:00.001','Thanks!')


insert into Parent_Rates_Teacher values ('Marco.Veratti',201,7)

insert into Parent_Rates_Teacher values ('Mortada.Mansour',301,3)



insert into Student_Participates_in_Activities values (296145827,102,101,'2016-11-11 05:05:05.000')

insert into Student_Participates_in_Activities values (294017362,102,101,'2016-11-11 05:05:05.000')

insert into Student_Participates_in_Activities values (296143773,102,101,'2016-11-11 05:05:05.000')

insert into Student_Participates_in_Activities values (292163976,102,103,'2016-07-11 05:05:05.000')

insert into Student_Participates_in_Activities values (296143673,102,103,'2016-07-11 05:05:05.000')

insert into Student_Participates_in_Activities values (295189273,102,103,'2016-07-11 05:05:05.000')


insert into Courses_IsPrerequisite_Courses values ('MATH401','MATH501')
insert into Courses_IsPrerequisite_Courses values ('SCIII','SCIV')

--==================================================================================================
insert into Children values (10101,'male','Shehab','2004-5-12','Abdel-Rahman.ElSaid')
insert into Children_Applied_for_Schools values(10101,1,1)
insert into Students values (10101,'Shehab.Elsaid','Ayman123',1)
insert into Monthly_reports values (10101,101,'2016-11-02 01:30:00.001','keep it up')

insert into Employees values (100,'wael','Hamada','Hamda','male','address','1970-10-1','wael@gmail.com',1)

insert into Questions values (296143773,'MATH501','when will be the next quiz, TIA')
insert into Children values (296143600,'male','Ayman','2004-5-12','Abdel-Rahman.ElSaid')
insert into Children_Applied_for_Schools values(296143600,1,1)
insert into Students values (296143600,'Ayman.Elsaid','Ayman123',1)

insert into Children values (99999999,'female','Shereen','2004-5-12','Abdel-Rahman.ElSaid')
insert into Children_Applied_for_Schools values(99999999,1,1)
insert into Students values (99999999,null,null,1)

insert into Employees values (121212,'Hady',null,'Samy','male','address','1994-12-13','Hady@gmail.com',1)
insert into Teachers values (121212,'Hady.Samy','Hady111',3,null)
--=======================================Omar===========================================
insert Into Schools values( 'Kharouba_Schools','057999999','International','English','Militiary-based school','Damietta,New Damietta City St56 B189','KH_Schools@gmail.edu.eg','provide Quality Education','Cutting Edge Educational Tech',2000)
insert into Parent_Reviews_School values ('Abdel-Rahman.ElSaid',5,'Great school')
insert into Parent_Reviews_School values ('Ahmed.Shobier',5,'Great school')
insert into Parent_Reviews_School values ('Mortada.Mansour',5,'Great school')
insert into Announcements
values ('2016-11-22 06:07:15.000' ,'QUIZ','Science Quiz','Quiz 2 will be held next week',102)
insert into Activities values(102,101,'11-12-2016 5:05:05','Sport','School','Ball') 
--===========================================Mohammed==========================================
insert into Employees values( '107','youssif','Ibrahim','badran','male','Eloubor-area15-app2','1985-9-3','pedro@mail.com',1)
insert into Teachers values('107','youssif.badran','2316545',2,null)
insert into Courses values ('SCV','Sceince',5,'Sciences for 5th grade')



