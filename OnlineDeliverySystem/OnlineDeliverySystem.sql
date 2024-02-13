-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2023 at 06:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `OnlineDeliverySystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `CustomerID` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`CustomerID`, `FullName`, `Password`, `Email`, `PhoneNumber`, `Address`) VALUES
('', '', '', '', '', ''),
('10', 'Mary Davis', 'marypass', 'md@example.com', '0123456789', '890 Oak Lane, CityJ, CountryJ'),
('100', 'sowmya Adavelli', 'sowmya.adavelli@okstate.edu', '4052692509', '310 South Knoblock Street , apt 1', 'adjkfba'),
('12', 'Megha', '', 'Stillwater', '408763221', ''),
('1234', 'sowmya Adavelli', '', 'okc', '4052692550', ''),
('12341', 'ram', 'aghfja', 'ram@gmail.com', '4052692559', '310 South Knoblock Street , apt 1'),
('123452', 'devar', 'ajfghja', 'evar@gmail.com', '4052692555', '310 South Knoblock Street , apt 1'),
('123456', 'divya', 'jskdk', 'divya@gmai.com', '4052692551', '310 South Knoblock Street , apt 1'),
('123487', 'devand', 'hcghch', 'devan@gmail.com', '4052692550', '310 South Knoblock Street , apt 1'),
('125', 'sowmya Adavelli', 'akja', 'sowmya.adavelli@okstate.edu', '4052692509', '310 South Knoblock Street , apt 1'),
('2', 'Jane Smith', 'pwd456', 'jane.smith@gmail.com', '2345678901', '456 Oak Ave, CityB, CountryB'),
('234567', 'Dheeraj', 'qwer', 'dheeraj@oklahoma', '1234123412', '310 South Knoblock Street , apt 1'),
('3', 'Michael Lee', 'password1', 'mlee@example.com', '3456789012', '789 Elm Rd, CityC, CountryC'),
('4', 'Sarah Johnson', 'secure123', 'sj@example.com', '4567890123', '012 Pine Lane, CityD, CountryD'),
('45', 'Deva', 'iopu_', 'deva@okstate.edu', '1234567890', 'H-no : 2-127/46/B , vijayapuri colony , uppal'),
('5', 'David Williams', 'mypwd2023', 'davidw@example.com', '5678901234', '345 Cedar Street,CityE,CountryE'),
('6', ' Lisa Brown', 'lbrown123', 'lb@example.com', '6789012345', '678 Walnut Blvd, CityF, CountryF'),
('65', 'Rithvik Adavelli', '', 'san francisco', '4052693456', ''),
('7', 'Robert Jones', 'robert#23', 'rj@example.com', '7890123456', '901 Maple Way, CityG, CountryG'),
('8', 'Jennifer Wang', 'jwangpass', 'jw@example.com', '8901234567', '234 Birch Road, CityH, CountryH'),
('876', 'sandy', '8764@', '', '4052692550', '310 South Knoblock Street , apt 1'),
('9', 'William Wu', 'wu123', 'wwu@example.com', '9012345678', '567 Spruce Lane, CityI, CountryI');

--
-- Triggers `Customer`
--
DELIMITER $$
CREATE TRIGGER `after_customer_delete` AFTER DELETE ON `Customer` FOR EACH ROW BEGIN
    -- Delete orders associated with the deleted customer
    DELETE FROM Orders WHERE CustomerID = OLD.CustomerID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `customerorderview`
-- (See below for the actual view)
--
CREATE TABLE `customerorderview` (
`CustomerID` varchar(255)
,`FullName` varchar(255)
,`OrderID` varchar(255)
,`Location` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `DeliveryPartner`
--

CREATE TABLE `DeliveryPartner` (
  `PartnerID` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(255) DEFAULT NULL,
  `AvailabilityStatus` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DeliveryPartner`
--

