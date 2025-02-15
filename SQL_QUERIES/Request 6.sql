-- Request Six
-- Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the Indian  market.
-- Query 6
SELECT p.customer_code, c.customer, avg(pre_invoice_discount_pct) as average_discount_percentage from fact_pre_invoice_deductions p
join dim_customer c
on p.customer_code = c.customer_code
where fiscal_year = 2021 and market = "india"
group by p.customer_code,c.customer
order by average_discount_percentage desc
limit 5;