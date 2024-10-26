-- Müşteri verisi ekleme
DECLARE @i INT = 1;


WHILE @i <= 20000 
BEGIN
    INSERT INTO Musteriler (musteri_adi, email)
    VALUES 
        ('Müşteri ' + CAST(@i AS NVARCHAR(10)), 'musteri' + CAST(@i AS NVARCHAR(10)) + '@example.com');
    SET @i = @i + 1;
END;


-- Kahve verisi ekleme
INSERT INTO Kahveler (kahve_adi, kategori, fiyat, yil)
VALUES 
    ('Espresso', 'Kahve', 15.00, 2022),
    ('Cappuccino', 'Kahve', 20.00, 2022),
    ('Latte', 'Kahve', 18.00, 2022),
    ('Americano', 'Kahve', 12.00, 2022),
    ('Mocha', 'Kahve', 22.00, 2022),
    ('Affogato', 'Kahve', 25.00, 2022),
    ('Ristretto', 'Kahve', 14.00, 2022),
    ('Café au Lait', 'Kahve', 17.00, 2022),
    ('Flat White', 'Kahve', 19.00, 2022),
    ('Turkish Coffee', 'Kahve', 10.00, 2022);



-- Sipariş verisi ekleme
DECLARE @siparis_i INT = 1; -- Sipariş sayacı
DECLARE @musteri_id INT;
DECLARE @kahve_id INT;


WHILE @siparis_i <= 80000 
BEGIN
    -- Müşteri ID'sini 1 ile 20000 arasında rastgele al
    SET @musteri_id = ABS(CHECKSUM(NEWID())) % 20000 + 1; 
    -- Kahve ID'sini 1 ile 10 arasında rastgele al
    SET @kahve_id = ABS(CHECKSUM(NEWID())) % 10 + 1; 

    -- Siparişi ekle
    BEGIN TRY
        INSERT INTO Siparisler (musteri_id, kahve_id, miktar)
        VALUES 
            (@musteri_id, @kahve_id, (ABS(CHECKSUM(NEWID())) % 5) + 1); -- Miktar 1 ile 5 arasında rastgele
    END TRY
    BEGIN CATCH
        PRINT 'Hata oluştu: ' + ERROR_MESSAGE();
    END CATCH;

    SET @siparis_i = @siparis_i + 1;
END;


UPDATE Siparisler
SET siparis_tarihi = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), '2023-01-01');


-- 2023 yılına ait rastgele tarihler
UPDATE Siparisler
SET siparis_tarihi = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), '2023-01-01');



SELECT COUNT(*) FROM Musteriler;
SELECT COUNT(*) FROM Kahveler;
SELECT COUNT(*) FROM Siparisler;
