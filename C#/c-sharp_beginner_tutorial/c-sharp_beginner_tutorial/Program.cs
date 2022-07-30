using System.Collections;

namespace vbt_intern_project
{
    class Progam
    {
        static void Main(string[] args)
        {

            // DEGISKENLER

            int age = 22;
            string name = "Basri";
            decimal price = 15.50M;
            bool isActive = true;
            object testAage = 22;
            object testName = "Basri";

            //FOR - WHILE - DO WHILE

            int x = 0;
            while (x < 5)
            {
                x++;
                // x 5'ten kucuk oldugu surece islemi yap
            }

            do
            {
                //islem en az bir kere gerceklestirilir
                x++;
            } while (x < 5);

            for (int i = 0; i < 5; i++)
            {

            }

            // FOR EACH - IF ELSE

            DateTime dtStart = new DateTime(2022, 7, 30);
            DateTime dtEnd = new DateTime(2022, 8, 5);
            int totalDays = 0;
            for (DateTime date = dtStart; date <= dtEnd; date = date.AddDays(1))
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday)
                {
                    totalDays++;
                    Console.WriteLine(date.Date + "Günü izin kullanabilirsiniz");
                }

            }
            Console.WriteLine(totalDays);
            Console.ReadLine();

            // CONTINUE BREAK

            char character = 'A';
            for (char i = character; i < 'Z'; i++)
            {
                if (i == 'K' || i == 'L')
                {
                    continue;
                    //continue  sadece o islemi atlar devam eder , break ise işlemi sonlandirir
                }
                Console.WriteLine(i);
            }

            // SWITCH CASE

            Console.WriteLine("Lütfen bir sayi giriniz");
            int sayi = Convert.ToInt32(Console.ReadLine());

            {
                switch (sayi)
                {
                    case 1:
                        Console.WriteLine("case 1");
                        break;
                    case 2:
                        Console.WriteLine("case 2");
                        break;
                    case 3:
                        Console.WriteLine("case 3");
                        break;
                    default:
                        Console.WriteLine("Default");
                        break;
                }
                Console.ReadLine();


                //  LISTE DIZI FOR EACH

                var lstStajyer = new List<string>() { "Basri", "Ferhat", "Hikmet" };
                string[] diziStajyer = { "Basri", "Ferhat", "Hikmet" };

                lstStajyer.Add("Hasan");
                foreach (var stajyer in lstStajyer)
                {
                    if (stajyer == "Hasan")
                    {
                        //break;
                        //continue;
                    }
                    Console.WriteLine(stajyer);
                }

                // STUDENT CLASS'INDA LISTE TUTMA

                List<Student> lstStudents = new List<Student>();
                Student objStudent = new Student();
                objStudent.Name = "Hasan Basri ";
                objStudent.Surname = "Kaygın";
                objStudent.Number = 404;
                objStudent.IdentityNumber = "121212";
                lstStudents.Add(objStudent);

                Student clsStudent = new Student();
                clsStudent.Name = "Ahmet";
                clsStudent.Surname = "Esat";
                clsStudent.Number = 405;
                clsStudent.IdentityNumber = "121212";
                lstStudents.Add(clsStudent);
                if (lstStudents.Count > 0)
                {
                    string nameSurname = lstStudents[0].Name;
                }

                var student = lstStudents.Where(p => p.Number == 405).FirstOrDefault();
                // ilk kaydi bul yoksa null ver
                // var student = lstStudents.OrderByDescending(p => p.Number).FirstOrDefault();
                // number'i en buyuk olani bul

                if (student != null)
                {
                    Console.WriteLine(student.Name + " " + student.Surname + " hoşgeldiniz.");
                }
                else
                {
                    Console.WriteLine("Öğrenci kaydınız bulunamadı!");
                }

                // LISTELERI BIRLERSTIRME

                List<string> lstCity = new List<string>();
                lstCity.Add("Denizli");
                lstCity.Add("İstanbul");
                lstCity.Add("Ankara");

                List<string> lstCountry = new List<string>();
                lstCity.Add("Türkiye");
                lstCity.Add("Almanya");
                lstCity.Add("Fransa");


                lstCity.AddRange(lstCountry);

                foreach (string item in lstCity)
                {
                    Console.WriteLine(item);
                }
                Console.ReadLine();

                List<Student> lstStudentGenel = new List<Student>();
                Student objStudent2 = new Student();
                objStudent2.Name = "Hasan Basri ";
                objStudent2.Surname = "Kaygın";
                objStudent2.Number = 404;
                objStudent2.IdentityNumber = "121212";
                lstStudentGenel.Add(objStudent2);


                Student clsStudent2 = new Student();
                clsStudent2.Name = "Ahmet";
                clsStudent2.Surname = "Esat";
                clsStudent2.Number = 405;
                clsStudent2.IdentityNumber = "121212";
                lstStudentGenel.Add(clsStudent2);
                //lstStudentObj.AddRange(lstStudentCls);
                //Birlestirme
                if (lstStudentGenel.Count > 0)
                {
                    string elemanaErisme = lstStudentGenel[0].Name;
                    // lstStudentCls icerisndeki elemana erisme
                }  //liste bos gelirse hata olusmamasini saglar

                foreach (Student item in lstStudentGenel)
                {
                    Console.WriteLine(item.Name + " " + item.Surname + " hoşgeldiniz");
                }
                //Listten Eleman Silme Ozellikleri
                //lstStudentGenel.Remove(objStudent);
                //lstStudentGenel.RemoveAt(0);
                //lstStudentGenel.Clear();//List icerisini bosaltir

            }

