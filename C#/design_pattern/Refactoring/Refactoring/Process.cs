using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;
using static Refactoring.Program;

namespace Refactoring
{
    interface IProcess
    {
        string nextMethodName { get; set; }
        string backMethodName { get; set; }

        void NextMethod();
        void BackMethod();
    }

    internal class Process : IProcess
    {
        public string nextMethodName { get; set; }
        //IProcess'ten tureyen Process
        //basarili olursa nextMethodName'i , basarisiz olursa backMethod name'i cagiracak
        public string backMethodName { get; set; }

        public Process(string _nextMethodName, string _backMethodName)
        {
            this.nextMethodName = _nextMethodName;
            this.backMethodName = _backMethodName;
        }
        public void NextMethod()
        {
            Type thisType = this.GetType();
            MethodInfo theMethod = thisType.GetMethod(this.nextMethodName);
            theMethod.Invoke(this, null);
        }//type alip, string isminden methodu cagiriyoruz 
        public void BackMethod()
        {
            Type thisType = this.GetType();
            MethodInfo theMethod = thisType.GetMethod(this.backMethodName);
            theMethod.Invoke(this, null);
        }//type alip, string isminden methodu cagiriyoruz 
        public void ProcessCalculation()
        {   // eger islem basarili olursa bir sonraki isi 
            // basarisiz olursa bir onceki isi cagiriyor
            try
            {
                // istenilen islem
                Console.WriteLine("Vbt Design Pattern Lesson - Bora Kasmer");
                //throw new Exception("Nau Nau");
                NextMethod();
            }
            catch (Exception)
            {

                BackMethod();
            }
        }
        // Dinamik olmayan yontem
        public void ProcessCalculationIfElseSolution(ProcessType type)
        {
            try
            {
                if (type == ProcessType.Crm)
                {
                    CallCrm();
                }
                else if (type == ProcessType.Finance)
                {
                    CallFinance();
                }
                else if (type == ProcessType.Service)
                {
                    CallService();
                }
            }
            catch (Exception)
            {
                if (type == ProcessType.Crm)
                {
                    BackCrm();
                }
                else if (type == ProcessType.Finance)
                {
                    BackFinance();
                }
                else if (type == ProcessType.Service)
                {
                    BackService();
                }
            }
        }
        // Dinamik olmayan yontem

        public void CallVbtStaj2022() { Console.WriteLine("Call VBT Staj 2022"); }
        public void BackVbtStaj2022() { Console.WriteLine("Back VBT Staj 2022"); }

        public void CallCrm() { Console.WriteLine("Call Crm"); }

        public void BackCrm() { Console.WriteLine("Back Crm"); }
        public void CallFinance() { Console.WriteLine("Call Finance"); }
        public void BackFinance() { Console.WriteLine("Back Finance"); }
        public void CallService() { Console.WriteLine("Call Service"); }
        public void BackService() { Console.WriteLine("Back Service"); }

    }
}
