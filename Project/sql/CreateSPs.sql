# Michael Gonzales
DELIMITER //

CREATE TRIGGER apply_order_discount
AFTER INSERT ON order_discount
FOR EACH ROW
BEGIN
    DECLARE totalDiscountPercentage DECIMAL(10, 2);

    SELECT SUM(d.discount_Amount) / 100
    INTO totalDiscountPercentage
    FROM discount d
    JOIN order_discount od ON d.discount_DiscountID = od.discount_DiscountID
    WHERE od.ordertable_OrderID = NEW.ordertable_OrderID
      AND d.discount_IsPercent = 1
    GROUP BY od.ordertable_OrderID;

    UPDATE ordertable
    SET ordertable_CustPrice = ordertable_CustPrice * (1 - totalDiscountPercentage)
    WHERE ordertable_OrderID = NEW.ordertable_OrderID;
END;
//

DELIMITER ;
