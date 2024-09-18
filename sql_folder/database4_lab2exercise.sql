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

#1.	Get the details of all employees who are not between the ages of 40 and 50.
select * from details where age < 40 or age > 50;
select * from details where age not between 40 and 50;

#2.	Get the details of all employees who work between the 10 and 15 hours per week.
select * from details where hours >= 10 and hours <=15;

#3.	Find all employees who have an ‘e’ in their first name.
select * from details where firstName like '%e%';

#4.	Find all employees whose second letter of their first name is ‘u’
select * from details where firstName like '_u%';

/*5.	Find all employees whose first name :
	ends with n and is only 4 letters in length
    starts with a ‘J’ but is only 4 letters in length
	is only 3 letters in length
    is greater than 4 letters in length
*/
select * from details where firstName like '%n' and LENGTH(firstName) = 4;
select * from details where firstName like 'j%' and LENGTH(firstName) = 4;
select * from details where LENGTH(firstName) = 3;
select * from details where LENGTH(firstName) >= 4;

#6.	Find all female employees who have a ‘3’ in their age.
select * from details where gender = 'F' having age like '%3%';

#7.	Count the number of females.
select COUNT(gender) as 'Number Of Females' from details where gender = 'F';

#8.	Count the number of males.
select COUNT(gender) as 'Number Of Males' from details where gender = 'M';

#9.	Calculate the average age of the females.
select avg(age) as 'Average Age of Females' from details where gender = 'F';

#10.	Calculate the average age of the males.
select avg(age) as 'Average Age of Females' from details where gender = 'M';

#11.	Who is the oldest employee?
select * from details where age in (select MAX(age) from details);
select * from details order by age desc limit 1;

#12.	Who is the youngest employee?
select * from details where age in (select min(age) from details);

#13.	What is the average hours worked?
select avg(hours) as 'Average hours worked' from details;

#14.	What is the total of the female wage?
select sum(rate) as 'total wage of females' from details where gender = 'F';

#15.	What is the total of the male wage?
select sum(rate) as 'total wage of males' from details where gender = 'M';

#16.	What is the average age in each department?
select avg(age) as 'average age', department from details group by department;

#17.	What is the average age of each position?
select avg(age) as 'average age', position from details group by position;

#18.	Count the number of males/females per department.
select department, gender, count(gender) as totalCount from details group by department, gender order by department;