DROP SCHEMA  IF EXISTS PizzaCo;
CREATE SCHEMA PizzaCo;
USE PizzaCo;

DROP USER IF EXISTS 'dbtester';
CREATE USER 'dbtester' IDENTIFIED BY 'CPSC4620';
GRANT ALL ON PizzaCo.* TO 'dbtester';

CREATE TABLE pizza (
    pizza_PizzaID INT primary key,
    pizza_Size VARCHAR(30),
    pizza_CrustType VARCHAR(30),
    pizza_PizzaState VARCHAR(30),
    pizza_PizzaDate DATETIME,
    pizza_CustPrice DECIMAL(5,2),
    pizza_BusPrice DECIMAL(5,2),
    ordertable_OrderID INT,
    FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID)
);

CREATE TABLE ordertable (
    ordertable_OrderID INT primary key,
    customer_CustID INT,
    ordertable_OrderType VARCHAR(30),
    ordertable_OrderDateTime DATETIME,
    ordertable_CustPrice DECIMAL(5,2),
    ordertable_BusPrice DECIMAL(5,2),
    ordertable_isComplete BOOLEAN
);

CREATE TABLE baseprice (
    baseprice_Size VARCHAR(30) PRIMARY KEY,
    baseprice_CrustType VARCHAR(30) PRIMARY KEY,
    baseprice_CustPrice DECIMAL(5,2),
    baseprice_BusPrice DECIMAL(5,2)
);

CREATE TABLE customer (
    customer_CustID INT primary key,
    customer_FName VARCHAR(30),
    customer_LName VARCHAR(30),
    customer_PhoneNum VARCHAR(30)
);

CREATE TABLE delivery (
    ordertable_OrderID INT PRIMARY KEY,
    delivery_HouseNum INT,
    delivery_Street VARCHAR(30),
    delivery_City VARCHAR(30),
    delivery_State VARCHAR(2),
    delivery_Zip INT,
    delivery_IsDelivered BOOLEAN,
    FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID)
);

CREATE TABLE topping (
    topping_TopID INT PRIMARY KEY,
    topping_TopName VARCHAR(30),
    topping_SmallAMT DECIMAL(5,2),
    topping_MedAMT DECIMAL(5,2),
    topping_LgAMT DECIMAL(5,2),
    topping_XLAMT DECIMAL(5,2),
    topping_CustPrice DECIMAL(5,2),
    topping_BusPrice DECIMAL(5,2),
    topping_MinINVT INT,
    topping_CurINVT INT
);

CREATE TABLE discount (
    discount_DiscountID INT PRIMARY KEY,
    discount_DiscountName VARCHAR(30),
    discount_Amount DECIMAL(5,2),
    discount_IsPercent BOOLEAN
);

CREATE TABLE pickup (
    ordertable_OrderID INT,
    pickup_IsPickedUp BOOLEAN,
    FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID)
);

CREATE TABLE dineine (
    ordertable_OrderID INT PRIMARY KEY,
    dinein_TableNum INT,
    FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID)
);

CREATE TABLE pizza_topping (
    pizza_PizzaID INT,
    topping_TopID INT,
    PRIMARY KEY (pizza_PizzaID, topping_TopID),
    FOREIGN KEY (pizza_PizzaID) REFERENCES pizza(pizza_PizzaID),
    FOREIGN KEY (topping_TopID) REFERENCES topping(topping_TopID)
);

CREATE TABLE pizza_discount (
    pizza_PizzaID INT,
    discount_DiscountID INT,
    PRIMARY KEY (pizza_PizzaID, discount_DiscountID),
    FOREIGN KEY (pizza_PizzaID) REFERENCES pizza(pizza_PizzaID),
    FOREIGN KEY (discount_DiscountID) REFERENCES discount(discount_DiscountID)
);

CREATE TABLE order_discount (
    ordertable_OrderID INT,
    discount_DiscountID INT,
    PRIMARY KEY (ordertable_OrderID, discount_DiscountID),
    FOREIGN KEY (ordertable_OrderID) REFERENCES ordertable(ordertable_OrderID),
    FOREIGN KEY (discount_DiscountID) REFERENCES discount(discount_DiscountID)
);

