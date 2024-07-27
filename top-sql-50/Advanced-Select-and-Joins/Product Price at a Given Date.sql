-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.


WITH product_price AS (
    SELECT
        p1.product_id,
        p1.new_price AS price
    FROM
        Products p1
    INNER JOIN (
        SELECT
            product_id,
            MAX(change_date) AS change_date
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
        GROUP BY
            product_id
    ) p2
    ON p1.product_id = p2.product_id
    AND p1.change_date = p2.change_date
),
unique_products AS (
    SELECT DISTINCT
        product_id AS u_products
    FROM
        Products
)

SELECT
    up.u_products AS product_id,
    ISNULL(pp.price, 10) AS price
FROM
    unique_products up
LEFT JOIN
    product_price pp
ON
    up.u_products = pp.product_id;
