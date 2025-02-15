-- Request Three
--  Provide a report with all the unique product counts for each  segment  and sort them in descending order of product counts. The final output contains 2 fields
-- Query 3
SELECT Segment, count( distinct product_code) as Product_count FROM dim_product
group by segment
order by Product_count desc;