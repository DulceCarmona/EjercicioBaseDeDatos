-- Clientes
SELECT * FROM customers;

-- Empleados
SELECT * FROM employees;

-- Oficinas
SELECT * FROM offices;

-- Detalles de pedido
SELECT * FROM orderdetails;

-- Pedidos
SELECT * FROM orders;

-- Pagos
SELECT * FROM payments;

-- Linea de Productos
SELECT * FROM productlines;

-- Productos
SELECT * FROM products;


-- Crear los JOINS necesarios para obtener las órdenes completas por cliente 
SELECT 
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.orderDate,
    o.shippedDate,
    o.status,
    od.productCode,
    p.productName,
    od.quantityOrdered,
    od.priceEach,
    (od.quantityOrdered * od.priceEach) AS total
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode;
