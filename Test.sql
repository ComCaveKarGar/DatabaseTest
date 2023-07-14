USE strafe;

Begin;
CREATE TABLE Dokument (
	DokumentenId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Dokumentenart VARCHAR(250)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Delikt(
	DeliktId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Deliktart VARCHAR(250)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Deliquent (
	DeliquentId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Anredet VARCHAR(250) NOT NULL,
	Name VARCHAR(250) NOT NULL,
	Vorname VARCHAR(250) NOT NULL,
	Adresse VARCHAR(250) NOT NULL,
	Geburtsdatum DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Vorgang(
	VorgangId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Datum DATE NOT NULL,
	BearbeiterId INTEGER NOT NULL,
	DeliquentId INTEGER NOT NULL,

	CONSTRAINT Deliquent_FK FOREIGN KEY(DeliquentId) 
	REFERENCES Deliquent(DeliquentId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
Commit;

CREATE TABLE VorgangDokument(
	VorgangId INTEGER NOT NULL,
	DokumentenId INTEGER NOT NULL,

	PRIMARY KEY(VorgangId, DokumentenId)

	) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Bearbeiter(
	BearbeiterId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(250),
	Vorname VARCHAR(250)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE VorgangDelikt(
	VorgangId INTEGER NOT NULL,
	DeliktId INTEGER NOT NULL,
	
	PRIMARY KEY (VorgangId , DeliktId)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE VorgangDokument
	ADD CONSTRAINT Vorg_FK FOREIGN KEY (VorgangId ) REFERENCES Vorgang(VorgangId),
	ADD CONSTRAINT Doku_FK FOREIGN KEY (DokumentenId ) REFERENCES Dokument(DokumentenId);

ALTER TABLE VorgangDelikt
	ADD CONSTRAINT Vorg1_FK FOREIGN KEY(VorgangId ) REFERENCES Vorgang(VorgangId),
	ADD CONSTRAINT Deli_FK FOREIGN KEY(DeliktId ) REFERENCES Delikt (DeliktId);

ALTER TABLE Vorgang
	ADD CONSTRAINT Bearb_FK FOREIGN KEY(BearbeiterId ) REFERENCES Bearbeiter (BearbeiterId);

COMMIT;



BEGIN;

INSERT INTO Dokument (DokumentenId, Dokumentenart) VALUES

(101, 'Personalausweis'),
(102, 'Fahrerlaubnis'),
(103, 'Reisepass');


INSERT INTO Bearbeiter VALUES

(101, 'Hansen', 'Klaus'),
(102, 'Mueller', 'Marcel'),
(103, 'Wagner', 'Wolfram');

INSERT INTO Delikt VALUES

(401, 'Raub'),
(402, 'Drogenmißbrauch'),
(403, 'Fahrerflucht'),
(404, 'Koerperverletzung');

INSERT INTO Deliquent  VALUES

(5645, 'Herr', 'Hubert', 'Klauts', '01234 AStadt, Kernweg 12', '1990-03-01'),
(1213, 'Herr', 'Norbert', 'Nimmts', '02566 BStadt, Mueller-Str. 1', '1990-04-01' ),
(7887, 'Herr', 'Robert', 'Schnell', '03669 AStadt, Franzgasse 3', '1990-05-01' );

INSERT INTO Vorgang VALUES

(301,'2017-04-02', 101, 5645),
(302, '2014-02-02', 102, 1213 ),
(303, '2017-03-30',101, 7887 );


INSERT INTO VorgangDokument VALUES

(301, 101),
(301, 102),
(302, 101),
(303, 103),
(303, 102);

INSERT INTO VorgangDelikt VALUES

(301, 401),
(302, 402),
(303, 403),
(303, 402);

COMMIT;