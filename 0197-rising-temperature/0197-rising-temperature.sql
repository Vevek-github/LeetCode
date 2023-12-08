# Write your MySQL query statement below
#select distinct w1.id as id
#from weather w1 
#left join (select id , recorddate , temperature from weather  ) as w2 
#on w1.recorddate = date_add(w2.recorddate,interval 1 day)
#where w1.temperature > w2.temperature 

SELECT  t1.id
        # , t1.recordDate
        # , t1.recordDate_prev
        # , DATEDIFF(t1.recordDate, t1.recordDate_prev)
        # , t1.temperature
         #, t1.temperature_prev
        # , t1.temperature - t1.temperature_prev
FROM    (SELECT id
                , recordDate
                , LAG(recordDate, 1) OVER
                    (
                        ORDER BY recordDate
                    ) recordDate_prev
                , temperature
                , LAG(temperature, 1) OVER  
                    (
                        ORDER BY recordDate
                    ) temperature_prev
        FROM    weather) t1
WHERE   timestampDIFF(day,t1.recordDate, t1.recordDate_prev) = -1
    AND t1.temperature > t1.temperature_prev
ORDER BY    t1.id

# SELECT id
#                 , recordDate
#                 , LAG(recordDate, 1) OVER
#                     (
#                         ORDER BY recordDate
#                     ) recordDate_prev
#                 , temperature
#                 , LAG(temperature, 1) OVER  
#                     (
#                         ORDER BY recordDate
#                     ) temperature_prev
#         FROM    weather