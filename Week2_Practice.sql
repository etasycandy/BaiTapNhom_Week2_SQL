﻿--Tạo Database
CREATE DATABASE Week2Practice;

--Xoá Database
--DROP DATABASE Week2Practice;

--Tạo bảng CUSTOMERS
CREATE TABLE CUSTOMERS(
    customerid INT PRIMARY KEY, 
    firstname VARCHAR(25),
    lastname VARCHAR(25),
    city CHAR(50),
    state CHAR(50)
);
--Xoá bảng CUSTOMERS
--DROP TABLE CUSTOMERS;

--Tạo bảng ITEMS_ORDERED
CREATE TABLE ITEMS_ORDERED(
    customerid INT, 
    order_date DATE,
    item VARCHAR(50),
    quantity INT,
    price DECIMAL(6,2),
    FOREIGN KEY (customerid) REFERENCES CUSTOMERS(customerid)
);

--Xoá bảng ITEMS_ORDERED
--DROP TABLE ITEMS_ORDERED;

--Thêm dữ liệu vào bảng CUSTOMERS
INSERT INTO CUSTOMERS (customerid, firstname, lastname, city, state) VALUES
(10101,'John','Gray','Lynden','Washington'),
(10298, 'Leroy', 'Brown', 'Pinetop', 'Arizona'),
(10299, 'Elroy', 'Keller', 'Snoqualmie', 'Washington'),
(10315, 'Lisa', 'Jones', 'Oshkosh', 'Wisconsin'),
(10325, 'Ginger', 'Schultz', 'Pocatello', 'Idaho'),
(10329, 'Kelly', 'Mendoza', 'Kailua', 'Hawaii'),
(10330, 'Shawn', 'Dalton', 'Cannon Beach', 'Oregon'),
(10338, 'Michael', 'Howell', 'Tillamook', 'Oregon'),
(10339, 'Anthony', 'Sanchez', 'Winslow', 'Arizona'),
(10408, 'Elroy', 'Cleaver', 'Globe', 'Arizona'),
(10410, 'Mary Ann', 'Howell', 'Charleston', 'South Carolina'),
(10413, 'Donald', 'Davids', 'Gila Bend', 'Arizona'),
(10419, 'Linda', 'Sakahara', 'Nogales', 'Arizona'),
(10429, 'Sarah', 'Graham', 'Greensboro', 'North Carolina'),
(10438, 'Kevin', 'Smith', 'Durango', 'Colorado'),
(10439, 'Conrad', 'Giles', 'Telluride', 'Colorado'),
(10449, 'Isabela', 'Moore', 'Yuma', 'Arizona');

--Thêm dữ liệu vào bảng ITEMS_ORDERED
INSERT INTO ITEMS_ORDERED (customerid, order_date, item, quantity, price) VALUES
(10330, '1999/06/30', 'Pogo stick', 1, 28.00),
(10101, '1999/06/30', 'Raft',1,58.00),
(10298, '1999/07/01', 'Skateboard', 1,33.00),
(10101, '1999/07/01', 'Life Vest', 4, 125.00),
(10299, '1999/07/06', 'Parachute', 1, 1250.00),
(10339, '1999/07/27', 'Umbrella', 1, 4.50),
(10449, '1999/08/13', 'Unicycle', 1, 180.79),
(10439, '1999/08/14', 'Ski Poles', 2, 25.50),
(10101, '1999/08/18', 'Rain Coat', 1, 18.30),
(10449, '1999/09/01', 'Snow Shoes', 1, 45.00),
(10439, '1999/09/18', 'Tent', 1, 88.00),
(10298, '1999/09/08', 'Lantern', 2, 29.00),
(10410, '1999/10/28', 'Sleeping Bag', 1, 89.22),
(10438, '1999/11/01', 'Umbrella', 1, 6.75),
(10438, '1999/11/02', 'Pillow', 1, 8.50),
(10298, '1999/12/01', 'Helmet', 1, 22.00),
(10449, '1999/12/15', 'Bicycle', 1, 380.50),
(10449, '1999/12/22', 'Canoe' , 1, 280.00),
(10101, '1999/12/30', 'Hoola Hoop' , 3, 14.75),
(10330, '2000/01/01', 'Flashlight' , 4, 28.00),
(10101, '2000/01/02', 'Lantern' , 1, 16.00),
(10299, '2000/01/18', 'Inflatable Mattress', 1, 38.00),
(10438, '2000/01/18', 'Tent' , 1, 79.99),
(10413, '2000/01/19', 'Lawnchair' , 4, 32.00),
(10410, '2000/01/30', 'Unicycle' , 1, 192.50),
(10315, '2000/02/2', 'Compass', 1, 8.00),
(10449, '2000/02/29', 'Flashlight' , 1, 4.50),
(10101, '2000/03/08', 'Sleeping Bag' , 2, 88.70),
(10298, '2000/03/18', 'Pocket Knife' , 1, 22.38),
(10449, '2000/03/19', 'Canoe paddle', 2, 40.00),
(10298, '2000/04/01', 'Ear Muffs', 1, 12.50),
(10330, '2000/04/19', 'Shovel', 1 , 16.75);


--Câu1:
SELECT customerid, item, price
--Lấy 3 biểu thức (customerid, item, price) 
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE customerid LIKE 10449;
--Thoả mãn điều kiện customerid = 10449

