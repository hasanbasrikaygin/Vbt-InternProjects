-- FULL JOIN - PERSONEL VE ILCE 
-- eslesen eslesmeyen tum verileri getirir - left ve right'in birlesimi gibi dusunulebilr
SELECT * FROM GN_ILCE
SELECT * FROM IK_PERSONEL
SELECT
	PER.*,
	ILC.*
FROM
	IK_PERSONEL AS PER
	FULL  JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE


-- FULL JOIN -- Ilcesi eslesen personeller ve personele baglanmis ilceler - (Inner Join gibi calisir)
SELECT
	PER.*,
	ILC.*
FROM
	IK_PERSONEL AS PER
	FULL  JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE -- INNER JOIN yazilsada ayni sonucu verir
WHERE 
	PER.ID_ILCE IS NOT NULL
	AND ILC.ID_ILCE IS NOT NULL


-- FULL JOIN -- Ilcesi eslesmeyen personeller veya personele baglanmamis ilceler
SELECT
	PER.*,
	ILC.*
FROM
	IK_PERSONEL AS PER
	FULL  JOIN GN_ILCE AS ILC ON PER.ID_ILCE = ILC.ID_ILCE 
WHERE 
	(PER.ID_ILCE IS NULL
	OR ILC.ID_ILCE IS  NULL)