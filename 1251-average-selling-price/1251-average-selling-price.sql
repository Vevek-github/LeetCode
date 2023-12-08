# Write your MySQL query statement below
select p.product_id,ifnull(round(sum(p.price * u.units)/SUM(U.UNITS),2),0)
as average_price
from unitssold u 
right join prices p
on p.product_id = u.product_id and u.purchase_date between p.start_date and p.end_date 
group by p.product_id
