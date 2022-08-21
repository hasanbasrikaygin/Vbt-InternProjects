-- Ankara'da yaþayan personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE IL_ADI = 'Ankara'


-- Ankara'da yaþayan ve Bilgi Ýþlem Departmanýnda çalýþan personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE IL_ADI = 'Ankara'
AND DEPARTMAN_ADI = 'Bilgi Ýþlem'


--Bilgi Ýþlem ve  Muhasebe Departmaýnda Çalýþan , Uzman ve Müdür olmayan personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE 
 DEPARTMAN_ADI IN('Bilgi Ýþlem', 'Muhasebe')
 AND UNVAN_ADI NOT IN('Uzman','Müdür')


 --Yaþý 40+ ya da Kýdemi 10+ olan personeller
/*SELECT GETDATE() - CURRENT_TIMESTAMP bulunduðumuz zamaný verir
YEAR(GETDATE()) Yýlýný döndürür*/
 SELECT 
	PERSONEL_ADI , PERSONEL_SOYADI , DOGUM_TARIHI,
	YEAR(DOGUM_TARIHI) AS DOGUM_YILI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS
FROM IK_PERSONEL


-- Yaþý 35+ olan ve çalýþma yýlý 15 yýlýn altýnda olan personeller
 SELECT 
	PERSONEL_ADI , PERSONEL_SOYADI , DOGUM_TARIHI,ISE_GIRIS_TARIHI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS,
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) AS KIDEM
FROM IK_PERSONEL
WHERE 
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) >= 40
	AND YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) <15


-- 2. Yöntem
SELECT 
*
FROM
(
 SELECT 
	PERSONEL_ADI , PERSONEL_SOYADI , DOGUM_TARIHI,ISE_GIRIS_TARIHI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS,
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) AS KIDEM
FROM IK_PERSONEL
) AS DUMMY_TABLE
WHERE 
	YAS >= 40
	AND KIDEM <15


-- Doðum yýlý 1985 ile 1990 arasýnda ola personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE YEAR(DOGUM_TARIHI) >= 1985
AND  YEAR(DOGUM_TARIHI) <=1990


-- 2. Yöntem
SELECT 
	* 
FROM IK_PERSONEL
WHERE YEAR(DOGUM_TARIHI) BETWEEN 1985 AND 1990


-- Adý S ile baþlayan personelleri adý ve soyadýna göre listele
SELECT 
	PERSONEL_ADI, PERSONEL_SOYADI
FROM IK_PERSONEL
WHERE PERSONEL_ADI LIKE 'S%'


-- Soyadý K ile baþlayan Adý S ile Baþlamayan personelleri adý ve soyadýna göre listele
SELECT 
	PERSONEL_ADI, PERSONEL_SOYADI
FROM IK_PERSONEL
WHERE PERSONEL_SOYADI LIKE 'K%' 
AND PERSONEL_ADI NOT  LIKE'S%'


--Kýdemi 10+ yýl , ve maaþý 1000 ile 1200  tl arasýnda olanlarý Adý , Soyadý , Departmaný ve Unvan Bilgisinine göre listele
SELECT 
	PERSONEL_ADI, PERSONEL_SOYADI,DEPARTMAN_ADI,UNVAN_ADI,MAAS
FROM IK_PERSONEL
WHERE 
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) >=10
	AND MAAS BETWEEN 1000 AND 1200


-- OR KULLANIMI
		SELECT 
		PERSONEL_ADI, PERSONEL_SOYADI
	FROM IK_PERSONEL
	WHERE 
		(PERSONEL_ADI = 'Hasan Basri' OR PERSONEL_ADI = 'Bora')