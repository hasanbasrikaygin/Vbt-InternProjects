-- CONVERT() tip donusumu TSQL microsoftun gelistirdigi bir yontem
-- string degeri int degere cevirme  
-- deger donusturulemeycekse hata verir ornegin basri int degere donusturulemez
SELECT CONVERT(int , '10') 


-- CAST() tip donusumu ANSI SQL tum veri tabanlarinda calisir
SELECT CAST('10' AS INT)


-- Veriyi bolme
SELECT SUBSTRING('BASRI', 2 ,3) -- cikti => ASR


-- Veri degistirme
SELECT REPLACE('HASAN KAYGIN','KAYGIN','BASRI' )-- KAYGIN yazan alana BASRI yazdirmak icin
SELECT REPLACE('HASAN BASRÝ',' ','' ) -- Bosluklari kaldrimak icin kullanilabilir


--UPPER buyuk harfe donusturme - LOWER kucuk harfe donusturme
SELECT 
	PERSONEL_SOYADI,
	UPPER(PERSONEL_SOYADI) AS PERSONEL_SOYADI_UPPER,
	LOWER(PERSONEL_SOYADI) AS PERSONEL_SOYADI_LOWER
FROM IK_PERSONEL


-- LTRIM Soldaki bosluklari temzle/ RTRIM Sagdaki bosluklari temzle/ TRIM Ýki taraftandan bosluk temizleme
SELECT
	PERSONEL_ADI,/* Basri */
	RTRIM(PERSONEL_ADI) AS PERSONEL_ADI_RTRIM/* Basri*/
	LTRIM(PERSONEL_ADI) AS PERSONEL_ADI_LTRIM/*Basri */
	TRIM(PERSONEL_ADI)  AS PERSONEL_ADI_TRIM/*Basri*/
FROM IK_PERSONEL


-- YUVARLAMA
SELECT 
	   FLOOR(24.9) AS FLOOR_COLUMN,                  -- 24      => tam sayi kismini kabul eder
	   CEILING(24.9) AS CEILING_COLUMN,              -- 25      => ondalikli olan kismi yukariya yvarlar
	   ROUND(24.956 , 3) AS ROUND_COLUMN_3,          -- 24.956  => 3. basakmaktan sonrasini yuvarlar
	   ROUND(24.956 , 2) AS ROUND_COLUMN_2,          -- 24.960  => 2. basakmaktan sonrasini yuvarlar
	   ROUND(24.956 , 1) AS ROUND_COLUMN_1,          -- 25.000  => 1. basakmaktan sonrasini yuvarlar
	   ROUND(24.956 , 0) AS ROUND_COLUMN_0,          -- 25.000  => 0. basakmaktan sonrasini yuvarlar
	   ROUND(24.956 , 1 , 0) AS ROUND_COLUMN_OVER,   -- 25.000  => 0 yuvarla anlami tasir
	   ROUND(24.956 , 1 , 1) AS ROUND_COLUMN_TRUNIC -- 24.900  => 1 kesme anlami verir


-- DATEADD()
SELECT 
	   GETDATE() AS NOW_DATE,
	   DATEADD( DAY , 1 , GETDATE())   AS NEW_DATE1, --gun bilgisine 1 gun ekle
	   DATEADD( MONTH , 1 , GETDATE()) AS NEW_DATE1, --ay bilgisine 1 ay ekle
	   DATEADD( YEAR , 1 , GETDATE())  AS NEW_DATE1  --yil bilgisine 1 yil ekle


-- DATEDIFF() zaman farki
SELECT 
	   CURRENT_TIMESTAMP AS NOW_DATE,
	   DATEDIFF(DAY , '2021-01-01', GETDATE()) AS DAY_DIF,     -- gun farkini gosterir
	   DATEDIFF(MONTH , '2021-01-01', GETDATE()) AS MONTH_DIF, -- ay farkini gosterir
	   DATEDIFF(YEAR , '2021-01-01', GETDATE()) AS YEAR_DIF    -- yil farkini gosterir


-- DATEPART() 
SELECT
	  GETDATE() AS NOW_DATE,
	  DATEPART(MONTH , GETDATE()) AS MONTH_DATE,
	  MONTH(GETDATE()) AS MONTH_DATE2,
	  DAY(GETDATE()) AS DAY_DATE3


--EOMONTH() ayin son gun bilgisini verir
SELECT
	  GETDATE() AS NOW_DATE,
	  EOMONTH(GETDATE() , 0) AS NEW_DATE -- 0 bulundugumuz ayi verir