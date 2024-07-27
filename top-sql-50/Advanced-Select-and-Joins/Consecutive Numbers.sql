-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.
 

-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.

SELECT 
    a.num as ConsecutiveNums
FROM 
    Logs a
JOIN
    Logs b
    ON a.id+1 = b.id
    AND a.num = b.num
JOIN
    Logs c
    ON b.id+1 = c.id
    AND b.num = c.num
GROUP BY a.num;


