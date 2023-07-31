--usp_RegisterUser:
CREATE PROCEDURE usp_RegisterUser
    @UserId INT,
    @UserName NVARCHAR(50),
    @Password NVARCHAR(100),
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Users WHERE UserId = @UserId)
    BEGIN
        INSERT INTO Users (UserId, UserName, Password, Name, Email, PhoneNumber)
        VALUES (@UserId, @UserName, @Password, @Name, @Email, @PhoneNumber)
        RETURN @@IDENTITY
    END
    ELSE
    BEGIN
        RETURN -1
    END
END
GO
--sp_GetUserById:
CREATE PROCEDURE sp_GetUserById
    @UserId INT
AS
BEGIN
    SELECT * FROM Users WHERE UserId = @UserId
END
GO
--usp_AuthenticateUser:
CREATE PROCEDURE usp_AuthenticateUser
    @UserName NVARCHAR(50),
    @Password NVARCHAR(100)
AS
BEGIN
    DECLARE @UserId INT
    SELECT @UserId = UserId FROM Users WHERE UserName = @UserName AND Password = @Password

    IF @UserId IS NOT NULL
    BEGIN
        RETURN @UserId
    END
    ELSE
    BEGIN
        RETURN 0
    END
END
