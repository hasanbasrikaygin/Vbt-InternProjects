using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinQ_1
{
    internal class ComparePersonel : IComparer<Personel>
    {
        public int Compare(Personel x, Personel y)
        //(Personel? x, Personel? y) eger opsiyonel ise bu sekilde tanimlanir
        {
            if (x.Name != y.Name)//eger isimler farkliysa isme gore siralama
            {
                return string.Compare(x.Name, y.Name);
            }
            else//eger isimler ayniysa soyisme gore siralama
            {
                return string.Compare(x.Name, y.Name);
            }
        }
    }
}