INSERT INTO `DeliveryPartner` (`PartnerID`, `FullName`, `Password`, `Email`, `PhoneNumber`, `AvailabilityStatus`) VALUES
('1', 'David Lee', 'pass123', 'davidlee@example.com', '1234567890', 'Yes'),
('10', 'Matthew Garcia', 'matt#123', 'mgarcia@example.com', '0123456789', 'Yes'),
('1234', 'Madhu', '1234@3', 'm@okstate.edu', '34567890', 'Yes'),
('12345', 'sowmya Adavelli', 'alkfnla', 'sowmya.adavelli@okstate.edu', '4052693456', 'Yes'),
('123456', 'aravind', 'akjgaad', 'aravind@gmail.com', '4052692550', 'Yes'),
('2', 'Sarah Smith', 'pwd456', 'sarah.smith@gmail.com', '2345678901', 'Yes'),
('3', 'Michael Wang', 'password1', 'mwang@example.com', '3456789012', 'No'),
('3454', 'sowmya Adavelli', 'njfajkfa', 'sowmya.adavelli@okstate.edu', '4052692565', 'Yes'),
('4', 'Emily Johnson', 'secure123', 'ejohnson@example.com', '4567890123', 'Yes'),
('5', 'Daniel Kim', 'mypwd2023', 'danielk@example.com', '5678901234', 'No'),
('6', 'Jennifer Wu', 'jwu123', 'jwu@example.com', '6789012345', 'Yes'),
('7', 'Christopher Brown', 'brown#23', 'chris.b@example.com', '7890123456', 'No'),
('8', 'Amanda Nguyen', 'amanda2023', 'anguyen@example.com', '8901234567', 'Yes'),
('9', 'Jessica Davis', 'jessica45', 'davis@example.com', '9012345678', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` varchar(255) NOT NULL,
  `OrderStatus` enum('Picked Up','On the Way','Delivered') DEFAULT NULL,
  `CustomerID` varchar(255) NOT NULL,
  `PartnerID` varchar(255) NOT NULL,
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `OrderStatus`, `CustomerID`, `PartnerID`, `Location`) VALUES
('09806', 'Picked Up', '1234', '1234', 'afafa'),
('09876', 'Picked Up', '1234', '1234', 'ajkfadfa'),
('10', 'Picked Up', '10', '10', '890 Oak Lane, CityJ, CountryJ'),
('1234', 'Picked Up', '1234', '1234', 'okc'),
('123456', 'Picked Up', '1234', '1234', 'delhi'),
('2', 'On the Way', '2', '2', '456 Oak Ave, CityB, CountryB'),
('3', 'Delivered', '3', '3', '789 Elm Rd, CityC, CountryC'),
('4', 'Picked Up', '4', '4', '012 Pine Lane, CityD, CountryD'),
('5', 'On the Way', '5', '5', '345 Cedar Street, CityE, CountryE'),
('6', 'Delivered', '6', '6', '678 Walnut Blvd, CityF, CountryF'),
('65388741c980b', 'Picked Up', '1234', '1234', 'okc'),
('65388cfe33279', 'Picked Up', '1234', '1234', 'india'),
('65388d2d33854', 'Picked Up', '1234', '1234', 'tamil nadu'),
('65388ee37b67f', 'Picked Up', '1234', '1234', 'india'),
('6538968500b0a', 'Picked Up', '1234', '1234', 'ranchi'),
('653896a9c395d', 'Picked Up', '1234', '1234', 'finland'),
('65389704305c1', 'Picked Up', '1234', '1234', 'india'),
('65389e93f32dd', 'Picked Up', '1234', '1234', 'ahjkaaaa'),
('6538a0fef345d', 'Picked Up', '1234', '1234', 'ahjkaaaa'),
('6538a222e3522', 'Picked Up', '1234', '1234', 'aajaa'),
('6538bfaed09a3', 'Picked Up', '1234', '1234', 'san francisco, ca'),
('65391953312ad', 'Picked Up', '1234', '1234', 'delhi'),
('6539197ba2c04', 'Picked Up', '1234', '1234', 'delhi'),
('653919936a330', 'Picked Up', '1234', '1234', 'delhi'),
('653977d232382', 'Picked Up', '1234', '1234', 'jghhj'),
('653977fd61967', 'Picked Up', '1234', '1234', 'adjkfkad'),
('6539783d8f0ed', 'Picked Up', '1234', '1234', 'afda'),
('653978505254d', 'Picked Up', '1234', '1234', 'dfada'),
('653978982e773', 'Picked Up', '1234', '1234', 'afafadf'),
('6539799873cfb', 'Picked Up', '1234', '1234', 'adfad'),
('653979c11ed0e', 'Picked Up', '1234', '1234', 'afdfa'),
('653979d2b4a0b', 'Picked Up', '1234', '1234', 'afaf'),
('653979f7d9460', 'Picked Up', '1234', '1234', 'gu'),
('65397c26007e5', 'Picked Up', '1234', '1234', 'fadfa'),
('65397c9daf6bc', 'Picked Up', '1234', '1234', 'fghj'),
('65398db5b8943', 'Picked Up', '1234', '1234', 'faaf'),
('6539941bacb18', 'Picked Up', '1234', '1234', 'afadfad'),
('65399431bfd4a', 'Picked Up', '1234', '1234', 'afadfa'),
('65399467e12e0', 'Picked Up', '1234', '1234', 'adasdas'),
('653994bca7123', 'Picked Up', '1234', '1234', 'adasd'),
('653994dd46d9b', 'Picked Up', '1234', '1234', 'ads'),
('653994efd4639', 'Picked Up', '1234', '1234', 'asdsa'),
('6539954fd066c', 'Picked Up', '1234', '1234', 'sdsa'),
('65399563af6f0', 'Picked Up', '1234', '1234', 'asda'),
('6539957cf1733', 'Picked Up', '1234', '1234', 'X'),
('653995962563e', 'Picked Up', '1234', '1234', 'ds'),
('653995cf794d7', 'Picked Up', '1234', '1234', 'asd'),
('653995eaa3020', 'Picked Up', '1234', '1234', 'asdasd'),
('653995fb6a9b7', 'Picked Up', '1234', '1234', 'DS'),
('653996484ffa2', 'Picked Up', '1234', '1234', 'ASDAS'),
('6539967d657f6', 'Picked Up', '1234', '1234', 'sds'),
('6539968a974f8', 'Picked Up', '1234', '1234', 'asdd'),
('65399709615bc', 'Picked Up', '1234', '1234', 'dasa'),
('65399744dffb0', 'Picked Up', '1234', '1234', 'aa'),
('653997a15d3a7', 'Picked Up', '1234', '1234', 'asdas'),
('653997cd1db30', 'Picked Up', '1234', '1234', 'dasdas'),
('653997f769ca7', 'Picked Up', '1234', '1234', 'sdasd'),
('65399a11e5ae8', 'Picked Up', '1234', '1234', 'dsa'),
('6539b7f1afcd2', 'Picked Up', '1234', '1234', 'dsa'),
('6539e5d7498ea', 'Picked Up', '1234', '1234', 'adfad'),
('7', 'Picked Up', '7', '7', '901 Maple Way, CityG, CountryG'),
('8', 'On the Way', '8', '8', '234 Birch Road, CityH, CountryH'),
('9', 'Delivered', '9', '9', '567 Spruce Lane, CityI, CountryI');

-- --------------------------------------------------------

--
-- Table structure for table `Package`
--

CREATE TABLE `Package` (
  `PackageID` varchar(255) NOT NULL,
  `OrderID` varchar(255) NOT NULL,
  `Size` enum('SMALL','MEDIUM','LARGE') DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Package`
--

INSERT INTO `Package` (`PackageID`, `OrderID`, `Size`, `Description`) VALUES
('09877 ', '09806', 'SMALL', 'adfkjdf'),
('10', '10', 'SMALL', 'Small package tied with a red ribbon'),
('1234', '1234', 'SMALL', 'cute bag'),
('12354', '1234', 'SMALL', 'description'),
('2', '2', 'MEDIUM', 'Small package wrapped in brown paper'),
('3', '3', 'LARGE', 'Square-shaped box with \"Fragile\" label'),
('4', '4', 'SMALL', 'Light-weight parcel in a cardboard box'),
('5', '5', 'MEDIUM', 'Long cylindrical tube wrapped in plastic'),
('6', '6', 'LARGE', 'Heavy parcel secured with duct tape'),
('65388741c95c4', '65388741c980b', 'SMALL', 'bag'),
('65388cfe33064', '65388cfe33279', 'SMALL', 'small bag'),
('65388d2d3383b', '65388d2d33854', 'SMALL', 'small bag'),
('65388ee37b66a', '65388ee37b67f', 'SMALL', 'small bag'),
('6538968500635', '6538968500b0a', 'SMALL', 'cute bag'),
('653896a9c3524', '653896a9c395d', 'SMALL', 'small cute bag'),
('65389704305a0', '65389704305c1', 'SMALL', 'small bag'),
('65389e93f32bc', '65389e93f32dd', 'SMALL', 'jhjkafbad'),
('6538a0fef3428', '6538a0fef345d', 'SMALL', 'jhjkafbad'),
('6538a222e34ff', '6538a222e3522', 'SMALL', 'afkjafa'),
('6538bfaed0988', '6538bfaed09a3', 'MEDIUM', 'large jimmy'),
('653919533128d', '65391953312ad', 'SMALL', 'good bag'),
('6539197ba2bd5', '6539197ba2c04', 'SMALL', 'good bag'),
('653919936a30f', '653919936a330', 'SMALL', 'good bag'),
('6539799873ce0 ', '6539799873cfb', 'SMALL', 'adfdaf'),
('653979c11ecfc ', '653979c11ed0e', 'SMALL', 'adafa'),
('653979d2b49f9 ', '653979d2b4a0b', 'SMALL', 'afafa'),
('653979f7d944b ', '653979f7d9460', 'SMALL', 'jh'),
('65397c2600471 ', '65397c26007e5', 'SMALL', 'sdfds'),
('65397c9daf693 ', '65397c9daf6bc', 'SMALL', 'fghj'),
('65398db5b8928 ', '65398db5b8943', 'SMALL', 'afaf'),
('6539941baca1a ', '6539941bacb18', 'SMALL', 'sdafaf'),
('65399431bfbdb ', '65399431bfd4a', 'SMALL', 'cafad'),
('65399467e12d9 ', '65399467e12e0', 'SMALL', 'dadad'),
('653994bca703b ', '653994bca7123', 'SMALL', 'arerq'),
('653994dd46d8c ', '653994dd46d9b', 'SMALL', 'asd'),
('653994efd462c ', '653994efd4639', 'SMALL', 'sda'),
('6539954fd0663 ', '6539954fd066c', 'SMALL', 'sds'),
('65399563af5e6 ', '65399563af6f0', 'SMALL', 'sda'),
('6539957cf1729 ', '6539957cf1733', 'SMALL', 'sads'),
('6539959625635 ', '653995962563e', 'SMALL', 'asd'),
('653995cf794cf ', '653995cf794d7', 'SMALL', 'ads'),
('653995eaa3018 ', '653995eaa3020', 'SMALL', 'asdsa'),
('653995fb6a9b0 ', '653995fb6a9b7', 'SMALL', 'sddS'),
('653996484feb9 ', '653996484ffa2', 'SMALL', 'ASDAS'),
('6539967d657e3 ', '6539967d657f6', 'SMALL', 'sds'),
('6539968a974ef ', '6539968a974f8', 'SMALL', 'sda'),
('65399709615ac ', '65399709615bc', 'SMALL', 'asdas'),
('65399744dfe31 ', '65399744dffb0', 'SMALL', 'afadf'),
('653997a15d39d ', '653997a15d3a7', 'SMALL', 'sadas'),
('653997cd1db16 ', '653997cd1db30', 'SMALL', 'asda'),
('653997f769c95 ', '653997f769ca7', 'SMALL', 'asdas'),
('65399a11e5ad8 ', '65399a11e5ae8', 'SMALL', 'ada'),
('6539b7f1afcc0 ', '6539b7f1afcd2', 'SMALL', 'ada'),
('6539e5d7498e1 ', '6539e5d7498ea', 'SMALL', 'ddfd'),
('7', '7', 'SMALL', 'Small envelope marked \"Urgent\"'),
('8', '8', 'MEDIUM', 'Flat package covered in bubble wrap'),
('9', '9', 'LARGE', 'Bulky item wrapped in brown packing paper');

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `PaymentID` varchar(255) NOT NULL,
  `Amount` double DEFAULT NULL,
  `PaymentMethod` enum('Card','Cash') DEFAULT NULL,
  `PaymentStatus` enum('Success','Fail') DEFAULT NULL,
  `OrderID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`PaymentID`, `Amount`, `PaymentMethod`, `PaymentStatus`, `OrderID`) VALUES
('2', 75.5, 'Cash', 'Success', '2'),
('3', 200, 'Card', 'Success', '3'),
('4', 50, 'Cash', 'Success', '4'),
('5', 120.75, 'Card', 'Success', '5'),
('6', 300, 'Cash', 'Success', '6'),
('7', 30.5, 'Card', 'Success', '7');

-- --------------------------------------------------------

--
-- Structure for view `customerorderview`
--
DROP TABLE IF EXISTS `customerorderview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `onlinedeliverysystem`.`customerorderview`  AS SELECT `c`.`CustomerID` AS `CustomerID`, `c`.`FullName` AS `FullName`, `o`.`OrderID` AS `OrderID`, `o`.`Location` AS `Location` FROM (`onlinedeliverysystem`.`customer` `c` join `onlinedeliverysystem`.`orders` `o` on(`c`.`CustomerID` = `o`.`CustomerID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `DeliveryPartner`
--
ALTER TABLE `DeliveryPartner`
  ADD PRIMARY KEY (`PartnerID`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `PartnerID` (`PartnerID`);

--
-- Indexes for table `Package`
--
ALTER TABLE `Package`
  ADD PRIMARY KEY (`PackageID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`PartnerID`) REFERENCES `DeliveryPartner` (`PartnerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Package`
--
ALTER TABLE `Package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
