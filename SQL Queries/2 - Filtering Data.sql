-- Ankara'da ya�ayan personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE IL_ADI = 'Ankara'


-- Ankara'da ya�ayan ve Bilgi ��lem Departman�nda �al��an personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE IL_ADI = 'Ankara'
AND DEPARTMAN_ADI = 'Bilgi ��lem'


--Bilgi ��lem ve  Muhasebe Departma�nda �al��an , Uzman ve M�d�r olmayan personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE 
 DEPARTMAN_ADI IN('Bilgi ��lem', 'Muhasebe')
 AND UNVAN_ADI NOT IN('Uzman','M�d�r')


 --Ya�� 40+ ya da K�demi 10+ olan personeller
/*SELECT GETDATE() - CURRENT_TIMESTAMP bulundu�umuz zaman� verir
YEAR(GETDATE()) Y�l�n� d�nd�r�r*/
 SELECT 
	PERSONEL_ADI , PERSONEL_SOYADI , DOGUM_TARIHI,
	YEAR(DOGUM_TARIHI) AS DOGUM_YILI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS
FROM IK_PERSONEL


-- Ya�� 35+ olan ve �al��ma y�l� 15 y�l�n alt�nda olan personeller
 SELECT 
	PERSONEL_ADI , PERSONEL_SOYADI , DOGUM_TARIHI,ISE_GIRIS_TARIHI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS,
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) AS KIDEM
FROM IK_PERSONEL
WHERE 
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) >= 40
	AND YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) <15


-- 2. Y�ntem
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


-- Do�um y�l� 1985 ile 1990 aras�nda ola personeller
SELECT 
	* 
FROM IK_PERSONEL
WHERE YEAR(DOGUM_TARIHI) >= 1985
AND  YEAR(DOGUM_TARIHI) <=1990


-- 2. Y�ntem
SELECT 
	* 
FROM IK_PERSONEL
WHERE YEAR(DOGUM_TARIHI) BETWEEN 1985 AND 1990


-- Ad� S ile ba�layan personelleri ad� ve soyad�na g�re listele
SELECT 
	PERSONEL_ADI, PERSONEL_SOYADI
FROM IK_PERSONEL
WHERE PERSONEL_ADI LIKE 'S%'


-- Soyad� K ile ba�layan Ad� S ile Ba�lamayan personelleri ad� ve soyad�na g�re listele
SELECT 
	PERSONEL_ADI, PERSONEL_SOYADI
FROM IK_PERSONEL
WHERE PERSONEL_SOYADI LIKE 'K%' 
AND PERSONEL_ADI NOT  LIKE'S%'


--K�demi 10+ y�l , ve maa�� 1000 ile 1200  tl aras�nda olanlar� Ad� , Soyad� , Departman� ve Unvan Bilgisinine g�re listele
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