create database SupplyChain ;
USE SupplyChain ;

delete from [supply chain]
where Order_ID is null or Order_ID ='';

select * from [supply chain] order by Row_ID asc;

--remove duplicate

select Row_ID, COUNT(Row_ID)as count from [supply chain] group by (Row_ID)
having COUNT (Row_ID) >1;

select Order_ID, COUNT(Order_ID)as count from [supply chain] group by (Order_ID)
having COUNT (Order_ID) >1;


delete from [supply chain] where Order_ID IN ( select Order_ID from  [supply chain]  group by (Order_ID)
having COUNT (Order_ID) >1);


select COUNT (*) as number_ofrows from [supply chain];

if 1 = 0
BEGIN 
delete from [supply chain] where Order_ID IN ( select Order_ID from  [supply chain]  group by (Order_ID)
having COUNT (Order_ID) >1);
END

select COUNT (*) as number_ofrows from [supply chain];

SELECT *  FROM [supply chain];
--IDENTIFY THE prduct category generating the highest sales volume 


SELECT TOP 1 Category ,sum (Sales)as total_sales from [supply chain] group by Category order by total_sales ;

--rank the 10 states with the highes total sales 
SELECT TOP 10 State ,sum (Sales)as total_sales from [supply chain] group by State order by total_sales DESC ;
--what percentage of products are returned relative to total sales ?
select 
sum (case when Returned = 'Not'then Sales else 0 end) as total_sales from [supply chain];

select sum (case when Returned = 'Yes' then Sales else 0 end) as total_returned_sales , (select sum (Sales)from [supply chain])as total_sales,
((sum (case when Returned = 'Yes' then Sales else 0 end))/(select sum (Sales)from [supply chain]))* 100 as return_percentage from [supply chain];









