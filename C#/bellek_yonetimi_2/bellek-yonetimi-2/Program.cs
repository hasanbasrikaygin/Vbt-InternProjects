using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace bellek_yonetimi_2
{
    [Serializable]
    public class Adress : IDisposable
    { //class'ta Dispose'u kullanmak icin IDisposable'dan turetmemiz gerekiyor
        private bool _disposed = false;
        public string Street { get; set; }
        public string City { get; set; }
        public string Country { get; set; }

        ~Adress() => Dispose(false);// Parantezden disari cikildigi anda burasi cagrilir
        protected virtual void Dispose(bool disposing)
        {
            if (_disposed)
            {
                return;
            }
            if (disposing)
            {
                //TO DO
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
    [Serializable]
    public class Customer
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public Adress Adress { get; set; }

        public Customer ShallowCopy()
        //yeni bir bellekte ayni verilerle adres olusturup vermesini saglar
        //klonlama yapar
        {
            return this.MemberwiseClone() as Customer;
        }
        public Customer DeepCopy()
        {
            using (var ms = new MemoryStream())
            {
                var formatter = new BinaryFormatter();
                formatter.Serialize(ms, this);
                ms.Position = 0;
                return (Customer)formatter.Deserialize(ms);
                // tum nesneyi yeni bir bellek adresinde tum verileriyle klonlar
            }// parantezden ciktigi anda bellekten silinecek
        }
    }
    internal class Program
    {

        static void Main(string[] args)
        {
            using (var ad = new Adress())
            {

            }

            Customer basri = new Customer()
            {
                Id = 1,
                FirstName = "Hasan Basri",
                LastName = "Kaygin",
                Adress = new Adress() { City = "İstanbul", Country = "Türkiye", Street = "Feneryolu" }
            };

            /*
           //YANLIS KULLANIM
           Customer hakan = basri;
           // stack bellekte hakan ve basri ayni pointer adresini tutyor - aynı heap bellege bakiyor
           hakan.FirstName = "Hakan";
           Console.WriteLine(basri.FirstName);// basrinin adi Hakan olur
           */

            /*
            //DOGRU KULLANIM ShallowCopy() ile yapildi
            Customer hakan = basri.ShallowCopy();
            hakan.FirstName = "Hakan";
            //Console.WriteLine("Basri:"+basri.FirstName +" Hakan:"+ hakan.FirstName+" "+hakan.LastName);
            */

            /*
            //YANLIS KULLANIM ShallowCopy() 
            //DeepCpoy() ile klonlanmasi gerekirdi
            Console.WriteLine(hakan.Adress.Street);
            hakan.Adress.Street = "Kuzey";
            */

            //DOGRU KULLANIM DeepCpoy() ile yapildi
            //primitive typeları kopyalar
            Customer hakan = basri.DeepCopy();
            hakan.FirstName = "Hakan";
            hakan.Adress.Street = "Kuzey";
            Console.WriteLine("Basri FirstName: " + basri.FirstName + "\nHakan FirstName: " + hakan.FirstName);
            Console.WriteLine("Basri street: " + basri.Adress.Street + "\nHakan street: " + hakan.Adress.Street);



        }
    }
}
//  ShallowCopy() => primitive typeları kopyalar
//complex typlari kopyalayamaz.Adress orneginde oldugu gibi

//  DeepCopy () => complex type olanlari da kopyalar.

//Her new , bellekte yer tutar . Ihtiyac kalinmadigi zaman bu verilerin temizlenmesi gerekir.
//C#'ta bu islemi Garbage Collector yapar ama istenilen seviyede verimli degildir.
//Bu yuzden Scopped() kullanilir

//  Scopped() => once olusturur daha sonra isi bitince kendi kaldirir