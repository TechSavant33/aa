-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 22 Septembre 2023 à 11:54
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_ping`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id_equipe` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `membre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_dominante`
--

CREATE TABLE `etudiant_dominante` (
  `id_utilisateur` int(11) NOT NULL,
  `dominante` varchar(11) NOT NULL,
  `id_equipe` int(11) DEFAULT NULL,
  `id_ping` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant_dominante`
--

INSERT INTO `etudiant_dominante` (`id_utilisateur`, `dominante`, `id_equipe`, `id_ping`) VALUES
(3, 'BDTN', NULL, NULL),
(4, 'gee', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ping`
--

CREATE TABLE `ping` (
  `id_ping` int(11) NOT NULL,
  `nom_ping` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `lien_image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `email`, `password`, `role`) VALUES
(1, 'k', 'g', 'ds@gmail.com', '$2y$12$PaTsrzBP1cLnXguhmKEja.l0RV1qv/OoUzNvMC7XIQbbbeecGRLO.', 2),
(3, 'k', 'g', 'f@gmail.com', '$2y$12$OhEMhz9/NeYOdDPLbQRQcuN7ajaB4DUDRKUL1cRtCaHO1XMZlPQMy', 2),
(4, 'fdss', 'sd', 'ggft@gmail.com', '$2y$12$fPIXKyzZU4hALfh01/PfbujtHpoVAq8wWBh2PBKrKDSmacgM2SrZ2', 2),
(5, 'h', 'h', 'h@gmail.com', '$2y$12$/X6YBZAw7UURI7FXB613E.LPh32n5mwXTLIZPwf4ZHdbm.LyY9skS', 3),
(6, 'z', 'z', 'z@gmail.com', '$2y$12$tlOlPVAWkyryVrLDMxaO1.12edfMLLWd/3QeIOiPOynQOQto/OYHW', 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id_equipe`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `etudiant_dominante`
--
ALTER TABLE `etudiant_dominante`
  ADD UNIQUE KEY `id_equipe` (`id_equipe`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_ping` (`id_ping`);

--
-- Index pour la table `ping`
--
ALTER TABLE `ping`
  ADD PRIMARY KEY (`id_ping`),
  ADD UNIQUE KEY `nom_ping` (`nom_ping`),
  ADD UNIQUE KEY `lien_image` (`lien_image`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `UNIQUE_email` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `equipe`
--
ALTER TABLE `equipe`
  MODIFY `id_equipe` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ping`
--
ALTER TABLE `ping`
  MODIFY `id_ping` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `etudiant_dominante`
--
ALTER TABLE `etudiant_dominante`
  ADD CONSTRAINT `fk_id_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipe` (`id_equipe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_ping` FOREIGN KEY (`id_ping`) REFERENCES `ping` (`id_ping`),
  ADD CONSTRAINT `fk_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
