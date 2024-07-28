-- Table: Customer

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- | visited_on    | date    |
-- | amount        | int     |
-- +---------------+---------+
-- In SQL,(customer_id, visited_on) is the primary key for this table.
-- This table contains data about customer transactions in a restaurant.
-- visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
-- amount is the total paid by a customer.
 

-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

-- Return the result table ordered by visited_on in ascending order.

SELECT
    Visited_on,
    amount,
    ROUND(RunningAverage, 2) AS average_amount
FROM (
    SELECT
        Visited_on,
        Daily_Amount,
        AVG(CAST(Daily_Amount AS FLOAT)) OVER(ORDER BY Visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS RunningAverage,
        SUM(CAST(Daily_Amount AS FLOAT)) OVER(ORDER BY Visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        RANK() OVER(ORDER BY Visited_on) AS Rnk
    FROM (
        SELECT
            Visited_on,
            SUM(amount) AS Daily_Amount
        FROM
            Customer
        GROUP BY
            Visited_on
    ) AS DailyTotal
) AS RunningAverage
WHERE
    Rnk > 6
ORDER BY
    Visited_on;


