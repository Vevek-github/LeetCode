# Write your MySQL query statement below
sELECT query_Name ,
ifnull(round(sum(rating/position)/count(*) ,2),0) as quality
,ifnull(round(
  sum(case when rating < 3 then 1 else 0 end) *100 /count(*)
  ,2),0)
 as poor_query_percentage
from queries
where query_name is not null
group by query_name
