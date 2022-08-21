-- PERSONEL_ADI 'na gore siralama ASC (default asc)
--Siralamada alfabeden once diger karakterler degerlendirilir 
--ornegin bir adin basinda bosluk varsa o isim en basta gosterilir
SELECT 
	* 
FROM IK_PERSONEL
ORDER BY PERSONEL_ADI ASC


-- PERSONEL_ADI 'na gore tersten siralama ASC (specified asc)
SELECT 
	* 
FROM IK_PERSONEL
ORDER BY PERSONEL_ADI DESC

-- DEPARTMAN_ADI 'na gore buyukten kucuge ,DEPARTMAN_ADI ayný ise UNVAN_ADI 'na gore kucukten buyuge
SELECT 
	* 
FROM IK_PERSONEL
ORDER BY DEPARTMAN_ADI ASC , UNVAN_ADI DESC