CREATE LOGIN admin_sieci WITH PASSWORD = 'Admin123!';
CREATE LOGIN kierownik_sklepu WITH PASSWORD = 'Kierownik123!';
CREATE LOGIN sprzedawca WITH PASSWORD = 'Sprzedawca123!';

CREATE USER admin_sieci FOR LOGIN admin_sieci;
CREATE USER kierownik_sklepu FOR LOGIN kierownik_sklepu;
CREATE USER sprzedawca FOR LOGIN sprzedawca;

CREATE ROLE rola_admin;
CREATE ROLE rola_kierownik;
CREATE ROLE rola_sprzedawca;

ALTER ROLE rola_admin ADD MEMBER admin_sieci;
ALTER ROLE rola_kierownik ADD MEMBER kierownik_sklepu;
ALTER ROLE rola_sprzedawca ADD MEMBER sprzedawca;

GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::system_zarzadzania_siecia_sklepow TO rola_admin;

GRANT SELECT ON SCHEMA::dbo TO rola_kierownik;
GRANT INSERT, UPDATE, DELETE ON pracownicy TO rola_kierownik;
GRANT INSERT, UPDATE, DELETE ON stanyMagazynowe TO rola_kierownik;

GRANT SELECT ON produkty TO rola_sprzedawca;
GRANT INSERT ON sprzedaz TO rola_sprzedawca;
GRANT INSERT ON pozycjeSprzedazy TO rola_sprzedawca;