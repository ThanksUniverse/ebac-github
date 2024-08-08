CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Price NUMERIC(10, 2)
);

CREATE TABLE Stock (
    StockID SERIAL PRIMARY KEY,
    ProductID INT REFERENCES Product(ProductID),
    Quantity INT
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    ProductID INT REFERENCES Product(ProductID),
    OrderDate DATE,
    Quantity INT
);

INSERT INTO Customer (Name, Email) VALUES
('Lucas Silva', 'lucas.silva@email.com'),
('Gabriel Souza', 'gabriel.souza@email.com'),
('Ana Oliveira', 'ana.oliveira@email.com'),
('Juliana Pereira', 'juliana.pereira@email.com'),
('Matheus Costa', 'matheus.costa@email.com');

INSERT INTO Product (Name, Price) VALUES
('Arroz 5kg', 25.00),
('Feijão 1kg', 8.00),
('Óleo de Soja 1L', 7.00),
('Açúcar 2kg', 5.00),
('Café 500g', 12.00);

INSERT INTO Stock (ProductID, Quantity) VALUES
(1, 150),  
(2, 100), 
(3, 80),   
(4, 120), 
(5, 90);  

INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, '2024-08-06', 2), 
(2, 3, '2024-08-06', 5),  
(3, 5, '2024-08-07', 1),  
(4, 2, '2024-08-07', 3), 
(5, 4, '2024-08-07', 4); 

SELECT c.Name AS CustomerName, p.Name AS ProductName, o.Quantity, o.OrderDate
FROM Orders o
INNER JOIN Customer c ON o.CustomerID = c.CustomerID
INNER JOIN Product p ON o.ProductID = p.ProductID;
