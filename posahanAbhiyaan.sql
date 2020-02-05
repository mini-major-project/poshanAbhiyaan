create database poshanabhiyaan;
use poshanabhiyaan;

create table user(
userId int auto_increment primary key,
userName varchar(20),
userMail varchar(30),
userPswd varchar(20),
userMobile varchar(10),
userAddress varchar(50),
userPinCode varchar(6)
);

-- truncate table user;
-- drop table user;

create table child(
cId int auto_increment primary key,
cName varchar(20),
cGender varchar(6),
cDob date,
parent int,
foreign key(parent) references user(userId),
day0 date,
day42 date,
day71 date,
day99 date,
day472 date,
day1780 date,
day3560 date,
day4300 date 
);

-- drop table child;
create table childvaccinations(
day0 varchar(100),
day42 varchar(100),
day71 varchar(100),
day99 varchar(100),
day274 varchar(100),
day472 varchar(100),
day1780 varchar(100),
day3560 varchar(100),
day4300 varchar(100)
);
-- drop table childvaccinations;

insert into childvaccinations values
("Oral Polio Vaccine,Hepatitis B,Bacille Calmette Guerin-BCG",
"Oral Polio Vaccine-1,Pentavalent-1,Fractional Dose of Inactivated Polio Vaccine-fIPV-1,Rotavirus-RV1",
"Oral Polio Vaccine-2,Pentavalent-2,Rotavirus-RV2",
"Oral Polio Vaccine-3,Pentavalent-3,Fractional Dose of Inactivated Polio Vaccine-fIPV-2",
"measles mumps and rubella-MMR,Typhoid,Vitamin-A",
"Diphtheria Pertussis Tetanus-Booster1,Oral Polio Vaccine-Booster,Hepatits-A",
"Diphtheria Pertussis Tetanus-Booster2",
"tetanus toxoid",
"Human papillomavirus (HPV) vaccines"
);
select * from childvaccinations;

create table pregnant(
pid int auto_increment primary key,
pname varchar(20),
pdate date,
womenid int,
foreign key(womenid) references user(userid),
day0 varchar(5),
day42 varchar(5),
day71 varchar(5),
day99 varchar(5),
day472 varchar(5),
day1780 varchar(5),
day3560 varchar(5),
day4300 varchar(5) 
);

select * from user;

select * from child;