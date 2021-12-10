--T?o Database
CREATE DATABASE Week2Practice;

--Xo� Database
--DROP DATABASE Week2Practice;

--T?o b?ng CUSTOMERS
CREATE TABLE CUSTOMERS(
    customerid INT PRIMARY KEY, 
    firstname VARCHAR(25),
    lastname VARCHAR(25),
    city CHAR(50),
    state CHAR(50)
);
--Xo� b?ng CUSTOMERS
--DROP TABLE CUSTOMERS;

--T?o b?ng ITEMS_ORDERED
CREATE TABLE ITEMS_ORDERED(
    customerid INT, 
    order_date DATE,
    item VARCHAR(50),
    quantity INT,
    price DECIMAL(6,2),
    FOREIGN KEY (customerid) REFERENCES CUSTOMERS(customerid)
);

--Xo� b?ng ITEMS_ORDERED
--DROP TABLE ITEMS_ORDERED;

--Th�m d? li?u v�o b?ng CUSTOMERS
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

--Th�m d? li?u v�o b?ng ITEMS_ORDERED
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




--C�u2:
SELECT * FROM ITEMS_ORDERED
--Ch?n t?t c? trong b?ng ITEMS_ORDERED
WHERE item LIKE 'Tent';
--Khi th?a m�n item l� 'c�i l?u'

--C�u4:
SELECT DISTINCT item
--Ch?nc�c item kh�ng l?p l?i
FROM ITEMS_ORDERED;
--T? b?ng ITEMS_ORDERED

--C�u6:
SELECT AVG(price) AS trungBinhPrice
--Ch?n gi� tr? trung b�nh c?a price
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE order_date LIKE '%12%';
--Khi Tho? m�n ?i?u ki?n order_date l� th�ng 12

--C�u8:
SELECT item, MIN(price) AS minPrice
--Ch?n item v� gi� nh? nh?t c?a n�
FROM ITEMS_ORDERED
--T? b?ng ITEMS_ORDERED
WHERE item LIKE 'Tent'
--Khi th?a m�n item ?� l� 'c�i l?u'
GROUP BY item;
--Nh�m l?i theo t?ng item

--C�u10:
SELECT item, MAX(price) AS maxPrice, MIN(price) AS minPrice
--Ch?n item, gi� l?n nh?t, gi� nh? nh?t c?a item ?�
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED 
GROUP BY item;
--Nh�m l?i theo t?ng item

--C�u12:
SELECT state, COUNT(customerid) AS amountOfPeople
--Ch?n state v� ??m customerid ??t t�n l� amountOfProple
FROM CUSTOMERS
--T? b?ng CUSTOMERS
GROUP BY state 
--Nh�m l?i theo t?ng state 
HAVING COUNT(customerid) > 1;
--Tho? ?i?u ki?n s? customerid ph?i l?n h?n 1

--C�u14:
SELECT customerid, COUNT(quantity) AS numberOfOrders, SUM(price) AS sumPrice
--L?y ra customerid, s? l??ng ??n h�ng ??t t�n l� numberOfOrders, t?ng s? ti?n t? c�c ??n h�ng ??t t�n l� sumPrice
FROM ITEMS_ORDERED
--T? b?ng ITEMS_ORDERED
GROUP BY customerid 
--Nh�m l?i theo t?ng customerid 
HAVING COUNT(quantity) > 1;
--Tho? ?i?u ki?n s? l??ng quantity ph?i l?n h?n 1

--C�u16:
SELECT customerid, item, price
--Ch?n 3 bi?u th?c (customerid, item, price) 
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE customerid LIKE 10449
--Tho? m�n ?i?u ki?n customerid = 10449
ORDER BY price DESC;
--S?p x?p theo gi� gi?m gi?n

--C�u18:
SELECT customerid, order_date, item
--Ch?n ra 3 bi?u th?c (customerid, order_date, item)
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE (item <> 'Snow Shoes') AND (item <> 'Ear Muffs');
--Tho? m�n ?i?u ki?n item kh�ng ph?i l� 'Snow Shoes' v� 'Ear Muffs'

--C�u20:
SELECT order_date, item, price
--Ch?n ra 3 bi?u th?c (order_date, item, price)
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE price BETWEEN 10.00 AND 80.00;
--Tho? m�n price n?m trong kho?ng t? 10-80
=======
--Câu3:
SELECT customerid, order_date, item
--Lấy 3 biểu thức (customerid, order_date, item) 
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
WHERE item LIKE 'S%';
--Thoả mãn điều kiện item bắt đầu bằng chữ 'S'

--Câu5:
SELECT item, MAX(price) AS maxPrice
--Lấy ra item và giá lớn nhất của item đó
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY item;
--Nhóm lại theo từng item

--Câu7:
SELECT COUNT(*) AS totalNumberOfRows
--Lấy ra số hàng gán cho nó tên là totalNumberOfRows
FROM ITEMS_ORDERED;
--Từ bảng ITEMS_ORDERED

--Câu9:
SELECT state, COUNT(*) AS amountOfPeople
--Lấy ra biểu thức state và đếm số lần xuất hiện
FROM CUSTOMERS
--Từ bảng CUSTOMERS
GROUP BY state;
--Nhóm lại theo từng state

--Câu11:
SELECT customerid, COUNT(*) AS numberOfOrders, SUM(price) AS sumPrice
--Lấy ra customerid, số lượng đơn hàng, tổng số tiền từ các đơn hàng
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY customerid;
--Nhóm lại theo từng customerid

--Câu13:
SELECT item, MAX(price) AS maxPrice, MIN(price) AS minPrice
--Lấy ra từng item, giá lớn nhất, giá nhỏ nhất
FROM ITEMS_ORDERED
--Từ bảng ITEMS_ORDERED
GROUP BY item 
--Nhóm lại theo từng item
HAVING MAX(price) > 190;
--Thoả điều kiện giá lớn nhất phải lớn hơn 190.00

--Câu15:
SELECT firstname, lastname, city
--Lấy ra 3 biểu thức (firstname, lastname, city)
FROM CUSTOMERS
--Từ bảng CUSTOMERS
ORDER BY firstname;
--Sắp xếp tăng dần theo firstname

--Câu17:
SELECT item, price
--Lấy ra 2 biểu thức (item, price)
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE price > 10
--Thoả mãn điều kiện price lớn hơn 10,00
ORDER BY price
--Sắp xếp tăng dần theo price

--Câu19:
SELECT item, price
--Lấy ra 2 biểu thức (item, price)
FROM ITEMS_ORDERED 
--Từ bảng ITEMS_ORDERED
WHERE item LIKE '[SPF]%';
--Thoả mãn điều kiện item bắt đầu bằng 'S','P' hoặc 'F'

--Câu21:
SELECT firstname, city, state
--Lấy ra 3 biểu thức (firstname, city, state)
FROM CUSTOMERS
--Từ bảng CUSTOMERS
WHERE state LIKE 'Arizona' OR state LIKE 'Washington' OR state LIKE 'Oklahoma' OR state LIKE 'Colorado' OR state LIKE 'Hawaii';
--Thoả mãn điều kiện state là Arizona, Washington, Oklahoma, Colorado hoặc Hawaii.

