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

