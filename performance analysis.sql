select * from location
select * from product
select* from facts

--  total number of states present in location?
 
select count(state) as  total_states from location 


--how many product  are of regular type?
select productid,product_type,product,type from product
where type='regular'

select count(type) as total_regular
from product 
where type= 'regular'

---how much spending has been done on marketing of product id 1?
SELECT SUM(marketing) AS total_marketing_spend
FROM facts
WHERE ProductId = 1;
 
 --what is the manimum sales of a product ?

 select min(sales) as min_sales
 from facts

 --display max COGS?
 select max(cogs) as max_cogs
 from facts

 --display the detailes of the product wher product_type is coffee?
 select product from  product 
where product_type ='coffee'

 --display the detailes where total expenses are greater than 40?
 select total_expenses from facts
 where Total_Expenses>40

 --what is the average sales in area code 719?
 select avg(area_code) from facts
 where Area_Code='719'

 --find out the total profit genearted by colorado state?
 select sum(profit) as total_profit from facts
 inner join location on facts.area_code=location.area_code
 where location.state ='colorado'

 select* from facts
 --display the average inventory for each product ID?
 select productid,
 AVG(inventory) avg_inventory from facts
 group by productid


 select * from location
 --display state in sequential order in location table?
 select state from location 
 order by state asc 
 

 --display the average budget of the product where the avereage budget margin shold be greater than 100
 select productid,avg(budget_margin) as average_budget_margin from facts 
 group by productid
 having avg(budget_margin)<100

 --what is the total sales done on date 2010-01-01
select sum(sales) as total_sales from facts 
where date='2010-01-01'

--display the average total expense of each product id on individual date?
select productid,date,
AVG(total_expenses) 
 as avg_expense from facts
group by
date,productid

---display the table with following attibutes such as
--date,productid,product_type,product,sales,profit,state,area_code
 select * from location
 select * from facts
 select * from Product

 select f.date,f.productid,f.sales,f.profit,l.state,p.product_type,l.area_code
 from facts as f
 inner join product as p  on f.productid= p.productid
 inner join location as l on f.area_code=l.Area_Code

 -- display th rank without any gap to show sales wis rank 
 SELECT
  DENSE_RANK() OVER (ORDER BY f.sales DESC) AS sales_rank_no_gap,
  f.date,
  f.productid,
  p.product_type,
  p.product,
  f.sales,
  f.profit,
  l.state,
  l.area_code
FROM fact AS f
INNER JOIN product AS p
  ON f.productid = p.productid
INNER JOIN location AS l
 ON f.area_code = l.area_code
ORDER BY sales_rank_no_gap;

-- find the state wise profit and sales?
select
l.state,
sum(f.profit) as total_profit,
sum(f.sales) as total_sales
from facts as f
inner join location as l on f.area_code=l.area_code
group by
l.state 
order by 
l.state 

--find the state wise profit and sales along with the product name
select 
l.state,
p.product,
sum(f.sales) as total_sales,
sum(f.profit) as total_profit
from facts as f
inner join location  as l on f.area_code=l.area_code
inner join product  as p on f.productid=p.productid
group by
l.state,
p.product
order by
l.state,
p.product



select * from location
 select * from facts

--if there is an increase in sales of 5%,calculate the increased sales ? 

select (sales * 0.5) as incresed_sales
from facts

-- find the max profit along with the product id and product type ?

select
p.product,
p.product_type,
f.profit 
from facts as f
inner join product as p on
f.productid=p.productid
where f.profit= (select max(profit) 
from facts)

--create a store procedure to fetch the result according to the product type from product table?
create procedure dbo.csp_getproductbytype

@product_type varchar(100)
as
begin 
select
productid,
product_type,
product,
type from 
product
where product_type=@product_type
end

EXEC dbo.csp_getproductbytype @product_type='coffee'
go

--write a query by creating a condition in which if the total expenses is less than 60 then it is a profit or else loss 
select 
total_expenses,
case when total_expenses < 60 then 'profit'
else 'loss'
end as status
from facts

--give the total weekly sales values with the date and product id details. use roll-up to pull data in hierarchical order ?
select
datepart(week,date)
date,productid,
sum(sales)
from facts
group by rollup(datepart(week,date),date,productid)

--apply union and intersection operator on the tables which consist of attribute ared code ?
select area_code
from facts 
union
select area_code
from facts

--create a user define function for the product table to fetch a particular product type based upon the user's preference ?

 create function fn_getproduct
 (
 @product_type varchar(30))
 returns table
 as  return(
 select
 productid, type 
 from 
 product 
 where product_type =@product_type)

 select * from fn_getproduct('coffee')

 select * from product

 --change the product type from coffee tea where product ID is 1 undo it ?
 begin transaction
 update product
 set product_type='tea'
 where productid=1
 rollback transaction

 select * from product where productid=1

--dispaly the date, product id and sales where total expenses are between 100 to 200?
select
date,
productid,
sales 
from
facts
where Total_Expenses between 100 and 200

--delete the record in the product table for regular type?
delete 
from product
where product_type='regular'

--display the ASCII values of the fifth character from the columnproduct?
 select ascii(substring(product ,5,1)) as fifthcharascii
 from product