SELECT * FROM IK_PERSONEL

-- INSERT - WITH VALUES
	-- Dikkat edilmesi gerekenler
		-->Veri týpý donusumu ,Not Null alanlar , veri uzunluklari ve alan sayisina dikkat edilmelidir
		--> Incorrect syntax near 'Uzman'. => 'Uzman' yazdiktan sonra virgul eklemeyi unutursak karsilasilir
		--> Error converting data type varchar to numeric. => numeric bir alana varchar bir deger atmasi olursa karsilasilir 
		--> Cannot insert the value NULL into column 'PERSONEL_ADI', table 'StajPersonel.dbo.IK_PERSONEL'; column does not allow nulls.  INSERT fails. 
		    --  => Not Null olan bir alana deger verilmezse karsilasilir
		--> String or binary data would be truncated. => Veri uzunlugu verilmek istenilen alandan buyuk ise karsilasilir
		--> There are more columns in the INSERT statement than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.
		    --  => Insert blogundaki eklenen kolonlar ile valur tarafindaki eklenen kolon sayisi eslemez ise karsilasilir

INSERT INTO IK_PERSONEL
(	
	-- id autoincrement oldugu icin id vermiyoruz
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	OZEL_TELEFON,
	IS_TELEFON,
	IL_ADI,
	ILCE_ADI,
	ISE_GIRIS_TARIHI,
	DEPARTMAN_ADI,
	UNVAN_ADI,
	MAAS
)
VALUES 
(	
	--siralamalar onemli
	'Ahmet',
	'Yasar',
	'1990-02-03',
	'0556 556 56 56',
	'0556 556 56 56',
	'Ýstanbul',
	'Kadýköy',
	'2021-12-12',
	'Bilgi Ýþlem',
	'Uzman',
	1000
)


-- INSERT - WITH VALUES
-- Baska bir tablodan veri ekleme , tablolarin formatlarinin ayni olmasi lazim
/*
INSERT INTO IK_PERSONEL
(	
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	OZEL_TELEFON,
	IS_TELEFON,
	IL_ADI,
	ILCE_ADI,
	ISE_GIRIS_TARIHI,
	DEPARTMAN_ADI,
	UNVAN_ADI,
	MAAS
)
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	OZEL_TELEFON,
	IS_TELEFON,
	IL_ADI,
	ILCE_ADI,
	ISE_GIRIS_TARIHI,
	DEPARTMAN_ADI,
	UNVAN_ADI,
	MAAS
FROM
	IK_PERSONEL_EXCEL
*/

-- INSERT  - WITH INTO
SELECT * INTO  IK_PERSONEL FROM IK_PERSONEL
-- IK_PERSONEL_2 adinda yeni bir tablo olusturup icerisine IK_PERSONEL 'in verilerini ekler
SELECT * FROM IK_PERSONEL_2

SELECT * INTO IK_PERSONEL_3 FROM IK_PERSONEL WHERE ID_PERSONEL = 16
-- IK_PERSONEL_3 adinda yeni bir tablo olusturup icerisine ID_PERSONEL = 16 olan veriyi ekler
SELECT * FROM IK_PERSONEL_3

SELECT * INTO  StajJoin.dbo.IK_PERSONEL_2 FROM StajPersonel.dbo.IK_PERSONEL_2;


-- UPDATE
UPDATE IK_PERSONEL
	SET  ILCE_ADI = 'Pamukkale' -- ILCE_ADI'na Pamukkale  ata
WHERE
	PERSONEL_ADI = 'Bora' -- Adi Bora ise
	AND PERSONEL_SOYADI = 'Kaþmer' -- ve Soaydi Kasmer ise
SELECT * FROM IK_PERSONEL


--DELETE
DELETE
	FROM IK_PERSONEL -- IK_PERSONEL'den sil
WHERE 
	PERSONEL_ADI = 'Ahmet' -- Adi Ahmet
	AND PERSONEL_SOYADI = 'Yasar' -- Ve soyadi Yasar ise 
SELECT * FROM IK_PERSONEL
	