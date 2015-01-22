Use MTG_Project_DB
Go

-- Be VERY CAREFUL with this file. It could cause the loss of all of our data
/*
	If Object_ID('History', 'U') Is Not NUll
		Drop Table History;
	If Object_ID('Cards', 'U') Is Not NUll
		Drop Table Cards;
	If Object_ID('Watch_List', 'U') Is Not NUll
		Drop Table Watch_List;
	If Object_ID('Sale_List', 'U') Is Not NUll
		Drop Table Sale_List;
	If Object_ID('Credit_Card', 'U') Is Not NUll
		Drop Table Credit_Card;
	If Object_ID('Trade', 'U') Is Not NUll
		Drop Table Trade;
	If Object_ID('Users', 'U') Is Not NUll
		Drop Table Users;
	If Object_ID('Addresses', 'U') Is Not NUll
		Drop Table Addresses;
*/

Create Table History(
	CardID		int,
	UpdateTime  datetime,
	Price		money,
	Primary Key (CardID, UpdateTime)
);

Create Table Cards(
	CardID		int Primary Key,
	CardName	nvarchar(50),
	SetName		nvarchar(50)
);

Create Table Watch_List(
	WatchID		int Primary Key,
	Price		money,
	UserID		int,
	CardID		int
);

Create Table Sale_List(
	SaleID		int Primary Key,
	Price		money,
	OwnerID		int,
	CardID		int,
	Condition	nvarchar(20)
);

Create Table Credit_Card(
	CCID			int Primary Key,
	SecurityCode	int,
	CCNumber		int,
	NameOnCard		nvarchar(50),
	ExpDate			date,
	OwnerID			int,
	CCName			nvarchar(20),
	AddressID		int
);

Create Table Trade(
	TradeID int Primary Key,
	Price int,
	SaleID int,
	BuyerID int,
	CCID int,
);
	
Create Table Users(
	UserID int Primary Key,
	FName nvarchar(50),
	LName nvarchar(50),
	Email nvarchar(50),
	JoinDate date,
);

Create Table Addresses(
	AddressID int,
	StreetAddress nvarchar(50),
	StateName Nvarchar(20),
	Country Nvarchar(37),
	Zipcode int,
	OwnerID int,
	AddressType nvarchar(50),
	NickName Nvarchar(50)
);