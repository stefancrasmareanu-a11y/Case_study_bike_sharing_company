SELECT
warehouse.warehouse_id,
warehouse.warehouse_alias,
warehouse.state,
subquery3.number_of_orders,
IF(subquery3.number_of_orders/subquery3.total_number_of_orders*100<=20, "0-20%", IF(subquery3.number_of_orders/subquery3.total_number_of_orders*100<=60,"20%-60%",">60%")) AS orders_percentage
FROM `thinking-case-479918-d3.Warehouse_orders.warehouse_table` AS warehouse
JOIN(
SELECT
warehouse.warehouse_id,
subquery1.number_of_orders,
(SELECT
SUM(number_of_orders) AS total_number_of_orders
FROM (
SELECT
subquery1.warehouse_id,
subquery1.number_of_orders,
FROM
(SELECT 
warehouse.warehouse_id as warehouse_id,
COUNT(DISTINCT(orders.order_id)) AS number_of_orders,
FROM `thinking-case-479918-d3.Warehouse_orders.warehouse_table` AS warehouse
JOIN  `thinking-case-479918-d3.Warehouse_orders.orders_table` AS orders
ON warehouse.warehouse_id=orders.warehouse_id
GROUP BY warehouse.warehouse_id) as subquery1)) AS total_number_of_orders
FROM `thinking-case-479918-d3.Warehouse_orders.warehouse_table` AS warehouse
JOIN (SELECT 
warehouse.warehouse_id as warehouse_id,
COUNT(DISTINCT(orders.order_id)) AS number_of_orders,
FROM `thinking-case-479918-d3.Warehouse_orders.warehouse_table` AS warehouse
JOIN  `thinking-case-479918-d3.Warehouse_orders.orders_table` AS orders
ON warehouse.warehouse_id=orders.warehouse_id
GROUP BY warehouse.warehouse_id) as subquery1
ON warehouse.warehouse_id=subquery1.warehouse_id) AS subquery3
ON warehouse.warehouse_id=subquery3.warehouse_id

 

