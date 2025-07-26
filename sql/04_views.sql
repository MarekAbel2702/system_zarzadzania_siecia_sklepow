SELECT * FROM stanyMagazynowe;

SELECT * FROM produkty;

CREATE OR ALTER VIEW v_stan_magazynowy AS
SELECT 
	sm.id_sklepu,
	s.miasto,
	sm.id_produktu,
	p.nazwa AS nazwa_produktu,
	sm.ilosc,
	sm.data_ostatniej_dostawy
FROM stanyMagazynowe sm
LEFT JOIN produkty p
ON sm.id_produktu = p.id_produktu
LEFT JOIN sklepy s
ON sm.id_sklepu = s.id_sklepu;

SELECT * FROM sprzedaz;

SELECT * FROM sklepy;

CREATE OR ALTER view v_miesieczna_sprzedaz AS
SELECT 
	s.id_sprzedazy,
	sk.miasto,
	YEAR(s.data) AS rok,
CASE  
	WHEN MONTH(s.data) = 1 THEN 'styczeñ'
	WHEN MONTH(s.data) = 2 THEN 'luty'
	WHEN MONTH(s.data) = 3 THEN 'marzec'
	WHEN MONTH(s.data) = 4 THEN 'kwiecieñ'
	WHEN MONTH(s.data) = 5 THEN 'maj'
	WHEN MONTH(s.data) = 6 THEN 'czerwiec'
	WHEN MONTH(s.data) = 7 THEN 'lipiec'
	WHEN MONTH(s.data) = 8 THEN 'sierpieñ'
	WHEN MONTH(s.data) = 9 THEN 'wrzesieñ'
	WHEN MONTH(s.data) = 10 THEN 'paŸdziernik'
	WHEN MONTH(s.data) = 11 THEN 'listopad'
	WHEN MONTH(s.data) = 12 THEN 'grudzieñ'
	ELSE 'B³¹d' 
END AS miesiac_sprzedazy,
SUM(s.suma) suma_sprzedazy
FROM sprzedaz s
JOIN sklepy sk
ON s.id_sklepu = sk.id_sklepu
GROUP BY s.id_sprzedazy,sk.miasto, YEAR(s.data),
CASE  
	WHEN MONTH(s.data) = 1 THEN 'styczeñ'
	WHEN MONTH(s.data) = 2 THEN 'luty'
	WHEN MONTH(s.data) = 3 THEN 'marzec'
	WHEN MONTH(s.data) = 4 THEN 'kwiecieñ'
	WHEN MONTH(s.data) = 5 THEN 'maj'
	WHEN MONTH(s.data) = 6 THEN 'czerwiec'
	WHEN MONTH(s.data) = 7 THEN 'lipiec'
	WHEN MONTH(s.data) = 8 THEN 'sierpieñ'
	WHEN MONTH(s.data) = 9 THEN 'wrzesieñ'
	WHEN MONTH(s.data) = 10 THEN 'paŸdziernik'
	WHEN MONTH(s.data) = 11 THEN 'listopad'
	WHEN MONTH(s.data) = 12 THEN 'grudzieñ'
	ELSE 'B³¹d' 
END


SELECT * FROM pracownicy

SELECT * FROM sklepy

CREATE OR ALTER VIEW v_pracownicy_sklepy 
AS
SELECT 
	p.id_pracownika,
	p.imie,
	p.nazwisko,
	p.stanowisko,
	p.status,
	p.pensja,
	s.miasto,
	s.ulica
FROM pracownicy p
LEFT JOIN sklepy s
ON p.id_sklepu = s.id_sklepu;


SELECT * FROM sprzedaz;

SELECT * FROM produkty;

SELECT * FROM sklepy;

CREATE OR ALTER VIEW v_pozycje_sprzedazy_rozszerzone 
AS
SELECT 
	s.id_sprzedazy,
	s.data,
	s.suma,
	p.nazwa,
	p.kategoria,
	ps.ilosc,
	ps.cena,
	sk.miasto,
	sk.ulica
FROM sprzedaz s
JOIN pozycjeSprzedazy ps
ON s.id_sprzedazy = ps.id_sprzedazy
JOIN produkty p
ON ps.id_produktu = p.id_produktu
JOIN sklepy sk
ON s.id_sklepu = sk.id_sklepu;

CREATE OR ALTER VIEW v_zwroty_rozszerzone
AS
SELECT 
	z.id_zwrotu,
	z.ilosc,
	z.powod,
	z.data AS data_zwrotu,
	s.data AS data_sprzedazy,
	s.suma,
	p.nazwa,
	p.kategoria,
	sk.miasto AS sklep
FROM zwroty z
JOIN sprzedaz s
ON z.id_sprzedazy = s.id_sprzedazy
JOIN produkty p 
ON z.id_produktu = p.id_produktu
JOIN sklepy sk
ON s.id_sklepu = sk.id_sklepu;