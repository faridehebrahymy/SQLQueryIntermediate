-- Query 1:

--Write a SQL query to fetch all the duplicate records from a table.

--Tables Structure:

drop table users;
create table users
(
user_id int primary key,
user_name varchar(30) not null,
email varchar(50));

insert into users values
(1, 'Sumit', 'sumit@gmail.com'),
(2, 'Reshma', 'reshma@gmail.com'),
(3, 'Farhana', 'farhana@gmail.com'),
(4, 'Robin', 'robin@gmail.com'),
(5, 'Robin', 'robin@gmail.com');

SELECT * FROM users ;
-- Solution 1:
SELECT user_id,user_name, email
FROM( 
	SELECT *,
	ROW_NUMBER() OVER (PARTITION BY user_name ORDER BY user_id) AS rn
	FROM users
	) AS X
WHERE X.rn>1
;