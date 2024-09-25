create view names_department as select firstName, lastName, department from details;

select * from names_department;

#will fail cuz in view theres no position
update names_department set position = 'Researcher' where firstName like 'Joe' and lastName like 'Mullins';

#this will work cuz department exist in the view, will also update main table
update names_department set department = 'Researcher' where firstName like 'Joe' and lastName like 'Mullins';

drop view names_department;

delimiter //
create procedure spUpdateAddress 
(
	PersonID	int,
    NewAddress	varchar(50),
    NewCity		varchar(50)
)
begin
declare sql_error tinyint default false;
declare continue handler for sqlexception
set sql_error = true;

start transaction;

	update person set Address = NewAddress, city = NewCity where P_Id = PersonID;
    if sql_error = false then
		commit;
	else
		rollback;
	end if;
    
select * from person;	END //

call spUpdateAddress(3, 'Main Street', 'Oslo');

delimiter //
create procedure spUpdateDetailsRate
(
	PersonID	int,
    NewRate	decimal(5,2)
)
begin
declare sql_error tinyint default false;
declare continue handler for sqlexception
set sql_error = true;

start transaction;

	update details set rate = NewRate where id = PersonID;
    if sql_error = false then
		commit;
	else
		rollback;
	end if;
    
select * from details;	END //

call spUpdateDetailsRate(1, 11.6);

delimiter //
create procedure spUpdateAddress_withoutput 
(
	in PersonID	int,
    in NewAddress	varchar(50),
    in NewCity		varchar(50),
    out update_count	int
)
begin
declare sql_error tinyint default false;
declare continue handler for sqlexception
set sql_error = true;

start transaction;

	update person set Address = NewAddress, city = NewCity where P_Id = PersonID;
    if sql_error = false then
		set update_count = 1;
		commit;
	else
		set update_count = 0;
		rollback;
	end if;
    
select * from person;	END //

call spUpdateAddress_withoutput(4, 'Sub Street', 'Nothing', @update_count);

select @update_count;

Drop function if exists fnCalculateWages;
delimiter //
create function fnCalculateWages
(
	PersonID	int
)
returns decimal(9,2)

begin
	declare wages decimal(9,2);
    select sum(rate*hours) from details where id = PersonID;
    return wages;
    
END //

delimiter //
create trigger trDetailsBeforeUpdate before update on details
	for each row
		begin
			set new.department = upper(new.department);
end //

update details set department = 'new dept' where id = 5;

drop table if exists orders_audit;
create table orders_audit
(
	order_id	int not null,
    person_id	int not null,
    action_type	varchar(50),
    action_date	datetime not null
);

drop trigger if exists trOrdersAfterInsert;
delimiter //
create trigger trOrdersAfterInsert after insert on orders
	for each row
		begin
			insert into orders_audit values(new.o_id, new.p_id, 'inserted', now());
end //
insert into orders values (6,4433,4);
select * from orders_audit;

show triggers;
show triggers in db4_2024;

delete from orders where o_id = 6;

select * from orders_audit;

drop trigger if exists trOrdersAfterDelete;
delimiter //
create trigger trOrdersAfterDelete before delete on orders
	 for each row
		begin
			insert into orders_audit values(old.o_id, old.p_id, 'deleted', now());
end //

show variables;

/*
drop event if exists evOneTimeDeleteAuditTrial;
delimiter //
create event evOneTimeDeleteAuditTrial
on schedule every 1 month
starts '2022-09-20'
do begin
delete from orders_audit
*/
