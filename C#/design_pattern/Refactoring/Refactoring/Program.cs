using System;


namespace Refactoring
{
    internal class Program
    {
        public enum ProcessType
        {
            Finance,
            Service,
            Crm,
        }
        static void Main(string[] args)
        {
            DoServiceProcess();
            Console.WriteLine("Finish Aplication");
        }
        public static void DoServiceProcess()
        {
            Process process = new Process("CallVbtStaj2022", "BackVbtStaj2022");
            process.ProcessCalculation();
        }
    }
}
