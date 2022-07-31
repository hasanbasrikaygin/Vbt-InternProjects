// BELLEK YONETIMI 1
byte a = 20; //255 karakterdir
int b = a; // bilincsiz tur donusumu

float f = 20;
double d;
d = f;

int a1 = 5;
byte b1 = 3;
short s1 = 30;
double d1 = a1 + b1 +s1;

// Sorunsuz calisirilar

char c1 = 'a';
decimal decimal1;
decimal1 = c1;

Console.WriteLine(decimal1);//a'nin decimal karsiligi gelir bilincsiz tur donusumu

byte b2 = 5;
byte b3 = 10;
//byte b4 = b2 + b3; //toplam byte'i asar bu yuzden hatali , bilincsiz tur donusumu
byte b4 = (byte)(b2 + b3);//bilincli tur donusumu
Console.WriteLine(b4);

//1 byte 8 bit - 1 int 4 byte => 1 int 32 bit

//int i = 255;
int i1 = 256;
byte b5 = (byte)i1;//byte'a 256 sigmaz tastigi icin 0 verir
Console.WriteLine(b5);

object obj1 = 5;
int i2 = (int)obj1;//heap bellekten stack bellege nesne gecti

int i3 = 50;
object obj2 = (object)i3;
 
