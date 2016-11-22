
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/22/2016 13:41:00
-- Generated from EDMX file: C:\Users\Kevin\Source\Repos\DigiStore\DigiStoreWithMVC\Models\DigiStoreDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Digistore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserPaymentMethod]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PaymentMethods] DROP CONSTRAINT [FK_UserPaymentMethod];
GO
IF OBJECT_ID(N'[dbo].[FK_UserReview_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserReview] DROP CONSTRAINT [FK_UserReview_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserReview_Review]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserReview] DROP CONSTRAINT [FK_UserReview_Review];
GO
IF OBJECT_ID(N'[dbo].[FK_UserOrder_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserOrder] DROP CONSTRAINT [FK_UserOrder_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserOrder_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserOrder] DROP CONSTRAINT [FK_UserOrder_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAppointment_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAppointment] DROP CONSTRAINT [FK_UserAppointment_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserAppointment_Appointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserAppointment] DROP CONSTRAINT [FK_UserAppointment_Appointment];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_OrderAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderPaymentMethod]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_OrderPaymentMethod];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItem_Order]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderItem_Order];
GO
IF OBJECT_ID(N'[dbo].[FK_OrderItem_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderItem] DROP CONSTRAINT [FK_OrderItem_Item];
GO
IF OBJECT_ID(N'[dbo].[FK_UserItem_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserItem] DROP CONSTRAINT [FK_UserItem_User];
GO
IF OBJECT_ID(N'[dbo].[FK_UserItem_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserItem] DROP CONSTRAINT [FK_UserItem_Item];
GO
IF OBJECT_ID(N'[dbo].[FK_StoreStoreHours]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[StoreHours] DROP CONSTRAINT [FK_StoreStoreHours];
GO
IF OBJECT_ID(N'[dbo].[FK_UserCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Carts] DROP CONSTRAINT [FK_UserCart];
GO
IF OBJECT_ID(N'[dbo].[FK_UserStore]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Stores] DROP CONSTRAINT [FK_UserStore];
GO
IF OBJECT_ID(N'[dbo].[FK_CartItem_Cart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartItem] DROP CONSTRAINT [FK_CartItem_Cart];
GO
IF OBJECT_ID(N'[dbo].[FK_CartItem_Item]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartItem] DROP CONSTRAINT [FK_CartItem_Item];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Items]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Items];
GO
IF OBJECT_ID(N'[dbo].[Reviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reviews];
GO
IF OBJECT_ID(N'[dbo].[PaymentMethods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PaymentMethods];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[Appointments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appointments];
GO
IF OBJECT_ID(N'[dbo].[Stores]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Stores];
GO
IF OBJECT_ID(N'[dbo].[StoreHours]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StoreHours];
GO
IF OBJECT_ID(N'[dbo].[Carts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Carts];
GO
IF OBJECT_ID(N'[dbo].[UserReview]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserReview];
GO
IF OBJECT_ID(N'[dbo].[UserOrder]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserOrder];
GO
IF OBJECT_ID(N'[dbo].[UserAppointment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserAppointment];
GO
IF OBJECT_ID(N'[dbo].[OrderItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderItem];
GO
IF OBJECT_ID(N'[dbo].[UserItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserItem];
GO
IF OBJECT_ID(N'[dbo].[CartItem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CartItem];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Address] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [Country] nvarchar(max)  NULL,
    [PostalCode] nvarchar(max)  NULL,
    [StateProv] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Price] decimal(18,0)  NOT NULL,
    [Weight] float  NULL,
    [Quantity] int  NOT NULL,
    [ImagePath] nvarchar(max)  NULL,
    [ItemType] nvarchar(max)  NULL,
    [Deleted] bit  NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReviewText] nvarchar(max)  NOT NULL,
    [Rating] int  NOT NULL,
    [Date] datetime  NOT NULL
);
GO

-- Creating table 'PaymentMethods'
CREATE TABLE [dbo].[PaymentMethods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PaymentType] nvarchar(max)  NOT NULL,
    [AccountNumber] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Tax] decimal(18,0)  NOT NULL,
    [TotalPrice] decimal(18,0)  NOT NULL,
    [PaymentMethod_Id] int  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] datetime  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [PostalCode] nvarchar(max)  NOT NULL,
    [Order_Id] int  NULL
);
GO

-- Creating table 'Stores'
CREATE TABLE [dbo].[Stores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [PostalCode] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL,
    [StateProv] nvarchar(max)  NOT NULL,
    [StorePicture] nvarchar(max)  NOT NULL,
    [UserStore_Store_Id] int  NOT NULL
);
GO

-- Creating table 'StoreHours'
CREATE TABLE [dbo].[StoreHours] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StoreId] int  NOT NULL,
    [DayOfTheWeek] nvarchar(max)  NOT NULL,
    [StartTime] datetime  NOT NULL,
    [EndTime] datetime  NOT NULL
);
GO

-- Creating table 'Carts'
CREATE TABLE [dbo].[Carts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserCart_Cart_Id] int  NOT NULL
);
GO

-- Creating table 'UserReview'
CREATE TABLE [dbo].[UserReview] (
    [Users_Id] int  NOT NULL,
    [Reviews_Id] int  NOT NULL
);
GO

-- Creating table 'UserOrder'
CREATE TABLE [dbo].[UserOrder] (
    [Users_Id] int  NOT NULL,
    [Orders_Id] int  NOT NULL
);
GO

-- Creating table 'UserAppointment'
CREATE TABLE [dbo].[UserAppointment] (
    [Users_Id] int  NOT NULL,
    [Appointments_Id] int  NOT NULL
);
GO

-- Creating table 'OrderItem'
CREATE TABLE [dbo].[OrderItem] (
    [Orders_Id] int  NOT NULL,
    [Items_Id] int  NOT NULL
);
GO

-- Creating table 'UserItem'
CREATE TABLE [dbo].[UserItem] (
    [Users_Id] int  NOT NULL,
    [Items_Id] int  NOT NULL
);
GO

-- Creating table 'CartItem'
CREATE TABLE [dbo].[CartItem] (
    [CartItem_Item_Id] int  NOT NULL,
    [Items_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [PK_Items]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reviews'
ALTER TABLE [dbo].[Reviews]
ADD CONSTRAINT [PK_Reviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PaymentMethods'
ALTER TABLE [dbo].[PaymentMethods]
ADD CONSTRAINT [PK_PaymentMethods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Stores'
ALTER TABLE [dbo].[Stores]
ADD CONSTRAINT [PK_Stores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StoreHours'
ALTER TABLE [dbo].[StoreHours]
ADD CONSTRAINT [PK_StoreHours]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [PK_Carts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Users_Id], [Reviews_Id] in table 'UserReview'
ALTER TABLE [dbo].[UserReview]
ADD CONSTRAINT [PK_UserReview]
    PRIMARY KEY CLUSTERED ([Users_Id], [Reviews_Id] ASC);
GO

-- Creating primary key on [Users_Id], [Orders_Id] in table 'UserOrder'
ALTER TABLE [dbo].[UserOrder]
ADD CONSTRAINT [PK_UserOrder]
    PRIMARY KEY CLUSTERED ([Users_Id], [Orders_Id] ASC);
GO

-- Creating primary key on [Users_Id], [Appointments_Id] in table 'UserAppointment'
ALTER TABLE [dbo].[UserAppointment]
ADD CONSTRAINT [PK_UserAppointment]
    PRIMARY KEY CLUSTERED ([Users_Id], [Appointments_Id] ASC);
GO

-- Creating primary key on [Orders_Id], [Items_Id] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [PK_OrderItem]
    PRIMARY KEY CLUSTERED ([Orders_Id], [Items_Id] ASC);
GO

-- Creating primary key on [Users_Id], [Items_Id] in table 'UserItem'
ALTER TABLE [dbo].[UserItem]
ADD CONSTRAINT [PK_UserItem]
    PRIMARY KEY CLUSTERED ([Users_Id], [Items_Id] ASC);
GO

-- Creating primary key on [CartItem_Item_Id], [Items_Id] in table 'CartItem'
ALTER TABLE [dbo].[CartItem]
ADD CONSTRAINT [PK_CartItem]
    PRIMARY KEY CLUSTERED ([CartItem_Item_Id], [Items_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'PaymentMethods'
ALTER TABLE [dbo].[PaymentMethods]
ADD CONSTRAINT [FK_UserPaymentMethod]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPaymentMethod'
CREATE INDEX [IX_FK_UserPaymentMethod]
ON [dbo].[PaymentMethods]
    ([UserId]);
GO

-- Creating foreign key on [Users_Id] in table 'UserReview'
ALTER TABLE [dbo].[UserReview]
ADD CONSTRAINT [FK_UserReview_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Reviews_Id] in table 'UserReview'
ALTER TABLE [dbo].[UserReview]
ADD CONSTRAINT [FK_UserReview_Review]
    FOREIGN KEY ([Reviews_Id])
    REFERENCES [dbo].[Reviews]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserReview_Review'
CREATE INDEX [IX_FK_UserReview_Review]
ON [dbo].[UserReview]
    ([Reviews_Id]);
GO

-- Creating foreign key on [Users_Id] in table 'UserOrder'
ALTER TABLE [dbo].[UserOrder]
ADD CONSTRAINT [FK_UserOrder_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Orders_Id] in table 'UserOrder'
ALTER TABLE [dbo].[UserOrder]
ADD CONSTRAINT [FK_UserOrder_Order]
    FOREIGN KEY ([Orders_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserOrder_Order'
CREATE INDEX [IX_FK_UserOrder_Order]
ON [dbo].[UserOrder]
    ([Orders_Id]);
GO

-- Creating foreign key on [Users_Id] in table 'UserAppointment'
ALTER TABLE [dbo].[UserAppointment]
ADD CONSTRAINT [FK_UserAppointment_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Appointments_Id] in table 'UserAppointment'
ALTER TABLE [dbo].[UserAppointment]
ADD CONSTRAINT [FK_UserAppointment_Appointment]
    FOREIGN KEY ([Appointments_Id])
    REFERENCES [dbo].[Appointments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserAppointment_Appointment'
CREATE INDEX [IX_FK_UserAppointment_Appointment]
ON [dbo].[UserAppointment]
    ([Appointments_Id]);
GO

-- Creating foreign key on [Order_Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_OrderAppointment]
    FOREIGN KEY ([Order_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderAppointment'
CREATE INDEX [IX_FK_OrderAppointment]
ON [dbo].[Appointments]
    ([Order_Id]);
GO

-- Creating foreign key on [PaymentMethod_Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_OrderPaymentMethod]
    FOREIGN KEY ([PaymentMethod_Id])
    REFERENCES [dbo].[PaymentMethods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderPaymentMethod'
CREATE INDEX [IX_FK_OrderPaymentMethod]
ON [dbo].[Orders]
    ([PaymentMethod_Id]);
GO

-- Creating foreign key on [Orders_Id] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItem_Order]
    FOREIGN KEY ([Orders_Id])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Items_Id] in table 'OrderItem'
ALTER TABLE [dbo].[OrderItem]
ADD CONSTRAINT [FK_OrderItem_Item]
    FOREIGN KEY ([Items_Id])
    REFERENCES [dbo].[Items]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItem_Item'
CREATE INDEX [IX_FK_OrderItem_Item]
ON [dbo].[OrderItem]
    ([Items_Id]);
GO

-- Creating foreign key on [Users_Id] in table 'UserItem'
ALTER TABLE [dbo].[UserItem]
ADD CONSTRAINT [FK_UserItem_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Items_Id] in table 'UserItem'
ALTER TABLE [dbo].[UserItem]
ADD CONSTRAINT [FK_UserItem_Item]
    FOREIGN KEY ([Items_Id])
    REFERENCES [dbo].[Items]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserItem_Item'
CREATE INDEX [IX_FK_UserItem_Item]
ON [dbo].[UserItem]
    ([Items_Id]);
GO

-- Creating foreign key on [StoreId] in table 'StoreHours'
ALTER TABLE [dbo].[StoreHours]
ADD CONSTRAINT [FK_StoreStoreHours]
    FOREIGN KEY ([StoreId])
    REFERENCES [dbo].[Stores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StoreStoreHours'
CREATE INDEX [IX_FK_StoreStoreHours]
ON [dbo].[StoreHours]
    ([StoreId]);
GO

-- Creating foreign key on [UserCart_Cart_Id] in table 'Carts'
ALTER TABLE [dbo].[Carts]
ADD CONSTRAINT [FK_UserCart]
    FOREIGN KEY ([UserCart_Cart_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserCart'
CREATE INDEX [IX_FK_UserCart]
ON [dbo].[Carts]
    ([UserCart_Cart_Id]);
GO

-- Creating foreign key on [UserStore_Store_Id] in table 'Stores'
ALTER TABLE [dbo].[Stores]
ADD CONSTRAINT [FK_UserStore]
    FOREIGN KEY ([UserStore_Store_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserStore'
CREATE INDEX [IX_FK_UserStore]
ON [dbo].[Stores]
    ([UserStore_Store_Id]);
GO

-- Creating foreign key on [CartItem_Item_Id] in table 'CartItem'
ALTER TABLE [dbo].[CartItem]
ADD CONSTRAINT [FK_CartItem_Cart]
    FOREIGN KEY ([CartItem_Item_Id])
    REFERENCES [dbo].[Carts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Items_Id] in table 'CartItem'
ALTER TABLE [dbo].[CartItem]
ADD CONSTRAINT [FK_CartItem_Item]
    FOREIGN KEY ([Items_Id])
    REFERENCES [dbo].[Items]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CartItem_Item'
CREATE INDEX [IX_FK_CartItem_Item]
ON [dbo].[CartItem]
    ([Items_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------