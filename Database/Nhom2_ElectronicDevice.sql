create database Electronic_Device
go
use Electronic_Device
go

--drop database Electronic_Device
create table Customer(
CusId int primary key identity,
CusName nvarchar(50),
Birthday datetime,
Email varchar(20),
Address nvarchar(100),
Phone varchar(20),
Username varchar(20),
Password varchar(20))

create table Employee(
EmpId int primary key identity,
EmpName nvarchar(50),
Address nvarchar(100),
Username varchar(20),
Password varchar(20))

create table Category(
CateId int primary key identity,
CateName nvarchar(20))

create table Shipment(
ShipmentId int primary key identity,
Address nvarchar(100),
Fee float)

create table Payment(
PaymentId int primary key identity,
Method varchar(50),
)


create table Product(
ProId int primary key identity,
ProName nvarchar(20),
Price float,
Description nvarchar(200),
CategoryId int,
foreign key (CategoryId) references Category(CateId)
) 

create table Image(
ImageId int primary key identity,
ImageName nvarchar(50),
Link text,
ProId int,
foreign key (ProId) references Product(ProId)
)

create table OrderDetail(
OrderDetailId int primary key identity,
Price float,
Quantity int,
ProId int,
foreign key (ProId) references Product(ProId),
)

create table Orderr(
OrderId int primary key identity,
DateOfPayment datetime,
EmployeeName nvarchar(30),
CustomerName nvarchar(30),
NameShipment nvarchar(50),
NamePayment nvarchar(50),
ShipmentId int,
PaymentId int,
OrderDetailId int,
CusId int,
EmpId int,
foreign key (OrderDetailId) references OrderDetail(OrderDetailId),
foreign key (CusId) references Customer(CusId),
foreign key (EmpId) references Employee(EmpId),
foreign key (ShipmentId) references Shipment(ShipmentId),
foreign key (PaymentId) references Payment(PaymentId)
)


