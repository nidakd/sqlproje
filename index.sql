CREATE INDEX IDX_MusteriID ON Siparisler (musteri_id);


SELECT * 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('Siparisler') 
AND name = 'musteri34';
