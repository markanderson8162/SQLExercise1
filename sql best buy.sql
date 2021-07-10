-- find all products --
 select * from bestbuy.products;
-- find all products that cost $1400
select * from bestbuy.products
where bestbuy.products.price = 1400;
-- find all products that cost $11.99 or $13.99
 select * from bestbuy.products 
 where price = 11.99 or price = 13.99; 
-- find all products that do NOT cost 11.99 - using NOT
 select * from bestbuy.products
 where not price = 11.99;
-- find  all products and sort them by price from greatest to least
 select * from bestbuy.products
 order by bestbuy.products.price desc;
-- find all employees who don't have a middle initial
 select * from bestbuy.employees
 where middleinitial is null;
-- find distinct product prices
 select distinct price
 from bestbuy.products;
-- find all employees whose first name starts with the letter ‘j’
 select * from bestbuy.employees
 where firstname like 'j%';
-- find all Macbooks --
 select * from bestbuy.products
 where name like '%macbook%';
-- find all products that are on sale
 select * from bestbuy.products
 where OnSale = 1
 order by bestbuy.products.name;
-- find the average price of all products --
Select avg(price)
from bestbuy.products; 
-- find all Geek Squad employees who don't have a middle initial --
 select * from bestbuy.employees
 where title like '%geek squad%';
-- find all products from the products table whose stock level is in the range of 500 to 1200. Order by Price from least to greatest. **Try this with the between keyword** 
select * from bestbuy.products
where stocklevel between 500 and 1000
order by stocklevel;

-- joins: select all the computers from the products table
 -- using the products table and the categories table, return the product name and the category name
 SELECT p.Name as Product, C.Name as Category FROM bestbuy.products as P
 INNER JOIN bestbuy.categories AS C ON C.CategoryID = P.CategoryID
 WHERE C.CategoryID = 1;
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 select p.Name, p.Price, r.Rating from bestbuy.products as p
 inner join bestbuy.reviews as r on r.ProductID = p.ProductID
 where rating = 5;
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
select e.FirstName, e.LastName, Sum(s.Quantity) as Total from bestbuy.sales as s
inner join bestbuy.employees as e on e.EmployeeID = s.employeeid
Group By e.EmployeeID
Order By Total Desc
Limit 2;

-- joins: find the name of the department, and the name of the category for Appliances and Games
select d.Name as 'Department Name', c.Name as 'Category Name' from bestbuy.departments as d
inner join bestbuy.categories as c on c.departmentid = d.departmentid
where c.Name = 'appliances' or c.name = 'games';

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
select p.Name, sum(s.Quantity) as 'Total Sold', sum(s.Quantity * s.Priceperunit) as 'Total Price' from bestbuy.products as p
inner join bestbuy.sales as s on s.ProductID = p.ProductID
where p.Productid = 97;

-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
select p.name, r.Reviewer, r.Rating, r.Comment from bestbuy.products as p
inner join bestbuy.reviews as r on r.ProductID = p.ProductID
where p.name like '%visio tv%' and r.Rating = 1;