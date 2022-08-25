
------    YEREL GECICI TABLOLAR (LOCAL TEMPORARY TABLES)    ------

-- local gecici tablo olusturma
CREATE TABLE #TMP_STAJ
(         
name NVARCHAR(50),     
surname NVARCHAR(50),
registryDate DATETIME
)

-- olusturuluan kolonlari goruntulemek icin
-- bu sorgu tablo #TMP_STAJ seklinde tek # ile olusturuldugu icin sadece bu query'de calisir
SELECT * FROM #TMP_STAJ
-- 

-- tabloya veri ekleme 
-- INSERT islemi
INSERT INTO #TMP_STAJ ( name , surname , registryDate ) VALUES ('Hasan Basri' ,'Kaygin',GETDATE())
INSERT INTO #TMP_STAJ ( name , surname , registryDate ) VALUES ('Bora' ,'Kasmer',GETDATE())

--UPDATE islemi
UPDATE #TMP_STAJ SET registryDate='2020-02-02' WHERE name='Bora'

--DELETE islemi
DELETE #TMP_STAJ WHERE name='Bora' AND surname='Kasmer'

--DROP
DROP TABLE #TMP_STAJ

------   GENEL GECICI TABLOLAR (GLOBAL TEMPORARY TABLES)     ------

CREATE TABLE ##TMP_STAJ2
(         
name NVARCHAR(50),     
surname NVARCHAR(50),
registryDate DATETIME
)

-- olusturuluan kolonlari goruntulemek icin
-- bu sorgu tablo ##TMP_STAJ2 seklinde 2 ## isareti ile olusturuldugu icin baska query'lerdede calisir
SELECT * FROM ##TMP_STAJ2
-- 

-- tabloya veri ekleme 
-- INSERT islemi
INSERT INTO ##TMP_STAJ2  VALUES ('Hasan Basri' ,'Kaygin',GETDATE())
INSERT INTO ##TMP_STAJ2  VALUES ('Bora' ,'Kasmer',GETDATE())

--UPDATE islemi
UPDATE ##TMP_STAJ2 SET registryDate='2021-01-01' WHERE name='Bora'

--DELETE islemi
DELETE ##TMP_STAJ2 WHERE name='Bora' AND surname='Kasmer'

--DROP
DROP TABLE ##TMP_STAJ2