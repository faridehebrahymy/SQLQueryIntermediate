
--From the weather table, fetch all the records when London had extremely cold temperature for 3 consecutive days or more.

--Note: Weather is considered to be extremely cold then its temperature is less than zero.

--Table Structure:

drop table weather;
create table weather
(
id int,
city varchar(50),
temperature int,
day date
);
delete from weather;
insert into weather values
(1, 'London', -1, CONVERT(DATETIME, '2021-01-01')),
(2, 'London', -2, CONVERT(DATETIME, '2021-01-02')),
(3, 'London', 4, CONVERT(DATETIME, '2021-01-03')),
(4, 'London', 1, CONVERT(DATETIME, '2021-01-04')),
(5, 'London', -2, CONVERT(DATETIME, '2021-01-05')),
(6, 'London', -5, CONVERT(DATETIME, '2021-01-06')),
(7, 'London', -7,CONVERT(DATETIME, '2021-01-07')),
(8, 'London', 5, CONVERT(DATETIME, '2021-01-08'));
SELECT Id,city , temperature, day
FROM (
	select * ,
	CASE WHEN temperature < 0 
		  AND LEAD(temperature) OVER (ORDER BY id ) < 0
		  AND LEAD(temperature,2) OVER (ORDER BY id ) < 0
		THEN 'YES'
		WHEN temperature < 0 
		  AND LAG(temperature) OVER (ORDER BY id ) < 0
		  AND LEAD(temperature) OVER (ORDER BY id ) < 0
		THEN 'YES'
		WHEN temperature < 0 
		  AND LAG(temperature) OVER (ORDER BY id ) < 0
		  AND LAG(temperature,2) OVER (ORDER BY id ) < 0
		THEN 'YES'
		ELSE NULL
	END Flag 
    from weather ) X
WHERE X.flag = 'YES'
	;