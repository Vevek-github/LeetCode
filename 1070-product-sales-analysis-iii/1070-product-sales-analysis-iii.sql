# Write your MySQL query statement below
/*with base as (
  select * ,rank()over(partition by product_id order by year) as rnk
  from sales
)
select product_id , year as first_year , quantity , price  
from base
where rnk =1
group by product_id 
*/
select product_id , year as first_year , quantity , price  
from sales s 
where (product_id ,year) in (select product_id , min(year) from sales group by product_id)
