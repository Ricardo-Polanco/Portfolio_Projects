CREATE TABLE bank (id INTEGER,
    name varchar(50),
    age INTEGER,
    date_account_opened varchar(50),
    current_balance INTEGER,
    credit_card_accounts_open INTEGER,
    yearly_income INTEGER,
    avg_monthly_spending INTEGER);

INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending) 
VALUES (1, 'Dana Smith', 34, '2007-08-14', 56000, 5, 104000, 3000);
INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending) 
VALUES (2, 'Jalen Hernandez', 28, '2013-03-29', 34000, 3, 83000, 4000);
INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending) 
VALUES (3, 'Liam Dominguez', 24, '2017-11-15', -6000, 1, 45000, 1400);
INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending) 
VALUES (4, 'Zoe Johnson', 49, '1992-01-10', 206000, 9, 457000, 15000);
INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending) 
VALUES (5, 'Daniel Davis', 41, '2001-05-02', 46000, 5, 89000, 2500);
INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending) 
VALUES (6, 'Natalia Yi', 29, '2012-10-10', 174000, 6, 212000, 5700);

SELECT * FROM bank;

/* Executed multiple commands within one transaction that updated certain variables of clients such as current balance, 
average monthly spending, how many credit cards they have, and yearly income */ 
BEGIN TRANSACTION;
UPDATE bank SET current_balance = 60000 WHERE id = 1;
UPDATE bank SET current_balance = 4000 WHERE id = 3;
UPDATE bank SET avg_monthly_spending = 20000 WHERE id = 4;
UPDATE bank SET current_balance = 189000 WHERE id = 6;
UPDATE bank SET current_balance = -127000 WHERE id = 4;
UPDATE bank SET credit_card_accounts_open = 5 WHERE id = 6;
UPDATE bank SET credit_card_accounts_open = 6 WHERE id = 5;
UPDATE bank SET yearly_income = 96000 WHERE id = 2;
COMMIT;
SELECT * FROM bank;

/* Created a new variable that will allow the programmer to filter the users by who is currently a client, and who has closed their account with us. 
For example, Liam closed his account with us so if we wanted to grab information from all of our existing clients, the programmer can query their information. 
We can see a table where Liam is assigned 'true' under the deleted column to indicate he has closed his account with us, 
while the others have 'false' to indicate they are still banking with us */ 
ALTER TABLE bank ADD deleted varchar(50) not null
CONSTRAINT df_deleted DEFAULT 'false';
UPDATE bank SET deleted = 'true' WHERE id = 3;
SELECT * FROM bank;
SELECT * FROM bank WHERE deleted = 'false';

/* Created a new feature that collects and stores the response of users about whether they want the banking app to allow location tracking or not. 
New accounts are allowed this feature while existing accounts are all assigned 'no' to the feature. */ 
ALTER TABLE bank ADD allow_location varchar(50) not null
CONSTRAINT df_allow_location DEFAULT 'no';

INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending, allow_location) 
VALUES (7, 'Helen Holmes', 23, '2022-12-10', 21000, 2, 72000, 1700, 'yes');
INSERT INTO bank (id, name, age, date_account_opened, current_balance, credit_card_accounts_open, yearly_income, avg_monthly_spending, allow_location) 
VALUES (8, 'George McAllen', 65, '2022-02-28', 157000, 7, 132000, 2100, 'no');

/* Shows the entire bank database in the first query and the second query shows any users that are still banking with 
(have active accounts) and have allowed the new location tracking feature. */ 
SELECT * FROM bank;
SELECT * FROM bank WHERE deleted = 'false' AND allow_location = 'yes';