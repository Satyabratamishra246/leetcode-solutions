-- Table Activities:

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | sell_date   | date    |
-- | product     | varchar |
-- +-------------+---------+
-- There is no primary key (column with unique values) for this table. It may contain duplicates.
-- Each row of this table contains the product name and the date it was sold in a market.
 

-- Write a solution to find for each date the number of different products sold and their names.

-- The sold products names for each date should be sorted lexicographically.

-- Return the result table ordered by sell_date.

WITH DistinctProducts AS (
    SELECT
        sell_date,
        product
    FROM
        Activities
    GROUP BY
        sell_date,
        product
)
SELECT 
    sell_date,
    COUNT(product) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM 
    DistinctProducts
GROUP BY 
    sell_date;
