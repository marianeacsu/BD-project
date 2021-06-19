---ex 10

CREATE TABLE ANGAJAT
(angajat_id NUMBER CONSTRAINT pk_angajat PRIMARY KEY,
 nume VARCHAR2(15 CHAR) NOT NULL,
 prenume VARCHAR2(15 CHAR) NOT NULL,
 salariu NUMBER NOT NULL,
 data_angajare DATE NOT NULL,
 locatie_id NUMBER,
 hotel_id NUMBER,
 tip_angajat VARCHAR2(15 CHAR) NOT NULL,
 nr_chelner NUMBER,
 nr_menajera NUMBER,
 nr_receptioner NUMBER,
 nr_bucatar NUMBER
);
 
CREATE TABLE CLIENTI
(client_id NUMBER CONSTRAINT pk_clienti PRIMARY KEY,
 nume VARCHAR2(15 CHAR) NOT NULL,
 prenume VARCHAR2(15 CHAR) NOT NULL,
 nr_de_tel VARCHAR2(20 CHAR) NOT NULL,
 locatie_id NUMBER 
);
 
CREATE TABLE LOCATIE
(locatie_id NUMBER CONSTRAINT pk_locatie PRIMARY KEY,
 strada VARCHAR2(50 CHAR) NOT NULL,
 numar NUMBER NOT NULL,
 orasul VARCHAR2(20 CHAR) NOT NULL,
 tara VARCHAR2(20 CHAR) NOT NULL
);
 
CREATE TABLE HOTEL
(hotel_id NUMBER CONSTRAINT pk_hotel PRIMARY KEY,
 nume_hotel VARCHAR2(20 CHAR) NOT NULL,
 stele NUMBER NOT NULL,
 locatie_id NUMBER,
 CONSTRAINT nr_de_stele CHECK (stele <= 7)
);

CREATE TABLE CAMERA
(camera_id NUMBER CONSTRAINT camera_pk PRIMARY KEY,
 etaj NUMBER NOT NULL,
 suprafata NUMBER NOT NULL,
 hotel_id NUMBER,
 CONSTRAINT dimensiune_camera CHECK (suprafata >= 12)
);

CREATE TABLE REZERVARE
(rezervare_id NUMBER CONSTRAINT rezervare_pk PRIMARY KEY,
 checkindata DATE NOT NULL,
 checkoutdata DATE NOT NULL,
 client_id NUMBER,
 camera_id NUMBER,
 nr_receptioner NUMBER REFERENCES ANGAJAT(angajat_id),
 CONSTRAINT date_valide CHECK (checkindata < checkoutdata)
);

CREATE TABLE PLATA
(plata_id NUMBER CONSTRAINT plata_pk PRIMARY KEY,
 nrcard VARCHAR2(20 CHAR) NOT NULL,
 dataexp DATE NOT NULL,
 cvv NUMBER NOT NULL,
 rezervare_id NUMBER,
 CONSTRAINT card_valid CHECK (dataexp > TO_DATE('31/12/2021' , 'DD/MM/YYYY'))
);

CREATE TABLE SPECTACOL
(spectacol_id NUMBER CONSTRAINT spectacol_pk PRIMARY KEY,
 nume_spectacol VARCHAR2(20 CHAR) NOT NULL,
 hotel_id NUMBER,
 organizator_id NUMBER
);

CREATE TABLE FIRMA_ORGANIZARE
(organizator_id NUMBER CONSTRAINT organizator_pk PRIMARY KEY,
 nume_organizator VARCHAR2(20 CHAR) NOT NULL,
 rating NUMBER,
 CONSTRAINT rating_valid CHECK (rating <= 5)
);

CREATE TABLE FACE_CURAT_IN
(nr_menajera NUMBER REFERENCES ANGAJAT(angajat_id),
 camera_id NUMBER REFERENCES CAMERA(camera_id),
 dataincepere DATE NOT NULL,
 dataterminare DATE NOT NULL,
 PRIMARY KEY(nr_menajera, camera_id)
);

CREATE TABLE PRIMESTE
(client_id NUMBER REFERENCES CLIENTI(client_id),
 nr_bucatar NUMBER REFERENCES ANGAJAT(angajat_id),
 nr_chelner NUMBER REFERENCES ANGAJAT(angajat_id)
);




