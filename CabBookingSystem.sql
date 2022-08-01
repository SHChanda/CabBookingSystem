create database CabBooking

use CabBooking

create table Location(
ID int primary key identity,
Name varchar(25)
)

create table Distance(
DistanceId int primary key identity,
FromLocation int  foreign key references Location(ID),
ToLocation int foreign key references Location(ID),
Distanceinkm float)

create table Cab(
Id int identity,
CabId AS 'C00' + CAST(Id as varchar(20)) persisted primary key,
Cabname varchar(20),
Cabtype varchar(20),
fareperkm float,
CurrentLocation int foreign key references Location(ID),
Isavailable bit
)

create table Customer(
Mobile bigint primary key,
Username varchar(20),
Password varchar(20),
Email varchar(20))

create table Driver(
mobile int primary key,
Username varchar(20),
Password varchar(20),
licenseno varchar(40),
cabid varchar(23) foreign key references Cab(CabId),
Isapproved bit,
)

create table Booking(
Bookingid int primary key,
mobileno bigint foreign key references Customer(Mobile),
cabid varchar(23) foreign key references Cab(CabId),
fare float,
Gst float,
DistanceId int foreign key references Distance(DistanceId),
Otp int,
TotalFare money,
Status varchar(20),
Rating float)

Create Table Admin(
Username varchar(50) primary key,
Password varchar(25) not null)

insert into Location values
('Hyderabad'),
('Visakhapatnam'),
('Chennai'),
('Thiruvananthapuram'),
('Bengaluru')

insert into Distance values
(1,2,615),
(1,3,627),
(1,4,1301),
(1,5,571),
(2,3,795),
(2,4,1560),
(2,5,1004),
(3,4,773),
(3,5,335),
(4,5,683)
