    
	--------   PARAMETRE ALMAYAN   --------


CREATE OR ALTER PROCEDURE sp_GetIkPersonel
AS
BEGIN
	SET NOCOUNT ON; 
	-- ciktida yazan etkilenen satir sayisi yazisini engeller,
	-- performans arttirmak icin kullanilir

    SELECT *
	FROM IK_PERSONEL

	DECLARE @SATIRSAYISI INT = @@ROWCOUNT
	-- bir ustundeki query'nin satir sayisini verir
	
	SELECT @@ROWCOUNT AS SATIR_SAYISI 
	--tablodaki satir sayisini gosterir
	-- procedure'lerde birden fazla select kullanilabilir

	SELECT @@VERSION -- sql server surumun verir
	SELECT @@SERVERNAME  -- server adini veirir
	
END
GO
/*
SELECT * FROM ViewAdi
SELECT * FROM FunctionAdi
SELECT dbo.FunctionAdi
*/
EXEC sp_GetIkPersonel --parametre almayan procedure'yi calistirmak icin



			--------   PARAMETRE ALAN   --------


CREATE OR ALTER PROCEDURE GetMaasBilgileri
	@SalaryYear INT,
	@Salary DECIMAL(18,2),
	@Deleted INT  = 0 -- paramtrelere default value verilebilir

AS
BEGIN
	SET NOCOUNT ON; 
    SELECT *
	FROM IK_PERSONEL_MAAS
	WHERE 
		YIL = @SalaryYear
		AND MAAS >= @Salary
		AND DELETED = @Deleted

	
END
GO

EXEC GetMaasBilgileri @SalaryYear = 2021 , @Salary = 13000 
--parametre alan procedure'yi calistirmak icin
-- verilen parametrelerin yazim siralamasi onemsizdir