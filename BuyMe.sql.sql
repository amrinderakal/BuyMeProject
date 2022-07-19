DROP DATABASE BuyMe;
CREATE DATABASE IF NOT EXISTS BuyMe;
USE BuyMe;

CREATE TABLE User(username varchar(50), password varchar(50), email varchar(100), primary key(username));
INSERT INTO User(username, password, email) VALUES ("user", "pass", "user@gmail.com");
INSERT INTO User(username, password, email) VALUES ("amrinder", "amrinder1", "amrinder@gmail.com");
INSERT INTO User(username, password, email) VALUES ("aman", "aman1", "aman@gmail.com");
INSERT INTO User(username, password, email) VALUES ("eeshaan", "eeshaan1", "eeshaan@gmail.com");
INSERT INTO User(username, password, email) VALUES ("ben", "ben1", "ben@gmail.com");
INSERT INTO User(username, password, email) VALUES ("winnerusername", NULL, NULL); 

CREATE TABLE Admin(username varchar(50), primary key(username), foreign key(username) references User(username));
INSERT INTO User(username, password, email) VALUES ("admin", "adminpass", "admin@gmail.com");
INSERT INTO Admin(username) VALUES ("admin");

CREATE TABLE CusRep(username varchar(50), primary key(username), foreign key(username) references User(username) ON DELETE CASCADE);
INSERT INTO User(username, password, email) VALUES ("cusrep", "cusreppass", "cusrep@gmail.com");
INSERT INTO CusRep(username) VALUES ("cusrep");

-- CREATE TABLE Item(itemID int, isaLaptop bool, isaDesktop bool, isaTablet bool, color varchar(20),
-- 				  brand varchar(20), modelYear int, dimension varchar(10),
--                   batteryLifeLap varchar(50), chargePortLap varchar(50),
--                   includesMouseDesk bool, includesKeyboardDesk bool,
--                   includesPenTab bool, chargePortTab varchar(50), batteryLifeTab varchar(50),
--                   primary key(itemID));

-- CREATE TABLE Item(
-- itemID int NOT NULL AUTO_INCREMENT, isaLaptop bool, isaDesktop bool, isaTablet bool, color varchar(20),
-- brand varchar(20), modelYear int,
-- primary key(itemID)
-- );

CREATE TABLE Item(
itemID int NOT NULL AUTO_INCREMENT, itemtype varchar(8), color varchar(20), brand varchar(20), modelYear int,
primary key(itemID)
);

CREATE TABLE Auction(
itemID int, username varchar(50), winnerusername varchar(50), listingname varchar(100),
startDateTime datetime, endDateTime datetime, initialPrice float,
currentbid float, reserve float,
closed bool, earnings float, minIncrement float,
primary key(username, itemID), foreign key(itemID) references Item(itemID),
foreign key(username) references User(username),
foreign key(winnerusername) references User(username)
);
-- datetime format: YYYY-MM-DD HH:MI:SS 

INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ("laptop", "black", "mac", 2021);
INSERT INTO Auction
(itemID, username, winnerusername, listingname, 								  startDateTime, 	      endDateTime,			initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES
(1,		"ben",     "user",         "FOR SALE: Never used black macbook pro 2020", '2022-05-07 21:45:50', '2022-05-07 21:45:50', 5.97,         432.12,       300,     TRUE,  432.12,     1           );

INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ("desktop", "silver", "windows", 2022);
INSERT INTO Auction
(itemID, username, winnerusername, listingname, 								  startDateTime, 	      endDateTime,			initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES
(2,		"eeshaan",     NULL,       "selling: silver windows pc 2022",             '2022-05-07 21:45:50', '2022-05-07 21:45:50', 5.97,         NULL,       4,       FALSE,  NULL,     1           );

INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ("tablet", "green", "android", 2023);
INSERT INTO Auction
(itemID, username, winnerusername, listingname, 								  startDateTime, 	      endDateTime,			initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES
(3,		"aman",     NULL,           "good deal: android tablet 2023",             '2022-05-07 21:45:50', '2022-05-07 21:45:50', 5.97,         NULL,       4,       FALSE,  NULL,     1           );

INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ("tablet", "black", "apple", 2021);
INSERT INTO Auction
(itemID, username, winnerusername, listingname,               startDateTime, 	      endDateTime,			initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES
(4,		"ben",     "user",         "black ipad, never used", '2022-05-07 21:45:50', '2022-05-07 21:45:50', 5.97,         432.12,       300,     TRUE,  432.12,     1           );

INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ("laptop", "blue", "macbook", 2020);
INSERT INTO Auction
(itemID, username, winnerusername, listingname, 								  startDateTime, 	      endDateTime,			initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES
(5,		"amrinder",     NULL,      "FOR SALE: Never used blue macbook air 2020", '2022-05-07 21:45:50', '2022-05-07 21:45:50', 5.97,         NULL,       4,       FALSE,  NULL,     1           );

INSERT INTO Item(itemtype, color, brand, modelYear) VALUES ("tablet", "black", "apple", 2021);
INSERT INTO Auction
(itemID, username, winnerusername, listingname,               startDateTime, 	      endDateTime,			initialPrice, currentbid, reserve, closed, earnings, minIncrement) VALUES
(6,		"ben",     "user",         "DUP: black ipad, never used", '2022-05-07 21:45:50', '2022-05-07 21:45:50', 5.97,         432.12,       300,     TRUE,  432.12,     1           );

-- CREATE TABLE Buyer(
-- username varchar(50), sellerUsername varchar(50), itemID int,
-- bid float, upperlimit float, increment float, isAuto bool,
-- primary key (username, sellerUsername, itemID), foreign key(username) references User(username),
-- foreign key(sellerUsername, itemID) references Auction(username, itemID)
-- );

CREATE TABLE Bids(
bidID int NOT NULL AUTO_INCREMENT, bidderUsername varchar(50), sellerUsername varchar(50), itemID int,
bid float, upperlimit float, increment float, isAuto bool,
primary key (bidID),
foreign key(bidderUsername) references User(username),
foreign key(sellerUsername, itemID) references Auction(username, itemID)
);

CREATE TABLE Alert(
username varchar(50), itemID int, primary key(username, itemID),
foreign key(username) references User(username), foreign key(itemID) references Item(itemID)
);
                   
CREATE TABLE Questions(
questionId int NOT NULL AUTO_INCREMENT, questions varchar(500),
username varchar(50), reply varchar(500), cusrepusername varchar(50), 
primary key(questionId)
);

