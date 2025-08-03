CREATE OR ALTER PROCEDURE p_dodaj_sprzedaz
	@id_sklepu INT,
	@id_pracownika INT,
	@data DATETIME2,
	@suma DECIMAL(10, 2)
AS
BEGIN
	INSERT INTO sprzedaz (id_sklepu, id_pracownika, data, suma)
	VALUES (@id_sklepu, @id_pracownika, @data, @suma)

	PRINT 'Dodano sprzedaz z id sklepu: ' +  CAST(@id_sklepu AS VARCHAR(10))
	+ ' id pracownika: ' + CAST(@id_pracownika AS VARCHAR(10))
	+ ' dat¹: ' + CONVERT(VARCHAR, @data, 120)
	+ ' sum¹: ' + CAST(@suma AS VARCHAR(20))

END;

EXEC dbo.p_dodaj_sprzedaz @id_sklepu = 1, @id_pracownika = 2, @data = '2025-07-13 11:00', @suma = 250.00;

CREATE OR ALTER PROCEDURE p_raport_sprzedazy_sklepu
	@id_sklepu INT,
	@data_od DATE,
	@data_do DATE
AS
BEGIN
	SELECT s.id_sprzedazy, 
		s.data, 
		s.suma, 
		p.imie + ' ' + p.nazwisko AS imie_nazwisko_pracownika, 
		p.stanowisko, 
		sk.miasto, 
		sk.region, 
		sk.ulica 
	FROM sprzedaz s
	JOIN pracownicy p ON s.id_pracownika = p.id_pracownika
	JOIN sklepy sk ON s.id_sklepu = sk.id_sklepu
	WHERE @id_sklepu = s.id_sklepu AND s.data BETWEEN @data_od AND @data_do
	ORDER BY s.data DESC;
END;

EXEC p_raport_sprzedazy_sklepu @id_sklepu = 2, @data_od = '2025-07-01', @data_do = '2025-08-01';

CREATE OR ALTER PROCEDURE p_sprawdz_braki_produkty
	@id_sklepu INT,
	@prog_ilosci INT = 20
AS
BEGIN
	SELECT sm.id_produktu, sm.ilosc, p.nazwa FROM stanyMagazynowe sm
	JOIN produkty p ON sm.id_produktu = p.id_produktu
	WHERE @id_sklepu = id_sklepu AND ilosc < @prog_ilosci;
END;

EXEC p_sprawdz_braki_produkty @id_sklepu = 3;