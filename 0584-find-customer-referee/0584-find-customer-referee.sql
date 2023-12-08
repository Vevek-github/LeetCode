# Write your MySQL query statement below
#-- with cte as(select name , case when referee_id =2 then 0 else 1 end as flag from customer )#select name from cte where flag =1; 
#-- select name from customer  where referee_id <>2 or isnull(referee_id)
select name from customer  where referee_id <>2 or referee_id is NULL;