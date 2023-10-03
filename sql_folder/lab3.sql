select department, count(*) as employees from details group by department having count(*)>3;

select department,position,count(*) as total from details group by department,position;

select department, count(*) as total from details group by department;

select * from details order by id desc limit 5;

select * from details limit 5 offset 15;

select * from details where age not between 40 and 50;

select * from details where hours between 10 and 15;

select * from details where firstName like "%e%";

select * from details where firstName like "_u%";

select * from details where firstName like "%n" and firstName like "____"; /*alt ans select * from details where firstName like "___n";*/

select * from details where firstName like "j%" and firstName like "____"; /*alt ans select * from details where firstName like "j___";*/

select * from details where firstName like "___";

select * from details where firstName like "_____%";

select * from details where gender="F" and age like "%3%";

select count(*) as noOfFemales from details where gender ="F";

select count(*) as noOfFemales from details where gender ="M";

select avg(age) as FemaleAvgAge from details where gender="F";

select avg(age) as FemaleAvgAge from details where gender="M";

select * from details where age=(select max(age) from details);

select * from details where age=(select min(age) from details);

select avg(hours) as avgHours from details;

select sum(rate*hours) from details where gender ="F";

select sum(rate*hours) from details where gender ="M";

select department, avg(age) from details group by department;

select position, avg(age) from details group by position;

select gender, avg(age) from details group by gender;

select department, gender, count(*) as total from details group by department, gender;

select department, avg(rate*hours) as avgWage from details group by department;

select gender, avg(rate*hours) as avgWage from details group by gender;

select position, avg(rate*hours) as avgSalary from details group by position;

select department, max(hours) from details group by department;

select position, max(hours) from details group by position;

select department, position, avg(rate*hours) as avgSalary from details group by department, position order by department;

select department, position, avg(hours) from details group by department, position order by department;

select *, (rate*hours) as wage from details order by wage desc limit 5;

select *, (rate*hours) as wage from details order by wage limit 3;

select * from details as d where hours > (select avg(hours) from details as d2 where d2.position = d.position);

select * from details as d where hours > (select avg(hours) from details as d2 where d2.department = d.department);

select *, (rate*hours) as wage from details as d where (rate*hours) > (select avg(rate*hours) from details as d2 where d2.department = d.department);