-- SQL Advent Calendar - Day 19
-- Title: Gift Wrap Paper Usage
-- Difficulty: easy
--
-- Question:
-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?
--
-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?
--

-- Table Schema:
-- Table: holiday_orders
--   order_id: INT
--   customer_name: VARCHAR
--   gift_wrap: BOOLEAN
--   paper_used_meters: DECIMAL
--   delivery_status: VARCHAR
--   order_date: DATE
--

-- My Solution:

SELECT COALESCE(SUM(paper_used_meters), 0) AS total_wrapping_paper
FROM holiday_orders
WHERE (
  gift_wrap = 1 OR gift_wrap = TRUE OR LOWER(CAST(gift_wrap AS TEXT)) IN ('true','t','yes','y','1')
)
AND LOWER(TRIM(delivery_status)) = 'delivered';
