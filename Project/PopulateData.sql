# Michael Gonzales

INSERT INTO topping (topping_TopName, topping_CustPrice, topping_BusPrice, topping_CurINVT, topping_MinINVT, topping_SmallAMT, topping_MedAMT, topping_LgAMT, topping_XLAMT)
VALUES
('Pepperoni', 1.25, 0.2, 100, 50, 2, 2.75, 3.5, 4.5),
('Sausage', 1.25, 0.15, 100, 50, 2.5, 3, 3.5, 4.25),
('Ham', 1.5, 0.15, 78, 25, 2, 2.5, 3.25, 4),
('Chicken', 1.75, 0.25, 56, 25, 1.5, 2, 2.25, 3),
('Green Pepper', 0.5, 0.02, 79, 25, 1, 1.5, 2, 2.5),
('Onion', 0.5, 0.02, 85, 25, 1, 1.5, 2, 2.75),
('Roma Tomato', 0.75, 0.03, 86, 10, 2, 3, 3.5, 4.5),
('Mushrooms', 0.75, 0.1, 52, 50, 1.5, 2, 2.5, 3),
('Black Olives', 0.6, 0.1, 39, 25, 0.75, 1, 1.5, 2),
('Pineapple', 1, 0.25, 15, 0, 1, 1.25, 1.75, 2),
('Jalapenos', 0.5, 0.05, 64, 0, 0.5, 0.75, 1.25, 1.75),
('Banana Peppers', 0.5, 0.05, 36, 0, 0.6, 1, 1.3, 1.75),
('Regular Cheese', 0.5, 0.12, 250, 50, 2, 3.5, 5, 7),
('Four Cheese Blend', 1, 0.15, 150, 25, 2, 3.5, 5, 7),
('Feta Cheese', 1.5, 0.18, 75, 0, 1.75, 3, 4, 5.5),
('Goat Cheese', 1.5, 0.2, 54, 0, 1.6, 2.75, 4, 5.5),
('Bacon', 1.5, 0.25, 89, 0, 1, 1.5, 2, 3);

INSERT INTO  discount (discount_DiscountName, discount_Amount, discount_IsPercent)
VALUES ('Employee', '15', true),
       ('Lunch Special Medium', '1.00', false),
       ('Lunch Special Large', '2.00', false),
       ('Specialty Pizza', '1.50', false),
       ('Happy Hour', '10', true),
       ('Gameday Special', '20', true);

INSERT INTO baseprice (baseprice_Size, baseprice_CrustType, baseprice_CustPrice, baseprice_BusPrice)
VALUES
('Small', 'Thin', 3, 0.5),
('Small', 'Original', 3, 0.75),
('Small', 'Pan', 3.5, 1),
('Small', 'Gluten-Free', 4, 2),
('Medium', 'Thin', 5, 1),
('Medium', 'Original', 5, 1.5),
('Medium', 'Pan', 6, 2.25),
('Medium', 'Gluten-Free', 6.25, 3),
('Large', 'Thin', 8, 1.25),
('Large', 'Original', 8, 2),
('Large', 'Pan', 9, 3),
('Large', 'Gluten-Free', 9.5, 4),
('XLarge', 'Thin', 10, 2),
('XLarge', 'Original', 10, 3),
('XLarge', 'Pan', 11.5, 4.5),
('XLarge', 'Gluten-Free', 12.5, 6);

# Order 1
INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (NULL, 'dinein', '2024-03-05 12:03:00', 19.75, 3.68, true);

SET @OrderID1 = LAST_INSERT_ID();

INSERT INTO dinein (ordertable_OrderID, dinein_TableNum)
VALUES (@OrderID1, 21);

INSERT INTO pizza (ordertable_OrderID, pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice)
VALUES (@OrderID1, 'Large', 'Thin', 'Completed', '2024-03-05 12:03:00', 19.75, 3.68);
SET @PizzaID1 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble) VALUES
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'), 1),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Sausage'),0);

