-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 27 mai 2021 à 07:23
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exo1`
--
DROP DATABASE IF EXISTS exo1;

CREATE DATABASE exo1;

USE exo1; 
-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `cli_num` int(11) NOT NULL,
  `cli_nom` varchar(50) NOT NULL,
  `cli_adresse` varchar(50) NOT NULL,
  `cli_tel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `com_num` int(11) NOT NULL,
  `cli_num` int(11) NOT NULL,
  `com_date` datetime NOT NULL,
  `com_obs` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `est_compose`
--

CREATE TABLE `est_compose` (
  `com_num` int(11) NOT NULL,
  `pro_num` int(11) NOT NULL,
  `est_qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `pro_num` int(11) NOT NULL,
  `pro_libelle` varchar(50) NOT NULL,
  `pro_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`cli_num`),
  ADD KEY `cli_nom` (`cli_nom`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`com_num`),
  ADD KEY `FK3` (`cli_num`);

--
-- Index pour la table `est_compose`
--
ALTER TABLE `est_compose`
  ADD PRIMARY KEY (`com_num`,`pro_num`),
  ADD KEY `FK1` (`pro_num`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`pro_num`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK3` FOREIGN KEY (`cli_num`) REFERENCES `client` (`cli_num`);

--
-- Contraintes pour la table `est_compose`
--
ALTER TABLE `est_compose`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`pro_num`) REFERENCES `produit` (`pro_num`),
  ADD CONSTRAINT `FK2` FOREIGN KEY (`com_num`) REFERENCES `commande` (`com_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
