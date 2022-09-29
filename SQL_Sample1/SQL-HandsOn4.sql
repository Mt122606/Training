-- Part 1

-- 1 Create a view named "initialCustomers" that shows the first name, last name, and email address of customers that have an id of less than 100.
create view initialCustomers as
SELECT first_name, last_name, email
FROM sakila.customer
Where customer_id > 100;

-- Select and view your newly created view.
Select * from initialCustomers;

-- Create a table named "ProductList". Include the following columns:ProductID, ProductName, Price, DateAdded, EmployeeSupportId

-- Requirements:
-- Every product should have an automatically generated id number that should be unique for each product.
-- Give each column a data type that would apply
-- Give the DateAdded column a default value for the current local time.
-- All columns CANNOT be null.
CREATE TABLE ProductList (
ProductID INTEGER PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(50) UNIQUE not null,
Price decimal (5,2) not null,
DateAdded DATETIME default current_timestamp,
EmployeeSupportId VARCHAR(5) not null
  CHECK (length(EmployeeSupportId) = 5)
);

-- Insert one product into the table following the given guidelines when the table was created.
-- Don't include the ProductId or the DateAdded
insert into ProductList (ProductName , Price, EmployeeSupportId )
value ("popcorn","3.93","f4y8*");

-- Run a query to see the single product in your table.
Select * from ProductList;

delete from ProductList
where ProductID=1;

drop table ProductList;