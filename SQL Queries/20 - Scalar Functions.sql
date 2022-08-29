CREATE OR ALTER FUNCTION FN_PERSONEL_UNVAN
-- geriye tablo dondurmez deger dondurur
(
	@ID_PERSONEL INT
)
RETURNS NVARCHAR(2000) -- geri donus tipi belirtilir
AS
BEGIN
	-- degisken tanimlama
	DECLARE @RESULT NVARCHAR(2000) 

	SELECT @RESULT = (P.PERSONEL_ADI + ' ' + P.PERSONEL_SOYADI + ' - ' + U.UNVAN_ADI)
		FROM IK_PERSONEL AS P
		INNER JOIN IK_UNVAN AS U ON U.ID_UNVAN = P.ID_UNVAN
	WHERE 
		P.DELETED = 0 
		AND P.ID_PERSONEL = @ID_PERSONEL

	-- Return the result of the function
	RETURN @RESULT 
-- geriye donus tipi basta olusturdugum sonuc degiskenini geriye don

END
GO

--SELECT * FROM FN_PERSONEL_UNVAN(2) -- bu cumlede geriye tablo doner bu yuzden hata verir
SELECT dbo.FN_PERSONEL_UNVAN(2) AS Unvan -- geriye deger dondugu icin boyle kullaniyoruz