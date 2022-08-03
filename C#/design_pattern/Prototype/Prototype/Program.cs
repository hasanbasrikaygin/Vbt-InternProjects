using System;
using System.Collections.Generic;

namespace Prototype
{
    abstract class VehiclePrototype
    {
        public abstract VehiclePrototype Clone();
        public string ChassisNumber { get; set; }
    }
    class Cbr650R : VehiclePrototype
    {
        public Cbr650R()
        {
            WarrantyYear = 4;
            Km = 0;
            Weight = 207;
            Height = 65;
            Engine = 650;
            Year = DateTime.Today.Year;
        }

        public int Height { get; set; }
        public int WarrantyYear { get; set; }
        public int Km { get; set; }
        public double Weight { get; set; }
        public int Engine { get; set; }
        public string Color { get; set; }
        public int Year { get; set; }
        public double Price { get; set; }
        public override VehiclePrototype Clone()
        {
            return this.MemberwiseClone() as VehiclePrototype;
        }
    }
    class AfricanTwin : VehiclePrototype
    {
        public AfricanTwin()
        {
            WarrantyYear = 3;
            Km = 0;
            Weight = 245;
            Height = 65;
            Engine = 1000;
            Year = DateTime.Today.Year;
        }

        public int WarrantyYear { get; set; }
        public int Km { get; set; }
        public int Weight { get; set; }
        public int Height { get; set; }
        public int Engine { get; set; }
        public int Year { get; set; }

        public override VehiclePrototype Clone()
        {
            return this.MemberwiseClone() as VehiclePrototype;
        }
    }
    internal class Program
    {
        public static List<VehiclePrototype> VehicleList { get; set; }

        static void Main(string[] args)
        {
            VehicleList = new List<VehiclePrototype>();
            for (int i = 0; i < 10; i++)
            {
                var index = VehicleList.FindIndex(f => f.GetType() == typeof(Cbr650R));
                //ilk once olusturulan listede Cbr650R var mi ona bakiyoruz
                Cbr650R motor = index == -1 ? new Cbr650R() : (Cbr650R)VehicleList[index].Clone();
                // eger yoksa olusturyoruz varsa klonluyoruz
                if (index == -1)// olusturma
                {
                    motor.WarrantyYear = 4;
                    motor.Km = 0;
                    motor.Weight = 207;
                    motor.Height = 65;
                    motor.Engine = 650;
                }
                //degisken ozellikler
                motor.Year = DateTime.Today.Year;
                motor.ChassisNumber = i.ToString() + "Cbr650R";

                VehicleList.Add(motor);
            }

            for (int i = 0; i < 10; i++)
            {
                var index2 = VehicleList.FindIndex(f => f.GetType() == typeof(AfricanTwin));
                //ilk once olusturulan listede AfricanTwin var mi ona bakiyoruz
                AfricanTwin motor = index2 == -1 ? new AfricanTwin() : (AfricanTwin)VehicleList[index2].Clone();
                // eger yoksa olusturyoruz varsa klonluyoruz
                if (index2 == -1)// olusturma
                {
                    motor.WarrantyYear = 3;
                    motor.Km = 0;
                    motor.Weight = 245;
                    motor.Height = 65;
                    motor.Engine = 1000;
                }
                //degisken ozellikler
                motor.Year = DateTime.Today.Year;
                motor.ChassisNumber = i.ToString() + "AfricanTwin";

                VehicleList.Add(motor);
            }
            foreach (var motor in VehicleList)
            {
                Console.WriteLine("Motor Chassis Number : " + motor.ChassisNumber);
            }
            Console.ReadLine();
        }
    }

}
