-- CASE
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	UNVAN_ADI,
	CASE 
		WHEN UNVAN_ADI IN ('Müdür Yrd.' ,'Genel Müdür Yrd.' ) THEN 'Evet'
		ELSE 'Hayir'
	END
	AS YONETICI_MI
FROM IK_PERSONEL


-- IIF (T-SQL)
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	UNVAN_ADI,
	IIF(UNVAN_ADI IN ('Müdür Yrd.' ,'Genel Müdür Yrd.' ), 'Evet' , 'Hayir')
	AS YONETICI_MI
FROM IK_PERSONEL


-- ISNULL()
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	OZEL_TELEFON,
	IS_TELEFON,
	ISNULL(IS_TELEFON, OZEL_TELEFON )  -- eger null degilse is telefonu null ise ozel telefonunu yansitir
	AS TELEFON_ISNULL
FROM IK_PERSONEL


--NULLIF()
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	OZEL_TELEFON,
	IS_TELEFON,
	NULLIF( OZEL_TELEFON, IS_TELEFON )  --  iki degeri karsilastirir eger esit ise null esit degilse ilk degeri doner 
	AS TELEFON_NULLIF
FROM IK_PERSONEL


--COUNT()
SELECT COUNT(*) FROM IK_PERSONEL -- toplam personel sayisi
SELECT COUNT(NULLIF( OZEL_TELEFON, IS_TELEFON )) FROM IK_PERSONEL  -- OZEL_TELEFON'u IS_TELEFON 'a esit olmayan personel sayisi


SELECT 0/100

SELECT 100/0 -- hata verir

SELECT 100/NULL -- NULL verir

SELECT 100/NULLIF(0,0) --gelen deger sifirsa  sonucu NULL dondur hatadan korunmak icin