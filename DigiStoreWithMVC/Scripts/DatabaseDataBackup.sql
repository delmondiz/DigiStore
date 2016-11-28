--INSERT INTO [dbo].[Users] (UserName, Email, Password, FirstName,
--LastName, Address, City, Country, PostalCode,
--PhoneNumber, StateProv)
--SELECT dbo2.Users.UserName, dbo2.Users.Email, dbo2.Users.[Password], dbo2.Users.FirstName,
--dbo2.Users.LastName, dbo2.Users.[Address], dbo2.Users.City, dbo2.Users.Country, dbo2.Users.PostalCode,
--dbo2.Users.PhoneNumber, dbo2.Users.StateProv FROM [dbo2].[Users];

--INSERT INTO [dbo].[Items] ([Name], [Description],
--[Price], [Weight], [Quantity], [ImagePath])
--SELECT [dbo2].[Items].[Name], [dbo2].[Items].[Description],
--[dbo2].[Items].[Price], [dbo2].[Items].[Weight], [dbo2].[Items].[Quantity], [dbo2].[Items].[ImagePath] from [dbo2].[Items];

--INSERT INTO dbo.Reviews(reviewText, rating, date)
--SELECT dbo2.Reviews.ReviewText, dbo2.Reviews.Rating, dbo2.Reviews.Date FROM dbo2.Reviews;

--INSERT INTO dbo.PaymentMethods (PaymentType, AccountNumber, UserId)
--SELECT dbo2.PaymentMethods.PaymentType, dbo2.PaymentMethods.AccountNumber, dbo2.PaymentMethods.UserId FROM dbo2.PaymentMethods;