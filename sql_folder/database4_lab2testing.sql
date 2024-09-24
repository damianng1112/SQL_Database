use sakila;

select * from actor cross join address union 
select * from actor cross join address union 
select * from actor cross join address union 
select * from actor cross join address;

select * from actor;
explain select * from actor;
explain select * from actor cross join address;
explain select * from actor inner join film_actor on actor.actor_id and film_actor.actor_id;