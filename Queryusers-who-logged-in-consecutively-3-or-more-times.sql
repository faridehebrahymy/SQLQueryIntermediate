--From the login_details table, fetch the users who logged in consecutively 3 or more times.

--Table Structure:

drop table login_details;
create table login_details(
login_id int primary key,
user_name varchar(50) not null,
login_date date);

delete from login_details;
insert into login_details values
(101, 'Michael', GETDATE()),
(102, 'James', GETDATE()),
(103, 'Stewart', GETDATE()+1),
(104, 'Stewart', GETDATE()+1),
(105, 'Stewart', GETDATE()+1),
(106, 'Michael', GETDATE()+2),
(107, 'Michael', GETDATE()+2),
(108, 'Stewart', GETDATE()+3),
(109, 'Stewart', GETDATE()+3),
(110, 'James', GETDATE()+4),
(111, 'James', GETDATE()+4),
(112, 'James', GETDATE()+5),
(113, 'James', GETDATE()+6);

select * from login_details;

--Solution:
SELECT DISTINCT Repeated_Users
FROM
	(select * 
	,case when user_name =LEAD(user_name) OVER (ORDER BY login_id)
			  AND user_name=LEAD(user_name,2)  OVER (ORDER BY login_id)
		  THEN user_name
		  ELSE NULL
		  END AS Repeated_Users
	from login_details) x
WHERE Repeated_Users IS NOT NULL ;
