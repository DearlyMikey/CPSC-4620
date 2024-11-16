# Michael Gonzales
CREATE VIEW ToppingPopularity AS
SELECT
    topping.topping_TopName AS 'Topping',
    COALESCE(
        SUM(
            CASE
                WHEN pizza_topping.topping_TopID IS NULL THEN 0
                WHEN pizza_topping.pizza_topping_IsDouble = 1 THEN 2
                ELSE 1
            END
        ), 0
    ) AS ToppingCount
FROM topping
    LEFT JOIN pizza_topping ON pizza_topping.topping_TopID = topping.topping_TopID
GROUP BY topping.topping_TopName
ORDER BY ToppingCount DESC, Topping ASC;

CREATE VIEW ProfitByPizza AS
SELECT
    pizza.pizza_Size as 'Size',
    pizza.pizza_CrustType as 'Crust',
    SUM(pizza.pizza_CustPrice - pizza.pizza_BusPrice) AS 'Profit',
    DATE_FORMAT(pizza.pizza_PizzaDate, '%c/%Y') AS OrderMonth
FROM pizza
GROUP BY OrderMonth, pizza.pizza_Size, pizza.pizza_CrustType
ORDER BY Profit ASC;

CREATE VIEW ProfitByOrderType AS
SELECT
    o.ordertable_OrderType AS customerType,
    DATE_FORMAT(o.ordertable_OrderDateTime, '%c/%Y') AS OrderMonth,
    SUM(o.ordertable_CustPrice) AS TotalOrderPrice,
    SUM(o.ordertable_BusPrice) AS TotalOrderCost,
    SUM(o.ordertable_CustPrice - o.ordertable_BusPrice) AS Profit
FROM ordertable o
GROUP BY customerType, OrderMonth

UNION ALL

SELECT
    '' AS customerType,
    'Grand Total' AS OrderMonth,
    SUM(o.ordertable_CustPrice) AS TotalOrderPrice,
    SUM(o.ordertable_BusPrice) AS TotalOrderCost,
    SUM(o.ordertable_CustPrice - o.ordertable_BusPrice) AS Profit
FROM ordertable o

ORDER BY
    FIELD(customerType, 'dinein', 'pickup', 'delivery', ''),
    Profit DESC;



