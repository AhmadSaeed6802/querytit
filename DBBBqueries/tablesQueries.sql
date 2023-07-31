-- Create the Categories table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Categories')
BEGIN
    CREATE TABLE Categories (
        CategoryId INT PRIMARY KEY,
        CategoryName NVARCHAR(50) NOT NULL
    );
END

-- Create the Users table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE Users (
        UserId INT PRIMARY KEY,
        UserName NVARCHAR(50) NOT NULL,
        Password NVARCHAR(100) NOT NULL,
        Name NVARCHAR(100) NOT NULL,
        Email NVARCHAR(100) NOT NULL,
        PhoneNumber NVARCHAR(20) NOT NULL
    );
END

-- Create the Posts table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Posts')
BEGIN
    CREATE TABLE Posts (
        PostId INT PRIMARY KEY,
        Title NVARCHAR(100) NOT NULL,
        Content NVARCHAR(MAX) NOT NULL,
        UserId INT NOT NULL,
        CategoryId INT NOT NULL,
        PostedDate DATETIME NOT NULL,
        UpdatedDate DATETIME,
        FOREIGN KEY (UserId) REFERENCES Users(UserId),
        FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
    );
END

-- Create the Comments table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Comments')
BEGIN
    CREATE TABLE Comments (
        CommentId INT PRIMARY KEY,
        Content NVARCHAR(MAX) NOT NULL,
        PostId INT NOT NULL,
        UserId INT NOT NULL,
        CreatedOn DATETIME NOT NULL,
        FOREIGN KEY (PostId) REFERENCES Posts(PostId),
        FOREIGN KEY (UserId) REFERENCES Users(UserId)
    );
END