            //ARRAY LIST

            ArrayList dynmicList = new ArrayList();
            dynmicList.Add("İstanbul");
            dynmicList.Add(34);
            foreach (var item in dynmicList)// var yerine int yazarsak hata verir guvensiz yapi
            {
                Console.WriteLine(item);
            }
            //Contains icerisinde var mi kontrol eder
            if (dynmicList.Contains("İstanbul"))
            {
                Console.WriteLine("Mevcut");
            }
            else
            {
                Console.WriteLine("Mevcut değil");
            }
            Console.ReadLine();

            //  HASHTABLE 1

            Hashtable htCity = new Hashtable();
            htCity.Add(34, "İstanbul");
            htCity.Add(6, "Ankara");
            Console.WriteLine("İl kodu giriniz");
            int ilKodu = Convert.ToInt32(Console.ReadLine());
            if (htCity.Contains(ilKodu))
            {
                Console.WriteLine("Mevcut ");
            }
            else
            {
                Console.WriteLine("Mevcut değil");
            }

            // HASHTABLE 2

            Hashtable htCity1 = new Hashtable();
            City city = new City();
            city.CityCode = 34;
            city.CityName = "İstanbul";

            City cityAnk = new City();
            cityAnk.CityCode = 6;
            cityAnk.CityName = "Ankara";

            htCity1.Add(city.CityCode, city.CityName);
            htCity1.Add(cityAnk.CityCode, cityAnk.CityName);

            Console.WriteLine("İl kodu giriniz: ");
            int plaka = Convert.ToInt32(Console.ReadLine());
            if (htCity1.ContainsValue(plaka))
            {
                Console.WriteLine("İl Kodu Mevcut");
            }
            else
            {
                Console.WriteLine("İl Kodu Mevcut Değil");
            }

            // BİT ARRAY

            //bool degerler tutar
            bool[] bit = { true, false, false, false, false, false, false, false, false, };
            BitArray bitArray = new BitArray(bit);

            //DICTIONARY SINIFI

            //Dictionary ile hashtable'in farki dictionary'de key ve value değerini belirtiyoruz.
            //hashtable da ise belirtemiyoruz. Hashtable  performans kaybi yasatabilir.
            Dictionary<int, string> dicCity = new Dictionary<int, string>();
            dicCity.Add(20, "Denizli");
            dicCity.Add(6, "Ankara");
            dicCity.Add(34, "İstanbul");

            int ilKod = 34;
            if (dicCity.ContainsKey(ilKod))
            {
                Console.WriteLine("İl Kodu Mevcut");
            }
            else
            {
                Console.WriteLine("İl Kodu Mevcut Değil");
            }

            //QUEUE SINIFI

            //ilk gelen veri ilk cikar
            //Enqueue(); kuyrugun sonuna  eleman ekler
            //Dequeue(); kuyrugun basindan eleman cikartir
            Queue<String> lstQueue = new Queue<string>();
            lstQueue.Enqueue("Hasan Basri Kaygin");
            lstQueue.Enqueue("Ali Koc");
            lstQueue.Enqueue("Muhterem Kızıl");

            try
            {
                string queueName = lstQueue.Dequeue();
                Console.WriteLine("Islemi yapilan musteri :" + queueName);
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }

            //STACK

            //Son giren veri ilk cikar
            Stack<String> stackCity = new Stack<String>();
            stackCity.Push("Denizli");
            stackCity.Push("İzmir");
            stackCity.Push("Kocaeli");
            try
            {
                string stackName = stackCity.Pop();
                Console.WriteLine("Islemi yapilan musteri :" + stackName);
            }
            catch (Exception ex)
            {

                Console.WriteLine(ex.Message);
            }
        }
        public class Student
        {
            public String Name { get; set; }
            public String Surname { get; set; }
            public int Number { get; set; }
            public String IdentityNumber { get; set; }

        }
        public class City
        {
            public int CityCode { get; set; }
            public string CityName { get; set; }

        }

    }
}
