-- RIGHT JOIN -- Ilce bilgisine gore
SELECT * FROM GN_ILCE
SELECT * FROM IK_PERSONEL
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	RIGHT  JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
-- yasanilmayan dahil tum ilceler gelir


-- RIGHT JOIN -- ilce bilgisi ve ID_IL 1 olanlar - Kriter Kullanimi -->  HATALI! (Inner Join gibi calisir!)
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	RIGHT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE -- INNER JOIN yapsakta ayni sonucu verir
WHERE  -- RIGHT JOIN kriteri WHERE sartinda verilmez , verilirse INNER JOIN gibi davranir
	ILC.ID_IL = 1


-- RIGHT JOIN -- ilce bilgisi ve ID_IL 1 olanlar - Kriter Kullanimi --> Dogru
-- ID_IL 1 olmayanlar NULL olarak gelir
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	RIGHT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
		AND ILC.ID_IL = 1


-- RIGHT JOIN -- personel baglanmis tum ilceler - (INNER JOIN gibi calisir)
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	RIGHT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
WHERE 
	PER.ID_ILCE IS NOT NULL -- ID_ILCE'si null olmayan kayitlari getir


-- RIGHT JOIN -- personel henuz baglanmayan tum ilceler 
SELECT
	PER.*,
	ILC.ILCE_ADI
FROM
	IK_PERSONEL AS PER
	RIGHT JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE
WHERE 
	PER.ID_ILCE IS  NULL -- ID_ILCE'si null olan kayitlari getir