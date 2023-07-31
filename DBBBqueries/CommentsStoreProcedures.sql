--usp_AddComment:
CREATE PROCEDURE usp_AddComment
    @CommentId INT,
    @PostId INT,
    @UserId INT,
    @Content NVARCHAR(MAX),
    @CreatedOn DATETIME
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Comments WHERE CommentId = @CommentId)
    BEGIN
        INSERT INTO Comments (CommentId, PostId, UserId, Content, CreatedOn)
        VALUES (@CommentId, @PostId, @UserId, @Content, @CreatedOn)
        RETURN @@IDENTITY
    END
    ELSE
    BEGIN
        RETURN -1
    END
END
GO
--usp_UpdateComment:
CREATE PROCEDURE usp_UpdateComment
    @CommentId INT,
    @Content NVARCHAR(MAX)
AS
BEGIN
    UPDATE Comments
    SET Content = @Content
    WHERE CommentId = @CommentId
END
GO
--usp_DeleteComment:
CREATE PROCEDURE usp_DeleteComment
    @CommentId INT
AS
BEGIN
    DELETE FROM Comments WHERE CommentId = @CommentId
END
GO
--usp_GetCommentsByPost:
CREATE PROCEDURE usp_GetCommentsByPost
    @PostId INT
AS
BEGIN
    SELECT * FROM Comments WHERE PostId = @PostId
END
