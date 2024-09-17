DROP DATABASE IF EXISTS DB4_2024;
CREATE DATABASE IF NOT EXISTS DB4_2024;
USE DB4_2024;

DROP TABLE IF EXISTS details;


CREATE TABLE DETAILS (
	id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
	firstName VARCHAR(15) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	age INTEGER NOT NULL,
	gender VARCHAR(1) NOT NULL,
	position VARCHAR(15) NOT NULL,
	department VARCHAR(20) NOT NULL,
	rate DECIMAL(7, 2) NOT NULL,
	hours INTEGER NOT NULL);

SELECT 'INSERTING DATA INTO DATABASE' as 'INFO';

INSERT INTO details VALUES ( null, 'Joe', 'Mullins', 64, 'M', 'Lecturer', 'Engineering', 63.08, 12);
INSERT INTO details VALUES ( null, 'Joan', 'Macgill', 27, 'F', 'Researcher', 'Science', 38, 35);
INSERT INTO details VALUES ( null, 'Jim', 'Mitchell', 51, 'M', 'Researcher', 'Business', 38, 25);
INSERT INTO details VALUES ( null, 'John', 'Magner', 47, 'M', 'Lecturer', 'Humanities', 63.08, 16);
INSERT INTO details VALUES ( null, 'Jean', 'Madden', 45, 'F', 'Professor', 'Design', 76.45, 14);
INSERT INTO details VALUES ( null, 'Jack', 'Minogue', 61, 'M', 'Administrator', 'Hospitality', 45.57, 37);
INSERT INTO details VALUES ( null, 'Josephine', 'Mahony', 33, 'F', 'Head', 'Nursing', 98.56, 40);
INSERT INTO details VALUES ( null, 'Juan', 'Mosley', 56, 'M', 'Professor', 'Engineering', 76.45, 11);
INSERT INTO details VALUES ( null, 'Jamie', 'Mulllen', 45, 'M', 'Researcher', 'Science', 38, 37);
INSERT INTO details VALUES ( null, 'Julie', 'Mooney', 39, 'F', 'Lecturer', 'Business', 63.08, 18);
INSERT INTO details VALUES ( null, 'Jane', 'Mccarthy', 37, 'F', 'Administrator', 'Design', 45.57, 45);
INSERT INTO details VALUES ( null, 'James', 'May', 38, 'M', 'Researcher', 'Hospitality', 38, 9);
INSERT INTO details VALUES ( null, 'Joseph', 'Manning', 32, 'M', 'Lecturer', 'Hospitality', 63.08, 16);
INSERT INTO details VALUES ( null, 'Judith', 'Milner', 36, 'F', 'Lecturer', 'Nursing', 63.08, 20);
INSERT INTO details VALUES ( null, 'Jerome', 'Murphy', 26, 'M', 'Head', 'Engineering', 98.56, 42);
INSERT INTO details VALUES ( null, 'Jude', 'Manley', 28, 'M', 'Head', 'Science', 98.56, 41);
INSERT INTO details VALUES ( null, 'Juanita', 'Mahon', 59, 'F', 'Administrator', 'Engineering', 45.57, 49);
INSERT INTO details VALUES ( null, 'Justin', 'Maguire', 25, 'M', 'Lecturer', 'Business', 63.08, 16);
INSERT INTO details VALUES ( null, 'Jacqulinen', 'Musgrave', 43, 'F', 'Professor', 'Business', 76.45, 10);
INSERT INTO details VALUES ( null, 'Julia', 'Moore', 36, 'F', 'Administrator', 'Science', 45.57, 38);

select * from details where age >= 40 and age <=50;

select * from details where hours >= 10 and hours <=15;

select * from details where firstName like '%e%';

select * from details where firstName like '_e%';

select * from details where firstName like '%n' and LENGTH(firstName) = 4;

select * from details where firstName like 'J%' and LENGTH(firstName) = 4;

select * from details where LENGTH(firstName) = 3;

select * from details where LENGTH(firstName) >= 4;

select * from details where gender = 'F' having age like '%3%';

select COUNT(gender) as 'Number Of Females' from details where gender = 'F';

select COUNT(gender) as 'Number Of Males' from details where gender = 'M';

select avg(age) as 'Average Age of Females' from details where gender = 'F';

select avg(age) as 'Average Age of Females' from details where gender = 'M';

select * from details where age = (select MAX(age) from details);

select * from details where age = (select min(age) from details);

select avg(hours) as 'Average hours worked' from details;

select sum(rate) as 'total wage of females' from details where gender = 'F';

select sum(rate) as 'total wage of males' from details where gender = 'M';

select avg(age) as 'average age', department from details group by department;

select avg(age) as 'average age', position from details group by position;

select department, gender, count(gender) as totalCount from details group by department, gender order by department;