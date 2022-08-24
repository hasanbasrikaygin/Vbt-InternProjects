-- IN --
SELECT
	*
FROM
	IK_PERSONEL AS PER
WHERE
	--PER.ID_ILC = ILC.ID_ILCE
	PER.ID_ILCE IN -- personel tablosunda id ilcesi altta gecenler gelsin , birebir eslesenleri getiriyor
	--PER.ID_ILCE NOT IN  --> gecmeyenler icin
		(
			SELECT
				ILC.ID_ILCE
			FROM
				GN_ILCE AS ILC
			WHERE
				ILC.ID_ILCE = PER.ID_ILCE
		)


-- EXCEPT --
-- ust kisimda yazan tabloda olup alt kisimda yazilan tabloda olmayan verileri getirir
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL_2
EXCEPT
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL
--
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL 
EXCEPT
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL_2



-- INTERSECT -- iki tablodaki kesisen verileri getirir -- INNER JOIN gibi calisir
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL_2
INTERSECT
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL
-- tablolarin yazim siralamasinin onemi yoktur ayni sonucu verir
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL 
INTERSECT
SELECT PERSONEL_ADI , PERSONEL_SOYADI FROM IK_PERSONEL_2