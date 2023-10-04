-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Paź 2023, 13:35
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `szkolenia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupa`
--

CREATE TABLE `grupa` (
  `IdSzkolenia` int(11) NOT NULL,
  `Nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Grupa` varchar(3) COLLATE utf8_polish_ci NOT NULL,
  `Datarozpoczecia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `grupa`
--

INSERT INTO `grupa` (`IdSzkolenia`, `Nazwa`, `Grupa`, `Datarozpoczecia`) VALUES
(1, 'Psie przedszkole', 'P1', '2020-10-03'),
(2, 'Posłuszeństwo psa', 'P2', '2020-10-10'),
(3, 'Psie przedszkole', 'P4', '2020-11-07'),
(4, 'Posłuszeństwo psa', 'P3', '2020-11-14');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pies`
--

CREATE TABLE `pies` (
  `Id` int(11) NOT NULL,
  `Idwlasciciela` int(11) DEFAULT NULL,
  `Imie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `Rasa` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `DataUrodzenia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pies`
--

INSERT INTO `pies` (`Id`, `Idwlasciciela`, `Imie`, `Rasa`, `DataUrodzenia`) VALUES
(1, 1, 'Fafik', 'wielorasowy', '2022-10-08'),
(2, 2, 'Pongo', 'owczarek podhalański', '2021-08-07'),
(3, 4, 'Piorun', 'jamnik', '2023-01-02'),
(4, 3, 'Reks', 'wielorasowy', '2022-12-04'),
(5, 1, 'Taran', 'buldog', '2021-08-07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szkolenie`
--

CREATE TABLE `szkolenie` (
  `Id` int(11) NOT NULL,
  `IdPsa` int(11) DEFAULT NULL,
  `IdSzkolenia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `szkolenie`
--

INSERT INTO `szkolenie` (`Id`, `IdPsa`, `IdSzkolenia`) VALUES
(1, 3, 1),
(2, 4, 3),
(3, 2, 4),
(4, 5, 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wlasciciel`
--

CREATE TABLE `wlasciciel` (
  `Id` int(11) NOT NULL,
  `Imie` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `Nazwisko` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `AdresMail` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wlasciciel`
--

INSERT INTO `wlasciciel` (`Id`, `Imie`, `Nazwisko`, `AdresMail`) VALUES
(1, 'Anna', 'Kowalska', 'akowalska@gmail.com'),
(2, 'Jerzy', 'Kruk', 'kruczek@wp.pl'),
(3, 'Piotr', 'Walas', 'pwalas@onet.pl'),
(4, 'Marianna', 'Gotek', 'marianna@gmail.com');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `grupa`
--
ALTER TABLE `grupa`
  ADD PRIMARY KEY (`IdSzkolenia`);

--
-- Indeksy dla tabeli `pies`
--
ALTER TABLE `pies`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Idwlasciciela` (`Idwlasciciela`);

--
-- Indeksy dla tabeli `szkolenie`
--
ALTER TABLE `szkolenie`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdPsa` (`IdPsa`);

--
-- Indeksy dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `grupa`
--
ALTER TABLE `grupa`
  MODIFY `IdSzkolenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `pies`
--
ALTER TABLE `pies`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `szkolenie`
--
ALTER TABLE `szkolenie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `wlasciciel`
--
ALTER TABLE `wlasciciel`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `pies`
--
ALTER TABLE `pies`
  ADD CONSTRAINT `pies_ibfk_1` FOREIGN KEY (`Idwlasciciela`) REFERENCES `wlasciciel` (`Id`);

--
-- Ograniczenia dla tabeli `szkolenie`
--
ALTER TABLE `szkolenie`
  ADD CONSTRAINT `szkolenie_ibfk_1` FOREIGN KEY (`IdPsa`) REFERENCES `pies` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
