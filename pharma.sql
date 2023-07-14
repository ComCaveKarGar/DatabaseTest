CREATE TABLE Hersteller (
    HerstellerID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(300) NOT NULL
    

);

CREATE TABLE Arzneimittel (
    AMID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(300) NOT NULL,
    Preis VARCHAR(300) NOT NULL,
    rezeptpflichtig BOOLEAN NOT NULL,
    HerstellerID INTEGER NOT NULL

);

CREATE TABLE Wirkstoff (
    WirkstoffId INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung VARCHAR(300) NOT NULL

);

CREATE TABLE Arzneimittelwirkstoffe (
    AMID INTEGER NOT NULL,
    Bezeichnung VARCHAR(300) NOT NULL,
    Menge VARCHAR(300) NOT NULL,
    WirkstoffId INTEGER NOT NULL,
    
    PRIMARY KEY(AMID, WirkstoffId)
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
    (1, 'Grippostad', '5,99 EURO', false, 1 );


/* Left Join Befehl 

SELECT * FROM Arzneimittel 
LEFT JOIN Arzneimittelwirkstoffe
ON Arzneimittelwirkstoffe.AMID = Arzneimittel.AMID
LEFT JOIN Wirkstoff
ON Arzneimittelwirkstoffe.WirkstoffID;

*/


