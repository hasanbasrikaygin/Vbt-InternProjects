CREATE OR ALTER FUNCTION FNT_MAAS_BILGILERI_INLINE -- <Inline_Function_Name, sysname, FunctionName> 
-- INLINE TABLE iceri  sinde insert ,update ,delete komutlari calismaz - sadece select calisir
(	
	-- disaridan alinan parametreler belirtilir
	@SalaryYear INT,
	@Salary DECIMAL(18,2)
	--SELECT * FROM FNT_MAAS_BILGILERI_INLINE(2020,1200)
)
RETURNS TABLE  --geriye tablo donecegini ifade eder
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT * 
	FROM IK_PERSONEL_MAAS
	WHERE 
		YIL = @SalaryYear
		AND MAAS = @Salary
)
GO

SELECT * FROM FNT_MAAS_BILGILERI_INLINE(2020,1200)

DROP FUNCTION IF EXISTS FNT_MAAS_BILGILERI


