#create the customers table
create table customers
(
	customer_id  varchar(10)  not null ,
	city   varchar(10)    not  null ,
	primary  key(customer_id)
) engine = INNODB;

#insert some data on customers table
insert into customers select '163','HangZhou';
insert into customers select '9you','ShangHai';
insert into customers select 'TX','HangZhou';
insert into customers select 'baidu','HangZhou';

#create the orders table
create table orders
(
	order_id   int   not null	  auto_increment ,
	customer_id  varchar(10)  ,
	primary key (order_id)
) engine = INNODB;

#insert some datas on orders table
insert into orders select null , '163';
insert into orders select null , '163';
insert into orders select null , '9you';
insert into orders select null , '9you';
insert into orders select null , '9you';
insert into orders select null , 'TX';
insert into orders select null , null;

#query the customers who from 'HangHou' with  the orders below 2 
#and query orders count of them
select  c.customer_id , count(o.order_id) as total_orders
from customers as c
left join orders as o
on  c.customer_id  =  o.customer_id 
where  c.city  =  'HangZhou'
group by  c.customer_id
having   count(o.order_id) < 2
order by  total_orders desc ;

