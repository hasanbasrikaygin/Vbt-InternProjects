create PROCEDURE dbo.Staj1
--ALTER PROCEDURE dbo.Staj
AS
BEGIN

-- TRY CATCH
	BEGIN TRY 
		insert into Personel (IdPersonel, PersonelName, PersonelSurname) values (1,'Hasan Basri','Kaygin')
		--insert into Personel (IdPersonel, PersonelName, PersonelSurname) values (2,cast('Ahmet' as int),'Tufan')
		raiserror('Hata',20,1) --otomatik hata olusturur
	END TRY
	BEGIN CATCH
	    -- Hata mesajini yazdirmak icin
		declare @severity int;
		set @severity = ERROR_SEVERITY();
		declare @msg varchar(max);
		set @msg = 'Error(' +CAST(ERROR_NUMBER() as varchar(max))+ '):' +
		CAST(ERROR_MESSAGE() as varchar(max)) +
		CAST(ERROR_SEVERITY() as varchar(max)) +
		CAST(ERROR_STATE() as varchar(max)) +
		CAST(ERROR_PROCEDURE() as varchar(max)) +
		CAST(ERROR_LINE() as varchar(max)) 

		insert into Personel (IdPersonel, PersonelName, PersonelSurname) values (3,'Mehmet','Akif')

	END CATCH
END
		PRINT @msg
GO
EXEC Staj1