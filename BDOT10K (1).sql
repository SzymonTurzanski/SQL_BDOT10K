CREATE TABLE OT_RodzajJednostkiAdministracyjnej (
	ID text primary key,
	Nazwa text not null
	);
	
CREATE TABLE OT_KatDokladnosci (
	ID text primary key,
	Nazwa text not null
	);
CREATE TABLE OT_ZrodloDanych (
	ID text primary key,
	Nazwa text not null
	);
CREATE TABLE OT_RodzajRepGeom (
	ID text primary key,
	Nazwa text not null
	);
CREATE TABLE OT_SkrKarto (
	ID text primary key,
	Nazwa text not null
	);
CREATE TABLE OT_KatIstnienia (
	ID text primary key,
	Nazwa text not null
	);
	
CREATE TABLE OT_RodzajObiektuPrzyrodniczego (
	ID text primary key,
	Nazwa text not null
	);	
	
	
INSERT INTO OT_RodzajJednostkiAdministracyjnej VALUES ( "Pns", "panstwo");
INSERT INTO OT_RodzajJednostkiAdministracyjnej VALUES ( "Pns", "panstwo");
INSERT INTO OT_RodzajJednostkiAdministracyjnej VALUES ( "Pns", "panstwo");


INSERT INTO OT_KatDokladnosci VALUES ( "Dok", "dokladny");
INSERT INTO OT_KatDokladnosci VALUES ( "Prz", "przyblizony");
INSERT INTO OT_KatDokladnosci VALUES ( "Npw", "niepewny");


INSERT INTO OT_ZrodloDanych VALUES ( "GEOS", "bazaDanychGeodezyjnychGrawimetrycznych");
INSERT INTO OT_ZrodloDanych VALUES ( "EGiB", "ewidencjaGruntowIBudynkow");
INSERT INTO OT_ZrodloDanych VALUES ( "GESUT", "geodezyjnaEwidencjaSieciUzbrojeniaTerenu");


INSERT INTO OT_RodzajRepGeom VALUES ( "SG", "srodekGeometryczny");
INSERT INTO OT_RodzajRepGeom VALUES ( "MC", "miejsceCharakterystyczne");
INSERT INTO OT_RodzajRepGeom VALUES ( "PU", "punktUmowny");


INSERT INTO OT_SkrKarto VALUES ( "amb", "ambasada");
INSERT INTO OT_SkrKarto VALUES ( "B", "bank");
INSERT INTO OT_SkrKarto VALUES ( "b.", "brod");

INSERT INTO OT_KatIstnienia VALUES ( "Eks", "eksploatowany");
INSERT INTO OT_KatIstnienia VALUES ( "Bud", "wBudowie");
INSERT INTO OT_KatIstnienia VALUES ( "Zns", "zniszczony");



CREATE TABLE OT_ADJA_A (
	idPRG text not null, 
	idTerytJednostkiNadrzednej text,
	idTerytTerc text not null,
	rodzaj text not null,
	FOREIGN KEY (rodzaj) REFERENCES OT_RodzajJednostkiAdministracyjnej(ID),
	nazwa text not null,
	geometria geom(MultiPolygon, 2180) not null,
	lokalnyId text primary key,
	przestrzenNazw text not null,
	wersjaId text,
	czyObiektBDOO boolean not null,
	x_kod text not null,
	x_katDoklGeom text not null,
	FOREIGN KEY (x_katDoklGeom) REFERENCES OT_KatDokladnosci(ID),
	x_doklGeom float,
	x_zrodloDanychG text not NULL,
	FOREIGN KEY (x_zrodloDanychG) REFERENCES OT_ZrodloDanych(ID),
	x_zrodloDanychA text not null,
	FOREIGN KEY (x_zrodloDanychA) REFERENCES OT_ZrodloDanych(ID),
	x_rodzajRepGeom text not null,
	FOREIGN KEY (x_rodzajRepGeom) REFERENCES OT_RodzajRepGeom(ID),
	x_uwagi text,
	x_uzytkownik text not null,
	x_aktualnoscG date not null,
	x_aktualnoscA date not null,
	koniecWersjiObiektu timestamp,
	poczatekWersjiObiektu timestamp not null,
	x_dataUtworzenia date not null,
	x_informDodatkowa text,
	x_skrKarto text,
	FOREIGN KEY (x_skrKarto) REFERENCES OT_SkrKarto(ID),
	x_katIstnienia text,
	FOREIGN KEY (x_katIstnienia) REFERENCES OT_katIstnienia(ID),
	x_kodKarto10k text,
	x_kodKarto25k text,
	x_kodKarto50k text,
	x_kodKarto100k text,
	x_kodKarto250k text,
	x_kodKarto1000k text
	);


INSERT INTO OT_RodzajObiektuPrzyrodniczego VALUES ( "Dwo", "drzewoGrupaDrzew");
INSERT INTO OT_RodzajObiektuPrzyrodniczego VALUES ( "Gnr", "glazNarzutowyGrupa");
INSERT INTO OT_RodzajObiektuPrzyrodniczego VALUES ( "Kkr", "kepaKrzewow");

