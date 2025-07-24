ALTER TABLE stanyMagazynowe
ALTER COLUMN id_sklepu int NOT NULL;

ALTER TABLE stanyMagazynowe
ALTER COLUMN id_produktu int NOT NULL;

ALTER TABLE pozycjeZamowienia
ALTER COLUMN id_zamowienia int NOT NULL;

ALTER TABLE pozycjeZamowienia 
ALTER COLUMN id_produktu int NOT NULL;

ALTER TABLE pozycjeSprzedazy
ALTER COLUMN id_sprzedazy int NOT NULL;

ALTER TABLE pozycjeSprzedazy
ALTER COLUMN id_produktu int NOT NULL;

ALTER TABLE pozycjeSprzedazy
ADD CONSTRAINT fk_pozycjeSprzedazy_produkty 
FOREIGN KEY (id_produktu) REFERENCES produkty(id_produktu);

ALTER TABLE pozycjeSprzedazy
ADD CONSTRAINT fk_pozycjeSprzedazy_sprzedaz
FOREIGN KEY (id_sprzedazy) REFERENCES sprzedaz(id_sprzedazy);

ALTER TABLE stanyMagazynowe 
ADD CONSTRAINT fk_stanyMagazynowe_produkty 
FOREIGN KEY (id_produktu) REFERENCES produkty(id_produktu);

ALTER TABLE stanyMagazynowe
ADD CONSTRAINT fk_stanyMagazynowe_sklepy 
FOREIGN KEY (id_sklepu) REFERENCES sklepy(id_sklepu);

ALTER TABLE sprzedaz 
ADD CONSTRAINT fk_sprzedaz_sklepy 
FOREIGN KEY (id_sklepu) REFERENCES sklepy(id_sklepu);

ALTER TABLE sprzedaz
ADD CONSTRAINT fk_sprzedaz_pracownicy
FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika);

ALTER TABLE pracownicy
ADD CONSTRAINT fk_pracownicy_sklepy
FOREIGN KEY (id_sklepu) REFERENCES sklepy(id_sklepu);

ALTER TABLE zwroty
ADD CONSTRAINT fk_zwroty_sprzedaz
FOREIGN KEY (id_sprzedazy) REFERENCES sprzedaz(id_sprzedazy);

ALTER TABLE zwroty
ADD CONSTRAINT fk_zwroty_produkty
FOREIGN KEY (id_produktu) REFERENCES produkty(id_produktu);

ALTER TABLE pozycjeZamowienia
ADD CONSTRAINT fk_pozycjeZamowienia_zamowieniaZakupu
FOREIGN KEY (id_zamowienia) REFERENCES zamowieniaZakupu(id_zamowienia);

ALTER TABLE pozycjeZamowienia
ADD CONSTRAINT fk_pozycjeZamowienia_produkty
FOREIGN KEY (id_produktu) REFERENCES produkty(id_produktu);

ALTER TABLE zamowieniaZakupu
ADD CONSTRAINT fk_zamowieniaZakupu_dostawcy
FOREIGN KEY (dostawca) REFERENCES dostawcy(id_dostawcy);

ALTER TABLE stanyMagazynowe
ADD CONSTRAINT pk_stanyMagazynowe PRIMARY KEY (id_sklepu, id_produktu);

ALTER TABLE pozycjeZamowienia
ADD CONSTRAINT pk_pozycjeZamowienia PRIMARY KEY (id_zamowienia, id_produktu);

ALTER TABLE pozycjeSprzedazy
ADD CONSTRAINT pk_pozycjeSprzdazy PRIMARY KEY (id_sprzedazy, id_produktu);

ALTER TABLE produkty
ADD CONSTRAINT chk_produkty_status CHECK (status IN ('aktywny', 'wycofany'));

ALTER TABLE pracownicy
ADD CONSTRAINT chk_pracownicy_status CHECK (status IN ('aktywny', 'urlop', 'zwolniony'));

CREATE INDEX IX_produkty_kategoria ON produkty(kategoria);
CREATE INDEX IX_stanyMagazynowe_idProduktu ON stanyMagazynowe(id_produktu);