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

insert customer (cid, cname, cage)
value (1,'minh quan', 10),
(2, 'ngoc oanh', 20),
(3, 'hong ha',50);

INSERT INTO `quanlybanhang`.`order` (`oID`, `cID`, `oDate`) VALUES ('1', '1', '2006-03-21');
INSERT INTO `quanlybanhang`.`order` (`oID`, `cID`, `oDate`) VALUES ('2', '2', '2006-03-23');
INSERT INTO `quanlybanhang`.`order` (`oID`, `cID`, `oDate`) VALUES ('3', '1', '2006-03-16');

INSERT INTO `quanlybanhang`.`product` (`pID`, `pName`, `pPrice`) VALUES ('1', 'May giat', '3');
INSERT INTO `quanlybanhang`.`product` (`pID`, `pName`, `pPrice`) VALUES ('2', 'Tu lanh', '5');
INSERT INTO `quanlybanhang`.`product` (`pID`, `pName`, `pPrice`) VALUES ('3', 'Dieu hoa', '7');
INSERT INTO `quanlybanhang`.`product` (`pID`, `pName`, `pPrice`) VALUES ('4', 'Quat', '1');
INSERT INTO `quanlybanhang`.`product` (`pID`, `pName`, `pPrice`) VALUES ('5', 'Bep dien', '2');

INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('1', '1', '3');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('1', '3', '7');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('1', '4', '2');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('2', '1', '1');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('3', '1', '8');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('2', '5', '4');
INSERT INTO `quanlybanhang`.`orderdetail` (`oID`, `pID`, `odQTY`) VALUES ('2', '3', '3');


select o.oid, c.cid , o.odate
from `order` o join customer c on o.cid = c.cid
;

SELECT c.cname, p.pname, o.odate
FROM customer c INNER JOIN `order` o
ON c.cid = o.cid
INNER JOIN orderdetail od
ON o.oid = od.oid
INNER JOIN product p
ON od.pid = p.pid;

SELECT c.cname
FROM customer c LEFT JOIN `order` o
ON c.cid = o.cid
WHERE o.cid IS NULL;
