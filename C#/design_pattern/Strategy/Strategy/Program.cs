using System;

namespace Strategy
{

    /*
    public enum MailType
    {
        HumanResource,
        IT,
        Manager,
        Worker
    }
    */

    public interface IMail
    {
        void SendMail(string body, string cc);
    }
    class HumanResource : IMail
    {
        public void SendMail(string body, string cc)
        {
            Console.WriteLine($"HumanResource Mail Sent : {body}");
        }
    }
    class IT : IMail
    {
        public void SendMail(string body, string cc)
        {
            Console.WriteLine($"IT Mail Sent : {body}");
        }
    }
    class Manager : IMail
    {
        public void SendMail(string body, string cc)
        {
            Console.WriteLine($"Manager Mail Sent : {body}");
        }
    }
    class Worker : IMail
    {
        public void SendMail(string body, string cc)
        {
            Console.WriteLine($"Worker Mail Sent : {body}");
        }
    }
    class VbtStaj : IMail
    {
        public void SendMail(string body, string cc)
        {
            Console.WriteLine($"VbtStaj Mail Sent : {body}");
        }
    }
    public class Postman
    {
        IMail _mail = null;
        public Postman(IMail mail) => _mail = mail;
        public void SendMail(string body, string cc)
        {
            _mail.SendMail(body, cc);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Postman postman = new Postman(new VbtStaj());
            postman.SendMail("iyi çalışmalar", "hasanbasrikayginn@gmail.com");

            /*
            SendMails(MailType.IT ,"Publish yapalim", "bora@borakasmer.com");
            void SendMails(MailType type, string body, string cc)
            {
                switch (type)
                {
                    case MailType.HumanResource:
                        {
                            Console.WriteLine($"HumanResource Mail Sent : {body}");
                        }
                        break;
                    case MailType.Manager:
                        {
                            Console.WriteLine($"Manager Mail Sent : {body}");
                        }
                        break;
                    case MailType.IT:
                        {
                            Console.WriteLine($"IT Mail Sent : {body}");
                        }
                        break;
                    case MailType.Worker:
                        {
                            Console.WriteLine($"Worker Mail Sent : {body}");
                        }
                        break;
                }
            }
            */
        }
    }
}
