select products.prod_id, name, count(*) as total from products, rentals where products.prod_id = rentals.prod_id group by 
products.prod_id order by total desc limit 1;

select customers.cus_id, firstName, lastName, count(*) as total from customers, rentals where customers.cus_id = rentals.cus_id 
group by customers.cus_id order by total desc limit 1;

update products set genre='Science Fiction' where prod_id = 5;

(select products.prod_id, name, count(*) as total, genre from products, rentals where products.prod_id = rentals.prod_id and 
genre = 'Science Fiction' group by products.prod_id order by total desc limit 1) Union 

(select products.prod_id, name, count(*) as total, genre from products, rentals where products.prod_id = rentals.prod_id and 
genre = 'Drama' group by products.prod_id order by total desc limit 1) Union 

(select products.prod_id, name, count(*) as total, genre from products, rentals where products.prod_id = rentals.prod_id and 
genre = 'Comedy' group by products.prod_id order by total desc limit 1);

select employees.emp_id, firstName, lastName, count(*) as total from employees, rentals where employees.emp_id = rentals.emp_id 
group by employees.emp_id order by total desc;

select name, dateRented from products, rentals order by dateRented limit 1;
/*select name, dateRented from products, rentals where products.prod_id=rentals.prod_id order by dateRented limit 1;*/

select name, dateRented from products, rentals order by dateRented desc limit 1;

INSERT INTO products VALUES(null,'Leon','Luc Besson', 'Jean Reno','Blu-ray',119,'18','Thriller',11,'An assassin makes good');
/*select name from products where not exists (select products.prod_id from products, rentals where products.prod_id=rentals.prod_id);*/
select name from products where prod_id not in (select prod_id from rentals);

select products.prod_id, name, count(*) as total from products, rentals where products.prod_id=rentals.prod_id and 
month(dateRented)=10 and year(dateRented)=2010 group by products.prod_id order by total desc limit 3;
