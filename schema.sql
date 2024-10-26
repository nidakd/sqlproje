CREATE TABLE Musteriler (
    musteri_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_adi NVARCHAR(100),
    email NVARCHAR(100)
);

CREATE TABLE Kahveler (
    kahve_id INT PRIMARY KEY IDENTITY(1,1),
    kahve_adi NVARCHAR(100),
    kategori NVARCHAR(50),
    fiyat DECIMAL(10, 2),
    yil INT
);

CREATE TABLE Siparisler (
    siparis_id INT PRIMARY KEY IDENTITY(1,1),
    musteri_id INT,
    kahve_id INT,
    miktar INT,
    FOREIGN KEY (musteri_id) REFERENCES Musteriler(musteri_id),
    FOREIGN KEY (kahve_id) REFERENCES Kahveler(kahve_id)
);

ALTER TABLE Siparisler ADD siparis_tarihi DATE;





SELECT * FROM Musteriler;
SELECT * FROM Kahveler;
SELECT * FROM Siparisler;
