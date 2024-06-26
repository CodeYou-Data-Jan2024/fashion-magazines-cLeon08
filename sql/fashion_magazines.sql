SELECT 
    c.customer_name as 'Customer', 
    PRINTF('$%.2f',SUM(s.price_per_month * s.subscription_length)) AS 'Amount Due'
FROM 
    orders o
INNER JOIN 
    customers c ON o.customer_id = c.customer_id
INNER JOIN 
    subscriptions s ON o.subscription_id = s.subscription_id
WHERE 
    o.order_status = 'unpaid' AND s.description = 'Fashion Magazine'
GROUP BY 
    c.customer_name;