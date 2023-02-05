
use master
go
drop database Estateopedia
go

create database Estateopedia
go

use Estateopedia
GO

create table USERS(
username nvarchar(30) not null,
mail_id nvarchar(30) primary key,
password_ nvarchar(30) not null,
user_type char check (user_type='S' or user_type='B') not null, -- S for sellers and B for buyers
contact_no nvarchar(15),
age int,
gender char check (gender='M' or gender='F'),
profile_description text,
cnic nvarchar (15) not null
)

create Table LISTINGS(
seller_ID nvarchar(30) foreign key references USERS(mail_id)not null,
listing_ID int primary key,
listing_name text not null,
listing_description text,
area_size float not null,
city nvarchar(15) not null,
location_ text not null,
listing_purpose char check (listing_purpose='S' or listing_purpose='R') not null, -- S for plots available to sell and R for plots available for rent
no_of_storeys int,
no_of_bedrooms int,
no_of_bathrooms int,
no_of_clicks int default 0,
price float not null,
plot_type char not null check (plot_type='C' or plot_type='R'), -- C for commercial and R for resedential plots
date_added date,
sold char check(sold='Y' or sold='N') default 'N'
)

create Table LISTING_IMAGES(
image_id int primary key,
listing_id int foreign key references LISTINGS(listing_ID),
image_data image not null
)

create Table FAV_LIST(
user_mail nvarchar(30) foreign key references USERS(mail_id) not null,
Listing_ID int foreign key references LISTINGS(listing_ID) On delete cascade not null 
primary key(user_mail, Listing_ID)
)

create Table TENANT(
Tenant_mail nvarchar(30) foreign key references USERS(mail_ID)not null,
Listing_ID int foreign key references LISTINGS(listing_ID) not null,
joining_date date not null,
dues_cleared char check (dues_cleared='Y' or dues_cleared='N') default 'N'
primary key (Tenant_mail, Listing_ID)
)
go

insert into USERS values ('Muhammad Danyal', 'daniyal123@gmail.com', 'daniyal123', 'S', '03204274323', 20, 'M', 'Seller on Estatopedia, selling new and unique properties.', '37164-3658392-5')
insert into USERS values ('Shahid Akram', 'shahid123@gmail.com', 'akram123', 'B', '03204637282', 23, 'M', 'Buyer on Estatopedia, looking to buy new properties.', '37164-3658392-5')
insert into USERS values ('Kamran Ahmad', 'kamran123@gmail.com', 'ahmad123', 'S', '03134274523', 30, 'M', 'Seller on Estatopedia, selling new and unique properties.', '37164-3658392-5')
insert into USERS values ('Sohail Cheema', 'sohail123@gmail.com', 'cheema123', 'S', '03204657323', 45, 'M', 'Seller on Estatopedia, selling new and unique properties.', '37164-3658392-5')
insert into USERS values ('Muhammad Saqib', 'saqib123@gmail.com', 'saqib123', 'B', '03134274323', 29, 'M', 'Buyer on Estatopedia, looking to buy new properties.', '37164-3658392-5')
insert into USERS values('Ali Raza','ali1@gmail.com',12345,'B','0300987621',20,'M','Buyer','3520151295467')
insert into USERS values('Hassan Haider','ali2@gmail.com',12345,'B','0306937621',22,'M','Buyer','352231327467')
insert into USERS values('Mustafa Nosher','ali3@gmail.com',12345,'B','0308787865',22,'M','Buyer','3567851287967')
insert into USERS values('Zain Ahmaed','ali4@gmail.com',12345,'B','03065487965',21,'M','Buyer','3520151295467')


