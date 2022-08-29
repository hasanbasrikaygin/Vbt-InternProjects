   -------  1. YONTEM  -------  
CREATE OR ALTER PROCEDURE GetIkPersonel
	@DELETED INT  = 0 

AS
BEGIN
	DECLARE @QUERY NVARCHAR(2000)
	SET @QUERY = 'SELECT * FROM IK_PERSONEL '

	IF(@DELETED >= 0)
	BEGIN
		SET @QUERY += 'WHERE DELETED = '+CAST(@DELETED AS NVARCHAR(100))
	END 

	PRINT '@QUERY : ' + @QUERY
	EXEC(@QUERY)

END
GO

EXEC GetIkPersonel 
-- default deger 0 yani parametre belirtilmez ise  deleted = 0 olan verileri getirir
EXEC GetIkPersonel 0
-- parametre 0 olarak verilirse  deleted = 0 olan verileri getirir
EXEC GetIkPersonel  1
-- parametre 1 olarak verilirse  deleted = 1 olan verileri getirir
EXEC GetIkPersonel NULL
--parametre 1NULL olarak verilirse  deleted = 1 ve deleted = 0 olan verileri yani tum verileri getirir

   -------  2. YONTEM  ------- 
   
CREATE OR ALTER PROCEDURE GetIkPersonel2
	@DELETED INT  = 0 

AS
BEGIN
	SELECT *
	FROM IK_PERSONEL
	WHERE
		IIF(@DELETED IS NULL , 1 , 0) =1 
		--@DELETED null ise 1 degilse 0 ver
		OR
		-- eger yukarisi true sonuc donerse or ifadesi anlam ifade etmez
		-- false gelirse asagidaki blok calisir
		DELETED = @DELETED
END
GO

 EXEC GetIkPersonel2 
-- default deger 0 yani parametre belirtilmez ise  deleted = 0 olan verileri getirir
EXEC GetIkPersonel2 0
-- parametre 0 olarak verilirse  deleted = 0 olan verileri getirir
EXEC GetIkPersonel2  1
-- parametre 1 olarak verilirse  deleted = 1 olan verileri getirir
EXEC GetIkPersonel2 NULL
--parametre 1NULL olarak verilirse  deleted = 1 ve deleted = 0 olan verileri yani tum verileri getirir