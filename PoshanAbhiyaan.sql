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

select * from user;

select * from child;

create table pregnantPerson(
ppid int8 primary key auto_increment,
userid int,
startDateOfPreg date,
day31Date date,
day31Status varchar(20),

day61Date date,
day61Status varchar(20),

day91Date date,
day91Status varchar(20),

day121Date date,
day121Status varchar(20),

day151Date date,
day151Status varchar(20),

day181Date date,
day181Status varchar(20),

day196Date date,
day196Status varchar(20),

day211Date date,
day211Status varchar(20),

day226Date date,
day226Status varchar(20),

day241Date date,
day241Status varchar(20),

day248Date date,
day248Status varchar(20),

day255Date date,
day255Status varchar(20),

day261Date date,
day261Status varchar(20),

foreign key(userid) references user(userId)
);

select * from pregnantPerson;
select * from user;
delete from user where userName = 'Preg1';

use poshanabhiyaan;

create table pregnantTests(
day varchar(10) primary key,
month varchar(10),
tests varchar(255)
);

insert into pregnantTests values('day31','month2', 'Routine prenatal check up, Blood and urine test (ANC profile), Urine pregnancy test, Pregnancy ultrasound scan for cardiac activity');
insert into pregnantTests values('day61','month3', 'Routine prenatal check up,NT ultrasound scan (sonography) and a double marker test,First trimester combined test');
insert into pregnantTests values('day91','month4', 'Routine prenatal check up');
insert into pregnantTests values('day121','month5', 'Routine prenatal check up, Anomaly or ultrasound level II scan');
insert into pregnantTests values('day151','month6', 'Routine prenatal check up, First dose of Tetanus Toxoid (TT) injection');
insert into pregnantTests values('day181','month7', 'Routine prenatal check up, Second dose of Tetanus Toxoid (TT) injection, Growth and fetal wellbeing ultrasound scan, Blood test (CBC/Urine R /OGCT)');
insert into pregnantTests values('day196','month7', 'Routine prenatal check up');
insert into pregnantTests values('day211','month8', 'Routine prenatal check up');
insert into pregnantTests values('day226','month8', 'Routine prenatal check up');
insert into pregnantTests values('day241','month9', 'Routine prenatal check up');
insert into pregnantTests values('day248','month9', 'Routine prenatal check up');
insert into pregnantTests values('day255','month9', 'Routine prenatal check up');
insert into pregnantTests values('day261','month9', 'Routine prenatal check up');

select * from pregnantPerson;

-- drop table hospital;
create table hospital(
hid int auto_increment primary key,
hName varchar(30),
hAddress varchar(100),
hPhone varchar(20),
hPinCode varchar(20)
);

insert into hospital(hName,hAddress,hPhone,hPinCode) values("Kasturi MultiSpeciality","Plot No 10-3-167/A, St Johns Road, Secunderabad, Hyderabad - 500003","9152194264","500003");
insert into hospital(hName,hAddress,hPhone,hPinCode) values("Srikara Hospitals","222 & 223, Mythri Nagar, Phase Ii, Miyapur, Madinaguda, Hyderabad - 500049","9152179412","500049");
insert into hospital(hName,hAddress,hPhone,hPinCode) values("Dr. BHavani Fertility","4th Floor, Lucid Daignostic Buliding, Nizampet X Roads, Kukatpally, Hyderabad - 500072","9152676939","500072");
insert into hospital(hName,hAddress,hPhone,hPinCode) values("Apollo Hospitals","Plot No 10-3-167/A, St Johns Road, Secunderabad, Hyderabad - 500003","9152386845","500003");
insert into hospital(hName,hAddress,hPhone,hPinCode) values("Apollo Cradle","Dharani Devi Building, Plot No 565, Jubilee Hills, Hyderabad - 500033","9152622478","500033");

select * from hospital;
select * from pregnantPerson;
