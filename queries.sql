-- Chinook Music Store: Sales Analysis
-- Database: Chinook (SQLite). Each query answers one business question.

-- Q1: Which countries bring in the most revenue?
SELECT BillingCountry, SUM(Total) AS revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY revenue DESC;


-- Q2: Who are the top 5 customers by total spend?
SELECT Invoice.CustomerId, Customer.FirstName, Customer.LastName, SUM(Total) AS Spending
FROM Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Invoice.CustomerId
ORDER BY Spending DESC
LIMIT 5;


-- Q3: Which genres sell best?
SELECT Genre.Name, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS Sales
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY Sales DESC;


-- Q4: How has revenue changed by year?
SELECT strftime('%Y', InvoiceDate) AS year, SUM(Total) AS revenue
FROM Invoice
GROUP BY year
ORDER BY year;


-- Q5: Which sales rep brings in the most revenue?
SELECT Employee.FirstName, Employee.LastName, SUM(Total) AS sales
FROM Employee
JOIN Customer ON Employee.EmployeeId = Customer.SupportRepId
JOIN Invoice ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Employee.EmployeeId
ORDER BY sales DESC;


-- Q6: Which artists sold the most tracks?
SELECT Artist.Name, SUM(InvoiceLine.Quantity) AS sales
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Album.AlbumId = Track.AlbumId
JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY sales DESC
LIMIT 10;