insert into LISTINGS values ('daniyal123@gmail.com', 1, 'Apartment for rent', 'Apartment for rent in resedential area of Johar town Lahore', 3, 'Lahore', 'Johar Town', 'R', 1, 3, 2, 0, 25000, 'R', GETDATE(), 'N')
insert into LISTINGS values ('kamran123@gmail.com', 2, 'Apartment for rent', 'Apartment for rent in resedential area of Johar town Lahore', 5, 'Lahore', 'Johar Town', 'R', 2, 5, 4, 0, 45000, 'R', GETDATE(), 'N')
insert into LISTINGS values ('sohail123@gmail.com', 3, 'Apartment for rent', 'Apartment for rent in resedential area of Johar town Lahore', 4, 'Lahore', 'Johar Town', 'R', 1, 3, 3, 0, 35000, 'R', GETDATE(), 'N')
insert into LISTINGS values ('daniyal123@gmail.com', 4, 'Apartment for sale', 'Apartment for sale in resedential area of Johar town Lahore', 4, 'Lahore', 'Johar Town', 'S', 1, 3, 3, 0, 6500000, 'R', GETDATE(), 'N')
insert into LISTINGS values ('kamran123@gmail.com', 5, 'Apartment for sale', 'Apartment for sale in resedential area of Johar town Lahore', 3, 'Lahore', 'Johar Town', 'S', 1, 3, 2, 0, 5800000, 'R', GETDATE(), 'N')
insert into LISTINGS values ('sohail123@gmail.com', 6, 'Apartment for sale', 'Apartment for sale in resedential area of Johar town Lahore', 5, 'Lahore', 'Johar Town', 'S', 2, 5, 5, 0, 9000000, 'R', GETDATE(), 'N')
insert into LISTINGS values('ali1@gmail.com',7,'House for Rent','Modern house available for rent at a great price.',12,'Lahore','Faisal Town','R',2,5,3,30,100000,'R','5/12/2022','N')
insert into LISTINGS values('ali2@gmail.com',8,'House for Sale','Newly built house forsale with all features and facilities.',12,'Multan','City Area','S',7,8,3,30,15000000,'R','6/12/2023','Y')


insert into LISTING_IMAGES values(1, 1,'https://drive.google.com/file/d/1WoKnNrAyusSnypPBgrgdI32BKiH0GGwd/view?usp=sharing')
insert into LISTING_IMAGES values(2, 2,'https://drive.google.com/file/d/1OX-UcpIH5iMtx-MP4FqNqM7XUUSvqPMS/view?usp=sharing')
insert into LISTING_IMAGES values(3, 3,'https://drive.google.com/file/d/1OX-UcpIH5iMtx-MP4FqNqM7XUUSvqPMS/view?usp=sharing')


insert into FAV_LIST values('ali2@gmail.com',1)
insert into FAV_LIST values('ali1@gmail.com',2)
insert into FAV_LIST values('ali3@gmail.com',3)
insert into FAV_LIST values('shahid123@gmail.com',4)

insert into TENANT values('ali1@gmail.com',2,'5/12/2022','Y')
insert into TENANT values('ali2@gmail.com',1,'5/12/2023','N')

select * from users
select* from listings
select * from LISTING_IMAGES
select * from FAV_LIST
select * from TENANT
go

--QUERIES--
----------------------------------------------

CREATE VIEW _CATALOG AS SELECT l.*, LISTING_IMAGES.image_data FROM LISTINGS l left outer join listing_images on l.listing_ID=listing_images.listing_id
where l.sold ='N'

GO
----------------------------------------------
CREATE PROCEDURE USEREXISTS
(
	@ID					NVARCHAR(30),
	@OUT				INT	OUTPUT
)
AS
BEGIN
	IF (EXISTS(SELECT * FROM USERS WHERE USERS.mail_id=@ID))
	BEGIN
		SET @OUT = 1
	END
	ELSE
	BEGIN
		SET @OUT = 0
	END
END

GO
CREATE PROCEDURE SIGNUP 
(
	@NAME				NVARCHAR(20),
	@ID					NVARCHAR(30),
	@PASS				NVARCHAR(30),
	@UT					CHAR,
	@NUMBER				NVARCHAR(15),
	@AGE				INT,
	@GENDER				CHAR,
	@DESC				TEXT,
	@CNIC				NVARCHAR(15) 
)
AS
BEGIN
	insert into users values (@NAME, @ID, @PASS, @UT, @NUMBER, @AGE, @GENDER, @DESC, @CNIC)
END

GO
create PROCEDURE FILTERLISTINGS 
(
	@MIN_PRICE				FLOAT,
	@MAX_PRICE				FLOAT,
	@MIN_AREA				FLOAT,
	@MAX_AREA				FLOAT,
	@MIN_BEDROOMS			INT,
	@MIN_BATHROOMS			INT,
	@MIN_STOREYS			INT
)
AS
BEGIN
	IF (@MAX_PRICE = 0)
		BEGIN
			SET @MAX_PRICE = 3.40282e+038
		END
	IF (@MAX_AREA = 0)
		BEGIN
			SET @MAX_AREA = 3.40282e+038
		END
	EXEC('DROP VIEW _CATALOG')
	EXEC('CREATE VIEW _CATALOG AS SELECT l.*, LISTING_IMAGES.image_data FROM LISTINGS l left outer join listing_images on l.listing_ID=listing_images.listing_id
where Price >= ' + @MIN_PRICE + ' AND PRICE <= ' + @MAX_PRICE + 
	' AND AREA_SIZE >= ' + @MIN_AREA + ' AND AREA_SIZE <= ' + @MAX_AREA + ' AND NO_OF_BEDROOMS >= ' + @MIN_BEDROOMS
	+ ' AND NO_OF_BATHROOMS >= ' + @MIN_BATHROOMS + ' AND NO_OF_STOREYS >= ' + @MIN_STOREYS)
	EXEC('execute AllListings')
