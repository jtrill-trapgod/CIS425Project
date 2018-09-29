using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject
{
    public class Game
    {
        private string id;
        private string name;
        private double price;
        private string imgPath;
        private string description;
        private string platform;
        private string genre;
        private string key;

        public string Id { get => id; set => id = value; }
        public string Name { get => name; set => name = value; }
        public double Price { get => price; set => price = value; }
        public string ImgPath { get => imgPath; set => imgPath = value; }
        public string Key { get => KeyGen(); set => key = value; }
        public string Description { get => description; set => description = value; }
        public string Platform { get => platform; set => platform = value; }
        public string Genre { get => genre; set => genre = value; }

        // generates a 16 digit game key
        public string KeyGen()
        {
            char[] chars = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            Random r = new Random();
            string keyPart1 = "";
            string keyPart2 = "";
            string keyPart3 = "";
            string keyPart4 = "";
            string key;
            int n;

            for (int i = 0; i < 4; i++)
            {
                n = r.Next(chars.Length);
                keyPart1 = keyPart1 + Convert.ToString(chars[n]);
            }
            for (int i = 0; i < 4; i++)
            {
                n = r.Next(chars.Length);
                keyPart2 = keyPart2 + Convert.ToString(chars[n]);
            }
            for (int i = 0; i < 4; i++)
            {
                n = r.Next(chars.Length);
                keyPart3 = keyPart3 + Convert.ToString(chars[n]);
            }
            for (int i = 0; i < 4; i++)
            {
                n = r.Next(chars.Length);
                keyPart4 = keyPart4 + Convert.ToString(chars[n]);
            }

            key = $"{keyPart1}-{keyPart2}-{keyPart3}-{keyPart4}";
            return key;
        }
    }
}