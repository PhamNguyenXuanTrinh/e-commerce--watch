using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThiGiuaKy_LapTrinhWeb.Models;
namespace ThiGiuaKy_LapTrinhWeb.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string User, string Pass )
        {
            string mk = Mahoa.mahoaSHA256(Pass);
            //------ đọc thông tin database
            TaiKhoan ttdn = new ShopOnlineKetNoi().TaiKhoans.Where(x => x.taiKhoan1.Equals(User.ToLower().Trim()) && x.matKhau.Equals(mk)).First<TaiKhoan>();
            bool isAcc = ttdn!=null && ttdn.taiKhoan1.Equals(User.ToLower().Trim()) && ttdn.matKhau.Equals(mk);
            if (isAcc)
            {
                Session["ttdn"] = ttdn;
                return RedirectToAction("Index","ThongTinChung",new { Area = "Admin" });
            }
            return View();
        }
    }
}