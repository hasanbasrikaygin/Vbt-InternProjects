SELECT * FROM TELEFON

TRUNCATE
	TABLE TELEFON
-- tablo verilerini sifirlamak icin kullanilir

DROP 
	TABLE TELEFON
-- icindeki verilerle beraber tabloyu siler


-- dongu ile 100.000 adet veri ekliyoruz
DECLARE @i INT
SET @i = 0
WHILE(@i < 100000)
	BEGIN 
		INSERT INTO TELEFON
		SELECT
			ID_TELEFONLAR = @i,
			AD = 'Basri' + CAST (@i AS NVARCHAR(20)),
			SOYAD = 'Kaygýn' + CAST (@i AS NVARCHAR(20)),
			TELEFON_NO = '0 123 456 78 89' + CAST (@i AS NVARCHAR(20))
		SET @i=@i+1
	END

SELECT COUNT(*) FROM TELEFON
-- tablodaki veri sayisini gosterir

-- Kac logical read yapildigini gosteren sistemi acma
 SET STATISTICS IO ON

--	Kac milisaniye gectigini gosteren sistemi acma
 SET STATISTICS TIME ON

--	Daha sonra ise;

SELECT * FROM TELEFON WHERE AD='Basri99993'


-- Clustered indeks tanimlama
CREATE CLUSTERED INDEX TelefonIndeks ON TELEFON(AD)

SELECT * FROM TELEFON WHERE AD='Basri99993'


--	Non-Clustered indeks tanimlama
CREATE NONCLUSTERED INDEX SoyadIndeks ON TELEFON(SOYAD)

SELECT * FROM TELEFON WHERE SOYAD='Kaygýn99993'

-- Index silme islemi
DROP INDEX TELEFON.SOYAD
DROP INDEX TELEFON.AD