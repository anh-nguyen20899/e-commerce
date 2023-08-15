Create database my_store;
use my_store;
CREATE TABLE Customers (
    ID int primary key AUTO_INCREMENT,
    LastName varchar(50) not null,
    FirstName varchar(50) not null,
    Email varchar(255) not null,
    Address1 varchar(255) not null,
    Credential_pass varchar(255) not null,
    City varchar(50) not null,
    PostalCode varchar(50),
    Country varchar(100) not null,
    Phone varchar(50),
    CreditCard varchar(50) not null,
    CardExpYear DateTime,
    ShipAddress varchar(255),
    ShipCity varchar(100),
    ShipRegion varchar(100),
    CreatedDate DateTime,
    UpdatedDate DateTime
);
Create Table Promotions (
    PromotionId int primary key AUTO_INCREMENT,
    Discount float not null,
    StartDate DateTime not null,
    ValidTo DateTime not null,
    PromoDescription varchar(255) not null
);
Create Table PaymentType (
    TypeId int primary key AUTO_INCREMENT,
    PaymentType varchar(100) not null
);
Create TABLE Payment (
    PaymentId int primary key AUTO_INCREMENT,
    PaymentTypeId int not null,
    CardHolderName varchar(255) not null,
    CONSTRAINT FK_PaymentType FOREIGN KEY (PaymentTypeId)
    REFERENCES PaymentType(TypeId)
);

Create Table Shipper(
    ShipperId int primary key AUTO_INCREMENT,
    ShipperName varchar(255) not null,
    CompanyName varchar (255) not null,
    Phone varchar(255) not null
);
Create Table Status (
    StatusId int primary key,
    DescriptionStatus varchar(200)
);
Create Table Orders(
    OrderId int primary key AUTO_INCREMENT,
    CustomerId int not null,
    OrderNumber int not null,
    PaymentId int not null,
    OrderDate DateTime not null,
    ShipDate DateTime not null,
    ShipperId int not null,
    Freight varchar(200) not null,
    SalesTax float not null,
    OrderTimeStamp DateTime not null,
    TransactionStatusId int not null,
    ErrorLocation varchar(255),
    ErrorMsg varchar(255),
    Fullfilled boolean,
    Deleted boolean,
    Paid boolean not null,
    PaymentDate DateTime not null,
    CONSTRAINT FK_OrderShipping
    FOREIGN KEY (ShipperId) REFERENCES Shipper(ShipperId),
    CONSTRAINT FK_OrderStatus
    FOREIGN KEY (TransactionStatusId) REFERENCES Status(StatusId),
    CONSTRAINT FK_OrderPayment
    FOREIGN KEY (PaymentId) REFERENCES Payment(PaymentId),
    CONSTRAINT FK_CustomerOrder
    FOREIGN KEY (CustomerId) REFERENCES Customers(ID)
);
Create Table Categories (
    CategoryId int primary key AUTO_INCREMENT,
    CategoryName varchar(255),
    CategoryDescription varchar(255),
    Picture varbinary(65535),
    Active boolean
);
Create Table Suppliers (
    SupplyId int primary key AUTO_INCREMENT,
    CompanyName varchar(255) not null,
    Address1 varchar(255),
    City varchar(50),
    Phone varchar(50),
    Email varchar(100),
    Discount float,
    Notes varchar(255)
);
Create Table Products(
    ProductId int primary key AUTO_INCREMENT,
    ProductName varchar(255) not null,
    ProductDescription varchar(255) not null,
    SupplierId int not null,
    CategoryId int not null,
    QuantityPerUnits int not null,
    UnitPrice float not null,
    AvailableSize varchar(100),
    AvailableColor varchar(100),
    UnitWeight float not null,
    UnitInStock int not null,
    UnitOnOrder int not null,
    ProductAvailable boolean,
    DiscountAvailable boolean,
    Notes varchar(255),
    CONSTRAINT FK_CategoryProduct
    FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
    CONSTRAINT FK_SupplyProduct
    FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplyId),
    CONSTRAINT CHK_Quantity CHECK (QuantityPerUnits >= 0)
);
Create Table OrderDetails (
    OrderDetailsId int primary key AUTO_INCREMENT,
    OrderId int not null,
    ProductId int not null,
    OrderNumber int not null,
    Price float not null,
    Quantity int not null,
    Discount float,
    Total float,
    Size varchar(100),
    Color varchar(50),
    Fullfilled boolean,
    ShipDate DateTime,
    BillDate DateTime,
    CONSTRAINT FK_OrderDetails
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    CONSTRAINT FK_OrderProduct
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);
INSERT INTO USER (ID, LastName, FirstName, Email, Address, Password) VALUES (1,'ADMIN', 'AD', 'Example@gmail.com', 'Mascot', 'password');