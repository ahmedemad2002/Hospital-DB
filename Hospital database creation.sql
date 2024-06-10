Employee table ---> create table employee(emp_id int , f_name varchar(10) not null ,l_name varchar(10) not null ,sex char ,email_Address varchar(30) unique , salary int ,emp_type char , supervise_emp_id int , constraint pk primary key(emp_id) , constraint fk foreign key (supervise_emp_id) references employee (emp_id) )
PhoneNum table(Multivalued Attribute) --->create table Emp_PhoneNum(phone_num varchar(11), emp_id int ,constraint pk10 primary key(phone_num,emp_id),constraint fk12 foreign key(emp_id) references employee(emp_id) )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
***Doctors Section***
Doctor table ---> create table doctor(doc_id int , exp int , Dep_name varchar(20) , doc_type char , supv_doc_id int , constraint pk1 primary key(doc_id) ,constraint fk1 foreign key(doc_id) references employee(emp_id) on delete cascade , constraint fk2 foreign key(supv_doc_id) references doctor(doc_id))
Check on doctor type ---> alter table doctor add constraint ch check(doc_type ='t' or doc_type='p' or doc_type='v' )
--------------------------------------------------------------
select e.* from employee e , doctor d where e.emp_id = d.doc_id
--------------------------------------------------------------
-Trainee Doctor entity
create table Trainee(td_id int , training_duration int  , constraint pk2 primary key(td_id) , constraint fk3 foreign key(td_id) references doctor(doc_id) on delete cascade)
--------------------------------------------------------------
-Visiting Doctor entity
create table visiting (vd_id int, specialty varchar(20), v_duration int, country varchar(20), constraint pk4 primary key(vd_id) , constraint fk4 foreign key(vd_id) references doctor(doc_id) on delete cascade)
--------------------------------------------------------------
-Permanent Doctor enitity
create table Permanent(pd_id int , Hire_date date, constraint pk5 primary key(pd_id) , constraint fk5 foreign key(pd_id) references doctor(doc_id) on delete cascade)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
***Receptionist Section***
-Receptionist table ---> create table Receptionist(r_id int, place varchar(20), supv_r_id int , constraint pk6 primary key(r_id) ,constraint fk6 foreign key(r_id) references employee(emp_id) on delete cascade , constraint fk7 foreign key(supv_r_id) references Receptionist(r_id) )
-Records table ---> create table Records(Rec_no int , description varchar(50),appointment date, r_id int, p_id int , constraint pk12 primary key(Rec_no) ,constraint fk15 foreign key(r_id) references Receptionist(r_id) on delete cascade , constraint fk16 foreign key(p_id) references Patient(p_id) on delete cascade )
--------------------------------------------------------------
***Nurse Section***
-Nurse table ---> create table Nurse(n_id int, n_place varchar(20), supv_n_id int , constraint pk7 primary key(n_id) ,constraint fk8 foreign key(n_id) references employee(emp_id) on delete cascade , constraint fk9 foreign key(supv_n_id) references Nurse(n_id) )
-Room table ---> create table Room (room_id int , room_type varchar(20) , BedNum int , constraint pk8 primary key(room_id))
-Manage table (for many to many relationship between Nurse and Room) --->create table manage(n_id , room_id , constraint pk9 primary key(room_id,n_id) ,constraint fk10 foreign key(room_id) references room(room_id) on delete cascade ,constraint fk11 foreign key(n_id) references Nurse(n_id) on delete cascade)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
***Patient Section***
Patient table ---> create table patient(p_id int , pname varchar(30) not null , sex char , phone_number varchar(11), ex_date date , room_id int , doc_id int , constraint pk11 primary key(p_id) , constraint fk13 foreign key(room_id) references room(room_id) on delete cascade, constraint fk14 foreign key(doc_id) references doctor(doc_id) on delete cascade)
Diease table(Mutivalued) ---> create table diseases(diseases varchar(50) , p_id int , constraint pk13 primary key(diseases, p_id) , constraint fk17 foreign key(p_id) references Patient(p_id)) 
Treatment table ---> create table Treatment(T_id int , t_date date ,price number(5,2), p_id int , constraint pk14 primary key(T_id) , constraint fk18 foreign key(p_id) references Patient(p_id) on delete cascade) 
Bill table (Associative Entity) ---> create table Bill(p_id int, Medicine_id int , Medicine_count int , constraint pk16 primary key(p_id,Medicine_id) ,constraint fk19 foreign key(p_id) references patient(p_id) on delete cascade ,constraint fk20 foreign key(Medicine_id) references Medicine(m_id) on delete cascade )
Medicine table ---> create table Medicine(m_id int, m_type varchar(20) , price number(6,2) , constraint pk15 primary key(m_id))
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
***Insertion codes***
--All Employees--
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary) values (1234,'Ahmed','Mohamed','M','1234@gmail',150000)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, supervise_emp_id) values (2020,'Diaa','Mohamed','M','2020@gmail',60000,1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, supervise_emp_id) values (2021,'Abdo','Saad','M','2021@gmail',50000,1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, supervise_emp_id) values (2022,'Mazen','Tharwat','M','2022@gmail',30000,1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, emp_type ,supervise_emp_id) values (2024,'Menna','Ahmed','F','2024@gmail',30000,'d',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, emp_type ,supervise_emp_id) values (2025,'Hanaa','Mohamed','F','2025@gmail',20000,'d',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, emp_type ,supervise_emp_id) values (2026,'Manar','Ragab','F','2026@gmail',25000,'d',1234)
-update employee set emp_type='d' where emp_id='1234'
-update employee set emp_type='d' where emp_id='2020'
-update employee set emp_type='d' where emp_id='2021'
-update employee set emp_type='d' where emp_id='2022'
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (3027,'Lujy','Abdo','F','3027@gmail',25000,'n',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (3025,'Sarah','Yasser','F','3025@gmail',10000,'n',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (3024,'Mohamed','Saad','M','3024@gmail',8500,'n',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (4021,'Salma','Mazen','F','4021@gmail',5000,'r',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (4022,'Mayar','Mazen','F','4021@gmail',5000,'r',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (4023,'Ezz','Toney','M','4023@gmail',2750,'r',1234)
-insert into employee(emp_id , f_name , l_name, sex , email_Address , salary, EMP_TYPE ,supervise_emp_id) values (2023,'Mousa','Farouk','M','2023@gmail',100000,'d',1234)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
***Doctors***
--General--
-insert into doctor (doc_id,exp,dep_name,doc_type) values (2020,15,'lungs','p')
-insert into doctor (doc_id,exp,dep_name,doc_type,supv_DOC_ID) values (2023,20,'Heart','v',2020)
-insert into doctor (doc_id,exp,dep_name,doc_type,supv_DOC_ID) values (2021,11,'Dentist','p',2020)
-insert into doctor (doc_id,exp,dep_name,doc_type,supv_DOC_ID) values (2022,9,'ENT','p',2020)
-insert into doctor (doc_id,exp,dep_name,doc_type,supv_DOC_ID) values (2025,1,'Dentist','t',2020)
-insert into doctor (doc_id,exp,dep_name,doc_type,supv_DOC_ID) values (2024,2,'ENT','t',2020)
-insert into doctor (doc_id,exp,dep_name,doc_type,supv_DOC_ID) values (2026,1,'Heart','t',2020)
--------------------------------------------------------------
***Doctors***
--Trainee--
-insert into Trainee(td_id , training_duration) values (2025,2)
-insert into Trainee(td_id , training_duration) values (2024,3)
-insert into Trainee(td_id , training_duration) values (2026,4)
--------------------------------------------------------------
***Doctors***
--Permanent--
-insert into Permanent(pd_id , HIRE_DATE) values (2022, '06/11/1990')
-insert into Permanent(pd_id , HIRE_DATE) values (2021, '06/11/2010')
-insert into Permanent(pd_id , HIRE_DATE) values (2021, '08/18/2012')
--------------------------------------------------------------
***Doctors***
--Visiting--
-insert into visiting(vd_id , specialty , v_duration , country) values (2023,'Heart',3,'Germany')
--------------------------------------------------------------
***Patient***
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (200,'Ahmed Mohamed','M','01119456789','1/1/2020',300,2023)
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (201,'Saad Hegazy','M','01219456789','6/12/2021',300,2020)
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (202,'Mohamed Adel','M','01519456789','6/27/2021',301,2021)
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (203,'Ibrahim Yasser','M','01109567810','11/6/2020',302,2022)
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (204,'Mariam Abdo','F','01555956781','7/9/2020',303,2022)
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (205,'Yara Maged','F','01222965871','8/19/2020',304,2021)
-insert into patient(p_id ,pname , sex, Phone_number ,EX_date , Room_id , doc_id ) values (206,'Essra Fathy','F','01002965871','3/28/2021',304,2026)
--------------------------------------------------------------
***Room***
-insert into room(room_id,room_type,bednum) values(300,'examination',1)
-insert into room(room_id,room_type,bednum) values(302,'examination',1)
-insert into room(room_id,room_type,bednum) values(303,'examination',1)
-insert into room(room_id,room_type,bednum) values(304,'Surgery Room',3)
-insert into room(room_id,room_type,bednum) values(305,'I_Care & Patient_R',8)
-insert into room(room_id,room_type,bednum) values(307,'Surgery Room',3)
--------------------------------------------------------------
***nurse***
-insert into nurse(n_id , n_place) values (3027,'First Floor')
-insert into nurse(n_id , n_place , supv_n_id) values (3025,'Second Floor',3027)
-insert into nurse(n_id , n_place , supv_n_id) values (3024,'Second Floor',3027)
--------------------------------------------------------------
***Receptionist***
-insert into Receptionist(r_id,place) values(4021,'First Floor')
-insert into Receptionist(r_id,place,supv_r_id) values(4022,'Second Floor',4021)
-insert into Receptionist(r_id,place,supv_r_id) values(4023,'Second Floor',4021)
--------------------------------------------------------------
***Emp-num***
-insert into emp_phonenum(phone_num,emp_id) values('01119875490',1234)
-insert into emp_phonenum(phone_num,emp_id) values('01098754321',2020)
-insert into emp_phonenum(phone_num,emp_id) values('01098763212',2021)
-insert into emp_phonenum(phone_num,emp_id) values('01098754310',2022)
-insert into emp_phonenum(phone_num,emp_id) values('01198754911',2023)
-insert into emp_phonenum(phone_num,emp_id) values('01198754911',2023)
--------------------------------------------------------------
***Treatment***
-insert into treatment(t_id,t_date,price,p_id) values (100,'12/6/2021',500,200)
-insert into treatment(t_id,t_date,price,p_id) values (101,'11/7/2020',700,201)
-insert into treatment(t_id,t_date,price,p_id) values (102,'10/17/2020',1000,201)
-insert into treatment(t_id,t_date,price,p_id) values (103,'7/28/2021',1200,203)
-insert into treatment(t_id,t_date,price,p_id) values (104,'6/11/2021',2000,204)
-insert into treatment(t_id,t_date,price,p_id) values (105,'2/12/2021',800,205)
-insert into treatment(t_id,t_date,price,p_id) values (106,'1/1/2022',100,205)
-insert into treatment(t_id,t_date,price,p_id) values (107,'10/15/2022',100,205)
-insert into treatment(t_id,t_date,price,p_id) values (108,'3/19/2020',100,206)
--------------------------------------------------------------
***Medicine***
-insert into Medicine(m_id,m_type,price) values(2101,'Tablets',50)
-insert into Medicine(m_id,m_type,price) values(2102,'Tablets',91)
-insert into Medicine(m_id,m_type,price) values(2103,'Syrup',100)
-insert into Medicine(m_id,m_type,price) values(2104,'Syrup',120)
-insert into Medicine(m_id,m_type,price) values(2105,'Injection',40)
-insert into Medicine(m_id,m_type,price) values(2106,'Injection',65)
--------------------------------------------------------------
***Bill***
-insert into bill(p_id,Medicine_id,Medicine_count) values(200,2101,2)
-insert into bill(p_id,Medicine_id,Medicine_count) values(201,2101,1)
-insert into bill(p_id,Medicine_id,Medicine_count) values(202,2102,1)
-insert into bill(p_id,Medicine_id,Medicine_count) values(203,2103,3)
-insert into bill(p_id,Medicine_id,Medicine_count) values(204,2105,4)
-insert into bill(p_id,Medicine_id,Medicine_count) values(205,2106,2)
--------------------------------------------------------------
***Records***
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (210,'ill','1/1/2020',4021,200)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (220,'ill','12/6/2021',4021,201)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (230,'ill','11/6/2020',4022,202)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (240,'ill','6/27/2021',4022,203)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (250,'ill','7/9/2020',4023,204)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (260,'ill','8/19/2020',4023,205)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (270,'ill','8/26/2020',4021,205)
-insert into Records(rec_no , description , Appointment , r_id , p_id) values (280,'ill','3/28/2020',4022,206)
--------------------------------------------------------------
***Diseases***
-insert into diseases(diseases,p_id) values('heart',200)
-insert into diseases(diseases,p_id) values('lungs',200)
-insert into diseases(diseases,p_id) values('dental',201)
-insert into diseases(diseases,p_id) values('heart',202)
-insert into diseases(diseases,p_id) values('dental',203)
-insert into diseases(diseases,p_id) values('Ent',204)
-insert into diseases(diseases,p_id) values('heart',205)
-insert into diseases(diseases,p_id) values('lungs',206)
-insert into diseases(diseases,p_id) values('ENT',206)
--------------------------------------------------------------
***Manage***
-insert into manage(n_id,room_id) values(3027,300)
-insert into manage(n_id,room_id) values(3027,301)
-insert into manage(n_id,room_id) values(3025,302)
-insert into manage(n_id,room_id) values(3025,301)
-insert into manage(n_id,room_id) values(3025,303)
-insert into manage(n_id,room_id) values(3024,304)
-insert into manage(n_id,room_id) values(3024,305)
-insert into manage(n_id,room_id) values(3024,303)



