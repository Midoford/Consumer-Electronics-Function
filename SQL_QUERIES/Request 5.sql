-- Request Five
-- Get the products that have the highest and lowest manufacturing costs.
-- Query 5

WITH HighestCost AS (
    SELECT 
        m.product_code, 
        d.product, 
        manufacturing_cost
    FROM 
        fact_manufacturing_cost m
	join dim_product d
    on m.product_code = d.product_code
    WHERE 
        manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
),
LowestCost AS (
    SELECT 
        m.product_code, 
        d.product, 
        manufacturing_cost
    FROM 
        fact_manufacturing_cost m
        join dim_product d
    on m.product_code = d.product_code
    WHERE 
        manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost)
)

SELECT * FROM HighestCost
UNION ALL
SELECT * FROM LowestCost;