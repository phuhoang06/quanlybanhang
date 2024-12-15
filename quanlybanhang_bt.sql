-- Create database
CREATE DATABASE QuanLyBanHang;

-- Use the newly created database
USE QuanLyBanHang;

-- Create Customer table
CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(100),
    cAge INT
);

-- Create Product table
CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(100),
    pPrice DECIMAL(10, 2)
);

-- Create Order table
CREATE TABLE `Order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    oTotalPrice DECIMAL(10, 2),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- Create OrderDetail table
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);
