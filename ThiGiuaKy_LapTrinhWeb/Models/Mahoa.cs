using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using ThiGiuaKy_LapTrinhWeb;
using System.Text;

namespace ThiGiuaKy_LapTrinhWeb.Models
{
    public class Mahoa
    {
        public static string mahoaSHA256(string Text)
        {
            string str = "";
            //----- tạo 1 đối tượng mã hóa SHA256--------
            using(SHA256 obj = SHA256.Create())
            {
                using (SHA256 bb = SHA256.Create())
                {
                    byte[] arr = Encoding.UTF8.GetBytes(Text);
                    byte[] hash = bb.ComputeHash(arr);
                    str = BitConverter.ToString(hash);
                }
            }
            return str;
        }
    }
}