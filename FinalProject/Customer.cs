using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject
{
    public class Customer
    {
        List<Game> shoppingCart;
        private int total;
        private string firstName;
        private string lastName;
        private string emailAddress;
        private string address;
        private string addressL2;
        private string zip;
        private string state;
        private string city;
        private string phone;
        private string country;
        private string ccInfo;
        private string cvv;
        private string ccExp;

        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string Address { get => address; set => address = value; }
        public string AddressL2 { get => addressL2; set => addressL2 = value; }
        public string Zip { get => zip; set => zip = value; }
        public string State { get => state; set => state = value; }
        public string Country { get => country; set => country = value; }
        public string CcInfo { get => ccInfo; set => ccInfo = value; }
        public string Cvv { get => cvv; set => cvv = value; }
        public string CcExp { get => ccExp; set => ccExp = value; }
        public string EmailAddress { get => emailAddress; set => emailAddress = value; }
        public string City { get => city; set => city = value; }
        public string Phone { get => phone; set => phone = value; }
        public int Total { get => total; set => total = value; }
        public List<Game> ShoppingCart { get => shoppingCart; set => shoppingCart = value; }
    }
}