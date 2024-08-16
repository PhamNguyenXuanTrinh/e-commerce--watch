using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThiGiuaKy_LapTrinhWeb.Models;
namespace ThiGiuaKy_LapTrinhWeb.Areas.Admin.Controllers
{
    public class SanPhamDangKinhDoanhController : Controller
    {
        private static ShopOnlineKetNoi db = new ShopOnlineKetNoi();
        private static bool daDuyet;
    
        // GET: Admin/SanPhamDangKinhDoanh
        [HttpGet]
        public ActionResult Index(string IsActive)
        {
            daDuyet = IsActive.Equals("1");
            UpdateLayout();
            return View();
        }
        [HttpPost]
        public ActionResult Delete( string maSp)
        {
            SanPham sp = db.SanPhams.Find(maSp);
            db.SanPhams.Remove(sp);
            db.SaveChanges();
            UpdateLayout();
            return View("Index");
        }
        [HttpPost]
        public ActionResult Active(string maSp)
        {
            SanPham sp = db.SanPhams.Find(maSp);
            sp.daDuyet = !daDuyet;
            db.SaveChanges();
            UpdateLayout();
            return View("Index");
        }
        private void UpdateLayout()
        {
            List<SanPham> l = db.SanPhams.Where(x => x.daDuyet == daDuyet).ToList<SanPham>();
            ViewData["dsSp"] = l;
            ViewBag.stBt = daDuyet ? "ban" : "check";
        }
    }
}