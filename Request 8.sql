-- Request Eight
--  In which quarter of 2020, got the maximum total_sold_quantity.
-- Query 8

select 
case
when month(date) in (9,10,11) then "Q1"
when month(date) in (12,1,2) then "Q2"
when month(date) in (3,4,5) then "Q3"
else "Q4"
end as Quarters_Mln,
round(sum(sold_quantity),2) as Total_sold_quantity from fact_sales_monthly
group by Quarters_Mln;