---FOREIGN KEYS---
ALTER TABLE ANGAJAT ADD CONSTRAINT angajat_locatie_fk FOREIGN KEY (locatie_id) REFERENCES LOCATIE (locatie_id);
ALTER TABLE ANGAJAT ADD CONSTRAINT angajat_hotel_fk FOREIGN KEY (hotel_id) REFERENCES HOTEL (hotel_id);
ALTER TABLE CLIENTI ADD CONSTRAINT clienti_locatie_fk FOREIGN KEY (locatie_id) REFERENCES LOCATIE (locatie_id);
ALTER TABLE HOTEL ADD CONSTRAINT hotel_locatie_fk FOREIGN KEY (locatie_id) REFERENCES LOCATIE (locatie_id);
ALTER TABLE CAMERA ADD CONSTRAINT camera_hotel_fk FOREIGN KEY (hotel_id) REFERENCES HOTEL (hotel_id);
ALTER TABLE REZERVARE ADD CONSTRAINT rezervare_camera_fk FOREIGN KEY (camera_id) REFERENCES CAMERA (camera_id);
ALTER TABLE REZERVARE ADD CONSTRAINT rezervare_client_fk FOREIGN KEY (client_id) REFERENCES CLIENTI (client_id);
ALTER TABLE PLATA ADD CONSTRAINT plata_rezervare_fk FOREIGN KEY (rezervare_id) REFERENCES REZERVARE (rezervare_id);
ALTER TABLE SPECTACOL ADD CONSTRAINT spectacol_organizare_fk FOREIGN KEY (organizator_id) REFERENCES FIRMA_ORGANIZARE (organizator_id);
ALTER TABLE SPECTACOL ADD CONSTRAINT spectacol_hotel_fk FOREIGN KEY (hotel_id) REFERENCES HOTEL (hotel_id);
ALTER TABLE "ANGAJAT" MODIFY "PRENUME" VARCHAR2(15) NULL;

---INSERT-URI


INSERT INTO LOCATIE VALUES( 1, 'N.Balcescu', 104, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 2, 'Victoriei', 124, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 3, 'F.Chopin', 143, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 4, 'Dacia', 304, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 5, 'Antipa', 45, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 6, 'Unirii', 64, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 7, 'Nordului', 18, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 8, 'Barajul Arges', 84, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 9, 'N.Iorga', 87, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 10, 'S.Braescu', 98, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 11, 'Kiseleff', 86, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 12, 'I.Campineanu', 154, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 13, 'Batiste', 49, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 14, 'Selari', 73, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 15, 'Smardan', 108, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 16, 'Radului', 7, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 17, 'C.Tanase', 544, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 18, 'Magheru', 1, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 19, 'M.Eminescu', 15, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 20, 'Frumoasa', 30, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 21, 'Gilei', 4, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 22, 'Catedrei', 63, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 23, 'Floreasca', 52, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 24, 'M.Eliade', 39, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 25, 'Fabrica de Glucoza', 84, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 26, 'Libertatii', 81, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 27, 'Stefan cel Mare', 36, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 28, 'Aviatorilor', 100, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 29, 'Aviatiei', 55, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 30, 'Amzei', 77, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 31, 'I.Maniu', 2, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 32, 'Doamnei', 12, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 33, 'Grivitei', 99, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 34, 'Aerogarii', 123, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 35, 'Cantemir', 18, 'Vaslui', 'Romania');
INSERT INTO LOCATIE VALUES( 36, 'A.Ipatescu', 64, 'Vaslui', 'Romania');
INSERT INTO LOCATIE VALUES( 37, 'Bunescu', 189, 'Brasov', 'Romania');
INSERT INTO LOCATIE VALUES( 38, 'Pacii', 74, 'Constanta', 'Romania');
INSERT INTO LOCATIE VALUES( 39, 'Drumul pietruit', 24, 'Galati', 'Romania');
INSERT INTO LOCATIE VALUES( 40, 'C.A.Rosetti', 173, 'Bucuresti', 'Romania');
INSERT INTO LOCATIE VALUES( 41, 'M.Kogalniceanu', 49, 'Vaslui', 'Romania');
INSERT INTO LOCATIE VALUES( 42, 'Traian', 5, 'Bacau', 'Romania');


