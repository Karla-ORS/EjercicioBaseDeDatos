-- a) Consultar las tablas por separado
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;

-- b) Consulta con JOINs para mostrar las órdenes completas por cliente
SELECT 
    customers.customerNumber,
    customers.customerName,
    orders.orderNumber,
    orders.orderDate,
    orders.status,
    products.productName,
    orderdetails.quantityOrdered,
    orderdetails.priceEach,
    (orderdetails.quantityOrdered * orderdetails.priceEach) AS totalPrice
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
ORDER BY customers.customerNumber, orders.orderNumber;

-- c) Crear una vista con la misma consulta anterior
DROP VIEW IF EXISTS vista_ordenes_completas;
CREATE VIEW vista_ordenes_completas AS
SELECT 
    customers.customerNumber,
    customers.customerName,
    orders.orderNumber,
    orders.orderDate,
    orders.status,
    products.productName,
    orderdetails.quantityOrdered,
    orderdetails.priceEach,
    (orderdetails.quantityOrdered * orderdetails.priceEach) AS totalPrice
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode;


