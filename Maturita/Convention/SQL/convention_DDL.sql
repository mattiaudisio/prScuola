CREATE DATABASE 5C_Convention;
USE 5C_Convention;

-- CREAZIONE TABELLA AZIENDA --
CREATE TABLE IF NOT EXISTS Azienda(
    idAzienda VARCHAR(10) NOT NULL,
    indirizzoAzienda VARCHAR(30) NULL,
    telefonoAzienda VARCHAR(15) NULL,
    PRIMARY KEY(idAzienda)
);

-- CREAZIONE TABELLA PIANO --
CREATE TABLE IF NOT EXISTS  Piano(
    idPiano VARCHAR(10) NOT NULL,
    nPiano INT NULL,
    nSale INT NULL,
    PRIMARY KEY(idPiano)
);

-- CREAZIONE TABELLA SALA --
CREATE TABLE IF NOT EXISTS  Sala(
    idSala VARCHAR(50) NULL,
    nPostiSala INT(200) NULL,
    idPiano VARCHAR(10) NULL,
    PRIMARY KEY(idSala)
);

-- CREAZIONE TABELLA PARTECIPANTE --
CREATE TABLE IF NOT EXISTS  Partecipante(
    idPart VARCHAR(10) NOT NULL,
    cognomePart VARCHAR(20) NULL,
    nomePart VARCHAR(20) NULL,
    mailPart VARCHAR(30) NULL,
    tipologiaPart VARCHAR(30) NULL,
    passwordPart VARCHAR(100) NULL,
    PRIMARY KEY(idPart)
);

-- CREAZIONE TABELLA RELATORE --
CREATE TABLE IF NOT EXISTS Relatore(
    idRel VARCHAR(10) NOT NULL,
    cognomeRel VARCHAR(30) NULL,
    immagineRel VARCHAR(50) NULL,
    nomeRel VARCHAR(30) NULL,
    idAzienda VARCHAR(10) NULL,
    PRIMARY KEY(idRel)
);

-- CREAZIONE TABELLA SPEECH --
CREATE TABLE IF NOT EXISTS  Speech(
    idSpeech VARCHAR(10) NOT NULL,
    titolo VARCHAR(30) NULL,
    argomento VARCHAR(30) NULL,
    immagine VARCHAR(50) NULL,
    Durata INT NULL,
    numPosti INT NULL,
    PRIMARY KEY(idSpeech)
);

-- CREAZIONE TABELLA PROGRAMMA --
CREATE TABLE IF NOT EXISTS  Programma(
    idProgramma VARCHAR(10) NOT NULL,
    fasciaOraria VARCHAR(20) NOT NULL,
    idSpeech VARCHAR(10) NOT NULL,
    idSala VARCHAR(10) NOT NULL,
    PRIMARY KEY(idProgramma)
);

-- CREAZIONE TABELLA RELAZIONE (COLLEGAMENTO TRA RELATORE E PROGRAMMA)--
CREATE TABLE IF NOT EXISTS Relaziona(
    idRel VARCHAR(10) NOT NULL,
    idProgramma VARCHAR(10) NOT NULL,
    PRIMARY KEY(idRel,idProgramma)
);

-- CREAZIONE TABELLA COMPOSTO (COLLEGAMENTO TRA PARTECIPANTE E PROGRAMMA)--
CREATE TABLE IF NOT EXISTS  Composto(
    idPart VARCHAR(10) NOT NULL,
    idProgramma VARCHAR(10) NOT NULL,
    nPartecipanti INT NULL,
    PRIMARY KEY(idPart,idProgramma)
);

ALTER TABLE Sala ADD FOREIGN KEY (idPiano) REFERENCES Piano(idPiano);
ALTER TABLE Relatore ADD FOREIGN KEY (idAzienda) REFERENCES Azienda(idAzienda);
ALTER TABLE Programma  ADD FOREIGN KEY (idSpeech) REFERENCES Speech(idSPeech);
ALTER TABLE Programma  ADD FOREIGN KEY (idSala) REFERENCES Sala(idSala);
ALTER TABLE Relaziona ADD FOREIGN KEY (idRel) REFERENCES Relatore(idRel);
ALTER TABLE Relaziona ADD FOREIGN KEY (idProgramma) REFERENCES Programma(idProgramma);
ALTER TABLE Composto ADD FOREIGN KEY (idPart) REFERENCES Partecipante(idPart);
ALTER TABLE Composto ADD FOREIGN KEY (idProgramma) REFERENCES Programma(idProgramma);
