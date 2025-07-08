CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50),
    email VARCHAR(150) UNIQUE NOT NULL,
    age INT,
    income NUMERIC (10, 2),
    inscription_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    client_name VARCHAR(100),
    town VARCHAR(150),
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    stock INT
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(id),
    order_date DATE NOT NULL,
    total NUMERIC(10,2)
);

CREATE TABLE products_orders (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    solo_price NUMERIC(10,2),
    PRIMARY KEY (order_id, product_id)
);