using LinQ_1;

var numbers = new int[] { 1, 2, 3, 11, 12, 13 };
var numbers1 = new int[] { 1, 2, 3, 11, 12, 13 };
//LINQ SORGUSU OLMADAN 


var numbersTemp = new List<int>();
foreach (var item in numbers)
{

    if (item < 10)
    {
        numbersTemp.Add(item);
    }
}
foreach (var num in numbersTemp)
{
    Console.Write(num+" ");
}
Console.WriteLine();
//LINQ SORGUSU ILE 1
//Performans olarak daha avantajli
var result = from x in numbers
             where x < 10
             select x;

foreach (var say in result)
{
    Console.Write(say+" ");
}
Console.WriteLine();
//LINQ SORGUSU ILE 2
var result1 = numbers.Where(x => x < 10);

foreach (var num in result1)
{
    Console.Write(num+" ");
}
Console.WriteLine();
var rslt = from x in numbers where  x < 10 select x;
// veriler cagirildigi zaman calisir bu yuzden tum sayilar 10'dan kucuk sonucu verir
for (int i = 0; i < numbers.Length; i++)
{
    numbers[i] = numbers[i] - 10;
}
foreach (var x in rslt)
{
    Console.Write(x+" ");
}
//Cozumu
Console.WriteLine();
var rslt1 = (from x in numbers1 where x < 10 select x).ToList();
// veriler cagirildigi zaman calisir bu yuzden tum sayilar 10'dan kucuk sonucu verir
for (int i = 0; i < numbers1.Length; i++)
{
    numbers1[i] = numbers1[i] - 10;
}
foreach (var x in rslt1)
{
    Console.Write(x + " ");
}
Console.WriteLine();
var personeller = new List<Personel>
{
    new Personel () { Name="Basri", SurName="Kaygin", PersonelNo=1 , ProjeId=1},
    new Personel () { Name="Haluk", SurName="Tatar",  PersonelNo=2 , ProjeId=2},
    new Personel () { Name="Erhan", SurName="Gullu1", PersonelNo=3 , ProjeId=2},
    new Personel () { Name="Erhan", SurName="Gullu2", PersonelNo=3 , ProjeId=3},
};

var projeler = new List<Proje>{
  new Proje() { ProjeName="Proje Ad 1", ProjeId=1},
  new Proje() { ProjeName="Proje Ad 2", ProjeId=2},
  new Proje() { ProjeName="Proje Ad 3", ProjeId=3},
  new Proje() { ProjeName="Proje Ad 4", ProjeId=4},
};
// Personellerin adini yazdirma -1
var result3 = from x in personeller select x;// x.Name de dondurulebilir
Console.WriteLine("\nPersonellerin adini yazdirma -1");
foreach (var x in result3)
{
    Console.WriteLine(x.Name);
    //Console.WriteLine(x);
}
// Personellerin adini yazdirma -2
Console.WriteLine("\nPersonellerin adini yazdirma -2");
var result4 = personeller.Select(x => x.Name);
foreach (var x in result4)
{
    Console.WriteLine(x);
}
// PersonelNo=1 olan personellerin adini yazdirma -1
Console.WriteLine("\nPersonelNo=1 olan personellerin adini yazdirma -1");
var result5 = from x in personeller where x.PersonelNo == 1 select x;
foreach (var x in result5)
{
    Console.WriteLine(x.Name);
}
// PersonelNo=1 olan personellerin adini yazdirma -2
Console.WriteLine("\nPersonelNo=1 olan personellerin adini yazdirma -2");
var result6 = personeller.Where(x => x.PersonelNo == 1).Select(x => x.Name);
foreach (var x in result6)
{
    Console.WriteLine(x);
}
// PersonelNo=1 ve Name=Basri olan personellerin adini yazdirma , or islemi icin ||
Console.WriteLine("\nPersonelNo=1 ve Name=Basri olan personellerin adini yazdirma");
var result7 = personeller.Where(x => x.PersonelNo == 1 && x.Name == "Basri").Select(x => x.Name);
foreach (var x in result7)
{
    Console.WriteLine(x);
}
// Sıralama islemi -1
//Name'e gore sirala , Name'ler ayniysa Surname'e gore sirala
Console.WriteLine("\nSıralama islemi -1");
var result8 = from x in personeller orderby x.Name, x.SurName select x.Name;
//var result8 = from x in personeller orderby x.Name descending select x.Name; 
//tersten siralama 1
foreach (var x in result8)
{
    Console.WriteLine(x);
}
var result9 = personeller.OrderBy(x => x.Name).ThenByDescending(x => x.SurName).Select(x => x.Name);
//var result9 = personeller.OrderByDescending(x => x.Name).Select(x => x.Name);
//tersten siralama -2
Console.WriteLine("\nSıralama islemi -2");
foreach (var x in result9)
{
    Console.WriteLine(x);
}
//Tersine cevirme -1
Console.WriteLine("\nTersine cevirme -1");
var result10 = personeller.Select(x => x.Name).Reverse();
foreach (var x in result10)
{
    Console.WriteLine(x);
}
var result11 = (from x in personeller select x.Name).Reverse();
//Tersine cevirme -2
Console.WriteLine("\nTersine cevirme -2");
foreach (var x in result9)
{
    Console.WriteLine(x);
}
//Siralama -3
Console.WriteLine("\nSıralama islemi -3");
var result12 = personeller.OrderBy(x => x, new ComparePersonel()).Select(x => x.Name);
foreach (var x in result12)
{
    Console.WriteLine(x);
}
//Gruplama -1
Console.WriteLine("\nGruplama -1\n");
var result13 = from x in personeller group x by x.Name;
foreach (var x in result13)
{
    Console.WriteLine("Gruplama başlık : " + x.Key);
    foreach (var y in x)
    {
        Console.WriteLine("İçerik :\n " + y.Name + " " + y.SurName);
    }
    Console.WriteLine();
}
//Gruplama -2
Console.WriteLine("Gruplama -2\n");
var result14 = personeller.GroupBy(x => x.Name);
foreach (var x in result14)
{
    Console.WriteLine("Gruplama başlık : " + x.Key);
    foreach (var y in x)
    {
        Console.WriteLine("İçerik : " + y.Name + " " + y.SurName);
    }
    Console.WriteLine();
}
//Gruplama -3
Console.WriteLine("Gruplama -3");
var result15 = from x in personeller group x by x.Name into nameGrup select nameGrup.Key;
foreach (var x in result15)
{
    Console.WriteLine(x);
}
//Gruplama -4
Console.WriteLine("\nGruplama -4 kritere gore");
var result16 = from x in personeller group x by x.PersonelNo==3;
foreach (var x in result16)
{
    Console.WriteLine( x.Key == true ? "Evet" : "Hayır");
    foreach (var y in x)
    {
        Console.WriteLine("İçerik : " + y.Name + " " + y.SurName);
    }
    Console.WriteLine();
}
// CompareEqualityPersonel
Console.WriteLine("CompareEqualityPersonel\n ");
var result17 = personeller.GroupBy(x => x, new CompareEqualityPersonel());
foreach (var x in result17)
{
    Console.WriteLine(x.Key.PersonelNo);
    foreach (var y in x)
    {
        Console.WriteLine("İçerik : " + y.Name + " " + y.SurName);
    }
    Console.WriteLine();
}
//  JOIN -1

