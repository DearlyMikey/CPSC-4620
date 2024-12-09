# Michael Gonzales
DELIMITER //

CREATE PROCEDURE apply_order_discount_proc (
    IN p_OrderID INT
)
BEGIN
    DECLARE totalDiscountPercentage DECIMAL(10, 2);

    SELECT SUM(d.discount_Amount) / 100
    INTO totalDiscountPercentage
    FROM discount d
    JOIN order_discount od ON d.discount_DiscountID = od.discount_DiscountID
    WHERE od.ordertable_OrderID = p_OrderID
      AND d.discount_IsPercent = 1
    GROUP BY od.ordertable_OrderID;

    UPDATE ordertable
    SET ordertable_CustPrice = ordertable_CustPrice * (1 - COALESCE(totalDiscountPercentage, 0))
    WHERE ordertable_OrderID = p_OrderID;
END;
//

DELIMITER ;
