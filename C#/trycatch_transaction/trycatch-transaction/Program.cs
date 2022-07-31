//TRY CATCH

// try {...} bloğu içinde yapılmak istenen işlem bulunur.  Bu blokta ;
// Hata yoksa catch(err) bloğu çalıştırılmaz atlanır.
// Hata varsa try çalıştırılması durdurulur ve catch(err) bloğu çalıştırılır.
using System.Data.SqlClient;

try
{
    var deneme = "test";
    int denme2 = Convert.ToInt32(deneme);
    // tip dönüşüm hatası
}
catch (FormatException ex) //when (LogException(ex))
{
    Console.WriteLine(" Format hatası :" + ex.Message);
}
catch (Exception ex)
//catch ler if else yapisi gibi calisir
//eger ust bloga girmez ise bu bloga uyup uymadigini dener
{
    Console.WriteLine("Hata :" + ex.ToString());
    // ex hata türünü verir
    throw;
}
finally
{
    Console.WriteLine("İşlem bitti");
    //Her zaman son olarak bu bloğa çalıştırılır
}
static bool LogException(Exception ex)
{
    return false;
}
// database baglantisi
string connectionString = "kullanicininDoldurmasiGerekenAlan";
SqlTransaction transaction = null;
// transaction hata alinirsa islemi tamamen geri almya yarar 
// 10 tabloda islem yapiyoruz 8.de hata aldik islemi tamamen geri alir
// CRUD create read delete update

//sql connection
using (SqlConnection contex = new SqlConnection(connectionString))
{
    // using blogundan cıktıktan sonra contex dispose olur-yasamaz
    try
    {
        contex.Open();// db'ye erismek icin
        transaction = contex.BeginTransaction();
        SqlCommand com = new SqlCommand("insert into Personel (IdPersonel, PersonelName, PersonelSurname) values (1,'Hasan Basri','Kaygin')", contex, transaction);//transaction opsiynel parametre ,her zaman dahil etmek zorunda değiliz
        SqlCommand com2 = new SqlCommand("insert into Personel (IdPersonel, PersonelName, PersonelSurname) values (2,'Ahmet','Tufan')", contex, transaction);
        //transaction opsiynel parametre ,her zaman dahil etmek zorunda değiliz
        SqlCommand com3 = new SqlCommand("insert into Personel (IdPersonel, PersonelName, PersonelSurname) values (3,'Mehmet','Akif')", contex, transaction);
        // Ornegin burada soyadi 'Tufan' yerine Tufan seklinde vermis olsaydik
        // transaction-rollback yardimiyla 1. veride eklenmeyecekti

        com.ExecuteNonQuery();
        transaction.Save("burayaKadarRollback");
        com3.ExecuteNonQuery();
        com2.ExecuteNonQuery();
        transaction.Commit();
    }
    catch (Exception)
    {

        transaction.Rollback("burayaKadarRollback");
        transaction.Commit();
        //belirtilen yerden onceki verilerin kayit olmasini saglar
    }
    finally
    {
        //contex.Close();// close => sleep moda alir baskası contexi kullanacagi zaman uyuyani verir
        contex.Dispose();// dispose => baskasi cagirdigi zaman  sifirdan yenisini verir
    }
}
