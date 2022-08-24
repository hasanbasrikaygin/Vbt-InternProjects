-- CROSS JOIN -- Kartezyen carpim
SELECT * FROM GN_IL
SELECT
	PER.*,
	IL.*
FROM
	IK_PERSONEL AS PER
	CROSS  JOIN GN_IL AS IL 
ORDER BY 
	PER.PERSONEL_ADI,
	PER.PERSONEL_SOYADI,
	IL.IL_ADI


-- IK_PERSONEL_IL tablosuna PER.ID_PERSONEL 15 ve 9 olan personelleri kartezyen carpimi seklinde ekle
-- ilgili personeller tum illerde gorevlendirilmis ise olusan tabloyu yapiyorz
SELECT * FROM IK_PERSONEL_IL
INSERT INTO IK_PERSONEL_IL
(
	ID_PERSONEL,
	ID_IL
)
SELECT
	PER.ID_PERSONEL,
	IL.ID_IL
FROM
	IK_PERSONEL AS PER
	CROSS  JOIN GN_IL AS IL 
WHERE
	PER.ID_PERSONEL IN(15,9)
ORDER BY 
	PER.PERSONEL_ADI,
	PER.PERSONEL_SOYADI,
	IL.IL_ADI