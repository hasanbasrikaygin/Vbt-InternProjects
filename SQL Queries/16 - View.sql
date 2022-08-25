
     ------  VIEV OLUSTUMA ------


/*
CREATE VIEW view_adi
AS
	SELECT sutun_adi(lar)i
	FROM TABLO_ADI
*/
CREATE OR ALTER VIEW VW_IK_PERSONEL -- yoksa create et varsa alter et
AS
	SELECT *
	FROM IK_PERSONEL
GO


-- DROP VIEW -- VÝEW silme islemi
DROP VIEW IF EXISTS VW_IK_PERSONEL 
GO
-- IF EXISTS => view varsa siler yoksa hata vermez

-- birden fazla silmek icin
--DROP VIEW IF EXISTS VW_IK_PERSONEL,EXISTS VW_IK_PERSONEL2


SELECT * FROM VW_IK_PERSONEL
GO
SELECT * FROM IK_PERSONEL
GO

     -------  Sql View icerisnde yapilamayacak islemler  -------

-- 1) view'lar icerisnde isimsiz kolon bulunamaz
CREATE VIEW VW_GET_CITIES_WITH_COUNT
AS 
	SELECT 
		ID_IL,
		COUNT(*)  -- COUNT(*)  AS C_COUNT gibi bir isme sahip olmasi gerekir
	FROM [VBTView].[dbo].[GN_ILCE]
	GROUP BY ID_IL
GO

-- 2)  Disaridan parametre alamazlar

-- 3) insert update delete vb DML kodlari kullanilamaz,
    --sadece select ile baslayan ifadeler kullanilabilir 
CREATE VIEW VW_GET_CITIES_WITH_COUNT
AS 
	INSERT INTO IK_PERSONEL
GO

-- 4) order by fonksiyonu dogrudan kullanilamaz, 

CREATE OR ALTER VIEW VW_IK_PERSONEL2
AS
	SELECT *
	FROM IK_PERSONEL
	ORDER BY PERSONEL_ADI
	--siralama icin alternatif yontemleri vardir
GO
CREATE OR ALTER VIEW VW_IK_PERSONEL2
AS
	SELECT TOP 100 PERCENT * -- tablonun %100'unu getir
	FROM IK_PERSONEL
	ORDER BY PERSONEL_ADI
SELECT * FROM VW_IK_PERSONEL2 ORDER BY PERSONEL_ADI


-- 5) birden fazla  sorgu yazilamaz , 
    --saddece tek bir select ile baslayan sorgu yazilabilir
CREATE OR ALTER VIEW VW_IK_PERSONEL2
AS
	SELECT *
	FROM IK_PERSONEL
	SELECT *
	FROM GN_IL
SELECT * FROM VW_IK_PERSONEL2
GO
  -- alternatif yontem
CREATE OR ALTER VIEW VW_IK_PERSONEL2
AS
	SELECT DISTINCT * 
	-- alttakiler birlesim kumesi oldugu icin bunu tek bir select olarak kabul eder sorgu calisir
	FROM (
		SELECT *
		FROM IK_PERSONEL

		UNION ALL -- birlesim kumesi ayni kayittan iki tane olabilir -- UNION ayný kyaittan iki tane olamaz

		SELECT *
		FROM IK_PERSONEL
	)AS SQ
GO
SELECT * FROM VW_IK_PERSONEL2


     -------  VIEW icerisinde JOIN yapilari  -------
CREATE OR ALTER VIEW [dbo].[VW_IK_MAAS]
AS
	SELECT P.* 
			 -- ayni kolon isminden 2 tane kolon olmasi izin verilmiyor
			 -- sadece * isareti kullanilirsa her iki tablodada maas  kolonu oldugu icin hata verir,
	         -- hangisinin seclecegi bilinmedigi icin
			 -- M.* veya P.* dogru kullanimdir
			,M.ID_PERSONEL_MAAS
			,M.MAAS AS M_MAAS
			,M.YIL
	FROM IK_PERSONEL AS P
		INNER JOIN IK_PERSONEL_MAAS AS M ON M.ID_PERSONEL = P.ID_PERSONEL
GO
SELECT * FROM VW_IK_MAAS
