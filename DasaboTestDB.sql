CREATE DATABASE DASABO;

USE DASABO;
 
CREATE TABLE User_TB
(
	Idx_User INT primary key auto_increment,
    Name_User varchar(40) NOT NULL,
    Email varchar(200) unique,
    Pw_User varchar(400) NOT NULL,
    salt varchar(400) NOT NULL,
	Phone_User Varchar(20) NOT NULL,
    Address_User Varchar(300),
    Create_at datetime default now(),
    Update_at datetime,
    Role varchar(20) default 'Cunsumer' 
);

Create TABLE Point_TB
(
	Idx_User INT,
    Point int,
    FOREIGN KEY (Idx_User) REFERENCES User_TB (Idx_User)
);

Create TABLE Type_Food_TB
(
	Idx_Food varchar(20) primary key,
    Type_Food varchar(50)
);

Create TABLE Store_TB
(
	Idx_Store INT primary key auto_increment,
	Idx_User Int not null,
    Idx_Food varchar(20) not null,
    Dscr_Food varchar(1000),
    Sales varchar(20) default 'N',
    Minimum_Order INT,
    Address_Store  varchar(300),
    ImageYn varchar(20) default 'N',
    foreign key(Idx_User) references User_TB (Idx_User),
    foreign key(Idx_Food) references Type_Food_TB (Idx_Food)
);

Create TABLE Store_Image_TB
(
	Idx_Image INT primary key auto_increment,
    Idx_Store int,
    Origin_Image varchar(100),
    Save_Image varchar(100),
    Path_Image varchar(100),
    Create_at datetime default now(),
    Update_at datetime,
    foreign key(Idx_Store) references Store_TB (Idx_Store)
);

Create TABLE Menu_TB
(
	Idx_Menu INT primary key auto_increment,
    Idx_Store int,
    Type_menu varchar(40),
    Price_Menu Int,
    Name_menu varchar(100),
    OptionYn varchar(10) default 'N',
    ImageYn varchar(10) default 'N',
	foreign key(Idx_Store) references Store_TB (Idx_Store)
);

Create TABLE Option_TB
(
	Idx_Menu INT,
    Name_Option varchar(40),
    Add_Price Int,
    foreign key(Idx_Menu) references Menu_TB (Idx_Menu)
);

Create Table Menu_Image_TB 
(
	Idx_MImage INT primary key auto_increment,
    Idx_Menu int,
    Origin_Image varchar(100),
    Save_Image varchar(100),
    Path_Image varchar(100),
    Create_at datetime default now(),
    Update_at datetime,
    foreign key(Idx_Menu) references Menu_TB (Idx_Menu)
);

Create TABLE Basket_TB
(
	Idx_Basket INT primary key auto_increment,
	Idx_User INT,
    Idx_Store INT,
    CompleteYn varchar(20) default 'N',
    Create_at datetime default now(),
    foreign key(Idx_User) references User_TB (Idx_User),
    foreign key(Idx_Store) references Store_TB (Idx_Store)
);

Create Table Basket_Item_TB
(
	Idx_Basket INT,
    Idx_Menu INT,
    Quantity INT,
    Basket_Price INT,
    foreign key(Idx_Basket) references Basket_TB(Idx_Basket),
    foreign key(Idx_Menu) references Menu_TB(Idx_Menu)
);

Create TABLE Order_TB
(
	Idx_Order Int primary key auto_increment,
	Idx_User INT,
    Idx_Store INT,
    Approval varchar(30),
    Address_User varchar(300),
    Create_at datetime default now(),
    foreign key(Idx_User) references User_TB (Idx_User),
    foreign key(Idx_Store) references Store_TB (Idx_Store),
    foreign key(Idx_Menu) references Menu_TB (Idx_Menu)
);

Create TABLE Order_Item_TB
(
	Idx_Order INT,
	Idx_Menu INT,
    Quantity INT,
    Price_Order Int,
    foreign key(Idx_Basket) references Basket_TB(Idx_Basket),
    foreign key(Idx_Menu) references Menu_TB(Idx_Menu),
    foreign key(Idx_Order) references Order_TB(Idx_Order)
);

Create TABLE Review_TB
(
	Idx_Review INT primary key auto_increment,
    Idx_Order INT, 
	Idx_user INT,
    Idx_Store INT,
    Content_Review varchar(500),
    foreign key(Idx_Order) references Order_TB(Idx_Order),
    foreign key(Idx_User) references User_TB (Idx_User),
    foreign key(Idx_Store) references Store_TB (Idx_Store)
);

Create TABLE Answer_TB
(
	Idx_Review INT,
    Content_Answer varchar(500),
    foreign key(Idx_Review) references Review_TB(Idx_Review)
);