--Câu2:
SELECT * FROM ITEMS_ORDERED
--Lấy tất cả các biểu thức trong bảng ITEMS_ORDERED
WHERE item LIKE 'Tent';
--Thoả mãn điều kiện item là 'cái lều'

--Câu3:
SELECT customerid, order_date, item
--Lấy 3 biểu thức (customerid, order_date, item) 
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
WHERE item LIKE 'S%';
--Thoả mãn điều kiện item bắt đầu bằng chữ 'S'

--Câu4:
SELECT DISTINCT item
--Lấy ra các item không lặp lại
FROM ITEMS_ORDERED;
--Từ bảng ITEMS_ORDERED

--Câu5:
SELECT item, MAX(price) AS maxPrice
--Lấy ra item và giá lớn nhất của item đó
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY item;
--Nhóm lại theo từng item

--Câu6:
SELECT AVG(price) AS trungBinhPrice
--Lấy ra giá trị trung bình của price
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE order_date LIKE '%12%';
--Thoả mãn điều kiện order_date là tháng 12

--Câu7:
SELECT COUNT(*) AS totalNumberOfRows
--Lấy ra số hàng gán cho nó tên là totalNumberOfRows
FROM ITEMS_ORDERED;
--Từ bảng ITEMS_ORDERED

--Câu8:
SELECT item, MIN(price) AS minPrice
--Lấy ra item và giá nhỏ nhất của nó
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
WHERE item LIKE 'Tent'
--Thoả mãn điều kiện item đó là 'cái lều'
GROUP BY item;
--Nhóm lại theo từng item

--Câu9:
SELECT state, COUNT(*) AS amountOfPeople
--Lấy ra biểu thức state và đếm số lần xuất hiện
FROM CUSTOMERS
--Từ bảng CUSTOMERS
GROUP BY state;
--Nhóm lại theo từng state

--Câu10:
SELECT item, MAX(price) AS maxPrice, MIN(price) AS minPrice
--Lấy ra item, giá lớn nhất, giá nhỏ nhất của item đó
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED 
GROUP BY item;
--Nhóm lại theo từng item

--Câu11:
SELECT customerid, COUNT(*) AS numberOfOrders, SUM(price) AS sumPrice
--Lấy ra customerid, số lượng đơn hàng, tổng số tiền từ các đơn hàng
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY customerid;
--Nhóm lại theo từng customerid

--Câu12:
SELECT state, COUNT(customerid) AS amountOfPeople
--Lấy ra từng state và số lượng customerid tại state đó
FROM CUSTOMERS
--Từ bảng CUSTOMERS
GROUP BY state 
--Nhóm lại theo từng state 
HAVING COUNT(customerid) > 1;
--Thoả điều kiện số customerid phải lớn hơn 1

--Câu13:
SELECT item, MAX(price) AS maxPrice, MIN(price) AS minPrice
--Lấy ra từng item, giá lớn nhất, giá nhỏ nhất
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY item 
--Nhóm lại theo từng item
HAVING MAX(price) > 190;
--Thoả điều kiện giá lớn nhất phải lớn hơn 190.00

--Câu14:
SELECT customerid, COUNT(quantity) AS numberOfOrders, SUM(price) AS sumPrice
--Lấy ra customerid, số lượng đơn hàng, tổng số tiền từ các đơn hàng
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY customerid 
--Nhóm lại theo từng customerid 
HAVING COUNT(quantity) > 1;
--Thoả điều kiện số lượng quantity phải lớn hơn 1

--Câu15:
SELECT firstname, lastname, city
--Lấy ra 3 biểu thức (firstname, lastname, city)
FROM CUSTOMERS
--Từ bảng CUSTOMERS
ORDER BY firstname;
--Sắp xếp tăng dần theo firstname

--Câu16:
SELECT customerid, item, price
--Lấy 3 biểu thức (customerid, item, price) 
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE customerid LIKE 10449
--Thoả mãn điều kiện customerid = 10449
ORDER BY price DESC;
--Sắp xếp theo giá giảm giần

--Câu17:
SELECT item, price
--Lấy ra 2 biểu thức (item, price)
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE price > 10
--Thoả mãn điều kiện price lớn hơn 10,00
ORDER BY price
--Sắp xếp tăng dần theo price

--Câu18:
SELECT customerid, order_date, item
--Lấy ra 3 biểu thức (customerid, order_date, item)
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE (item <> 'Snow Shoes') AND (item <> 'Ear Muffs');
--Thoả mãn điều kiện item không phải là 'Snow Shoes' và 'Ear Muffs'

--Câu19:
SELECT item, price
--Lấy ra 2 biểu thức (item, price)
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE item LIKE '[SPF]%';
--Thoả mãn điều kiện item bắt đầu bằng 'S','P' hoặc 'F'

--Câu20:
SELECT order_date, item, price
--Lấy ra 3 biểu thức (order_date, item, price)
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE price BETWEEN 10.00 AND 80.00;
--Thoả mãn price nằm trong khoảng từ 10-80

--Câu21:
SELECT firstname, city, state
--Lấy ra 3 biểu thức (firstname, city, state)
FROM CUSTOMERS
--Từ bảng CUSTOMERS
WHERE state LIKE 'Arizona' OR state LIKE 'Washington' OR state LIKE 'Oklahoma' OR state LIKE 'Colorado' OR state LIKE 'Hawaii';
--Thoả mãn điều kiện state là Arizona, Washington, Oklahoma, Colorado hoặc Hawaii.