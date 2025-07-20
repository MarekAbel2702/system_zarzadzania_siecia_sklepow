INSERT INTO sklepy (miasto, ulica, powierzchnia, region) VALUES
('Warszawa', 'ul. Marsza³kowska 1', 300.00, 'Mazowieckie'),
('Kraków', 'ul. Floriañska 15', 250.00, 'Ma³opolskie'),
('Gdañsk', 'ul. D³uga 22', 270.00, 'Pomorskie');

INSERT INTO pracownicy (id_sklepu, imie, nazwisko, stanowisko, pensja, status) VALUES
(1, 'Anna', 'Kowalska', 'Sprzedawca', 4000.00, 'aktywny'),
(1, 'Jan', 'Nowak', 'Kierownik', 6500.00, 'aktywny'),
(2, 'Ewa', 'Zieliñska', 'Sprzedawca', 3900.00, 'urlop'),
(3, 'Pawe³', 'Wiœniewski', 'Sprzedawca', 4100.00, 'aktywny');

INSERT INTO dostawcy (nazwa, NIP, adres, telefon) VALUES
('FreshFood Sp. z o.o.', '1112233344', 'ul. Ch³odna 11, Warszawa', '600123456'),
('EkoZdrowie S.A.', '2223344455', 'ul. Zielona 3, Poznañ', '601234567'),
('BestDelivery', '3334455566', 'ul. Szybka 77, Wroc³aw', '602345678');

INSERT INTO produkty (nazwa, kategoria, cena_detaliczna, cena_zakupu, status) VALUES
('Mleko 1L', 'Nabia³', 3.49, 2.20, 'aktywny'),
('Chleb pszenno-¿ytni', 'Pieczywo', 4.50, 2.80, 'aktywny'),
('Jajka 10 szt.', 'Nabia³', 7.99, 5.10, 'aktywny'),
('Makaron spaghetti', 'Produkty sypkie', 5.99, 3.20, 'aktywny'),
('Sok pomarañczowy 1L', 'Napoje', 6.49, 4.00, 'wycofany');

INSERT INTO stanyMagazynowe (id_sklepu, id_produktu, ilosc, data_ostatniej_dostawy) VALUES
(1, 1, 120, '2025-07-01'),
(1, 2, 90, '2025-07-03'),
(2, 3, 150, '2025-07-02'),
(3, 4, 200, '2025-07-01'),
(3, 5, 0, '2025-06-15');

INSERT INTO zamowieniaZakupu (dostawca, data_zlozenia, status) VALUES
(1, '2025-07-01', 'zrealizowane'),
(2, '2025-07-05', 'oczekuje'),
(3, '2025-06-28', 'anulowane');

INSERT INTO pozycjeZamowienia (id_zamowienia, id_produktu, ilosc, cena_jednostkowa) VALUES
(1, 1, 100, 2.20),
(1, 2, 50, 2.80),
(2, 3, 80, 5.10),
(3, 4, 60, 3.20);

INSERT INTO sprzedaz (id_sklepu, id_pracownika, data, suma) VALUES
(1, 1, '2025-07-10', 349.00),
(2, 3, '2025-07-11', 250.50),
(3, 4, '2025-07-12', 410.75);

INSERT INTO pozycjeSprzedazy (id_sprzedazy, id_produktu, ilosc, cena) VALUES
(1, 1, 10, 3.49),
(1, 2, 5, 4.50),
(2, 3, 7, 7.99),
(3, 4, 10, 5.99);

INSERT INTO zwroty (id_sprzedazy, id_produktu, ilosc, powod) VALUES
(1, 1, 2, 'Produkt uszkodzony'),
(2, 3, 1, 'Przekroczony termin przydatnoœci');
