# Write your MySQL query statement below
/*
select round(count(player_id)/(select count(distinct  player_id) from activity),2) as fraction
from activity
where (player_id,event_date) in
(select player_id, date_add(min(event_date) ,interval 1 day) from activity group by player_id)

*/
with base as (
    select player_id , event_date,
    row_number() over (partition by player_id order by event_date asc) as rnum
    from Activity
), base1 as (
    select *, lag(event_date , 1) over (partition by player_id order by event_date ASC) as pre
    from base
    where rnum <3),
  base2 as (
    select player_id , max(if(datediff(event_date,pre)=1,1,0)) as diff 
    from base1 
    group by player_id
  )
    select round(sum(case when diff = 1 then 1 else 0 end) / count(distinct player_id) , 2) as fraction
 from base2



