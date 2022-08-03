using System;

namespace InterfaceSegregation
{
    internal class Program
    {

        interface IService
        {
            Boolean CheckToken();
            String GetUserId();
            /*
             String GetMobileDeviceID();
             Boolean CheckMobileVerison();
             String GetMobilePlatform();
            */
        }

        interface IMobileService : IService
        {
            String GetMobileDeviceID();
            Boolean CheckMobileVerison();
            String GetMobilePlatform();
        }
        public class WebService : IService
        {
            public bool CheckToken()
            {
                return true;
            }
            public string GetUserId()
            {
                return "123";
            }
            /*
            public bool CheckMobileVerison()
            {
                throw new NotImplementedException();
            }
            public string GetMobileDeviceID()
            {
                throw new NotImplementedException();
            }
            public string GetMobilePlatform()
            {
                throw new NotImplementedException();
            }
            */

        }
        public class MobileService : IMobileService
        {
            public bool CheckToken()
            {
                return false;
            }
            public string GetUserId()
            {
                return "20";
            }
            public bool CheckMobileVerison()
            {
                return true;
            }
            public string GetMobileDeviceID()
            {
                return "4635131554";
            }
            public string GetMobilePlatform()
            {
                return "ios";
            }
        }



        static void Main(string[] args)
        {
            WebService webService = new WebService();
            MobileService mobileService = new MobileService();
            Console.WriteLine($"UserID:{webService.GetUserId()}");
            Console.WriteLine($"MobileDeviceId:{mobileService.GetMobileDeviceID()}");
            Console.ReadLine();

            // webService. kullanimminda web'e ulasim var mobile'e yok
            //mobileService. kullaniminda web'e de mobil'de ulasim var
        }
    }
}
