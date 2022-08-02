using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LinQ_1
{
    internal class CompareEqualityPersonel : IEqualityComparer<Personel>
    {
        public bool Equals(Personel x, Personel y)
        {
            if (x.PersonelNo == y.PersonelNo)
                return true;
            else
                return false;
                   
            

        }

        public int GetHashCode(Personel obj)
        {
            return obj.GetHashCode();
        }
    }
}
