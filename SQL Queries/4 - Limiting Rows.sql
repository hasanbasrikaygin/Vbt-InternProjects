-- Ilk 5 kaydi getirme
SELECT 
	* 
FROM 
	IK_PERSONEL
ORDER BY 
	PERSONEL_ADI
OFFSET 
	0 ROWS -- 0'dan
FETCH NEXT 
	5 ROWS ONLY -- 5' e kadar


-- 6'dan itibaren kayitlari getirme
SELECT 
	* 
FROM 
	IK_PERSONEL
ORDER BY 
	PERSONEL_ADI
OFFSET 
	5 ROWS -- 6'dan


-- TOP bastan kac veri alacagimiz gosterilir
-- ilk 9 veriyi getirme
SELECT 
	TOP 9 * 
FROM 
	IK_PERSONEL
-- data sayisindan buyuk bir sayi yazilirsa elimizdeki tum verileri getirir
