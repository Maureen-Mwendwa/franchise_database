# Command to create a new databse 
CREATE DATABASE Franchise;
# Ensure that you are working in the right database
USE Franchise; 

# ONE TO ONE RELATIONSHIP
# Customer Table vs Membership Table 
CREATE TABLE Customer(
CustomerID INT PRIMARY KEY, 
Name VARCHAR(255), 
Email VARCHAR(255),
Phone VARCHAR(15)
);
# Enter data into table
INSERT INTO Customer(CustomerID,Name, Email, Phone)
VALUES 
(101,'John Maker','johnmaker@gmail.com','012345678'),
(102,'Rachel Shebesh','shebesh89@gmail.com','0123454568'),
(103,'Rosemary Katana','katanar@gmail.com','0123564678'); 
# Create Membership Table 
CREATE TABLE Membership(
MembershipID INT PRIMARY KEY,
CustomerID INT UNIQUE, -- marked as UNIQUE, indicating that each customer can have only one membership.
StartDate DATE,
ExpiryDate DATE, 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)   -- specify the relationship here.The CustomerID column is a foreign key that references the primary key (CustomerID) in the Customer table.
); 
# Add data into Membership Table 
INSERT INTO Membership(MembershipID, CustomerID, StartDate, ExpiryDate)
VALUES
(1,101,'2020-07-07','2026-05-06'), 
(2,102,'2021-05-10','2027-05-06'),
(3,103,'2019-02-14','2025-06-03');

# One To Many Relationship
# Menu Table vs Order Table
CREATE TABLE Menu(
DishID INT PRIMARY KEY, 
DishName VARCHAR(255),
Description VARCHAR(255),
Price DECIMAL(65,2)
); 
INSERT INTO Menu(DishID, DishName, Description,Price) 
VALUES
(1,'Pizza','Margherita', 70.2),
(2,'Burgar','Cheeseburger', 150.2),
(3,'Salad','Caesar Salad', 45.3); 
CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT, 
DishID INT, 
Quantity INT,
OrderDate DATE, 
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (DishID) REFERENCES Menu(DishID)
);
INSERT INTO Orders(OrderID, CustomerID,DishID,Quantity,OrderDate)
VALUES 
(1,101,1,8,'2024-03-08'), 
(2,102,2,3,'2024-03-08'), 
(3,103,3,1,'2024-03-08'); 

# MANY TO MANY RELATIONSHIP 
# ingredient Table, Menu Table , MenuIngredient Table (Junction/Intersection Table )
CREATE TABLE Ingredient (
IngredientID INT PRIMARY KEY, 
IngredientName VARCHAR(255)
);
INSERT INTO Ingredient(IngredientID, IngredientName)
VALUES
(1, 'Tomato'),
(2, 'Mozzarella'),
(3, 'Lettuce'),
(4, 'Beef Patty'),
(5, 'Bun'),
(6, 'Caeser Dressing'); 
# Junction/Intersection Table
CREATE TABLE MenuIngredient(
DishID INT,
IngredientID INT,
PRIMARY KEY (DishID, ingredientID),
FOREIGN KEY (DishID) REFERENCES Menu(DishID), 
FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
); 
INSERT INTO MenuIngredient(DishID, IngredientID)
VALUES
(1, 1),
(1, 2),
(2, 4),
(2, 5),
(3, 6),
(3, 3); 













 


