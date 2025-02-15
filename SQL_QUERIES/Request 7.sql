-- Request Seven
--  Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month.
-- This analysis helps to  get an idea of low and high-performing months and take strategic decisions
-- Query 7

select date_format(date, '%b') as month, g.fiscal_year as year, round(sum(gross_price*sold_quantity)/1000000,2) as gross_sales_amount from fact_gross_price g
join fact_sales_monthly s
on g.product_code = s.product_code
where g.fiscal_year = 2021
group by month,g.fiscal_year;

select date_format(date, '%b') as month, g.fiscal_year as year, round(sum(gross_price*sold_quantity)/1000000,2) as gross_sales_amount from fact_gross_price g
join fact_sales_monthly s
on g.product_code = s.product_code
where g.fiscal_year = 2021
group by month,s.fiscal_year;