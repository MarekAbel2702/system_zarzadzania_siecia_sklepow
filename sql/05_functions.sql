CREATE OR ALTER FUNCTION oblicz_marze (@id_produktu INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
	DECLARE @marza DECIMAL(10, 2);
	DECLARE @cena_detaliczna DECIMAL(10, 2);
	DECLARE @cena_zakupu DECIMAL(10, 2);

	SELECT @cena_detaliczna = cena_detaliczna, @cena_zakupu = cena_zakupu
	FROM produkty WHERE @id_produktu = id_produktu;

	IF @cena_detaliczna IS NULL OR @cena_detaliczna = 0
		SET @marza = 0
	ELSE
		SET @marza = ((@cena_detaliczna - @cena_zakupu) / @cena_detaliczna) * 100;

	RETURN @marza;
END

SELECT dbo.oblicz_marze(1) AS mar¿a_procent;

CREATE OR ALTER FUNCTION top5_produkty_miesiac (@rok INT, @miesiac INT)
RETURNS TABLE
AS
RETURN
	SELECT TOP 5 p.id_produktu, p.nazwa, SUM(ps.ilosc) AS ilosc_sprzedana FROM produkty p
	JOIN pozycjeSprzedazy ps
	ON p.id_produktu = ps.id_produktu
	JOIN sprzedaz s
	ON ps.id_sprzedazy = s.id_sprzedazy
	WHERE @rok = YEAR(s.data) AND @miesiac = MONTH(s.data)
	GROUP BY p.id_produktu, p.nazwa
	ORDER BY SUM(ps.ilosc) DESC;

SELECT * FROM dbo.top5_produkty_miesiac(2025, 7);

CREATE OR ALTER FUNCTION top_pracownicy_miesiac (@rok INT, @miesiac INT)
RETURNS TABLE 
AS
RETURN 
SELECT 
	p.id_pracownika, 
	p.imie + ' ' +  p.nazwisko AS imie_nazwisko, 
	COUNT(s.id_sprzedazy) AS liczba_transakcji, 
	SUM(s.suma) AS suma_sprzedazy 
FROM pracownicy p
JOIN sprzedaz s
ON p.id_pracownika = s.id_pracownika
WHERE @rok = YEAR(s.data) AND @miesiac = MONTH(s.data)
GROUP BY p.id_pracownika, p.imie, p.nazwisko;

SELECT * FROM dbo.top_pracownicy_miesiac(2025, 7)
ORDER BY suma_sprzedazy DESC;