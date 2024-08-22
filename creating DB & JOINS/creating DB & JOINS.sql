CREATE DATABASE IF NOT EXISTS ShopDB;
USE ShopDB;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);


CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerName, ContactName, Country) VALUES
('Alfreds Futterkiste', 'Maria Anders', 'Germany'),
('Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
('Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico');

INSERT INTO Orders (OrderDate, CustomerID) VALUES
('2024-08-01', 1),
('2024-08-02', 2),
('2024-08-03', 3);


SELECT Customers.CustomerID,Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

