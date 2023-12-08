# Write your MySQL query statement below
select date_format(trans_date,'%Y-%m') as month,
country,
ifnull(count(state),0) as trans_count,
ifnull(sum(CASE WHEN state = 'approved' THEN 1 ELSE 0 END)  ,0  ) as approved_count,
ifnull(sum(amount),0) as trans_total_amount,
ifnull(sum(CASE WHEN state = 'approved' THEN amount ELSE 0 END),0) as approved_total_amount
from transactions
group by month,country