var result18 = from x in personeller
               join y in projeler on x.ProjeId equals y.ProjeId
               select new { Adı = x.Name + ' ' + x.SurName, ProjeAdı = y.ProjeName };
Console.WriteLine("Join -1");
foreach (var x in result18)
{
    Console.WriteLine(x);
}

//  JOIN -2

var result19 = personeller.Join(projeler, x => x.ProjeId, y => y.ProjeId, (x, y) =>
    new { Adı = x.Name + ' ' + x.SurName, ProjeAdı = y.ProjeName });
Console.WriteLine("Join -2");
foreach (var x in result19)
{
    Console.WriteLine(x);
}

//  JOIN -3

Console.WriteLine("Join -3");
var result20 = from x in personeller
               from y in projeler
               where x.ProjeId == y.ProjeId
               select new { Adı = x.Name + ' ' + x.SurName, ProjeAdı = y.ProjeName };
foreach (var x in result20)
{
    Console.WriteLine(x);
}

//  JOIN -4

Console.WriteLine("Join -4");
var result21 = personeller.SelectMany(x => projeler.Where(y => y.ProjeId == x.ProjeId), (x, y) =>
new { Adı = x.Name + ' ' + x.SurName, ProjeAdı = y.ProjeName });
foreach (var x in result21)
{
    Console.WriteLine(x);
}

// 1
Console.WriteLine();
var result22 = (from x in personeller select x.Name).Take(2);// ilk iki veriyi getir
foreach (var x in result22)
{
    Console.WriteLine(x);
}
// 2
Console.WriteLine();
var result23 = projeler.Take(2).Select(x => x.ProjeName);// ilk iki veriyi getir
foreach (var x in result23)
{
    Console.WriteLine(x);
}

Console.WriteLine();
var result24 = (from x in projeler select x.ProjeName).Skip(2);// ilk 2'yi atla
foreach (var x in result24)
{
    Console.WriteLine(x);
}

Console.WriteLine();
var result25 = (from x in personeller select x).TakeWhile(x => x.ProjeId < 3);// ProjeId 2'den kucuk olanlar
foreach (var x in result25)
{
    Console.WriteLine(x.ProjeId);
}

Console.WriteLine();
var result26 = (from x in personeller select x.Name).Distinct();
// tekrarlayan verileri bir kere olmak uzere ,tum verileri verir
foreach (var x in result26)
{
    Console.WriteLine(x);
}