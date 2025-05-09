CREATE DATABASE IF NOT EXISTS LittleLemon;
USE LittleLemon;

CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    BookingDate DATE NOT NULL,
    BookingTime TIME NOT NULL,
    TableNumber INT NOT NULL,
    Guests INT NOT NULL
);

CREATE TABLE MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Price DECIMAL(5,2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    MenuItemID INT,
    Quantity INT NOT NULL,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);
