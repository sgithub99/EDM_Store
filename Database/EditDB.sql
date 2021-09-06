alter table Orderr
ADD CONSTRAINT FK_ShipmentOrder
FOREIGN KEY (ShipmentId) REFERENCES Shipment(ShipmentId);

alter table Orderr
ADD CONSTRAINT FK_PaymentOrder
FOREIGN KEY (PaymentId) REFERENCES Payment(PaymentId);

alter table Orderr
add Address nvarchar(1000)

alter table Orderr
add Email varchar(50)

alter table Orderr
add Telephone varchar(20)

alter table Orderr
add Status bit

alter table Orderr
drop constraint [FK__Orderr__OrderDet__398D8EEE]

alter table Orderr
drop constraint FK__Orderr__PaymentI__3D5E1FD2

alter table Orderr
drop constraint [FK__Orderr__Shipment__3C69FB99]

alter table Orderr
drop constraint FK__Orderr__EmpId__3B75D760

alter table Orderr
drop constraint [FK_PaymentOrder]

alter table Orderr
drop constraint [FK_ShipmentOrder]

alter table Orderr
drop column ShipmentId, [PaymentId], [OrderDetailId], [EmpId]

alter table Orderr
drop column PaymentId

--Order Detail
alter table OrderDetail
add PaymentId int

alter table OrderDetail
add ShipmentId int

alter table OrderDetail
add constraint fk_orderdetail_payment
foreign key (PaymentId) references Payment(PaymentId)

alter table OrderDetail
add constraint fk_orderdetail_shipment
foreign key (ShipmentId) references Shipment(ShipmentId)

alter table OrderDetail 
add OrderId int not null

alter table OrderDetail
add constraint fk_orderdetail_order
foreign key (OrderId) references Orderr(OrderId)
