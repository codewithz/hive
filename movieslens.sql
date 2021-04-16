CREATE TABLE movies
(movieID int,title varchar(100),genres varchar(100))
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH
'movies.csv'
OVERWRITE INTO TABLE movies;

CREATE TABLE users
(userID int,
gender string,
age int,
occupation int,
zip int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH
'users.csv'
OVERWRITE INTO TABLE users;


CREATE TABLE ratings
(userID int,
movieID int,
rating int,
Timestampdata string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH
'ratings.csv'
OVERWRITE INTO TABLE ratings;

----------------------- JOIN QUERY ------------------------CREATE

Select m.movieID,m.title,COUNT(DISTINCT r.userID) as views 
FROM movies m JOIN ratings r 
ON (m.movieID=r.movieID)
GROUP BY m.movieID,m.title 
ORDER BY views DESC 
LIMIT 10;


