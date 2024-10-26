CREATE PROCEDURE sp_SiparisGetirByTarihAraligi
    @BaslangicTarihi DATE,
    @BitisTarihi DATE
AS
BEGIN
    SELECT *
    FROM Siparisler
    WHERE siparis_tarihi BETWEEN @BaslangicTarihi AND @BitisTarihi;
END;


EXEC sp_SiparisGetirByTarihAraligi @BaslangicTarihi = '2023-01-01', @BitisTarihi = '2023-12-31';
