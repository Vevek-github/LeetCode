# Write your MySQL query statement below
#select v.customer_id , count(case when t.transaction_id is null then 1 else null end ) as #count_no_trans from visits v left join transactions t on v.visit_id = t.visit_id group by v.#customer_id having count_no_trans >0 order by count_no_trans

select v.customer_id , count(visit_id) as count_no_trans
from visits v
where visit_id not in 
(
    select visit_id from transactions
)
group by customer_id
order by count_no_trans