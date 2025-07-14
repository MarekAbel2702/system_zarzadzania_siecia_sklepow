CREATE DATABASE system_zarzadzania_siecia_sklepow;

USE system_zarzadzania_siecia_sklepow;

CREATE TABLE sklepy (
	id_sklepu INT PRIMARY KEY IDENTITY(1, 1),
	miasto VARCHAR(100) NOT NULL,
	ulica VARCHAR(100) NOT NULL,
	powierzchnia DECIMAL(8, 2),
	region VARCHAR(150) NOT NULL
);

CREATE TABLE pracownicy (
	id_pracownika INT PRIMARY KEY IDENTITY(1, 1),
	id_sklepu INT,
	imie VARCHAR(100) NOT NULL,
	nazwisko VARCHAR(150) NOT NULL,
	stanowisko VARCHAR(150) NOT NULL,
	pensja DECIMAL(10, 2) NOT NULL,
	data_zatrudnienia DATETIME2 NOT NULL DEFAULT GETDATE(),
	status VARCHAR(100) NOT NULL
);

CREATE TABLE dostawcy (
	id_dostawcy INT PRIMARY KEY IDENTITY(1, 1),
	nazwa VARCHAR(150) NOT NULL,
	NIP VARCHAR(10) NOT NULL UNIQUE,
	adres VARCHAR(150) NOT NULL UNIQUE,
	telefon VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE produkty (
	id_produktu INT PRIMARY KEY IDENTITY(1, 1),
	nazwa VARCHAR(150) NOT NULL,
	kategoria VARCHAR(100) NOT NULL,
	cena_detaliczna DECIMAL(10, 2) NOT NULL,
	cena_zakupu DECIMAL(10, 2) NOT NULL,
	status VARCHAR(100) NOT NULL
);

CREATE TABLE stanyMagazynowe (
	id_sklepu INT,
	id_produktu INT,
	ilosc INT NOT NULL DEFAULT 0,
	data_ostatniej_dostawy DATETIME2 NOT NULL
);

CREATE TABLE zamowieniaZakupu (
	id_zamowienia INT PRIMARY KEY IDENTITY(1, 1),
	dostawca INT,
	data_zlozenia DATETIME2 NOT NULL,
	status VARCHAR(50) CHECK (status IN('oczekuje', 'zrealizowane', 'anulowane'))
);

CREATE TABLE pozycjeZamowienia (
	id_zamowienia INT,
	id_produktu INT,
	ilosc INT NOT NULL DEFAULT 0,
	cena_jednostkowa DECIMAL(10, 2) NOT NULL
);

CREATE TABLE sprzedaz (
	id_sprzedazy INT PRIMARY KEY IDENTITY(1, 1),
	id_sklepu INT,
	id_pracownika INT,
	data DATETIME2 NOT NULL DEFAULT GETDATE(),
	suma DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pozycjeSprzedazy (
	id_sprzedazy INT,
	id_produktu INT,
	ilosc INT NOT NULL DEFAULT 0,
	cena DECIMAL(10, 2) NOT NULL
);

CREATE TABLE zwroty (
	id_zwrotu INT PRIMARY KEY IDENTITY(1, 1),
	id_sprzedazy INT,
	id_produktu INT,
	ilosc INT NOT NULL DEFAULT 0,
	powod TEXT NOT NULL,
	data DATETIME2 NOT NULL DEFAULT GETDATE()
);