INSERT INTO HOTEL VALUES( 1, 'Novotel', 5, 1);
INSERT INTO HOTEL VALUES( 2, 'Intercontinental', 4, 2);
INSERT INTO HOTEL VALUES( 3, 'Ramada', 4, 3);
INSERT INTO HOTEL VALUES( 4, 'Trevi', 3, 4);
INSERT INTO HOTEL VALUES( 5, 'Plaza', 5, 5);


INSERT INTO ANGAJAT VALUES( 10, 'Roman', 'Alexandru', 7000, TO_DATE('25/10/2015' , 'DD/MM/YYYY'), 6, 1, 'chelner', 1, NULL, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 11, 'Dudau', 'Vlad', 6500, TO_DATE('13/12/2017' , 'DD/MM/YYYY'), 7, 1, 'chelner', 2, NULL, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 12, 'Mindrescu', 'Albert', 10000, TO_DATE('27/11/2018' , 'DD/MM/YYYY'), 8, 1, 'bucatar', NULL, NULL, NULL, 1);
INSERT INTO ANGAJAT VALUES( 13, 'Leuca', 'Florin', 12000, TO_DATE('10/10/2011' , 'DD/MM/YYYY'), 9, 1, 'bucatar', NULL, NULL, NULL, 2);
INSERT INTO ANGAJAT VALUES( 14, 'Dexamir', 'Vlad', 5000, TO_DATE('25/10/2020' , 'DD/MM/YYYY'), 10, 1, 'receptioner', NULL, NULL, 1, NULL);
INSERT INTO ANGAJAT VALUES( 15, 'Epure', NULL, 6700, TO_DATE('25/10/2019' , 'DD/MM/YYYY'), 11, 1, 'receptioner', NULL, NULL, 2, NULL);
INSERT INTO ANGAJAT VALUES( 16, 'Dumitrescu', 'Malina', 4000, TO_DATE('18/12/2018' , 'DD/MM/YYYY'), 12, 1, 'menajera', NULL, 1, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 17, 'Sandu', 'Simona', 3500, TO_DATE('25/10/2020' , 'DD/MM/YYYY'), 13, 1, 'menajera', NULL, 2, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 20, 'Draghici', NULL, 6000, TO_DATE('19/10/2020' , 'DD/MM/YYYY'), 14, 2, 'chelner', 3, NULL, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 21, 'Agachi', 'Sergiu', 6200, TO_DATE('24/10/2017' , 'DD/MM/YYYY'), 15, 2, 'bucatar', NULL, NULL, NULL, 3);
INSERT INTO ANGAJAT VALUES( 22, 'Popescu', 'Radu', 5000, TO_DATE('12/12/2018' , 'DD/MM/YYYY'), 16, 2, 'receptioner', NULL, NULL, 3, NULL);
INSERT INTO ANGAJAT VALUES( 23, 'Larion', 'Emilia', 4500, TO_DATE('10/11/2020' , 'DD/MM/YYYY'), 17, 2, 'menajera', NULL, 3, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 30, 'Ionescu', 'Bogdan', 3600, TO_DATE('10/04/2021' , 'DD/MM/YYYY'), 18, 3, 'chelner', 4, NULL, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 31, 'Vulpe', 'Robert', 5400, TO_DATE('25/10/2017' , 'DD/MM/YYYY'), 19, 3, 'bucatar', NULL, NULL, NULL, 4);
INSERT INTO ANGAJAT VALUES( 32, 'Dumitru', 'Ion', 4500, TO_DATE('22/12/2018' , 'DD/MM/YYYY'), 20, 3, 'receptioner', NULL, NULL, 4, NULL);
INSERT INTO ANGAJAT VALUES( 33, 'Popa', 'Alexandra', 5400, TO_DATE('23/12/2016' , 'DD/MM/YYYY'), 21, 3, 'menajera', NULL, 4, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 40, 'Cozma', 'Catalin', 4300, TO_DATE('11/10/2018' , 'DD/MM/YYYY'), 22, 4, 'chelner', 5, NULL, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 41, 'Por', 'Andrei', 6700, TO_DATE('13/11/2015' , 'DD/MM/YYYY'), 23, 4, 'bucatar', NULL, NULL, NULL, 5);
INSERT INTO ANGAJAT VALUES( 42, 'Tudose', 'Matei', 7800, TO_DATE('26/10/2015' , 'DD/MM/YYYY'), 24, 4, 'bucatar', NULL, NULL, NULL, 6);
INSERT INTO ANGAJAT VALUES( 43, 'Rom', 'Andrei', 7500, TO_DATE('22/11/2015' , 'DD/MM/YYYY'), 25, 4, 'receptioner', NULL, NULL, 5, NULL);
INSERT INTO ANGAJAT VALUES( 44, 'Costan', 'Maria', 3700, TO_DATE('27/10/2020' , 'DD/MM/YYYY'), 26, 4, 'menajera', NULL, 5, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 45, 'David', 'Olivia', 4000, TO_DATE('28/12/2019' , 'DD/MM/YYYY'), 27, 4, 'menajera', NULL, 6, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 50, 'Anghel', 'Alexandru', 6500, TO_DATE('25/12/2017' , 'DD/MM/YYYY'), 28, 5, 'chelner', 6, NULL, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 51, 'Costache', 'Calin', 7200, TO_DATE('25/09/2019' , 'DD/MM/YYYY'), 29, 5, 'bucatar', NULL, NULL, NULL, 7);
INSERT INTO ANGAJAT VALUES( 52, 'Usu', 'Alin', 6500, TO_DATE('15/05/2015' , 'DD/MM/YYYY'), 30, 5, 'receptioner', NULL, NULL, 6, NULL);
INSERT INTO ANGAJAT VALUES( 53, 'Mitrof', 'Ozzy', 5400, TO_DATE('25/03/2020' , 'DD/MM/YYYY'), 31, 5, 'receptioner', NULL, NULL, 7, NULL);
INSERT INTO ANGAJAT VALUES( 54, 'Cazacu', 'Bianca', 4500, TO_DATE('20/02/2017' , 'DD/MM/YYYY'), 32, 5, 'menajera', NULL, 7, NULL, NULL);
INSERT INTO ANGAJAT VALUES( 55, 'Ababei', 'Tania', 3700, TO_DATE('25/09/2019' , 'DD/MM/YYYY'), 33, 5, 'menajera', NULL, 8, NULL, NULL);

