CREATE DATABASE LibraryDB;
CREATE SCHEMA Sales;
CREATE SCHEMA Library;
CREATE TABLE Library.Book(
     book_id serial PRIMARY KEY,
     title VARCHAR(100) NOT NULL,
     author VARCHAR(50) NOT NULL,
     published_year INTEGER,
     available boolean default TRUE
);

CREATE TABLE Library.Member
(
    member_id INTEGER PRIMARY KEY,
    name      VARCHAR(50) NOT NULL,
    email     VARCHAR(30) NOT NULL UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);
CREATE TABLE Sales.Products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price numeric(10,2),
    stock_quantity INTEGER
);

CREATE TABLE Sales.Orders(
    order_id   SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    member_id  SERIAL NOT NULL,
    CONSTRAINT fk_order_member_id FOREIGN KEY (member_id) REFERENCES Library.Member(member_id)
);

CREATE TABLE Sales.OrderDetails(
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    CONSTRAINT fk_od_order FOREIGN KEY (order_id) REFERENCES Sales.Orders(order_id),
    CONSTRAINT fk_od_product FOREIGN KEY (product_id) REFERENCES Sales.Products(product_id)
);

/*dfdsfsfsfsdfsfsfsfsfsdfsdfsdfsdfsfds*/