-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 20 déc. 2023 à 05:07
-- Version du serveur : 8.0.35-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_trajekita`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `ID` int NOT NULL,
  `Location` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Label` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UserID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `ID` int NOT NULL,
  `TripID` int DEFAULT NULL,
  `BookingStatus` enum('Pending','Accepted','Rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `ID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `NotificationContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NotificationStatus` enum('Unread','Read') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `ID` int NOT NULL,
  `UserID` int DEFAULT NULL,
  `TripID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentStatus` enum('Pending','Success','Failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ratingreview`
--

CREATE TABLE `ratingreview` (
  `ID` int NOT NULL,
  `RatedDriverID` int DEFAULT NULL,
  `RatingPassengerID` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Trip`
--

CREATE TABLE `Trip` (
  `ID` int NOT NULL,
  `DepartureLocationLong` double NOT NULL,
  `DepartureLocationLat` double NOT NULL,
  `DestinationLocationLong` double NOT NULL,
  `DestinationLocationLat` double NOT NULL,
  `DepartureDateTime` datetime DEFAULT NULL,
  `AvailableSeats` int DEFAULT NULL,
  `Fare` decimal(10,2) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `VehicleID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Trip`
--

INSERT INTO `Trip` (`ID`, `DepartureLocationLong`, `DepartureLocationLat`, `DestinationLocationLong`, `DestinationLocationLat`, `DepartureDateTime`, `AvailableSeats`, `Fare`, `UserID`, `VehicleID`) VALUES
(2, 123.45, 67.89, 123.45, 67.89, '2023-12-20 14:30:00', 4, '2555.00', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `trip`
--

CREATE TABLE `trip` (
  `ID` int NOT NULL,
  `DepartureLocation` varchar(255) DEFAULT NULL,
  `DestinationLocation` varchar(255) DEFAULT NULL,
  `DepartureDateTime` datetime DEFAULT NULL,
  `AvailableSeats` int DEFAULT NULL,
  `Fare` decimal(10,2) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `VehicleID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `triphistory`
--

CREATE TABLE `triphistory` (
  `ID` int NOT NULL,
  `TripID` int DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `ID` int NOT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `ResetCode` varchar(255) DEFAULT NULL,
  `ResetCodeExpiry` datetime DEFAULT NULL,
  `ProfilePhoto` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`ID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Password`, `ResetCode`, `ResetCodeExpiry`, `ProfilePhoto`, `createdAt`, `updatedAt`) VALUES
(1, 'Parfait', 'Kouame', 'parfait1@gmail.com', '0707070708', '$2b$10$nudGOYVl/q/.cFrATY/V6uA8ZR8u1k3Kxs2Bbs7pR.TzPYbKP56SW', NULL, NULL, NULL, '2023-12-19 10:42:15', '2023-12-19 10:42:15'),
(2, 'Jordan', 'Konan', 'jd@gmail.com', '0505050550', '$2b$10$DF2iMTgT0H0d35gXSH4AA.ZyOH6vqO0X0oP5sd1fxPdIuHZY', NULL, NULL, NULL, '2023-12-19 10:42:52', '2023-12-19 10:42:52'),
(3, 'Jordan', 'Konan', 'kparfait45@gmail.com', '0101010101', '$2b$10$9HsIjyCsx/nYlsOG4r6Mre.XUwv4AsrNwavpGWQxDxiOrlauawpyC', NULL, NULL, NULL, '2023-12-20 02:21:42', '2023-12-20 02:21:42');

-- --------------------------------------------------------

--
-- Structure de la table `Vehicules`
--

CREATE TABLE `Vehicules` (
  `id` int NOT NULL,
  `userId` int DEFAULT NULL,
  `brand` varchar(225) DEFAULT NULL,
  `model` varchar(225) DEFAULT NULL,
  `color` varchar(225) DEFAULT NULL,
  `immatNumber` varchar(225) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Vehicules`
--

INSERT INTO `Vehicules` (`id`, `userId`, `brand`, `model`, `color`, `immatNumber`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'test', 'test', 'noir', '12AZ252525', '2023-12-19 10:28:24', '2023-12-19 10:28:24'),
(3, 1, 'fabio', 'test', 'noir', '12AZ252525', '2023-12-19 10:29:42', '2023-12-19 11:06:50'),
(4, 2, 'Chevrolet', 'K85', 'noir', '2545AZ85', '2023-12-19 10:51:00', '2023-12-19 10:51:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TripID` (`TripID`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`) USING BTREE,
  ADD KEY `TripID` (`TripID`) USING BTREE;

--
-- Index pour la table `ratingreview`
--
ALTER TABLE `ratingreview`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RatedDriverID` (`RatedDriverID`),
  ADD KEY `RatingPassengerID` (`RatingPassengerID`);

--
-- Index pour la table `Trip`
--
ALTER TABLE `Trip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `VehicleID` (`VehicleID`);

--
-- Index pour la table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`) USING BTREE,
  ADD KEY `VehicleID` (`VehicleID`) USING BTREE;

--
-- Index pour la table `triphistory`
--
ALTER TABLE `triphistory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TripID` (`TripID`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `PhoneNumber` (`PhoneNumber`);

--
-- Index pour la table `Vehicules`
--
ALTER TABLE `Vehicules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ratingreview`
--
ALTER TABLE `ratingreview`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Trip`
--
ALTER TABLE `Trip`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `trip`
--
ALTER TABLE `trip`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `triphistory`
--
ALTER TABLE `triphistory`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Vehicules`
--
ALTER TABLE `Vehicules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