INSERT INTO CAMERA VALUES( 101, 2, 20, 1);
INSERT INTO CAMERA VALUES( 102, 3, 14, 1);
INSERT INTO CAMERA VALUES( 103, 4, 17, 1);
INSERT INTO CAMERA VALUES( 104, 4, 15, 1);
INSERT INTO CAMERA VALUES( 105, 3, 13, 1);
INSERT INTO CAMERA VALUES( 100, 2, 18, 1);
INSERT INTO CAMERA VALUES( 200, 3, 14, 2);
INSERT INTO CAMERA VALUES( 201, 2, 16, 2);
INSERT INTO CAMERA VALUES( 202, 1, 15, 2);
INSERT INTO CAMERA VALUES( 300, 3, 25, 3);
INSERT INTO CAMERA VALUES( 301, 2, 13, 3);
INSERT INTO CAMERA VALUES( 302, 1, 14, 3);
INSERT INTO CAMERA VALUES( 303, 3, 22, 3);
INSERT INTO CAMERA VALUES( 400, 2, 21, 4);
INSERT INTO CAMERA VALUES( 401, 3, 14, 4);
INSERT INTO CAMERA VALUES( 500, 1, 19, 5);
INSERT INTO CAMERA VALUES( 501, 2, 20, 5);
INSERT INTO CAMERA VALUES( 502, 3, 27, 5);
INSERT INTO CAMERA VALUES( 503, 2, 21, 5);

INSERT INTO CLIENTI VALUES( 1000, 'Ionescu', 'Ion', '0765000345', 34);
INSERT INTO CLIENTI VALUES( 1001, 'Popa', 'Bianca', '0775100345', 35);
INSERT INTO CLIENTI VALUES( 1002, 'Cazacu', 'Rares', '0725012345', 36);
INSERT INTO CLIENTI VALUES( 2000, 'Sos', 'Daniela', '0725000789', 37);
INSERT INTO CLIENTI VALUES( 2001, 'Popescu', 'Iulian', '0721200345', 38);
INSERT INTO CLIENTI VALUES( 3000, 'Dinu', 'Eugen', '0755075345', 39);
INSERT INTO CLIENTI VALUES( 4000, 'Bosin', 'Ana', '0737034345', 40);
INSERT INTO CLIENTI VALUES( 5000, 'Crudu', 'Elena', '0745023345', 41);
INSERT INTO CLIENTI VALUES( 5001, 'Pais', 'Roxana', '0723560345', 42);

