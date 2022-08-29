CREATE OR ALTER FUNCTION FNT_MAAS_BILGILERI_MULTI
-- MULTI TABLE icerisinde insert ,update ,delete ,select komutlari calisir
(
	-- disaridan alinan parametreler belirtilir
	@SalaryYear INT,
	@Salary DECIMAL(18,0),
	@Oran DECIMAL(18,2)
	--SELECT * FROM FNT_MAAS_BILGILERI_MULTI(2020,1200)
)
RETURNS 
@MaasTablo TABLE --geriye donecek tablo
(
	-- geriye donecek tablo icerisinde bulunacak alanlar
	ID_PERSONEL INT,
	YIL INT,
	MAAS DECIMAL(18,2),
	ZAM_ORANI DECIMAL(18,2),
	TOPLAM_MAAS DECIMAL(18,2)
)
AS
BEGIN
	-- geriye tablodonmemizi bekliyor
	INSERT INTO @MaasTablo
	SELECT ID_PERSONEL, YIL, MAAS, @Oran AS ORAN, TOLAM_MAAS = (MAAS * @ORAN) 
	FROM IK_PERSONEL_MAAS
	WHERE 
		YIL = @SalaryYear
		AND MAAS = @Salary
	
	RETURN 
END
GO
SELECT * FROM FNT_MAAS_BILGILERI_MULTI(2020,1200,2.20) 