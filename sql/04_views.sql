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

