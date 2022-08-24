SELECT * FROM IK_PERSONEL_MAAS

-- IK_PERSONEL DEKÝ MAAS BÝLGÝLEÝRNÝN IK_PERSONEL_MAAS tablosuna ekle
INSERT INTO IK_PERSONEL_MAAS
(
	ID_PERSONEL,
	YIL,
	MAAS
)
SELECT 
	ID_PERSONEL,
	2020,
	MAAS
FROM IK_PERSONEL


-- 2020 yilindaki maaslara 200 ekleyerek 2021 yili olarak ata
INSERT INTO IK_PERSONEL_MAAS
(
	ID_PERSONEL,
	YIL,
	MAAS 
)
SELECT 
	ID_PERSONEL,
	2021 AS YIL,
	MAAS + 200 AS MAAS
FROM IK_PERSONEL_MAAS
WHERE 
	YIL = 2020

-- ayni islemi 2022 icin yapiyoruz
INSERT INTO IK_PERSONEL_MAAS
(
	ID_PERSONEL,
	YIL,
	MAAS 
)
SELECT 
	ID_PERSONEL,
	2022 AS YIL,
	MAAS + 200 AS MAAS
FROM IK_PERSONEL_MAAS
WHERE 
	YIL = 2021


-- Silme islemleri icn deleted alanini kullaniriz 
-- 0 veya 1 olma durumuna gore silindi yada silinmedi kabul edilir
UPDATE IK_PERSONEL SET DELETED = 1 WHERE ID_PERSONEL = 16

SELECT * 
	FROM [StajJoin].[dbo].[IK_PERSONEL]
	WHERE DELETED = 1