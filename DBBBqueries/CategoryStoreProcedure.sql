--usp_CreateCategory:
CREATE PROCEDURE usp_CreateCategory
    @CategoryId INT,
    @CategoryName NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Categories WHERE CategoryId = @CategoryId)
    BEGIN
        INSERT INTO Categories (CategoryId, CategoryName)
        VALUES (@CategoryId, @CategoryName)
        RETURN @@IDENTITY
    END
    ELSE
    BEGIN
        RETURN -1
    END
END
GO
--usp_GetAllCategories:
CREATE PROCEDURE usp_GetAllCategories
AS
BEGIN
    SELECT * FROM Categories
END
GO
--usp_UpdateCategory:
CREATE PROCEDURE usp_UpdateCategory
    @CategoryId INT,
    @CategoryName NVARCHAR(50)
AS
BEGIN
    UPDATE Categories
    SET CategoryName = @CategoryName
    WHERE CategoryId = @CategoryId
END
GO
--usp_DeleteCategory:
CREATE PROCEDURE usp_DeleteCategory
    @CategoryId INT
AS
BEGIN
    DELETE FROM Categories WHERE CategoryId = @CategoryId
END
