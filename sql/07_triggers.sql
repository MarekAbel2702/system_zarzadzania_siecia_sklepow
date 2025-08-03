CREATE OR ALTER TRIGGER trg_odejmij_stan_po_sprzedazy
ON pozycjeSprzedazy 
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE sm
	SET sm.ilosc = sm.ilosc - ps.ilosc
	FROM stanyMagazynowe sm
	JOIN inserted ps ON sm.id_sklepu = (
		SELECT id_sklepu FROM sprzedaz WHERE id_sprzedazy = ps.id_sprzedazy
	)
	AND sm.id_produktu = ps.id_produktu;

END;

CREATE OR ALTER TRIGGER trg_oddaj_stan_po_usunieciu
ON pozycjeSprzedazy
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE sm
	SET sm.ilosc = sm.ilosc + d.ilosc
	FROM stanyMagazynowe sm
	JOIN deleted d ON sm.id_sklepu = (
		SELECT id_sklepu FROM sprzedaz WHERE id_sprzedazy = d.id_sprzedazy
	)
	AND sm.id_produktu = d.id_produktu;

END;	

CREATE TABLE historiaPensji (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	id_pracownika INT,
	stara_pensja DECIMAL(10, 2),
	nowa_pensja DECIMAL(10, 2),
	data_zmiany DATETIME2 DEFAULT GETDATE()
);

CREATE OR ALTER trigger trg_loguj_zmiane_pensji
ON pracownicy
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO historiaPensji (id_pracownika, stara_pensja, nowa_pensja)
	SELECT
		d.id_pracownika,
		d.pensja,
		i.pensja
		FROM deleted d
		JOIN inserted i ON d.id_pracownika = i.id_pracownika
		WHERE d.pensja <> i.pensja;
END;