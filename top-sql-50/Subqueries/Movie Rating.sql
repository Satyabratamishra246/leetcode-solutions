-- Table: Movies

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key (column with unique values) for this table.
-- title is the name of the movie.
 

-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key (column with unique values) for this table.
 

-- Table: MovieRating

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key (column with unique values) for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date. 
 

-- Write a solution to:

-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.



/* Write your T-SQL query statement below */

SELECT 
    a.results
FROM
    (SELECT TOP 1 u.name AS results
    FROM MovieRating m
    INNER JOIN Users u ON m.user_id = u.user_id
    GROUP BY m.user_id, u.name
    ORDER BY COUNT(m.user_id) DESC, u.name) a
UNION ALL
SELECT results
FROM
    (SELECT TOP 1 m2.title AS results
    FROM MovieRating m1
    INNER JOIN Movies m2 ON m1.movie_id = m2.movie_id
    WHERE YEAR(m1.created_at) = 2020 AND MONTH(m1.created_at) = 2
    GROUP BY m1.movie_id, m2.title
    ORDER BY AVG(CAST(m1.rating AS DECIMAL)) DESC, m2.title) b;