END
GO
----------------------------------------------
 go 
create PROCEDURE RESETFILTERS AS
BEGIN
	EXEC('DROP VIEW _CATALOG')
	EXEC('CREATE VIEW _CATALOG AS SELECT l.*, LISTING_IMAGES.image_data FROM LISTINGS l left outer join listing_images on l.listing_ID=listing_images.listing_id')
	EXEC('execute AllListings')
END
GO

--EXECUTE RESETFILTERS
--SELECT * FROM _catalog
--EXECUTE FILTERLISTINGS	@MIN_PRICE=35000, @MAX_PRICE=6000000, 
--						@MIN_AREA=5, @MAX_AREA=0, 
--						@MIN_BEDROOMS=3,@MIN_BATHROOMS=3,@MIN_STOREYS=1
--SELECT * FROM _catalog

----------------------------------------------

go
create procedure userFavList @input_id nvarchar(30)
as begin 
select l.listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from LISTINGS l left outer join LISTING_IMAGES li on l.listing_ID = li.listing_id join FAV_LIST fl on fl.Listing_ID= l.listing_ID
where fl.user_mail = @input_id
end
--execute userFavList 'ali1@gmail.com'
--execute userFavList 'ali2@gmail.com'
--execute userFavList 'ali3@gmail.com'
go

----------------------------------------------

create procedure LowToHighPrice
as begin
select listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from _CATALOG where sold='N'
order by price asc
end
--exec LowToHighPrice
go

----------------------------------------------

create procedure HighToLowPrice
as begin
select listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from _CATALOG where sold='N'
order by price desc
end
--exec HighToLowPrice
go

----------------------------------------------
create procedure allListings
as begin
select listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from _CATALOG where sold='N'

end

--exec allListings
go

----------------------------------------------

create procedure Get_Seller_Listing

@sellerid nvarchar(30)
as
begin
select l.listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose, sold as Sold
 FROM LISTINGS l left outer join listing_images on l.listing_ID=listing_images.listing_id where @sellerid=l.seller_ID
end

--exec Get_Seller_Listing 'ali2@gmail.com'
go

----------------------------------------------

create procedure Get_Sorted
as 
begin
select listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from _CATALOG where sold='N'
order by no_of_clicks
desc
end

--exec Get_Sorted
go

----------------------------------------------

create procedure Calculate_Commison
@input1 int -- User will provide Lisiting ID 
as
begin
declare @amount int -- To store Price
declare @commison float --To store Calculated Commison
declare @plot_Category char -- To store Plot_Type

set @amount=(
select price from listings
where
@input1=listing_ID
)
set @plot_Category=(
select  plot_type from listings
where
@input1=listing_ID
)
IF @plot_Category='R'
set @commison=(@amount*0.01) -- For Residential 1% 

ELSE
set @commison=(@amount*0.02 ) -- For Commercial 2%

select @amount as 'Price(RS)',@plot_Category as 'PlotType', @commison as 'COMMISON'
end

--exec Calculate_Commison 7
go

----------------------------------------------

create procedure location_search
@locate text
as
begin
select listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from _CATALOG where sold='N'and @locate like location_
end

--exec location_search 'Johar Town'
go

----------------------------------------------

create procedure UserDetail
(
	@mail_id nvarchar(30),
	@name nvarchar(30) output,
	@age int output,
	@cnic nvarchar(15) output,
	@desc text output,
	@gender char output,
	@contact nvarchar(15) output
)
as
begin
	select @name=username, @contact=contact_no, @age=age, @gender = gender, @desc=profile_description, @cnic = cnic from USERS u where u.mail_id= @mail_id
end
--execute UserDetail
--'ali1@gmail.com'
go

----------------------------------------------

create procedure TenantDetail
(
	@seller_ID nvarchar(30)
)
as
begin
	select username as Name,mail_id Mail,contact_no Number,age Age,gender Gender,profile_description,cnic Cnic from USERS u where u.mail_id In
	(
		select Tenant_mail from TENANT t join LISTINGS l on t.Listing_ID=l.Listing_ID where l.seller_ID=@seller_ID 
	)
