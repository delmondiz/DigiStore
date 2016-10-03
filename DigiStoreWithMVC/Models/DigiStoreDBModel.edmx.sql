
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/03/2016 17:38:13
-- Generated from EDMX file: F:\ewchr_000\Sheridan\Capstone\DigiStore\DigiStoreWithMVC\Models\DigiStoreDBModel.edmx
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Salt] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [PostalCode] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Items'
CREATE TABLE [dbo].[Items] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [Weight] nvarchar(max)  NOT NULL,
    [OrderId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Reviews'
CREATE TABLE [dbo].[Reviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReviewText] nvarchar(max)  NOT NULL
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
    [Tax] nvarchar(max)  NOT NULL,
    [TotalPrice] nvarchar(max)  NOT NULL,
    [PaymentMethod_Id] int  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Time] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [Country] nvarchar(max)  NOT NULL,
    [PostalCode] nvarchar(max)  NOT NULL,
    [PaymentMethodId] nvarchar(max)  NOT NULL,
    [Order_Id] int  NULL
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

-- Creating foreign key on [OrderId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [FK_OrderItem]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrderItem'
CREATE INDEX [IX_FK_OrderItem]
ON [dbo].[Items]
    ([OrderId]);
GO

-- Creating foreign key on [UserId] in table 'Items'
ALTER TABLE [dbo].[Items]
ADD CONSTRAINT [FK_UserItem]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserItem'
CREATE INDEX [IX_FK_UserItem]
ON [dbo].[Items]
    ([UserId]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------