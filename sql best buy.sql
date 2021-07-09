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