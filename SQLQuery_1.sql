CREATE DATABASE KahveSiparisleri;


USE KahveSiparisleri;

SELECT m.musteri_id, m.musteri_adi, s.siparis_id, k.kahve_adi, s.miktar, s.siparis_tarihi
FROM Musteriler m
JOIN Siparisler s ON m.musteri_id = s.musteri_id
JOIN Kahveler k ON s.kahve_id = k.kahve_id
WHERE m.musteri_id = 1;

--en popüler kahvei gösteriyor
SELECT k.kahve_adi, SUM(s.miktar) AS toplam_siparis
FROM Kahveler k
JOIN Siparisler s ON k.kahve_id = s.kahve_id
GROUP BY k.kahve_adi
ORDER BY toplam_siparis DESC;


select*from Kahveler;
