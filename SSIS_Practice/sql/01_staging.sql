CREATE DATABASE Staging;
GO
USE Staging;
GO
CREATE TABLE dbo.stg_Customer (
	CustomerID INT,
	FullName NVARCHAR(100),
	Email NVARCHAR(100),
	Country NVARCHAR(50),
	SignupDate DATE
);
CREATE TABLE dbo.err_Customer (
	RawLine NVARCHAR(500),
	ErrorReason NVARCHAR(200),
	LoadedAt DATETIME DEFAULT GETDATE()
);