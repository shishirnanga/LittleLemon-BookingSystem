DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END;
//
DELIMITER ;

-- ManageBooking procedure
DELIMITER //

CREATE PROCEDURE ManageBooking(IN cust_name VARCHAR(100), IN book_date DATE, IN book_time TIME, IN table_num INT, IN guests INT)
BEGIN
    DECLARE count_existing INT;
    SELECT COUNT(*) INTO count_existing
    FROM Bookings
    WHERE TableNumber = table_num AND BookingDate = book_date AND BookingTime = book_time;

    IF count_existing = 0 THEN
        INSERT INTO Bookings (CustomerName, BookingDate, BookingTime, TableNumber, Guests)
        VALUES (cust_name, book_date, book_time, table_num, guests);
        SELECT 'Booking successful.' AS Message;
    ELSE
        SELECT 'Table already booked.' AS Message;
    END IF;
END //

DELIMITER ;

-- UpdateBooking procedure
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN new_date DATE, IN new_time TIME)
BEGIN
    UPDATE Bookings
    SET BookingDate = new_date, BookingTime = new_time
    WHERE BookingID = booking_id;
END;
//
DELIMITER ;

-- AddBooking procedure
DELIMITER //
CREATE PROCEDURE AddBooking(IN cust_name VARCHAR(100), IN book_date DATE, IN book_time TIME, IN table_num INT, IN guests INT)
BEGIN
    INSERT INTO Bookings (CustomerName, BookingDate, BookingTime, TableNumber, Guests)
    VALUES (cust_name, book_date, book_time, table_num, guests);
END;
//
DELIMITER ;

-- CancelBooking procedure
DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Bookings WHERE BookingID = booking_id;
END;
//
DELIMITER ;
