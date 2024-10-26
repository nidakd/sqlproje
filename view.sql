CREATE VIEW Vw_ToplamSiparisler AS
SELECT m.musteri_id, m.musteri_adi, COUNT(s.siparis_id) AS toplam_siparis
FROM Musteriler m
LEFT JOIN Siparisler s ON m.musteri_id = s.musteri_id
GROUP BY m.musteri_id, m.musteri_adi;




SELECT *
FROM Vw_ToplamSiparisler
WHERE musteri_id = 1; -- 1 numaralı müşterinin siparişlerini gösterir
