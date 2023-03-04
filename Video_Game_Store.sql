CREATE TABLE Polanco_Industries (id INTEGER, 
    name varchar(50), 
    rating INTEGER, 
    year_released INTEGER, 
    price INTEGER,
    number_of_copies INTEGER,
    aisle INTEGER);

INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (1, 'Destiny', 10, 2017, 90, 15, 5);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (2, 'Monster Hunter', 9, 2010, 35, 18, 3);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (3, 'Hearthstone', 2, 2005, 1, 20, 1);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (4, 'Yu-Gi-Oh', 8, 2022, 10, 34, 3);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (5, 'Smite', 9, 2013, 30, 78, 4);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (6, 'Minecraft', 10, 2008, 40, 21, 5);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (7, 'Roblox', 7, 2005, 11, 29, 1);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (8, 'Among Us', 6, 2019, 5, 62, 1);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (9, 'Call of Duty', 3, 2022, 1, 24, 1);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (10, 'Valorant', 2, 2018, 20, 46, 4);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (11, 'Overwatch', 7.5, 2014, 55, 32, 4);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (12, 'Apex Legends', 4, 2009, 8, 71, 2);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price,  number_of_copies, aisle)
VALUES (13, 'GTA V', 8.5, 2015, 60, 56, 5);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (14, 'Fortnite', 8, 2017, 10, 94, 3);
INSERT INTO Polanco_Industries (id, name, rating, year_released, price, number_of_copies, aisle)
VALUES (15, 'Pokemon', 9, 2005, 15, 9, 1);

SELECT * FROM Polanco_Industries;

/* Orders the table by price in descending order */
SELECT * FROM Polanco_Industries ORDER BY price DESC;

/* We get the information for the game with highest rating */
SELECT id, name, year_released, price, number_of_copies, aisle, MAX(rating) AS Maximum_Rating 
FROM Polanco_Industries 
GROUP BY id, name, year_released, price, number_of_copies, aisle
ORDER BY Maximum_Rating DESC;

/* We get the information for the game that was released the earliest */
SELECT id, name, rating, price, number_of_copies, aisle, MIN(year_released) AS Earliest_Year 
FROM Polanco_Industries 
GROUP BY id, name, rating, price, number_of_copies, aisle
ORDER BY Earliest_Year;

/* We get the location of the game and how many copies are in store  */
SELECT name, number_of_copies, aisle FROM Polanco_Industries GROUP BY name, number_of_copies, aisle ORDER BY aisle, number_of_copies;

/* We get the total amount of money that each aisle is worth */
SELECT aisle, SUM(price*number_of_copies) AS Total_Price FROM Polanco_Industries GROUP BY aisle;

/* We get the average rating in each aisle */
SELECT aisle, AVG(rating) AS Average_Rating FROM Polanco_Industries GROUP BY aisle;

