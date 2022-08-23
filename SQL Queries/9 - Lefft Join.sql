-- LEFT JOIN - ALTAS --

SELECT * FROM IK_PERSONEL
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	LEFT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE


-- LEFT JOIN -- ilce bilgisi ve ID_IL 1 olanlar - Kriter Kullanimi -->  HATALI! (Inner Join gibi calisir!)
-- hem sol hemde sag taraftan ID_IL 1 olanlar gelir
SELECT * FROM IK_PERSONEL
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	LEFT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE -- INNER JOIN yapsakta ayni sonucu verir
WHERE  -- LEFT JOIN kriteri WHERE sartinda verilmez , verilirse INNER JOIN gibi davranir
	ILC.ID_IL = 1


-- LEFT JOIN -- ilce bilgisi ve ID_IL 1 olanlar - Kriter Kullanimi --> Dogru
-- ID_IL 1 olamayanlar NULL olarak gelir
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	LEFT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
		AND ILC.ID_IL = 1


-- LEFT JOIN -- ilcesi girilen tum personeller - (INNER JOIN gibi calisir)
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	LEFT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
WHERE 
	PER.ID_ILCE IS NOT NULL -- ID_ILCE'si null olmayan kayitlari getir


-- LEFT JOIN -- ilcesi girilmeyen personeller
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	LEFT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
WHERE 
	PER.ID_ILCE IS  NULL -- ID_ILCE'si null olan kayitlari getir