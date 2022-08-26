SELECT 
	ROW_NUMBER() OVER(ORDER BY PERSONEL_ADI) AS RN_AD,
	RANK() OVER(ORDER BY PERSONEL_ADI) AS RN_RANK, 
-- ayni verilere ayni numarayi verir numaralandirmaya ayni verilerin saysini da ekleyip devam eder
	DENSE_RANK() OVER(ORDER BY PERSONEL_ADI) AS RN_DENSE_RANK, 
-- ayni verilere ayni numarayi verir numaralnadirmaya kaldigi yerden devam eder
	ROW_NUMBER() OVER(ORDER BY PERSONEL_SOYADI) AS RN_SOYAD,
-- ad ve soyada gore numaralandýrma
	ROW_NUMBER() OVER(PARTITION BY ID_DEPARTMAN ORDER BY PERSONEL_SOYADI) AS RN_DEP 
--  once kategorize eder sonra numaralandirir
	,*
FROM IK_PERSONEL
ORDER BY PERSONEL_ADI
