-- TABLE users
INSERT INTO users (user_name, email, age, income)
VALUES 
('Alice', 'alice@example.com', 28, 35000.00),
('Bob', 'bob@example.com', 34, 42000.00),
('Charlie', 'charlie@example.com', 22, 29000.00),
('Jack', 'jack@example.com', 30, 35000.00);

-- TABLE clients
INSERT INTO clients (client_name, town, active)
VALUES 
('Client A', 'Paris', TRUE),
('Client B', 'Nantes', TRUE),
('Client C', 'Annecy', FALSE),
('Client D', 'Aix-Les-Bains', TRUE);

-- TABLE products
INSERT INTO products (product_name, category, stock)
VALUES 
('Laptop', 'Informatique', 50),
('Smartphone', 'Téléphonie', 100),
('Imprimante', 'Informatique', 30),
('Casque', 'Audio', 75),
('Coque smartphone', 'Accessoires', 35);

-- TABLE orders
INSERT INTO orders (client_id, order_date, total)
VALUES 
(1, '2024-01-15', 1799.99),
(2, '2024-03-02', 899.90),
(1, '2025-04-22', 149.99),
(3, '2025-06-10', 99.00),
(4, '2025-07-08', 105.00);

-- TABLE products_orders
INSERT INTO products_orders (order_id, product_id, quantity, solo_price)
VALUES 
(1, 1, 1, 1799.99),  -- Laptop
(2, 2, 1, 899.90),   -- Smartphone
(3, 4, 2, 149.99),   -- Casque
(4, 3, 1, 99.00),    -- Imprimante
(5, 5, 3, 35.00);    -- Coque smartphone