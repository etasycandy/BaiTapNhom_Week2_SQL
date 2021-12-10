--T?o Database
CREATE DATABASE Week2Practice;

--Xoá Database
--DROP DATABASE Week2Practice;

--T?o b?ng CUSTOMERS
CREATE TABLE CUSTOMERS(
    customerid INT PRIMARY KEY, 
    firstname VARCHAR(25),
    lastname VARCHAR(25),
    city CHAR(50),
    state CHAR(50)
);
--Xoá b?ng CUSTOMERS
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

--Xoá b?ng ITEMS_ORDERED
--DROP TABLE ITEMS_ORDERED;

--Thêm d? li?u vào b?ng CUSTOMERS
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

--Thêm d? li?u vào b?ng ITEMS_ORDERED
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



--Câu2:
SELECT * FROM ITEMS_ORDERED
--Ch?n t?t c? trong b?ng ITEMS_ORDERED
WHERE item LIKE 'Tent';
--Khi th?a mãn item là 'cái l?u'

--Câu4:
SELECT DISTINCT item
--Ch?ncác item không l?p l?i
FROM ITEMS_ORDERED;
--T? b?ng ITEMS_ORDERED

--Câu6:
SELECT AVG(price) AS trungBinhPrice
--Ch?n giá tr? trung bình c?a price
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE order_date LIKE '%12%';
--Khi Tho? mãn ?i?u ki?n order_date là tháng 12

--Câu8:
SELECT item, MIN(price) AS minPrice
--Ch?n item và giá nh? nh?t c?a nó
FROM ITEMS_ORDERED
--T? b?ng ITEMS_ORDERED
WHERE item LIKE 'Tent'
--Khi th?a mãn item ?ó là 'cái l?u'
GROUP BY item;
--Nhóm l?i theo t?ng item

--Câu10:
SELECT item, MAX(price) AS maxPrice, MIN(price) AS minPrice
--Ch?n item, giá l?n nh?t, giá nh? nh?t c?a item ?ó
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED 
GROUP BY item;
--Nhóm l?i theo t?ng item

--Câu12:
SELECT state, COUNT(customerid) AS amountOfPeople
--Ch?n state và ??m customerid ??t tên là amountOfProple
FROM CUSTOMERS
--T? b?ng CUSTOMERS
GROUP BY state 
--Nhóm l?i theo t?ng state 
HAVING COUNT(customerid) > 1;
--Tho? ?i?u ki?n s? customerid ph?i l?n h?n 1

--Câu14:
SELECT customerid, COUNT(quantity) AS numberOfOrders, SUM(price) AS sumPrice
--L?y ra customerid, s? l??ng ??n hàng ??t tên là numberOfOrders, t?ng s? ti?n t? các ??n hàng ??t tên là sumPrice
FROM ITEMS_ORDERED
--T? b?ng ITEMS_ORDERED
GROUP BY customerid 
--Nhóm l?i theo t?ng customerid 
HAVING COUNT(quantity) > 1;
--Tho? ?i?u ki?n s? l??ng quantity ph?i l?n h?n 1

--Câu16:
SELECT customerid, item, price
--Ch?n 3 bi?u th?c (customerid, item, price) 
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE customerid LIKE 10449
--Tho? mãn ?i?u ki?n customerid = 10449
ORDER BY price DESC;
--S?p x?p theo giá gi?m gi?n

--Câu18:
SELECT customerid, order_date, item
--Ch?n ra 3 bi?u th?c (customerid, order_date, item)
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE (item <> 'Snow Shoes') AND (item <> 'Ear Muffs');
--Tho? mãn ?i?u ki?n item không ph?i là 'Snow Shoes' và 'Ear Muffs'

--Câu20:
SELECT order_date, item, price
--Ch?n ra 3 bi?u th?c (order_date, item, price)
FROM ITEMS_ORDERED 
--T? b?ng ITEMS_ORDERED
WHERE price BETWEEN 10.00 AND 80.00;
--Tho? mãn price n?m trong kho?ng t? 10-80
