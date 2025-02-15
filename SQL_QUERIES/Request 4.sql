-- Request Four
-- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020?
-- Query 4
with cte1 as(
select segment, count( distinct d.product_code) as P_2020 from dim_product d
join fact_sales_monthly s 
on d.product_code = s.product_code
where s.fiscal_year = 2020
group by segment
),

cte2 as(
select segment, count( distinct d.product_code) as P_2021 from dim_product d
join fact_sales_monthly s 
on d.product_code = s.product_code
where s.fiscal_year = 2021
group by segment)

select c2.segment, c1.P_2020 as product_count_2020, c2.P_2021 as product_count_2021, (c2.P_2021 - c1.P_2020) as difference from cte1 c1
join cte2 c2
on c1.segment = c2.segment;