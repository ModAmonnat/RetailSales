SELECT
  P.user_rating_stars,
	COUNT(O.Order_ID) AS TotalOrders,
	SUM(O.Order_Amount) AS TotalRevenue
From Orders O
INNER JOIN products AS P
	ON O.Item_Number = P.product_id
GROUP BY P.user_rating_stars
ORDER BY TotalRevenue DESC; 