INSERT INTO REZERVARE VALUES( 10000, TO_DATE('25/06/2021' , 'DD/MM/YYYY'), TO_DATE('27/06/2021' , 'DD/MM/YYYY'), 1000, 101, 14);
INSERT INTO REZERVARE VALUES( 10001, TO_DATE('12/07/2021' , 'DD/MM/YYYY'), TO_DATE('17/07/2021' , 'DD/MM/YYYY'), 1001, 104, 15);
INSERT INTO REZERVARE VALUES( 10002, TO_DATE('10/06/2021' , 'DD/MM/YYYY'), TO_DATE('13/06/2021' , 'DD/MM/YYYY'), 1002, 102, 14);
INSERT INTO REZERVARE VALUES( 20000, TO_DATE('25/05/2021' , 'DD/MM/YYYY'), TO_DATE('27/05/2021' , 'DD/MM/YYYY'), 2000, 201, 22);
INSERT INTO REZERVARE VALUES( 30000, TO_DATE('14/06/2021' , 'DD/MM/YYYY'), TO_DATE('20/06/2021' , 'DD/MM/YYYY'), 3000, 302, 32);
INSERT INTO REZERVARE VALUES( 40000, TO_DATE('24/08/2021' , 'DD/MM/YYYY'), TO_DATE('27/08/2021' , 'DD/MM/YYYY'), 4000, 401, 43);
INSERT INTO REZERVARE VALUES( 50000, TO_DATE('18/10/2021' , 'DD/MM/YYYY'), TO_DATE('26/10/2021' , 'DD/MM/YYYY'), 5000, 501, 52);
INSERT INTO REZERVARE VALUES( 50001, TO_DATE('25/06/2021' , 'DD/MM/YYYY'), TO_DATE('27/06/2021' , 'DD/MM/YYYY'), 5001, 502, 53);
INSERT INTO REZERVARE VALUES( 50002, TO_DATE('25/10/2021' , 'DD/MM/YYYY'), TO_DATE('29/10/2021' , 'DD/MM/YYYY'), 5001, 502, 52);


INSERT INTO PLATA VALUES( 1100, '458797801234', TO_DATE('25/09/2022' , 'DD/MM/YYYY'), 765, 10000);
INSERT INTO PLATA VALUES( 1200, '128756801234', TO_DATE('15/10/2025' , 'DD/MM/YYYY'), 976, 10001);
INSERT INTO PLATA VALUES( 1300, '400797801173', TO_DATE('13/09/2023' , 'DD/MM/YYYY'), 895, 10002);
INSERT INTO PLATA VALUES( 2100, '887912012672', TO_DATE('22/12/2024' , 'DD/MM/YYYY'), 711, 20000);
INSERT INTO PLATA VALUES( 3100, '558711804434', TO_DATE('29/11/2023' , 'DD/MM/YYYY'), 461, 30000);
INSERT INTO PLATA VALUES( 4100, '888227801114', TO_DATE('14/09/2026' , 'DD/MM/YYYY'), 532, 40000);
INSERT INTO PLATA VALUES( 5100, '158792801231', TO_DATE('15/10/2023' , 'DD/MM/YYYY'), 115, 50000);
INSERT INTO PLATA VALUES( 5200, '768791101234', TO_DATE('22/09/2025' , 'DD/MM/YYYY'), 987, 50001);

INSERT INTO FIRMA_ORGANIZARE VALUES( 99, 'FUNNY', 4);
INSERT INTO FIRMA_ORGANIZARE VALUES( 98, 'HAPPY', 5);
INSERT INTO FIRMA_ORGANIZARE VALUES( 97, 'GOODTIMES', 3);
INSERT INTO FIRMA_ORGANIZARE VALUES( 96, 'PEACE', 2);
INSERT INTO FIRMA_ORGANIZARE VALUES( 95, 'CORAL', 5);

