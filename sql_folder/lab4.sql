select * from customers, employees;

(select firstName, lastName, town from customers) Union (select firstName, lastName, town from employees);

select c.firstName, c.lastName, c.town from customers as c inner join employees as e on (c.firstName=e.firstName and c.lastName=e.lastName and c.town=e.town);

select c.firstName, c.lastName, c.town from customers as c where exists (select e.firstName, e.lastName, e.town from employees as e where c.firstName=e.firstName and c.lastName=e.lastName and c.town=e.town);

select c.firstName, c.lastName, c.town from customers as c where not exists (select e.firstName, e.lastName, e.town from employees as e where c.firstName=e.firstName and c.lastName=e.lastName and c.town=e.town);

select rental_id, name, cus_id, emp_id, dateRented from rentals, products where rentals.prod_id = products.prod_id;

select current_date();

select now();

select dayname(now())as info;

select monthname(now()) as info;

select day(now()), month(now()), year(now());

select now(), date_add(now(), interval 5 month);

select now(), date_sub(now(), interval 5 month);

select datediff(now(),'2020-11-01');

select dayname('2002-05-09') as 'My day of birth';

select date_format(from_days(datediff(now(),'2002-05-09')),'%y') as age;

select cast((rand()*10) as unsigned integer);

select datediff(now(),'2002-05-09') as 'Total Days Alive';

select firstName,lastName,dateOfBirth from employees order by dateOfBirth limit 1;

select firstName,lastName,dateOfBirth from employees where dateOfBirth=(select min(dateOfBirth)from employees);

select firstName,lastName,dateOfBirth,date_format(from_days(datediff(now(),dateOfBirth)),'%y')as age from employees;

select firstName,lastName,dateOfBirth,date_format(from_days(datediff(now(),dateOfBirth)),'%y')as age from customers;