# Write your MySQL query statement below
#with starti as(select * from activity where activity_type= 'start') 
#select starti.machine_id ,round(avg(-starti.timestamp+endi.timestamp),3) as processing_time
#from starti 
#join (select * from activity where activity_type= 'end') as endi
#on starti.machine_id = endi.machine_id and starti.process_id = endi.process_id
#group by starti.machine_id 

select machine_id , round(sum(if( activity_type = 'start',-1,1)* timestamp)/count(distinct process_id),3) as processing_time
from activity 
group by machine_id

