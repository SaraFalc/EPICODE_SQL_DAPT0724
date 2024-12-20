CREATE TABLE Fornitore (
	FornitoreID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Indirizzo VARCHAR(100),
    Telefono VARCHAR(50),
    Email VARCHAR(100)
    );
    
CREATE TABLE OrdineAcquisto (
	OrdineID INT PRIMARY KEY,
    FornitoreID INT,
    DataOrdine DATE,
    Totale DECIMAL(10,2),
    FOREIGN KEY (FornitoreID) REFERENCES Fornitore(FornitoreID)
    );
    
CREATE TABLE Prodotto (
	ProdottoID INT PRIMARY KEY,
    OrdineID INT,
    Nome VARCHAR(50),
    PrezzoUnitario DECIMAL(10,2),
    Quantita INT,
    FOREIGN KEY (OrdineID) REFERENCES OrdineAcquisto(OrdineID)
    );
    
CREATE TABLE MovimentoMagazzino (
	MovimentoID INT PRIMARY KEY,
    ProdottoID INT,
    Quantita INT,
    DataRicezione DATE,
    FOREIGN KEY (ProdottoID) REFERENCES Prodotto(ProdottoID)
    );
    
CREATE TABLE Fattura (
	FatturaID INT PRIMARY KEY,
    OrdineID INT,
    DataFattura DATE,
    ImportoFattura DECIMAL(10,2),
    FOREIGN KEY (OrdineID) REFERENCES OrdineAcquisto(OrdineID)
    );
    

INSERT INTO Fornitore (FornitoreID, Nome, Indirizzo, Telefono, Email)
VALUES
    (1, 'Fornitore A', 'Via Roma 10', '1234567890', 'fornitoreA@email.com'),
    (2, 'Fornitore B', 'Via Milano 20', '0987654321', 'fornitoreB@email.com'),
    (3, 'Fornitore C', 'Via Napoli 30', '1112223333', 'fornitoreC@email.com'),
    (4, 'Fornitore D', 'Via Torino 40', '4445556666', 'fornitoreD@email.com'),
    (5, 'Fornitore E', 'Via Firenze 50', '7778889999', 'fornitoreE@email.com');

INSERT INTO OrdineAcquisto (OrdineID, FornitoreID, DataOrdine, Totale)
VALUES
    (1, 1, '2024-12-01', 1000.00),
    (2, 2, '2024-12-02', 1500.00),
    (3, 3, '2024-12-03', 2000.00),
    (4, 4, '2024-12-04', 2500.00),
    (5, 5, '2024-12-05', 3000.00);
    
INSERT INTO Prodotto (ProdottoID, Nome, PrezzoUnitario, Quantita, OrdineID)
VALUES
    (1, 'Prodotto X', 50.00, 20, 1),
    (2, 'Prodotto Y', 30.00, 15, 1),
    (3, 'Prodotto Z', 100.00, 10, 2),
    (4, 'Prodotto W', 200.00, 5, 3),
    (5, 'Prodotto V', 75.00, 25, 4);

INSERT INTO MovimentoMagazzino (MovimentoID, ProdottoID, Quantita, DataRicezione)
VALUES
    (1, 1, 20, '2024-12-10'),
    (2, 2, 15, '2024-12-11'),
    (3, 3, 10, '2024-12-12'),
    (4, 4, 5, '2024-12-13'),
    (5, 5, 25, '2024-12-14');
    
INSERT INTO Fattura (FatturaID, OrdineID, DataFattura, ImportoFattura)
VALUES
    (1, 1, '2024-12-20', 1000.00),
    (2, 2, '2024-12-21', 1500.00),
    (3, 3, '2024-12-22', 2000.00),
    (4, 4, '2024-12-23', 2500.00),
    (5, 5, '2024-12-24', 3000.00);

SELECT * FROM Fornitore;
SELECT * FROM OrdineAcquisto;
SELECT * FROM Prodotto;
SELECT * FROM MovimentoMagazzino;
SELECT * FROM Fattura;




	