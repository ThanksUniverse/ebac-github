SELECT 
    p.Name AS product_name,
    SUM(s.Quantity) AS product_stock
FROM 
    Product p
INNER JOIN 
    Stock s ON p.ProductID = s.ProductID
GROUP BY 
    p.Name
ORDER BY 
    product_stock DESC;

SELECT 
	SUM(s.quantity) as SumStock
FROM 
    Stock s
