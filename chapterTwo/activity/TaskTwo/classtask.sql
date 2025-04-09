-- a
select * from CUSTOMER;
select * from INVOICE;
select * from INVOICE_ITEM;

-- b
select lastName, firstName, phone from CUSTOMER;

--c 
select lastName, firstName, phone 
from CUSTOMER
where firstName = 'Nikki';

-- d
select lastName, firstName, phone, dateIn, dateOut
from CUSTOMER, INVOICE
where CUSTOMER.customerID = INVOICE.customerID
and TotalAmount > 100.00;

-- e
select lastName, firstName, phone
from CUSTOMER
where firstName like 'B%';

-- f
select lastName, firstName, phone
from CUSTOMER
where firstName like '%cat%';

-- g
select lastName, firstName, phone
from CUSTOMER
where phone like '___23%';

-- h
select max(TotalAmount) as MaxTotal, min(TotalAmount) as MinTotal
from INVOICE;

-- i
select avg(TotalAmount) as AvgTotal
from INVOICE;

-- j
select count(*) as NumberOfCustomers
from CUSTOMER;

-- k
select lastName, firstName, phone
from CUSTOMER
group by lastName, firstName
having count(*) > 1;

-- l 
select lastName, firstName, count(*) as NumberOfCustomers
from CUSTOMER
group by lastName, firstName
having count(*) > 1;

-- m
select lastName, firstName, phone
from CUSTOMER
where customerID in (select customerID
                     from INVOICE
                     where TotalAmount > 100.00)
order by lastName asc, firstName desc;

-- n
select lastName, firstName, phone
from CUSTOMER, INVOICE
where CUSTOMER.customerID = INVOICE.customerID
and TotalAmount > 100.00
order by lastName asc, firstName desc;

-- o
select lastName, firstName, phone
from CUSTOMER JOIN INVOICE
on CUSTOMER.customerID = INVOICE.customerID
where TotalAmount > 100.00
order by lastName asc, firstName desc;

-- p
select lastName, firstName, phone
from CUSTOMER
where customerID in (select customerID
                     from INVOICE_ITEM
                     where item = 'Dress Shirt')
order by lastName asc, firstName desc;


-- Q
SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.TotalAmount > 100 
ORDER BY C.LastName ASC, C.FirstName DESC;

-- R
SELECT LastName, FirstName, Phone 
FROM CUSTOMER I
WHERE CustomerID IN (
    SELECT I.CustomerID 
    FROM INVOICE_ITEM I 
    WHERE I.Item = 'Dress Shirt'
)
ORDER BY LastName ASC, FirstName DESC;

-- S
SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C, INVOICE I, INVOICE_ITEM II 
WHERE C.CustomerID = I.CustomerID AND I.InvoiceNumber = II.InvoiceNumber AND II.Item = 'Dress Shirt' 
ORDER BY C.LastName ASC, C.FirstName DESC;

SELECT C.LastName AS CustomerLastName, C.FirstName AS CustomerFirstName, 
       R.LastName AS ReferredByLastName, R.FirstName AS ReferredByFirstName 
FROM CUSTOMER C 
LEFT JOIN CUSTOMER R ON C.ReferredBy = R.CustomerID;

-- T
SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.InvoiceNumber IN (
    SELECT InvoiceNumber 
    FROM INVOICE_ITEM 
    WHERE Item = 'Dress Shirt'
)
ORDER BY C.LastName ASC, C.FirstName DESC;

-- U
SELECT C.LastName, C.FirstName, C.Phone, I.TotalAmount 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.InvoiceNumber IN (
    SELECT InvoiceNumber 
    FROM INVOICE_ITEM 
    WHERE Item = 'Dress Shirt'
)
UNION 
SELECT C.LastName, C.FirstName, C.Phone, NULL AS TotalAmount 
FROM CUSTOMER C 
WHERE C.CustomerID NOT IN (
    SELECT CustomerID 
    FROM INVOICE I 
    JOIN INVOICE_ITEM II ON I.InvoiceNumber = II.InvoiceNumber 
    WHERE II.Item = 'Dress Shirt'
)
ORDER BY TotalAmount ASC, LastName ASC, FirstName DESC;


