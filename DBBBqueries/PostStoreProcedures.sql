--usp_CreatePost:
CREATE PROCEDURE usp_CreatePost
    @PostId INT,
    @UserId INT,
    @Title NVARCHAR(100),
    @Content NVARCHAR(MAX),
    @CategoryId INT,
    @PostedDate DATETIME,
    @UpdatedDate DATETIME
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Posts WHERE PostId = @PostId)
    BEGIN
        INSERT INTO Posts (PostId, UserId, Title, Content, CategoryId, PostedDate, UpdatedDate)
        VALUES (@PostId, @UserId, @Title, @Content, @CategoryId, @PostedDate, @UpdatedDate)
        RETURN @@IDENTITY
    END
    ELSE
    BEGIN
        RETURN -1
    END
END
GO
--usp_GetAllPosts:
CREATE PROCEDURE usp_GetAllPosts
AS
BEGIN
    SELECT * FROM Posts
END
GO
--usp_GetPostById:
CREATE PROCEDURE usp_GetPostById
    @PostId INT
AS
BEGIN
    SELECT * FROM Posts WHERE PostId = @PostId
END
GO
--usp_UpdatePost:
CREATE PROCEDURE usp_UpdatePost
    @PostId INT,
    @Title NVARCHAR(100),
    @Content NVARCHAR(MAX),
    @CategoryId INT
AS
BEGIN
    UPDATE Posts
    SET Title = @Title,
        Content = @Content,
        CategoryId = @CategoryId
    WHERE PostId = @PostId
END
GO
--usp_DeletePost:
CREATE PROCEDURE usp_DeletePost
    @PostId INT
AS
BEGIN
    DELETE FROM Posts WHERE PostId = @PostId
END
GO
--usp_GetPostsByCategory:
CREATE PROCEDURE usp_GetPostsByCategory
    @CategoryId INT
AS
BEGIN
    SELECT * FROM Posts WHERE CategoryId = @CategoryId
END
GO
--usp_GetPostsByUser:
CREATE PROCEDURE usp_GetPostsByUser
    @UserId INT
AS
BEGIN
    SELECT * FROM Posts WHERE UserId = @UserId
END

