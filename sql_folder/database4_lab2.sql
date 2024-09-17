update branch set assets = 600 where `name` like 'branch 1';

create table branch_list (`name` varchar(10));
insert into branch_list values ('branch 1'),('branch 2'),('branch 3');

select distinct `name` from branch where `name` in (select `name` from branch_list);

