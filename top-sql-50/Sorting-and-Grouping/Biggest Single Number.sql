-- Table: MyNumbers

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key for this table in SQL).
-- Each row of this table contains an integer.
 

-- A single number is a number that appeared only once in the MyNumbers table.

-- Find the largest single number. If there is no single number, report null.

SELECT
    max(Num) as num
FROM
    (SELECT
        Num
    FROM
        MyNumbers
    GROUP BY
        Num
    HAVING
        COUNT(num)=1) m;