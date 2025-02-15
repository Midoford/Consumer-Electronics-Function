-- Request Ten
--   Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021
-- Query 10

with cte1 as(
select division,s.product_code,product, sum(sold_quantity) as total_sold_quantity from fact_sales_monthly s 
join dim_product d
on s.product_code = d.product_code
where s.fiscal_year = 2021
group by division,s.product_code,product
order by total_sold_quantity
),
cte2 as(
select *, dense_rank() over(partition by division order by total_sold_quantity desc) as rank_number from cte1
order by division 
)

select * from cte2
where rank_number <= 3