end
--execute TenantDetail
--'kamran123@gmail.com'
go

----------------------------------------------

-- single listing full detail page
create procedure Listing_Images_Details
(
	@listing_ID int
)
as
begin
	select l.*, i.image_data from _CATALOG l left outer join LISTING_IMAGES i on  l.listing_ID=i.listing_id where l.listing_ID=@listing_ID
end

--execute Listing_Images_Details
--'2'
go

----------------------------------------------
-- login functionality
create procedure CheckLoginDetails
(
	@LoginID nvarchar(30),
	@LoginPassword nvarchar(30),
	@Status int output
)
as 
begin
	if(exists(select mail_id,password_ from USERS where mail_id = @LoginID and password_ = @LoginPassword))
		begin
			set @Status=1
		end
	else
		begin
			set @Status=0
		end
end

declare @out int

-- get user type to open correct page
go
create procedure GetUserType
(
	@id				nvarchar(30),
	@out			char output
)
as
begin
	select @out = user_type from users where mail_id=@id
end

--search bar function
go
create procedure SearchListings
(
	@string			nvarchar(50)
)
as
begin
select listing_ID as ID, image_data as Picture, listing_name as Name, listing_description as Description,price as Price,area_size as Marla,location_ as Location, city as City,no_of_bathrooms as Bathrooms,no_of_bedrooms as Bedrooms,no_of_storeys Stories,date_added as Date, plot_type as PlotType,  listing_purpose as Purpose
 from _CATALOG where CHARINDEX(@string, _CATALOG.listing_name) > 0 or CHARINDEX(@string, _CATALOG.listing_description) > 0 or CHARINDEX(@string, _CATALOG.location_) > 0
end
go
----------------------------------------------.
create procedure updateProfile
(
 @id nvarchar(30),
 @newName nvarchar(30),
 @newContact nvarchar(30),
 @newAge int,
 @newdescription nvarchar(100)
)
as
begin
if(@newName = '')
begin
select @newName = username from USERS where  mail_id = @id
end
if(@newContact = '')
begin
select @newContact=contact_no from USERS where  mail_id = @id
end
if(@newdescription = '')
begin
select @newdescription=profile_description from USERS where  mail_id = @id
end
if(@newAge = '')
begin
select @newAge=age from USERS where  mail_id = @id
end
update USERS 
set username = @newName, contact_no =@newContact, age= @newAge, profile_description=@newdescription
where  mail_id = @id
end

go

create procedure AddListing
(
	@seller_id			nvarchar(30),
	@name				text,
	@desc				text,
	@area				float,
	@city				nvarchar(15),
	@loc				text,
	@purp				char,
	@storeys			int,
	@beds				int,
	@baths				int,
	@price				float,
	@type				char
)
as
begin
	insert into listings values (@seller_id, (select max(LISTINGS.listing_ID) from LISTINGS) + 1, @name, @desc, @area, 
	@city, @loc, @purp, @storeys, @beds, @baths, 0, @price, @type, GETDATE(), 'N')
end

go

create procedure IncrementClicks
(
	@list_id			int
)
as
begin
	update LISTINGS
	set listings.no_of_clicks = listings.no_of_clicks + 1
	where listings.listing_ID = @list_id
end

go

create procedure AddToFav
(
	@user_id			nvarchar(30),
	@list_id			int
)
as
begin
	insert into FAV_LIST values (@user_id, @list_id)
	execute IncrementClicks @list_id
end
  
  go
  create procedure DeleteFromListings
(
	@list_id			int
)
as
begin
	delete from LISTINGS  where listing_ID = @list_id 
	
end
  
  go

  create procedure DeleteFromFav
(
	@user_id			nvarchar(30),
	@list_id			int
)
as
begin
	delete from FAV_LIST  where listing_ID = @list_id and FAV_LIST.user_mail= @user_id
	
end
  
  go
create procedure AddTenants
(
	@tenant_id			nvarchar(30),
	@list_id			int
)
as 
begin
	insert into TENANT values (@tenant_id, @list_id, GETDATE(), 'Y')
end

go
create Procedure MarkSold
(
	@list_id		int
)
as
begin
	update listings 
	set sold='Y'
	where listing_ID=@list_ID
end

go
create procedure AddTenant
(
	@list_ID		int,
	@t_mail			nvarchar(30)
)
as
begin
	execute MarkSold @list_ID
	insert into tenant values (@t_mail, @list_ID, GETDATE(), 'Y')
end

select * from TENANT