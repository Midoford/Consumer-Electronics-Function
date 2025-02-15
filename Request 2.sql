-- Request Two
-- What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
-- Query 2
with CTE1 as(
SELECT count( distinct product_code) as u_p_2020 FROM fact_sales_monthly
where fiscal_year = 2020),

CTE2 as (
SELECT count( distinct product_code) as u_p_2021 FROM fact_sales_monthly
where fiscal_year = 2021)

select 
u_p_2020 as unique_product_2020, 
u_p_2021 as unique_product_2021,
round(((u_p_2021-u_p_2020)/u_p_2020)*100,2) as Percentage_Chg from CTE1,CTE2;