INSERT INTO SPECTACOL VALUES( 991, 'Dineu cu prosti', 1, 99);
INSERT INTO SPECTACOL VALUES( 981, 'Take, Ianke si Cadir', 2, 98);
INSERT INTO SPECTACOL VALUES( 971, 'O noapte furtunoasa', 3, 97);
INSERT INTO SPECTACOL VALUES( 961, 'O scrisoare pierduta', 4, 96);
INSERT INTO SPECTACOL VALUES( 951, 'Gaitele', 5, 95);


INSERT INTO FACE_CURAT_IN VALUES( 16, 101, TO_DATE('27/05/2021' , 'DD/MM/YYYY'), TO_DATE('28/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 17, 101, TO_DATE('27/05/2021' , 'DD/MM/YYYY'), TO_DATE('28/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 16, 104, TO_DATE('28/05/2021' , 'DD/MM/YYYY'), TO_DATE('29/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 16, 103, TO_DATE('29/05/2021' , 'DD/MM/YYYY'), TO_DATE('30/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 17, 100, TO_DATE('25/05/2021' , 'DD/MM/YYYY'), TO_DATE('26/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 23, 201, TO_DATE('26/05/2021' , 'DD/MM/YYYY'), TO_DATE('27/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 23, 202, TO_DATE('28/05/2021' , 'DD/MM/YYYY'), TO_DATE('29/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 23, 200, TO_DATE('27/05/2021' , 'DD/MM/YYYY'), TO_DATE('28/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 33, 302, TO_DATE('25/05/2021' , 'DD/MM/YYYY'), TO_DATE('26/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 33, 301, TO_DATE('26/05/2021' , 'DD/MM/YYYY'), TO_DATE('27/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 33, 300, TO_DATE('27/05/2021' , 'DD/MM/YYYY'), TO_DATE('28/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 44, 401, TO_DATE('26/05/2021' , 'DD/MM/YYYY'), TO_DATE('27/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 45, 400, TO_DATE('27/05/2021' , 'DD/MM/YYYY'), TO_DATE('28/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 45, 401, TO_DATE('26/05/2021' , 'DD/MM/YYYY'), TO_DATE('27/05/2021' , 'DD/MM/YYYY'));
INSERT INTO FACE_CURAT_IN VALUES( 44, 400, TO_DATE('29/05/2021' , 'DD/MM/YYYY'), TO_DATE('30/05/2021' , 'DD/MM/YYYY'));

INSERT INTO PRIMESTE VALUES( 1000, 12, 10);
INSERT INTO PRIMESTE VALUES( 1001, 13, 11);
INSERT INTO PRIMESTE VALUES( 1002, 12, 11);
INSERT INTO PRIMESTE VALUES( 1001, 12, 10);
INSERT INTO PRIMESTE VALUES( 1001, 13, 10);
INSERT INTO PRIMESTE VALUES( 1000, 13, 11);
INSERT INTO PRIMESTE VALUES( 1000, 12, 11);
INSERT INTO PRIMESTE VALUES( 1002, 13, 11);
INSERT INTO PRIMESTE VALUES( 1002, 12, 10);
INSERT INTO PRIMESTE VALUES( 2000, 21, 20);
INSERT INTO PRIMESTE VALUES( 3000, 31, 30);
INSERT INTO PRIMESTE VALUES( 4000, 41, 40);
INSERT INTO PRIMESTE VALUES( 4000, 42, 40);
INSERT INTO PRIMESTE VALUES( 5000, 51, 50);
INSERT INTO PRIMESTE VALUES( 5001, 51, 50);

commit;

---EX11
/*
Afisati id-ul, numele, prenumele , numele hotelului la care lucreaza si de cate ori au efectuat curatenie in camere menajerele.
Se va afisa in ordine descrescatoare dupa numarul de curatari.

-join pe cel putin 4 tabele, ordonari, functie grup (COUNT), grupare de date

*/

SELECT COUNT(CAMERA.camera_id) numar_curatari, ANGAJAT.angajat_id, ANGAJAT.nume, ANGAJAT.prenume, HOTEL.nume_hotel
FROM ANGAJAT
JOIN FACE_CURAT_IN
ON ANGAJAT.angajat_id = FACE_CURAT_IN.nr_menajera
JOIN CAMERA
ON FACE_CURAT_IN.camera_id = CAMERA.camera_id
JOIN HOTEL
ON CAMERA.hotel_id = HOTEL.hotel_id
GROUP BY ANGAJAT.angajat_id, ANGAJAT.nume, ANGAJAT.prenume,  HOTEL.nume_hotel
ORDER BY numar_curatari DESC;


/*
Afisati id-ul angajatului de tip receptioner, numarul receptionerului, numele hotelului, numarul de stele, numele si prenumele
pentru receptionerii care au preluat minim o rezervare. Numele si prenumele se vor afisa pe o coloana numita "Nume Prenume", iar numele
va fi afisat cu litere mari. Daca angajatul nu are prenumele trecut, se va afisat textul "Fara prenume".

- subcerere nesincronizata in care intervin cel putin 3 tabele( ANGAJAT, HOTEL, REZERVARE), doua functii pe siruri de caractere(CONCAT si UPPER), NVL, filtare la nivel de linii
*/


SELECT a.angajat_id, a.nr_receptioner, h.nume_hotel, h.stele, CONCAT(CONCAT(CONCAT( UPPER(a.nume), ' '), NVL(a.prenume, 'Fara prenume')),' ') AS "Nume Prenume"
FROM ANGAJAT a
JOIN HOTEL h
ON a.hotel_id = h.hotel_id
WHERE a.angajat_id IN (SELECT r.nr_receptioner
                       FROM REZERVARE r
                       WHERE r.nr_receptioner IN( SELECT nr_receptioner FROM REZERVARE))
ORDER BY 1;


/*
Sa se afiseze id-ul, numele, adresa (strada, numarul, orasul), numarul de angajati
pentru hotelurile in care lucreaza mai putin de 6 angajati.

- subcerere nesincronizata cu 3 tabele, grupari de date, functii grup, filtrare la nivel de grupuri

*/

SELECT a.hotel_id, h.nume_hotel, l.strada, l.numar, l.orasul, COUNT(*)
FROM HOTEL h
JOIN LOCATIE l
ON h.locatie_id = l.locatie_id
JOIN ANGAJAT a
ON (h.hotel_id = a.hotel_id)
WHERE a.hotel_id IN (SELECT hotel_id
                     FROM ANGAJAT
                     GROUP BY hotel_id
                     HAVING COUNT(*) < 6)
GROUP BY a.hotel_id, h.nume_hotel, l.strada, l.numar, l.orasul;



/*
Sa se afiseze id-ul hotelurilor, numele hotelurilor si id-ul camerelor ce au fost rezervate macar o data ce apartin hotelurilor de 5 stele.
 
 -subcerere sincronizata cu 3 tabele, grupari de date, filtrare la nivel de linii
*/


SELECT  c.hotel_id, h.nume_hotel, c.camera_id
FROM HOTEL h
JOIN CAMERA c
ON (h.hotel_id = c.hotel_id)
WHERE c.camera_id IN (SELECT camera_id
                      FROM REZERVARE
                      WHERE c.camera_id = camera_id AND c.hotel_id IN (SELECT hotel_id FROM HOTEL WHERE stele = 5)
                      GROUP BY camera_id)
GROUP BY c.hotel_id, h.nume_hotel, c.camera_id;



/*
Afisati id-ul, numele, prenumele si oferiti statut angajatilor in functie de vechimea in hotel. 
Daca au mai putin de un an se va afisa NOU VENIT, daca au intre un an si 2 se va afisa INCEPATOR,
pentru cei care au vechime mai mare de 2 ani si mai mica de 3 ani se afiseaza MID, iar pentru cei cu vechime mai mare de 4 ani se va afisa SENIOR.
Pentru angajatii hotelului Plaza afisati si data de angajare.
-CASE, DECODE, doua functii pe date calendaristice
*/
SELECT a.angajat_id, a.nume, a.prenume, DECODE(ROUND((MONTHS_BETWEEN(SYSDATE, a.data_angajare)/12)), 0, 'NOU VENIT', 1, 'INCEPATOR', 2, 'MID', 3, 'AVANSAT', 4, 'SENIOR', 5, 'SENIOR', 6, 'SENIOR', 7, 'SENIOR', 8, 'SENIOR', 9, 'SENIOR', 10, 'SENIOR') as "Experienta",
CASE (h.nume_hotel)
WHEN 'Plaza' THEN a.data_angajare
ELSE NULL
END AS "DATA DE ANGAJARE"
FROM ANGAJAT a
JOIN HOTEL h
ON a.hotel_id = h.hotel_id
ORDER BY 1;

/*
Sa se afiseze id-ul, suprafata, etajul la care se afla camerele si id-ul hotelurilor din care fac parte pentru hotelurile de 5 stele.
Se vor afisa doar camerele care se afla la etajul cel mai mic.

-WITH, functie grup
*/


WITH camere_hotel AS (SELECT camera_id, suprafata, hotel_id, etaj
            FROM CAMERA 
            WHERE hotel_id IN (SELECT hotel_id
                         FROM HOTEL
                         WHERE stele = 5)),

camera_2 AS (SELECT camera_id
        FROM camere_hotel
        WHERE etaj = (SELECT MIN(etaj) FROM camere_hotel))

            
SELECT * FROM  camere_hotel WHERE camera_id IN (select camera_id from camera_2);



   


--EX12

/*
Mariti salariul menajerelor cu 25% din salariul mediu al angajatilor
*/


UPDATE ANGAJAT
SET salariu = salariu + (SELECT 0.25*AVG(salariu) FROM ANGAJAT) WHERE nr_menajera is not null;

SELECT * FROM ANGAJAT;
ROLLBACK;
/*
Adaugati atributul "Fidel" la numele clientilor care au facut minim o rezervare
*/

UPDATE CLIENTI
SET nume = CONCAT(nume, '-Fidel') WHERE client_id IN (SELECT client_id FROM REZERVARE);

SELECT * FROM CLIENTI;
ROLLBACK;

/*

Schimbati numele hotelurilor de 4 stele in care s-a facut minim o rezervare in EXCELENT.

*/


UPDATE HOTEL
SET nume_hotel = 'EXCELENT' WHERE hotel_id IN (SELECT h.hotel_id
                                               FROM REZERVARE r
                                               JOIN CAMERA c
                                               ON r.camera_id = c.camera_id
                                               JOIN HOTEL h
                                               ON c.hotel_id = h.hotel_id
                                               ) AND stele = 4;

SELECT * FROM HOTEL;
ROLLBACK;



--EX13


CREATE SEQUENCE seq_id_firma
START WITH 100
INCREMENT  BY 1
MAXVALUE 104
NOCYCLE
NOCACHE;

INSERT INTO FIRMA_ORGANIZARE VALUES (seq_id_firma.NEXTVAL, '&nume_organizator', '&rating');
SELECT * FROM FIRMA_ORGANIZARE;

CREATE SEQUENCE seq_id_spectacol
START WITH 1001
INCREMENT  BY 10
MAXVALUE 1051
NOCYCLE
NOCACHE;

INSERT INTO SPECTACOL VALUES (seq_id_spectacol.NEXTVAL, '&nume_spectacol' , '&hotel_id', '&organizator_id');
SELECT * FROM SPECTACOL;


CREATE SEQUENCE seq_id_locatie
START WITH 43
INCREMENT  BY 1
MAXVALUE 47
NOCYCLE
NOCACHE;

INSERT INTO LOCATIE VALUES (seq_id_locatie.NEXTVAL, '&strada', '&numar', '&orasul', '&tara');
SELECT * FROM LOCATIE;

rollback;

---EX16

/*
Afisati menajerele care au facut curat exact in camerele in care a facut curat menajera cu id-ul de angajat 45.
*/

SELECT f.nr_menajera, prenume
FROM FACE_CURAT_IN f
JOIN ANGAJAT a ON (f.nr_menajera = a.angajat_id)
WHERE camera_id IN (SELECT  camera_id
                 FROM FACE_CURAT_IN
                 WHERE nr_menajera = 45)
        AND angajat_id != 45
GROUP BY f.nr_menajera, prenume
HAVING COUNT(*) = (SELECT COUNT(camera_id)
                FROM FACE_CURAT_IN
                WHERE nr_menajera = 45)
MINUS
SELECT f.nr_menajera, prenume
FROM FACE_CURAT_IN f
JOIN ANGAJAT a ON (f.nr_menajera = a.angajat_id)
WHERE camera_id NOT IN (SELECT camera_id
                  FROM FACE_CURAT_IN
                  WHERE nr_menajera = 45);