INSERT INTO pizza_discount (pizza_PizzaID, discount_DiscountID)
VALUES (@PizzaID1, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Lunch Special Large'));

# Order 2
INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (NULL, 'dinein', '2024-04-03 12:05:00', 19.78, 4.63, 1);

SET @OrderID = LAST_INSERT_ID();

INSERT INTO dinein (ordertable_OrderID, dinein_TableNum)
VALUES (@OrderID, 4);


INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Medium', 'Pan', 'Completed', '2024-04-03 12:05:00', 12.85, 3.23, @OrderID);
SET @PizzaID1 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Feta Cheese'), 0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Black Olives'), 0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Roma Tomato'), 0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Mushrooms'), 0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Banana Peppers'), 0);

INSERT INTO pizza_discount (pizza_PizzaID, discount_DiscountID)
VALUES
(@PizzaID1, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Lunch Special Medium')),
(@PizzaID1, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Specialty Pizza'));

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Small', 'Original', 'Completed', '2024-04-03 12:05:00', 6.93, 1.40, @OrderID);
SET @PizzaID2 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'), 0),
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Chicken'), 0),
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Banana Peppers'), 0);

# Order 3
INSERT INTO customer (customer_FName, customer_LName, customer_PhoneNum)
VALUES ('Andrew', 'Wilkes-Krier', '8642545861');

SET @CustID = LAST_INSERT_ID();

INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (@CustID, 'pickup', '2024-03-03 21:30:00', 89.28, 19.80, 1);

SET @OrderID = LAST_INSERT_ID();

INSERT INTO pickup (ordertable_OrderID, pickup_IsPickedUp)
VALUES (@OrderID, 1);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Original', 'Completed', '2024-03-03 21:30:00', 14.88, 3.30, @OrderID);
SET @PizzaID1 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'),0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Original', 'Completed', '2024-03-03 21:30:00', 14.88, 3.30, @OrderID);
SET @PizzaID2 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'),0),
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Original', 'Completed', '2024-03-03 21:30:00', 14.88, 3.30, @OrderID);
SET @PizzaID3 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID3, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'),0),
(@PizzaID3, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Original', 'Completed', '2024-03-03 21:30:00', 14.88, 3.30, @OrderID);
SET @PizzaID4 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID4, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'),0),
(@PizzaID4, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Original', 'Completed', '2024-03-03 21:30:00', 14.88, 3.30, @OrderID);
SET @PizzaID5 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID5, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'),0),
(@PizzaID5, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Original', 'Completed', '2024-03-03 21:30:00', 14.88, 3.30, @OrderID);
SET @PizzaID6 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID6, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'),0),
(@PizzaID6, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0);

# Order 4
SET @CustID = (SELECT customer_CustID FROM customer WHERE customer_FName = 'Andrew' AND customer_LName = 'Wilkes-Krier' AND customer_PhoneNum = '8642545861');

INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (@CustID, 'delivery', '2024-04-20 19:11:00', 86.19, 23.62, 1);

SET @OrderID = LAST_INSERT_ID();

INSERT INTO delivery (ordertable_OrderID, delivery_HouseNum, delivery_Street, delivery_City, delivery_State, delivery_Zip, delivery_IsDelivered)
VALUES (@OrderID, 115, 'Party Blvd', 'Anderson', 'SC', 29621, 1);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('XLarge', 'Original', 'Completed', '2024-04-20 19:11:00', 27.94, 9.19, @OrderID);
SET @PizzaID1 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'),0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Sausage'),0),
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Four Cheese Blend'),0);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('XLarge', 'Original', 'Completed', '2024-04-20 19:11:00', 31.50, 6.25, @OrderID);
SET @PizzaID2 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Ham'),1),
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pineapple'),1),
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Four Cheese Blend'),0);
INSERT INTO pizza_discount (pizza_PizzaID, discount_DiscountID)
VALUES
(@PizzaID2, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Specialty Pizza'));

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('XLarge', 'Original', 'Completed', '2024-04-20 19:11:00', 26.75, 8.18, @OrderID);
SET @PizzaID3 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID3, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Chicken'),0),
(@PizzaID3, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Bacon'),0),
(@PizzaID3, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Four Cheese Blend'),0);

INSERT INTO order_discount (ordertable_OrderID, discount_DiscountID)
VALUES
(@OrderID, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Gameday Special'));

# Order 5
INSERT INTO customer (customer_FName, customer_LName, customer_PhoneNum)
VALUES ('Matt', 'Engers', '8644749953');

SET @CustID = LAST_INSERT_ID();

INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (@CustID, 'pickup', '2024-03-02 17:30:00', 27.45, 7.88, 1);

SET @OrderID = LAST_INSERT_ID();

INSERT INTO pickup (ordertable_OrderID, pickup_IsPickedUp)
VALUES (@OrderID, 1);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('XLarge', 'Gluten-Free', 'Completed', '2024-03-02 17:30:00', 27.45, 7.88, @OrderID);
SET @PizzaID = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Green Pepper'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Onion'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Roma Tomato'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Mushrooms'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Black Olives'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Goat Cheese'), 0);

INSERT INTO pizza_discount (pizza_PizzaID, discount_DiscountID)
VALUES
(@PizzaID, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Specialty Pizza'));

# Order 6
INSERT INTO customer (customer_FName, customer_LName, customer_PhoneNum)
VALUES ('Frank', 'Turner', '8642328944');

SET @CustID = LAST_INSERT_ID();

INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (@CustID, 'delivery', '2024-03-02 18:17:00', 25.81, 4.24, 1);

SET @OrderID = LAST_INSERT_ID();

INSERT INTO delivery (ordertable_OrderID, delivery_HouseNum, delivery_Street, delivery_City, delivery_State, delivery_Zip, delivery_IsDelivered)
VALUES (@OrderID, 6745, 'Wessex St', 'Anderson', 'SC', 29621, 1);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Thin', 'Completed', '2024-03-02 18:17:00', 25.81, 4.24, @OrderID);
SET @PizzaID = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Chicken'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Green Pepper'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Onion'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Mushrooms'), 0),
(@PizzaID, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Four Cheese Blend'), 1);

# Order 7
INSERT INTO customer (customer_FName, customer_LName, customer_PhoneNum)
VALUES ('Milo', 'Auckerman', '8648785679');

SET @CustID = LAST_INSERT_ID();

INSERT INTO ordertable (customer_CustID, ordertable_OrderType, ordertable_OrderDateTime, ordertable_CustPrice, ordertable_BusPrice, ordertable_isComplete)
VALUES (@CustID, 'delivery', '2024-04-13 20:32:00', 37.25, 6.00, 1);

SET @OrderID = LAST_INSERT_ID();

INSERT INTO delivery (ordertable_OrderID, delivery_HouseNum, delivery_Street, delivery_City, delivery_State, delivery_Zip, delivery_IsDelivered)
VALUES (@OrderID, 8879, 'Suburban', 'Anderson', 'SC', 29621, 1);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Thin', 'Completed', '2024-04-13 20:32:00', 18.00, 2.75, @OrderID);
SET @PizzaID1 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID1, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Four Cheese Blend'), 1);

INSERT INTO pizza (pizza_Size, pizza_CrustType, pizza_PizzaState, pizza_PizzaDate, pizza_CustPrice, pizza_BusPrice, ordertable_OrderID)
VALUES ('Large', 'Thin', 'Completed', '2024-04-13 20:32:00', 19.25, 3.25, @OrderID);
SET @PizzaID2 = LAST_INSERT_ID();
INSERT INTO pizza_topping (pizza_PizzaID, topping_TopID, pizza_topping_IsDouble)
VALUES
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Regular Cheese'), 0),
(@PizzaID2, (SELECT topping_TopID FROM topping WHERE topping_TopName = 'Pepperoni'), 1);

INSERT INTO order_discount (ordertable_OrderID, discount_DiscountID)
VALUES
(@OrderID, (SELECT discount_DiscountID FROM discount WHERE discount_DiscountName = 'Employee'));
