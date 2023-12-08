# Write your MySQL query statement below
with base as (
  select customer_id , count(distinct product_key) as pal
  from customer 
  group  by customer_id
)
select c.customer_id 
from base c
where c.pal = (select count(distinct product_key) from product)