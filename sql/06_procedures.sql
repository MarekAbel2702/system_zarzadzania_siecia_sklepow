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

