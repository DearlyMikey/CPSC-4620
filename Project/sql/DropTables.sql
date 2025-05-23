# Michael Gonzales
DROP TABLE IF EXISTS order_discount;
DROP TABLE IF EXISTS pizza_discount;
DROP TABLE IF EXISTS pizza_topping;
DROP TABLE IF EXISTS dinein;
DROP TABLE IF EXISTS pickup;
DROP TABLE IF EXISTS discount;
DROP TABLE IF EXISTS topping;
DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS pizza;
DROP TABLE IF EXISTS baseprice;
DROP TABLE IF EXISTS ordertable;
DROP TABLE IF EXISTS customer;

DROP VIEW IF EXISTS ToppingPopularity;
DROP VIEW IF EXISTS ProfitByPizza;
DROP VIEW IF EXISTS profitbyordertype;

DROP PROCEDURE apply_order_discount_proc;