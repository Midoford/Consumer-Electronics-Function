-- Request Nine
--  Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution
-- Query 9
with cte1 as(
SELECT channel, round(sum(gross_price*sold_quantity)/1000000,2) as gross_sales_mln FROM dim_customer d
join fact_sales_monthly s 
on d.customer_code = s.customer_code
join fact_gross_price g
on s.product_code = g.product_code
where s.fiscal_year = 2021
group by channel
order by gross_sales_mln
),
cte2 as(
select round(sum(gross_price*sold_quantity)/1000000,2) as yet from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code
where s.fiscal_year = 2021
)

select 
*,
round((gross_sales_mln/(select round(sum(gross_price*sold_quantity)/1000000,2) as yet from fact_sales_monthly s
join fact_gross_price g
on s.product_code = g.product_code
where s.fiscal_year = 2021))*100,2) as Percentage 
from cte1;