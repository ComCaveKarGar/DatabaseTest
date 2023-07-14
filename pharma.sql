create TABLE Hersteller (
    HerstellerID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(300)
    

);

CREATE TABLE Arzneimittel (
    AMID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(300),
    Preis VARCHAR(300),
    rezeptpflichtig BOOLEAN,
    HerstellerID INTEGER

);

CREATE TABLE Wirkstoff (
    WirkstoffId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(300)

);

CREATE TABLE Arzneimittelwirkstoffe (
    AMID INTEGER,
    Bezeichnung VARCHAR(300),
    Menge VARCHAR(300),
    WirkstoffId INTEGER 
);

ALTER TABLE Arzneimittel
ADD CONSTRAINT Herst_FK FOREIGN KEY (HerstellerID ) REFERENCES Hersteller(HerstellerID);

ALTER TABLE Arzneimittelwirkstoffe
ADD CONSTRAINT Wirk_FK FOREIGN KEY (WirkstoffID ) REFERENCES Wirkstoff(WirkstoffID),
ADD CONSTRAINT AMID_FK FOREIGN KEY (AMID ) REFERENCES Arzneimittel(AMID);


INSERT INTO Wirkstoff VALUES 
	(1, 'Aspirin'), 
	(2, 'EDTA'),
    (3, 'THC');
    
INSERT INTO Hersteller VALUES
    (1, 'Bayer'),
    (2, 'Ratiopharm'),
    (3, 'BASF'); 
    
    
INSERT INTO Arzneimittel VALUES
    (1, 
     'Grippostad', 
     '5,99 EURO', 
     false, 
     1 );