CREATE TABLE OT_OIPR_P (
	geometria geom(point, 2180) not null,
	nazwa text,
	pomnikPrzyrody boolean not null,
	rodzaj text not null,
	FOREIGN KEY (rodzaj) REFERENCES OT_RodzajObiektuPrzyrodniczego(ID),
	lokalnyId text primary key,
	przestrzenNazw text not null,
	wersjaId text,
	czyObiektBDOO boolean not null,
	x_kod text not null,
	x_katDoklGeom text not null,
	FOREIGN KEY (x_katDoklGeom) REFERENCES OT_KatDokladnosci(ID),
	x_doklGeom float,
	x_zrodloDanychG text not NULL,
	FOREIGN KEY (x_zrodloDanychG) REFERENCES OT_ZrodloDanych(ID),
	x_zrodloDanychA text not null,
	FOREIGN KEY (x_zrodloDanychA) REFERENCES OT_ZrodloDanych(ID),
	x_rodzajRepGeom text not null,
	FOREIGN KEY (x_rodzajRepGeom) REFERENCES OT_RodzajRepGeom(ID),
	x_uwagi text,
	x_uzytkownik text not null,
	x_aktualnoscG date not null,
	x_aktualnoscA date not null,
	koniecWersjiObiektu timestamp,
	poczatekWersjiObiektu timestamp not null,
	x_dataUtworzenia date not null,
	x_informDodatkowa text,
	x_skrKarto text,
	FOREIGN KEY (x_skrKarto) REFERENCES OT_SkrKarto(ID),
	x_katIstnienia text,
	FOREIGN KEY (x_katIstnienia) REFERENCES OT_katIstnienia(ID),
	x_kodKarto10k text,
	x_kodKarto25k text,
	x_kodKarto50k text,
	x_kodKarto100k text,
	x_kodKarto250k text,
	x_kodKarto1000k text
	);
	
CREATE INDEX IDX_ADJA_A_0 ON OT_ADJA_A (rodzaj);
CREATE INDEX IDX_ADJA_A_1 ON OT_ADJA_A (x_katDoklGeom);
CREATE INDEX IDX_ADJA_A_2 ON OT_ADJA_A (zrodloDanychG);
CREATE INDEX IDX_ADJA_A_3 ON OT_ADJA_A (zrodloDanychA);
CREATE INDEX IDX_ADJA_A_4 ON OT_ADJA_A (x_rodzajRepGeom);
CREATE INDEX IDX_ADJA_A_5 ON OT_ADJA_A (x_skrKarto);
CREATE INDEX IDX_ADJA_A_6 ON OT_ADJA_A (x_katIstnienia);


CREATE INDEX IDX_OIPR_P_0 ON OT_OIPR_P (rodzaj);
CREATE INDEX IDX_OIPR_P_1 ON OT_OIPR_P (x_katDoklGeom);
CREATE INDEX IDX_OIPR_P_2 ON OT_OIPR_P (x_zrodloDanychG);
CREATE INDEX IDX_OIPR_P_3 ON OT_OIPR_P (x_zrodloDanychA);
CREATE INDEX IDX_OIPR_P_3 ON OT_OIPR_P (x_rodzajRepGeom);
CREATE INDEX IDX_OIPR_P_4 ON OT_OIPR_P (x_skrKarto);
CREATE INDEX IDX_OIPR_P_5 ON OT_OIPR_P (x_katIstnienia);

CREATE MATERIALIZED VIEW M_OT_ADJA_A AS 
SELECT lokalnyId AS ID, geometria as GEO ,OTZD.nazwa AS ZDG
FROM OT_ADJA_A AS OTAA
LEFT JOIN OT_ZrodloDanych AS OTZD 
ON OTAA.x_zrodloDanychG = OTZD.ID

CREATE MATERIALIZED VIEW M_OT_OIPR_P AS 
SELECT lokalnyId AS ID, koniecWersjiObiektu AS KWO, OTRR.nazwa AS RR
FROM OT_OIPR_P AS OTOP
LEFT JOIN OT_RodzajRepGeom AS OTRR
ON OTOP.x_rodzajRepGeom = OTRR.ID

CREATE UNIQUE INDEX IDX_M_OT_ADJA_A_ID ON M_OT_ADJA_A (ID);
CREATE INDEX IDX_M_OT_ADJA_A_GEO ON M_OT_ADJA_A USING GIST (GEO);
CREATE INDEX IDX_M_OT_ADJA_A_ZDG ON M_OT_ADJA_A (ZDG);

CREATE UNIQUE INDEX IDX_OT_OIPR_P_ID ON M_OT_OIPR_P (ID);
CREATE INDEX IDX_M_OT_OIPR_P_KWO ON M_OT_OIPR_P (KWO);
CREATE INDEX IDX_M_OT_ADJA_A_RR ON M_OT_OIPR_P (RR);



CREATE OR REPLACE FUNCTION DATAAUTOR()
    RETURNS trigger AS
$BODY$
    BEGIN
    NEW.x_uzytkownik := current_user;
    NEW.x_dataUtworzenia := current_date;
    RETURN NEW;
    END;
$BODY$
    LANGUAGE plpgsql VOLATILE
    COST 100;
    
CREATE TRIGGER TRG_OT_OIPR_P
    AFTER INSERT
    ON OT_OIPR_P
    FOR EACH ROW
    EXECUTE PROCEDURE DATAAUTOR();




