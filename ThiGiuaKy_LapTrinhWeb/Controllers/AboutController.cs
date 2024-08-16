using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThiGiuaKy_LapTrinhWeb.Models;
namespace ThiGiuaKy_LapTrinhWeb.Controllers
{
    public class AboutController : Controller
    {
        // GET: About
        public ActionResult Index(string maSP)
        {
            ShopOnlineKetNoi db = new ShopOnlineKetNoi();
            SanPham x = db.SanPhams.Where(sp => sp.maSP.Equals(maSP)).First<SanPham>();
            ViewData["sp"] = x;
            return View();  
        }
    }
}